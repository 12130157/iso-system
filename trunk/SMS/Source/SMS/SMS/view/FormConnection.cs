using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

using GsmComm.GsmCommunication;
using GsmComm.PduConverter;

namespace SMS
{
    public partial class frmConn : Form
    {
        public frmConn()
        {
            InitializeComponent();
            
        }
        GSMUtil connect = new GSMUtil();
        bool connected;

        private void btnConnect_Click(object sender, EventArgs e)
        {
            common.Constants.comPort = int.Parse(cboComPort.Text);
            common.Constants.baudRate = int.Parse(cboBaudrate.Text);
            common.Constants.timeOut = int.Parse(cboTimeout.Text);

            //Cursor.Current = Cursors.WaitCursor;
            //Cursor.Current = Cursors.Default;

            connected = connect.connectGSM(common.Constants.comPort, common.Constants.baudRate, common.Constants.timeOut);
            if (connected == true)
            {
                MessageBox.Show("Connect successfull");
                this.Hide();
                FormMain frmMain = new FormMain();
                frmMain.ShowDialog();
                
            }
            else
            {
                MessageBox.Show("Connect Failed");
            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            if (connected == true)
            {
                connect.closeConnect();
            }
            
            Dispose();
        }
    }
}
