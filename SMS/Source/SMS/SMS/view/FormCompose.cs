using System;
using System.Collections;
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
        HopThuDiMODEL model;

        public FormCompose()
        {
            InitializeComponent();
            
            
        }
        private delegate void SetTextCallback(string text);



        private void but_Send_Click(object sender, EventArgs e)
        {
            SmsSubmitPdu[] desPhones;
            ArrayList listPdu = new ArrayList();
            SmsSubmitPdu pdu;

            string[] phones = (txtPhoneNumber.Text).Split(';');
            //MessageBox.Show(phones.Length.ToString());
            string mess = txtMessage.Text;

            bool unicode = chkUnicode.Checked;

            if (!txtPhoneNumber.Text.Equals("") && !mess.Equals(""))
            {
                Cursor.Current = Cursors.WaitCursor;

                if (phones.Length == 1)
                {
                    model = new HopThuDiMODEL();

                    if (!unicode)
                    {
                        pdu = new SmsSubmitPdu(phones[0],mess, "");
                    }
                    else
                    {
                        byte dcs = DataCodingScheme.NoClass_16Bit;
                        pdu = new SmsSubmitPdu(txtMessage.Text, txtPhoneNumber.Text, "", dcs);
                    }

                    model.So_Dien_Thoai = phones[0];
                    model.Noi_Dung_Tin_Nhan = mess;
                    model.Loai_Hop_Thu = "6";
                    model.User11 = "";
                    model.User21 = "";
                    model.User31 = "";
                    model.User41 = "";
                    model.User51 = "";

                    try
                    {
                        common.Constants.comm.SendMessage(pdu);
                        model.Tinh_Trang = "1";
                    }
                    catch (Exception k)
                    {
                        model.Tinh_Trang = "0";
                        MessageBox.Show(k.Message);
                    }

                    bool result = HopThuDiDAO.insertHopThuDi(model);
                }
                else if (phones.Length > 1)
                {
                    if (!unicode)
                    {
                        foreach (string phone in phones)
                        {
                            pdu = new SmsSubmitPdu(mess, phone, "");
                            listPdu.Add(pdu);

                            model = new HopThuDiMODEL();

                            model.So_Dien_Thoai = phone;
                            model.Noi_Dung_Tin_Nhan = mess;
                            model.Tinh_Trang = "1";
                            model.Loai_Hop_Thu = "6";
                            model.User11 = "";
                            model.User21 = "";
                            model.User31 = "";
                            model.User41 = "";
                            model.User51 = "";

                            bool result = HopThuDiDAO.insertHopThuDi(model);
                        }

                        desPhones = (SmsSubmitPdu[])listPdu.ToArray(typeof(SmsSubmitPdu));
                        try
                        {
                            common.Constants.comm.SendMessages(desPhones);
                        }
                        catch (Exception i)
                        {
                            MessageBox.Show(i.Message);
                        }
                    }
                    else
                    {
                        byte dcs = DataCodingScheme.NoClass_16Bit;

                        foreach (string phone in phones)
                        {
                            pdu = new SmsSubmitPdu(mess, phone, "", dcs);
                            listPdu.Add(pdu);

                            model = new HopThuDiMODEL();

                            model.So_Dien_Thoai = phone;
                            model.Noi_Dung_Tin_Nhan = mess;
                            model.Tinh_Trang = "1";
                            model.Loai_Hop_Thu = "6";
                            model.User11 = "";
                            model.User21 = "";
                            model.User31 = "";
                            model.User41 = "";
                            model.User51 = "";

                            bool result = HopThuDiDAO.insertHopThuDi(model);
                        }

                        desPhones = (SmsSubmitPdu[])listPdu.ToArray(typeof(SmsSubmitPdu));
                        try
                        {
                            common.Constants.comm.SendMessages(desPhones);
                        }
                        catch (Exception j)
                        {
                            MessageBox.Show(j.Message);
                        }
                    }
                    Cursor.Current = Cursors.Default;
                }
            }
            else
            {
                MessageBox.Show("Số Điện Thoại hoặc Nội Dung Tin Nhắn trống .");
            }
        }
        #region tailieu
            //string phone = txtPhoneNumber.Text;
            //string mess = txtMessage.Text;

            //if (!phone.Equals("") && !mess.Equals(""))
            //{
            //    Cursor.Current = Cursors.WaitCursor;

            //    try
            //    {
            //        // Send an SMS message
            //        SmsSubmitPdu pdu;

            //        
            //        if (!alert && !unicode)
            //        {
            //            // The straightforward version
            //            pdu = new SmsSubmitPdu(txtMessage.Text, txtPhoneNumber.Text, "");  // "" indicate SMSC No
            //        }
            //        else
            //        {
            //            // The extended version with dcs
            //            byte dcs;
            //            if (!alert && unicode)
            //                dcs = DataCodingScheme.NoClass_16Bit;
            //            else if (alert && !unicode)
            //                dcs = DataCodingScheme.Class0_7Bit;
            //            else if (alert && unicode)
            //                dcs = DataCodingScheme.Class0_16Bit;
            //            else
            //                dcs = DataCodingScheme.NoClass_7Bit; // should never occur here

            //            pdu = new SmsSubmitPdu(txtMessage.Text, txtPhoneNumber.Text, "", dcs);
            //        }

            //        // Send the same message multiple times if this is set
            //        int times = 0;
            //        if (chkMultipleTimes.Checked)
            //        {
            //            times = int.Parse(txtTimes.Text);
            //        }

            //        // Send the message the specified number of times
            //        HopThuDiMODEL model;
            //        for (int i = 0; i < times; i++)
            //        {
            //            model = new HopThuDiMODEL();
            //            //danh dau tinh trang gui 1=da gui 0=chua gui dc  3=xoa vao hop thu deleted
            //            int j = 0;

            //            try
            //            {
                            
            //                common.Constants.comm.SendMessage(pdu);
            //                Output("Message {0} of {1} sent.", i + 1, times);
            //                Output("");
            //                j = 1;

            //                model.Loai_Hop_Thu = "6";
            //            }
            //            catch (Exception)
            //            {
            //                MessageBox.Show("Send Message Failed");
            //                j = 0;
            //                model.Loai_Hop_Thu = "";
            //            }
                        
            //            model.So_Dien_Thoai = txtPhoneNumber.Text;
            //            model.Noi_Dung_Tin_Nhan = txtMessage.Text;
            //            model.Tinh_Trang = j.ToString();
                        
            //            model.User11 = "";
            //            model.User21 = "";
            //            model.User31 = "";
            //            model.User41 = "";
            //            model.User51 = "";

            //            bool result = HopThuDiDAO.insertHopThuDi(model);
            //            if (result == true)
            //            {
            //                MessageBox.Show("Insert thanh cong");
            //            }
            //            else
            //            {
            //                MessageBox.Show("Insert that bai");
            //            }
            //        }
            //    }
            //    catch (Exception ex)
            //    {
            //        MessageBox.Show(ex.Message);
            //    }

            //    Cursor.Current = Cursors.Default;

            //}
            //else
            //{
            //    MessageBox.Show("BAN PHAI NHAP DAY DU");
            //}
        //}
        //public  void Output(string text)
        //{
        //    if (this.txtOutput.InvokeRequired)
        //    {
        //        SetTextCallback stc = new SetTextCallback(Output);
        //        this.Invoke(stc, new object[] { text });
        //    }
        //    else
        //    {
        //        this.txtOutput.AppendText(text);
        //        this.txtOutput.AppendText("\r\n");
        //    }
        //}
        //
        //
        //
        //public  void Output(string text, params object[] args)
        //{
        //    string msg = string.Format(text, args);
        //    Output(msg);
        //}
#endregion 
        //Action button Clear 
        private void btnClear_Click(object sender, EventArgs e)
        {
            txtMessage.Text = "";
            txtPhoneNumber.Text = "";
            chkUnicode.Checked = false;
        }

        //Action button Close
        private void butClosse_Click(object sender, EventArgs e)
        {
            this.Close();
        }  
    }
}
