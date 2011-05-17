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

            Cursor.Current = Cursors.WaitCursor;
            //Cursor.Current = Cursors.Default;

            connected = connect.connectGSM(common.Constants.comPort, common.Constants.baudRate, common.Constants.timeOut);
            if (common.Constants.comm.IsConnected() == true)
            {
                //MessageBox.Show("Connect successfull");
                this.Hide();
                new FormLogin().Show();
            }
            else
            {
                //MessageBox.Show("Connect Failed");
                if (MessageBox.Show("Ban co muon tiep tuc dang nhap ?", "Xac Nhan", MessageBoxButtons.YesNo) == DialogResult.Yes)
                {
                    this.Hide();
                    new FormLogin().Show();
                }
                else
                {
                    Application.Exit();
                    Environment.Exit(0);
                    Dispose();
                }
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

        private void frmConn_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
            Environment.Exit(0);
        }
    }
}
