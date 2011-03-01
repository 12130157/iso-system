using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

//import dll connect GMS device

using GsmComm.GsmCommunication;
using GsmComm.PduConverter;
using System.Windows.Forms;

namespace SMS.util
{
    class GSMUtil
    {
        ////gan cong port mac dinh cho bien port
        //int port = GsmCommMain.DefaultPortNumber;
        ////gan mac dinh 9600 cho baudrate
        //int baudRate = 9600; 
        ////gan time out mac dinh
        //int timeout = GsmCommMain.DefaultTimeout;

        private static GsmCommMain comm;

        public static void connectGSM(int port, int baudRate, int timeout)
        {         
            Cursor.Current = Cursors.WaitCursor;
            comm = new GsmCommMain(port, baudRate, timeout);
            Cursor.Current = Cursors.Default;
            comm.Open();
            if (comm.IsOpen() == true)
            {
                Console.WriteLine("OK");
            }
            else
            {
                Console.WriteLine("NO");
            }   
        }
    }
}
