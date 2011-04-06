namespace SMS
{
    partial class FormCompose
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormCompose));
            this.piboCompose = new System.Windows.Forms.PictureBox();
            this.txtTimes = new System.Windows.Forms.TextBox();
            this.chkMultipleTimes = new System.Windows.Forms.CheckBox();
            this.gboOptions = new System.Windows.Forms.GroupBox();
            this.lbTimes = new System.Windows.Forms.Label();
            this.chkUnicode = new System.Windows.Forms.CheckBox();
            this.chkAlert = new System.Windows.Forms.CheckBox();
            this.btnClear = new System.Windows.Forms.Button();
            this.butClosse = new System.Windows.Forms.Button();
            this.but_Send = new System.Windows.Forms.Button();
            this.txtMessage = new System.Windows.Forms.TextBox();
            this.txtPhoneNumber = new System.Windows.Forms.TextBox();
            this.lbMessage = new System.Windows.Forms.Label();
            this.lbNumberPhone = new System.Windows.Forms.Label();
            this.lbTitle = new System.Windows.Forms.Label();
            this.txtOutput = new System.Windows.Forms.TextBox();
            this.btnContacts = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.piboCompose)).BeginInit();
            this.gboOptions.SuspendLayout();
            this.SuspendLayout();
            // 
            // piboCompose
            // 
            this.piboCompose.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("piboCompose.BackgroundImage")));
            this.piboCompose.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.piboCompose.ErrorImage = ((System.Drawing.Image)(resources.GetObject("piboCompose.ErrorImage")));
            this.piboCompose.InitialImage = ((System.Drawing.Image)(resources.GetObject("piboCompose.InitialImage")));
            this.piboCompose.Location = new System.Drawing.Point(319, 168);
            this.piboCompose.Name = "piboCompose";
            this.piboCompose.Size = new System.Drawing.Size(234, 100);
            this.piboCompose.TabIndex = 155;
            this.piboCompose.TabStop = false;
            // 
            // txtTimes
            // 
            this.txtTimes.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTimes.Location = new System.Drawing.Point(111, 79);
            this.txtTimes.Name = "txtTimes";
            this.txtTimes.Size = new System.Drawing.Size(46, 21);
            this.txtTimes.TabIndex = 3;
            this.txtTimes.Text = "1";
            // 
            // chkMultipleTimes
            // 
            this.chkMultipleTimes.AutoSize = true;
            this.chkMultipleTimes.Checked = true;
            this.chkMultipleTimes.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chkMultipleTimes.Enabled = false;
            this.chkMultipleTimes.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkMultipleTimes.ForeColor = System.Drawing.Color.Black;
            this.chkMultipleTimes.Location = new System.Drawing.Point(18, 81);
            this.chkMultipleTimes.Name = "chkMultipleTimes";
            this.chkMultipleTimes.Size = new System.Drawing.Size(109, 19);
            this.chkMultipleTimes.TabIndex = 2;
            this.chkMultipleTimes.Text = "Send message";
            this.chkMultipleTimes.UseVisualStyleBackColor = true;
            // 
            // gboOptions
            // 
            this.gboOptions.Controls.Add(this.lbTimes);
            this.gboOptions.Controls.Add(this.txtTimes);
            this.gboOptions.Controls.Add(this.chkMultipleTimes);
            this.gboOptions.Controls.Add(this.chkUnicode);
            this.gboOptions.Controls.Add(this.chkAlert);
            this.gboOptions.Location = new System.Drawing.Point(319, 49);
            this.gboOptions.Name = "gboOptions";
            this.gboOptions.Size = new System.Drawing.Size(234, 113);
            this.gboOptions.TabIndex = 154;
            this.gboOptions.TabStop = false;
            this.gboOptions.Text = "Options";
            // 
            // lbTimes
            // 
            this.lbTimes.AutoSize = true;
            this.lbTimes.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbTimes.ForeColor = System.Drawing.Color.Black;
            this.lbTimes.Location = new System.Drawing.Point(158, 82);
            this.lbTimes.Name = "lbTimes";
            this.lbTimes.Size = new System.Drawing.Size(41, 15);
            this.lbTimes.TabIndex = 4;
            this.lbTimes.Text = "Times";
            // 
            // chkUnicode
            // 
            this.chkUnicode.AutoSize = true;
            this.chkUnicode.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkUnicode.ForeColor = System.Drawing.Color.Black;
            this.chkUnicode.Location = new System.Drawing.Point(18, 52);
            this.chkUnicode.Name = "chkUnicode";
            this.chkUnicode.Size = new System.Drawing.Size(163, 19);
            this.chkUnicode.TabIndex = 1;
            this.chkUnicode.Text = "Send as Unicode (UCS2)";
            this.chkUnicode.UseVisualStyleBackColor = true;
            // 
            // chkAlert
            // 
            this.chkAlert.AutoSize = true;
            this.chkAlert.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkAlert.ForeColor = System.Drawing.Color.Black;
            this.chkAlert.Location = new System.Drawing.Point(18, 23);
            this.chkAlert.Name = "chkAlert";
            this.chkAlert.Size = new System.Drawing.Size(210, 19);
            this.chkAlert.TabIndex = 0;
            this.chkAlert.Text = "Request immediate display (alert)";
            this.chkAlert.UseVisualStyleBackColor = true;
            // 
            // btnClear
            // 
            this.btnClear.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.btnClear.BackColor = System.Drawing.SystemColors.Menu;
            this.btnClear.Cursor = System.Windows.Forms.Cursors.Default;
            this.btnClear.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnClear.ForeColor = System.Drawing.SystemColors.Control;
            this.btnClear.Image = ((System.Drawing.Image)(resources.GetObject("btnClear.Image")));
            this.btnClear.Location = new System.Drawing.Point(120, 244);
            this.btnClear.Name = "btnClear";
            this.btnClear.Size = new System.Drawing.Size(79, 25);
            this.btnClear.TabIndex = 153;
            this.btnClear.Text = "Clear";
            this.btnClear.UseVisualStyleBackColor = false;
            this.btnClear.Click += new System.EventHandler(this.btnClear_Click);
            // 
            // butClosse
            // 
            this.butClosse.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.butClosse.BackColor = System.Drawing.SystemColors.Menu;
            this.butClosse.Cursor = System.Windows.Forms.Cursors.Hand;
            this.butClosse.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.butClosse.ForeColor = System.Drawing.SystemColors.Control;
            this.butClosse.Image = ((System.Drawing.Image)(resources.GetObject("butClosse.Image")));
            this.butClosse.Location = new System.Drawing.Point(220, 244);
            this.butClosse.Name = "butClosse";
            this.butClosse.Size = new System.Drawing.Size(79, 25);
            this.butClosse.TabIndex = 150;
            this.butClosse.Text = "Close";
            this.butClosse.UseVisualStyleBackColor = false;
            this.butClosse.Click += new System.EventHandler(this.butClosse_Click);
            // 
            // but_Send
            // 
            this.but_Send.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.but_Send.BackColor = System.Drawing.SystemColors.Menu;
            this.but_Send.Cursor = System.Windows.Forms.Cursors.Default;
            this.but_Send.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Send.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Send.Image = ((System.Drawing.Image)(resources.GetObject("but_Send.Image")));
            this.but_Send.Location = new System.Drawing.Point(24, 244);
            this.but_Send.Name = "but_Send";
            this.but_Send.Size = new System.Drawing.Size(79, 25);
            this.but_Send.TabIndex = 149;
            this.but_Send.Text = "Send";
            this.but_Send.UseVisualStyleBackColor = false;
            this.but_Send.Click += new System.EventHandler(this.but_Send_Click);
            // 
            // txtMessage
            // 
            this.txtMessage.AllowDrop = true;
            this.txtMessage.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.txtMessage.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMessage.Location = new System.Drawing.Point(24, 117);
            this.txtMessage.MaxLength = 640;
            this.txtMessage.Multiline = true;
            this.txtMessage.Name = "txtMessage";
            this.txtMessage.Size = new System.Drawing.Size(275, 117);
            this.txtMessage.TabIndex = 152;
            // 
            // txtPhoneNumber
            // 
            this.txtPhoneNumber.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.txtPhoneNumber.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPhoneNumber.Location = new System.Drawing.Point(24, 72);
            this.txtPhoneNumber.Name = "txtPhoneNumber";
            this.txtPhoneNumber.Size = new System.Drawing.Size(190, 21);
            this.txtPhoneNumber.TabIndex = 151;
            // 
            // lbMessage
            // 
            this.lbMessage.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.lbMessage.AutoSize = true;
            this.lbMessage.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbMessage.ForeColor = System.Drawing.Color.Black;
            this.lbMessage.Location = new System.Drawing.Point(20, 95);
            this.lbMessage.Name = "lbMessage";
            this.lbMessage.Size = new System.Drawing.Size(61, 15);
            this.lbMessage.TabIndex = 147;
            this.lbMessage.Text = "Message:";
            // 
            // lbNumberPhone
            // 
            this.lbNumberPhone.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.lbNumberPhone.AutoSize = true;
            this.lbNumberPhone.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbNumberPhone.ForeColor = System.Drawing.Color.Black;
            this.lbNumberPhone.Location = new System.Drawing.Point(20, 50);
            this.lbNumberPhone.Name = "lbNumberPhone";
            this.lbNumberPhone.Size = new System.Drawing.Size(162, 15);
            this.lbNumberPhone.TabIndex = 148;
            this.lbNumberPhone.Text = "Destination Number Phone :";
            // 
            // lbTitle
            // 
            this.lbTitle.AutoSize = true;
            this.lbTitle.Font = new System.Drawing.Font("Times New Roman", 15.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbTitle.Location = new System.Drawing.Point(197, 9);
            this.lbTitle.Name = "lbTitle";
            this.lbTitle.Size = new System.Drawing.Size(175, 24);
            this.lbTitle.TabIndex = 156;
            this.lbTitle.Text = "Compose Message";
            // 
            // txtOutput
            // 
            this.txtOutput.AllowDrop = true;
            this.txtOutput.BackColor = System.Drawing.SystemColors.HighlightText;
            this.txtOutput.Location = new System.Drawing.Point(24, 285);
            this.txtOutput.Multiline = true;
            this.txtOutput.Name = "txtOutput";
            this.txtOutput.Size = new System.Drawing.Size(529, 58);
            this.txtOutput.TabIndex = 157;
            this.txtOutput.WordWrap = false;
            // 
            // btnContacts
            // 
            this.btnContacts.Location = new System.Drawing.Point(220, 71);
            this.btnContacts.Name = "btnContacts";
            this.btnContacts.Size = new System.Drawing.Size(75, 23);
            this.btnContacts.TabIndex = 158;
            this.btnContacts.Text = "Contacts\r\n";
            this.btnContacts.UseVisualStyleBackColor = true;
            // 
            // FormCompose
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(573, 353);
            this.Controls.Add(this.btnContacts);
            this.Controls.Add(this.txtOutput);
            this.Controls.Add(this.lbTitle);
            this.Controls.Add(this.piboCompose);
            this.Controls.Add(this.gboOptions);
            this.Controls.Add(this.btnClear);
            this.Controls.Add(this.butClosse);
            this.Controls.Add(this.but_Send);
            this.Controls.Add(this.txtMessage);
            this.Controls.Add(this.txtPhoneNumber);
            this.Controls.Add(this.lbMessage);
            this.Controls.Add(this.lbNumberPhone);
            this.ForeColor = System.Drawing.Color.Maroon;
            this.MaximizeBox = false;
            this.Name = "FormCompose";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Compose";
            ((System.ComponentModel.ISupportInitialize)(this.piboCompose)).EndInit();
            this.gboOptions.ResumeLayout(false);
            this.gboOptions.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox piboCompose;
        private System.Windows.Forms.TextBox txtTimes;
        private System.Windows.Forms.CheckBox chkMultipleTimes;
        private System.Windows.Forms.GroupBox gboOptions;
        private System.Windows.Forms.Label lbTimes;
        private System.Windows.Forms.CheckBox chkUnicode;
        private System.Windows.Forms.CheckBox chkAlert;
        private System.Windows.Forms.Button btnClear;
        private System.Windows.Forms.Button butClosse;
        private System.Windows.Forms.Button but_Send;
        internal System.Windows.Forms.TextBox txtMessage;
        internal System.Windows.Forms.TextBox txtPhoneNumber;
        internal System.Windows.Forms.Label lbMessage;
        internal System.Windows.Forms.Label lbNumberPhone;
        private System.Windows.Forms.Label lbTitle;
        private System.Windows.Forms.TextBox txtOutput;
        private System.Windows.Forms.Button btnContacts;
        
    }
}