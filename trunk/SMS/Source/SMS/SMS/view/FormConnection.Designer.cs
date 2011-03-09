using GsmComm.GsmCommunication;

namespace SMS
{
    partial class frmConn
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lbConnection = new System.Windows.Forms.Label();
            this.lbComPort = new System.Windows.Forms.Label();
            this.lbBaudrate = new System.Windows.Forms.Label();
            this.lbTimeout = new System.Windows.Forms.Label();
            this.cboComPort = new System.Windows.Forms.ComboBox();
            this.cboBaudrate = new System.Windows.Forms.ComboBox();
            this.cboTimeout = new System.Windows.Forms.ComboBox();
            this.btnConnect = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lbConnection
            // 
            this.lbConnection.AutoSize = true;
            this.lbConnection.Font = new System.Drawing.Font("Times New Roman", 26.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbConnection.ForeColor = System.Drawing.Color.Maroon;
            this.lbConnection.Location = new System.Drawing.Point(12, 9);
            this.lbConnection.Name = "lbConnection";
            this.lbConnection.Size = new System.Drawing.Size(277, 40);
            this.lbConnection.TabIndex = 0;
            this.lbConnection.Text = "GSM Connection";
            // 
            // lbComPort
            // 
            this.lbComPort.AutoSize = true;
            this.lbComPort.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbComPort.Location = new System.Drawing.Point(35, 75);
            this.lbComPort.Name = "lbComPort";
            this.lbComPort.Size = new System.Drawing.Size(66, 13);
            this.lbComPort.TabIndex = 1;
            this.lbComPort.Text = "Com-Port :";
            // 
            // lbBaudrate
            // 
            this.lbBaudrate.AutoSize = true;
            this.lbBaudrate.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbBaudrate.Location = new System.Drawing.Point(35, 115);
            this.lbBaudrate.Name = "lbBaudrate";
            this.lbBaudrate.Size = new System.Drawing.Size(66, 13);
            this.lbBaudrate.TabIndex = 2;
            this.lbBaudrate.Text = "Baudrate :";
            // 
            // lbTimeout
            // 
            this.lbTimeout.AutoSize = true;
            this.lbTimeout.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbTimeout.Location = new System.Drawing.Point(35, 155);
            this.lbTimeout.Name = "lbTimeout";
            this.lbTimeout.Size = new System.Drawing.Size(60, 13);
            this.lbTimeout.TabIndex = 3;
            this.lbTimeout.Text = "Timeout :";
            // 
            // cboComPort
            // 
            this.cboComPort.FormattingEnabled = true;
            this.cboComPort.Location = new System.Drawing.Point(137, 72);
            this.cboComPort.Name = "cboComPort";
            this.cboComPort.Size = new System.Drawing.Size(121, 21);
            this.cboComPort.TabIndex = 4;
            // 
            // cboBaudrate
            // 
            this.cboBaudrate.FormattingEnabled = true;
            this.cboBaudrate.Location = new System.Drawing.Point(137, 112);
            this.cboBaudrate.Name = "cboBaudrate";
            this.cboBaudrate.Size = new System.Drawing.Size(121, 21);
            this.cboBaudrate.TabIndex = 5;
            // 
            // cboTimeout
            // 
            this.cboTimeout.FormattingEnabled = true;
            this.cboTimeout.Location = new System.Drawing.Point(137, 152);
            this.cboTimeout.Name = "cboTimeout";
            this.cboTimeout.Size = new System.Drawing.Size(121, 21);
            this.cboTimeout.TabIndex = 6;
            // 
            // btnConnect
            // 
            this.btnConnect.Location = new System.Drawing.Point(57, 199);
            this.btnConnect.Name = "btnConnect";
            this.btnConnect.Size = new System.Drawing.Size(75, 23);
            this.btnConnect.TabIndex = 7;
            this.btnConnect.Text = "Connect";
            this.btnConnect.UseVisualStyleBackColor = true;
            this.btnConnect.Click += new System.EventHandler(this.btnConnect_Click);
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(161, 199);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(75, 23);
            this.btnCancel.TabIndex = 8;
            this.btnCancel.Text = "Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // frmConn
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(295, 244);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnConnect);
            this.Controls.Add(this.cboTimeout);
            this.Controls.Add(this.cboBaudrate);
            this.Controls.Add(this.cboComPort);
            this.Controls.Add(this.lbTimeout);
            this.Controls.Add(this.lbBaudrate);
            this.Controls.Add(this.lbComPort);
            this.Controls.Add(this.lbConnection);
            this.Name = "frmConn";
            this.Text = "Connection";
            this.Load += new System.EventHandler(this.showCbo);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbConnection;
        private System.Windows.Forms.Label lbComPort;
        private System.Windows.Forms.Label lbBaudrate;
        private System.Windows.Forms.Label lbTimeout;
        private System.Windows.Forms.ComboBox cboComPort;
        private System.Windows.Forms.ComboBox cboBaudrate;
        private System.Windows.Forms.ComboBox cboTimeout;
        private System.Windows.Forms.Button btnConnect;
        private System.Windows.Forms.Button btnCancel;

        private int comPort = GsmCommMain.DefaultPortNumber;
        private int baudRate = GsmCommMain.DefaultBaudRate;
        private int timeOut = GsmCommMain.DefaultTimeout;

        public void showCbo(object sender, System.EventArgs e)
        {
            cboComPort.Items.Add("1");
            cboComPort.Items.Add("2");
            cboComPort.Items.Add("3");
            cboComPort.Items.Add("4");
            cboComPort.Text = comPort.ToString();

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
            cboTimeout.Text = timeOut.ToString();
        }
    }
}