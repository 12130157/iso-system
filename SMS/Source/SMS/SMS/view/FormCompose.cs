using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

using GsmComm.PduConverter;
using GsmComm.GsmCommunication;

namespace SMS
{
    public partial class FormCompose : Form
    {
        public FormCompose()
        {
            InitializeComponent();
        }
        private delegate void SetTextCallback(string text);
        
        

        private void but_Send_Click(object sender, EventArgs e)
        {
            
            if (!txtPhoneNumber.Equals("") && !txtMessage.Equals(""))
            {
                
                
                Cursor.Current = Cursors.WaitCursor;

                try
                {
                    // Send an SMS message
                    SmsSubmitPdu pdu;

                    bool alert = chkAlert.Checked;
                    bool unicode = chkUnicode.Checked;

                    if (!alert && !unicode)
                    {
                        // The straightforward version
                        pdu = new SmsSubmitPdu(txtMessage.Text, txtPhoneNumber.Text, "");  // "" indicate SMSC No
                    }
                    else
                    {
                        // The extended version with dcs
                        byte dcs;
                        if (!alert && unicode)
                            dcs = DataCodingScheme.NoClass_16Bit;
                        else if (alert && !unicode)
                            dcs = DataCodingScheme.Class0_7Bit;
                        else if (alert && unicode)
                            dcs = DataCodingScheme.Class0_16Bit;
                        else
                            dcs = DataCodingScheme.NoClass_7Bit; // should never occur here

                        pdu = new SmsSubmitPdu(txtMessage.Text, txtMessage.Text, "", dcs);
                    }

                    // Send the same message multiple times if this is set
                    int times = 0;
                    if (chkMultipleTimes.Checked)
                    {
                        times = int.Parse(txtTimes.Text);
                    }

                    // Send the message the specified number of times
                    for (int i = 0; i < times; i++)
                    {
                        try
                        {
                            common.Constants.comm.SendMessage(pdu);
                        }
                        catch (Exception)
                        { 
                            MessageBox.Show("Message Erro");
                        }
                        Output("Message {0} of {1} sent.", i + 1, times);
                        Output("");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }

                Cursor.Current = Cursors.Default;

            }
        }
        //
        //
        //
        private void Output(string text)
        {
            if (this.txtOutput.InvokeRequired)
            {
                SetTextCallback stc = new SetTextCallback(Output);
                this.Invoke(stc, new object[] { text });
            }
            else
            {
                txtOutput.AppendText(text);
                txtOutput.AppendText("\r\n");
            }
        }
        //
        //
        //
        private void Output(string text, params object[] args)
        {
            string msg = string.Format(text, args);
            Output(msg);
        }
        //
        //
        //Action button Clear 
        private void btnClear_Click(object sender, EventArgs e)
        {
            txtMessage.Text = "";
            txtOutput.Text = "";
            txtPhoneNumber.Text = "";
            chkAlert.Checked = false;
            chkUnicode.Checked = false;
        }
        //
        //
        //Action button Close
        private void butClosse_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
