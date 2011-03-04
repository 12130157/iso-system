using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SMS.util;

using GsmComm.GsmCommunication;
using GsmComm.PduConverter;

namespace SMS
{
    public partial class FormConnection : Form
    {
        public FormConnection()
        {
            InitializeComponent();

            
                cboComPort.Items.Add("1");
                cboComPort.Items.Add("2");
                cboComPort.Items.Add("3");
                cboComPort.Items.Add("4");
                cboComPort.Text = port.ToString();

                cboBaudrate.Items.Add("9600");
                cboBaudrate.Items.Add("19200");
                cboBaudrate.Items.Add("38400");
                cboBaudrate.Items.Add("57600");
                cboBaudrate.Items.Add("115200");
                cboBaudrate.Text = baudRate.ToString();

                cboTimeout.Items.Add("150");
                cboTimeout.Items.Add("300");
                cboTimeout.Items.Add("600");
                cboTimeout.Items.Add("900");
                cboTimeout.Items.Add("1200");
                cboTimeout.Items.Add("1500");
                cboTimeout.Items.Add("1800");
                cboTimeout.Items.Add("2000");
                cboTimeout.Text = timeout.ToString();

            
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            port = int.Parse(cboComPort.Text);
            baudRate = int.Parse(cboBaudrate.Text);
            timeout = int.Parse(cboTimeout.Text);

            //Cursor.Current = Cursors.WaitCursor;
            //Cursor.Current = Cursors.Default;
            GSMUtil connect = new GSMUtil();
            bool cned = connect.connectGSM(port, baudRate, timeout);
            if (cned == true)
            {
                MessageBox.Show("Connect successfull");
                FormMain frmMain = new FormMain();
                frmMain.ShowDialog();
            }
            else
            {
                MessageBox.Show("Connect Failed");
            }
            connect.closeConnect();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            Dispose();
        }
    }
}
