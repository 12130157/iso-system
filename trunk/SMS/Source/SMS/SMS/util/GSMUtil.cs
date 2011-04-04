using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

//import dll connect GMS device

using GsmComm.GsmCommunication;
using GsmComm.PduConverter;
using System.Windows.Forms;
using System.Threading;

namespace SMS
{
    public class GSMUtil
    {
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
            //if (common.Constants.comm != null)
            //{
                new frmConn().Invoke(new ConnectedHandler(OnPhoneConnectionChange), new object[] { true });
            //}
        }

        private delegate void ConnectedHandler(bool connected);

        private void OnPhoneConnectionChange(bool connected)
        {
        }
        //
        //
        //
        //Receive Message
        //public void mapAutoRecie(object sender, EventArgs e)
        //{
            
        //}
        public void comm_MessageReceived(object sender, GsmComm.GsmCommunication.MessageReceivedEventArgs e)
        {
            //if (common.Constants.comm != null)
            //{
            //IMessageIndicationObject obj = e.IndicationObject;
            //if (obj is MemoryLocation)
            //{
                MessageReceived();
            //}
            //}
            
        }
        private void MessageReceived()
        {
            Cursor.Current = Cursors.WaitCursor;

            string storage = GetMessageStorage();

            DecodedShortMessage[] messages = common.Constants.comm.ReadMessages(PhoneMessageStatus.ReceivedUnread, storage);
            foreach (DecodedShortMessage message in messages)
            { }
        }
        private string GetMessageStorage()
        {
            string storage = string.Empty;
            storage = PhoneStorageType.Sim;

            if (storage.Length == 0)
                throw new ApplicationException("Unknown message storage.");
            else
                return storage;
        }
    }
}
