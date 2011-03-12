﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

//import dll connect GMS device

using GsmComm.GsmCommunication;
using GsmComm.PduConverter;
using System.Windows.Forms;

namespace SMS
{
    public class GSMUtil
    {
        ////gan cong port mac dinh cho bien port
        //int port = GsmCommMain.DefaultPortNumber;
        ////gan mac dinh 9600 cho baudrate
        //int baudRate = 9600; 
        ////gan time out mac dinh
        //int timeout = GsmCommMain.DefaultTimeout;

        //public GsmCommMain comm;
        private delegate void SetTextCallback(string text);



        public bool connectGSM(int port, int baudRate, int timeout)
        {
            Cursor.Current = Cursors.WaitCursor;
            common.Constants.comm = new GsmCommMain(port, baudRate, timeout);
            Cursor.Current = Cursors.Default;


            
            
 

            Cursor.Current = Cursors.WaitCursor;

            try
            {
                common.Constants.comm.Open();
            }
            catch (Exception)
            {
                return false;
            }
            if (common.Constants.comm.IsConnected() == true)
            {
                //send message
                common.Constants.comm.PhoneConnected += new EventHandler(comm_PhoneConnected);
                //receice message
                common.Constants.comm.MessageReceived += new MessageReceivedEventHandler(comm_MessageReceived);

                return true;
            }
            else
            {
                return false;
            }

            
        }
        //
        //
        //Close Connect
        public void closeConnect()
        {
            common.Constants.comm.Close();
        }
        //
        //
        //
        //Phone Connected
        private void comm_PhoneConnected(object sender, EventArgs e)
        {
            new frmConn().Invoke(new ConnectedHandler(OnPhoneConnectionChange), new object[] { true });
        }

        private delegate void ConnectedHandler(bool connected);

        private void OnPhoneConnectionChange(bool connected)
        {}
        //
        //
        //
        //Receive Message
        private void comm_MessageReceived(object sender, GsmComm.GsmCommunication.MessageReceivedEventArgs e)
        {
            MessageReceived();
        }

        private void MessageReceived()
        {
            Cursor.Current = Cursors.WaitCursor;
            string storage = GetMessageStorage();

            common.Constants.messages = common.Constants.comm.ReadMessages(PhoneMessageStatus.ReceivedUnread, storage);
            //string statusMess;
            SmsPdu dataMess;
            HopThuDenMODEL model;

            foreach (DecodedShortMessage message in messages)
            {
                //statusMess = message.Status;
                dataMess = message.Data;
                SmsDeliverPdu data = (SmsDeliverPdu)dataMess;
                string desMess = data.OriginatingAddressType;
                string contentMess = data.UserDataText;

                model = new HopThuDenMODEL();
                
                string[] arrContentMess = contentMess.Split(" ");

                string cumCuPhap;
                
                for (int i = 0 ; i < arrContentMess - 2 ; i++)
                {
                    cumCuPhap += arrContentMess[i];
                }
                CuPhapMODEL cuPhapModel = CuPhapDAO.getCuPhapByCumtu1(cumCuPhap);

                model.So_Dien_Thoai = desMess;
                model.Ma_Cu_Phap = cuPhapModel.Id;
                model.Noi_Dung_Tin_Nhan = contentMess;
                model.Tinh_Trang = "0";
                if (cuPhapModel != null)
                {
                    model.Loai_Hop_Thu = "0";
                }
                else
                {
                    model.Loai_Hop_Thu = "1";
                }
                //model.Ma_Tin_Nhan_Tra_Loi = "";
                
                //foreach (string syntax in arrContentMess)
                //{
                       
                //}

                

                
            }
            
        }
        // get message storage
        private string GetMessageStorage()
        {
            string storage = "";
            storage = PhoneStorageType.Sim;

            if (storage.Length == 0)
                throw new ApplicationException("Unknown message storage.");
            else
                return storage;
        }
        //
        //status message
        //private string StatusToString(PhoneMessageStatus status)
        //{
        //    // Map a message status to a string
        //    string ret;
        //    switch (status)
        //    {
        //        case PhoneMessageStatus.All:
        //            ret = "1";
        //            break;
        //        case PhoneMessageStatus.ReceivedRead:
        //            ret = "2";
        //            break;
        //        case PhoneMessageStatus.ReceivedUnread:
        //            ret = "3";
        //            break;
        //        case PhoneMessageStatus.StoredSent:
        //            ret = "4";
        //            break;
        //        case PhoneMessageStatus.StoredUnsent:
        //            ret = "5";
        //            break;
        //        default:
        //            ret = "Unknown (" + status.ToString() + ")";
        //            break;
        //    }
            return ret;
        }
        //
        //
        //show mesage
        public int ShowMessage(SmsPdu pdu)
        {
            int i = 0;
            if (pdu is SmsSubmitPdu)
            {
                // Stored (sent/unsent) message
                SmsSubmitPdu data = (SmsSubmitPdu)pdu;
                //Output("SENT/UNSENT MESSAGE");
                //Output("Recipient: " + data.DestinationAddress);
                //Output("Message text: " + data.UserDataText);
                //Output("-------------------------------------------------------------------");
                i = 1;
            }
            if (pdu is SmsDeliverPdu)
            {
                // Received message
                SmsDeliverPdu data = (SmsDeliverPdu)pdu;
                //Output("RECEIVED MESSAGE");
                //Output("Sender: " + data.OriginatingAddress);
                //Output("Sent: " + data.SCTimestamp.ToString());
                //Output("Message text: " + data.UserDataText);
                //Output("-------------------------------------------------------------------");
                i = 2;
            }
            if (pdu is SmsStatusReportPdu)
            {
                // Status report
                SmsStatusReportPdu data = (SmsStatusReportPdu)pdu;
                //Output("STATUS REPORT");
                //Output("Recipient: " + data.RecipientAddress);
                //Output("Status: " + data.Status.ToString());
                //Output("Timestamp: " + data.DischargeTime.ToString());
                //Output("Message ref: " + data.MessageReference.ToString());
                //Output("-------------------------------------------------------------------");
                i = 3;
            }
            //Output("Unknown message type: " + pdu.GetType().ToString());
            return i;
        }
    }
}
