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
            try
            {
                Cursor.Current = Cursors.WaitCursor;
                common.Constants.comm = new GsmCommMain(port, baudRate, timeout);

                common.Constants.comm.Open();

                Cursor.Current = Cursors.Default;

                Cursor.Current = Cursors.WaitCursor;

                
                //send message
                Thread thr = new Thread(phoneConnected);
                thr.Start();
                //receice message
                Thread thr1 = new Thread(messageRecieved);
                thr1.Start();
                if (common.Constants.comm.IsConnected() == true)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
                return false;
            }
        }

        public void closeConnect()
        {
            common.Constants.comm.Close();
        }

        private delegate void ConnectedHandler(bool connected);

        private void OnPhoneConnectionChange(bool connected)
        {
            
        }

        public void comm_MessageReceived(object sender, GsmComm.GsmCommunication.MessageReceivedEventArgs e)
        {
            MessageReceived();
        }

        private void comm_PhoneConnected(object sender, EventArgs e)
        {
            new frmConn().Invoke(new ConnectedHandler(OnPhoneConnectionChange), new object[] { true });
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
        
        private void MessageReceived()
        {
            Cursor.Current = Cursors.WaitCursor;

            string storage = GetMessageStorage();

            try
            {
                DecodedShortMessage[] messages = common.Constants.comm.ReadMessages(PhoneMessageStatus.ReceivedUnread, storage);
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
            }
        }

        public void phoneConnected()
        {
            common.Constants.comm.PhoneConnected += new EventHandler(comm_PhoneConnected);
        }   

        public void messageRecieved()
        {
            common.Constants.comm.MessageReceived += new MessageReceivedEventHandler(comm_MessageReceived);
        }
    }
}
