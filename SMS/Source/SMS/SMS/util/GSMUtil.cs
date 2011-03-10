using System;
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



            
            //comm.MessageReceived += new MessageReceivedEventHandler(comm_MessageReceived);

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
                return true;
            }
            else
            {
                return false;
            }
            
        }

        public void closeConnect()
        {
            common.Constants.comm.Close();
        }
        private void comm_PhoneConnected(object sender, EventArgs e)
        {
            new frmConn().Invoke(new ConnectedHandler(OnPhoneConnectionChange), new object[] { true });
        }

        private delegate void ConnectedHandler(bool connected);

        private void OnPhoneConnectionChange(bool connected)
        {
            
        }

        //private void comm_MessageReceived(object sender, GsmComm.GsmCommunication.MessageReceivedEventArgs e)
        //{
        //    MessageReceived();
        //}

        //private void MessageReceived()
        //{
        //    Cursor.Current = Cursors.WaitCursor;
        //    string storage = GetMessageStorage();

        //    DecodedShortMessage[] messages = comm.ReadMessages(PhoneMessageStatus.ReceivedUnread, storage);

        //    int i = 0;
        //    foreach (DecodedShortMessage message in messages)
        //    {

        //        Console.WriteLine("message "+i);
        //        i++;
        //        //Output(string.Format("Message status = {0}, Location = {1}/{2}",
        //        //    StatusToString(message.Status), message.Storage, message.Index));
        //        //ShowMessage(message.Data);
        //        //Output("");
        //    }

        //    //Output(string.Format("{0,9} messages read.", messages.Length.ToString()));
        //    //Output("");
        //}

        private string GetMessageStorage()
        {
            string storage = string.Empty;
            storage = PhoneStorageType.Sim;

            if (storage.Length == 0)
                throw new ApplicationException("Unknown message storage.");
            else
                return storage;
        }

        //private void Output(string text)
        //{
        //    if (this.txtOutput.InvokeRequired)
        //    {
        //        SetTextCallback stc = new SetTextCallback(Output);
        //        this.Invoke(stc, new object[] { text });
        //    }
        //    else
        //    {
        //        txtOutput.AppendText(text);
        //        txtOutput.AppendText("\r\n");
        //    }
        //}

        //private string StatusToString(PhoneMessageStatus status)
        //{
        //    // Map a message status to a string
        //    string ret;
        //    switch (status)
        //    {
        //        case PhoneMessageStatus.All:
        //            ret = "All";
        //            break;
        //        case PhoneMessageStatus.ReceivedRead:
        //            ret = "Read";
        //            break;
        //        case PhoneMessageStatus.ReceivedUnread:
        //            ret = "Unread";
        //            break;
        //        case PhoneMessageStatus.StoredSent:
        //            ret = "Sent";
        //            break;
        //        case PhoneMessageStatus.StoredUnsent:
        //            ret = "Unsent";
        //            break;
        //        default:
        //            ret = "Unknown (" + status.ToString() + ")";
        //            break;
        //    }
        //    return ret;
        //}

        //private void ShowMessage(SmsPdu pdu)
        //{
        //    if (pdu is SmsSubmitPdu)
        //    {
        //        // Stored (sent/unsent) message
        //        SmsSubmitPdu data = (SmsSubmitPdu)pdu;
        //        Output("SENT/UNSENT MESSAGE");
        //        Output("Recipient: " + data.DestinationAddress);
        //        Output("Message text: " + data.UserDataText);
        //        Output("-------------------------------------------------------------------");
        //        return;
        //    }
        //    if (pdu is SmsDeliverPdu)
        //    {
        //        // Received message
        //        SmsDeliverPdu data = (SmsDeliverPdu)pdu;
        //        Output("RECEIVED MESSAGE");
        //        Output("Sender: " + data.OriginatingAddress);
        //        Output("Sent: " + data.SCTimestamp.ToString());
        //        Output("Message text: " + data.UserDataText);
        //        Output("-------------------------------------------------------------------");
        //        return;
        //    }
        //    if (pdu is SmsStatusReportPdu)
        //    {
        //        // Status report
        //        SmsStatusReportPdu data = (SmsStatusReportPdu)pdu;
        //        Output("STATUS REPORT");
        //        Output("Recipient: " + data.RecipientAddress);
        //        Output("Status: " + data.Status.ToString());
        //        Output("Timestamp: " + data.DischargeTime.ToString());
        //        Output("Message ref: " + data.MessageReference.ToString());
        //        Output("-------------------------------------------------------------------");
        //        return;
        //    }
        //    Output("Unknown message type: " + pdu.GetType().ToString());
        //}

    }
}
