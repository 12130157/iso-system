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
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.checkBox2 = new System.Windows.Forms.CheckBox();
            this.gboOptions = new System.Windows.Forms.GroupBox();
            this.lbTimes = new System.Windows.Forms.Label();
            this.chkUnicode = new System.Windows.Forms.CheckBox();
            this.chkAlert = new System.Windows.Forms.CheckBox();
            this.btnClear = new System.Windows.Forms.Button();
            this.butClosse = new System.Windows.Forms.Button();
            this.but_Send = new System.Windows.Forms.Button();
            this.txt_Message = new System.Windows.Forms.TextBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.lbMessage = new System.Windows.Forms.Label();
            this.lbNumberPhone = new System.Windows.Forms.Label();
            this.lbTitle = new System.Windows.Forms.Label();
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
            this.piboCompose.Location = new System.Drawing.Point(319, 166);
            this.piboCompose.Name = "piboCompose";
            this.piboCompose.Size = new System.Drawing.Size(234, 100);
            this.piboCompose.TabIndex = 155;
            this.piboCompose.TabStop = false;
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(132, 68);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(46, 20);
            this.textBox2.TabIndex = 3;
            // 
            // checkBox2
            // 
            this.checkBox2.AutoSize = true;
            this.checkBox2.ForeColor = System.Drawing.Color.Black;
            this.checkBox2.Location = new System.Drawing.Point(18, 70);
            this.checkBox2.Name = "checkBox2";
            this.checkBox2.Size = new System.Drawing.Size(108, 17);
            this.checkBox2.TabIndex = 2;
            this.checkBox2.Text = "chkMultipleTimes";
            this.checkBox2.UseVisualStyleBackColor = true;
            // 
            // gboOptions
            // 
            this.gboOptions.Controls.Add(this.lbTimes);
            this.gboOptions.Controls.Add(this.textBox2);
            this.gboOptions.Controls.Add(this.checkBox2);
            this.gboOptions.Controls.Add(this.chkUnicode);
            this.gboOptions.Controls.Add(this.chkAlert);
            this.gboOptions.Location = new System.Drawing.Point(319, 50);
            this.gboOptions.Name = "gboOptions";
            this.gboOptions.Size = new System.Drawing.Size(234, 100);
            this.gboOptions.TabIndex = 154;
            this.gboOptions.TabStop = false;
            this.gboOptions.Text = "Options";
            // 
            // lbTimes
            // 
            this.lbTimes.AutoSize = true;
            this.lbTimes.ForeColor = System.Drawing.Color.Black;
            this.lbTimes.Location = new System.Drawing.Point(185, 70);
            this.lbTimes.Name = "lbTimes";
            this.lbTimes.Size = new System.Drawing.Size(35, 13);
            this.lbTimes.TabIndex = 4;
            this.lbTimes.Text = "Times";
            // 
            // chkUnicode
            // 
            this.chkUnicode.AutoSize = true;
            this.chkUnicode.ForeColor = System.Drawing.Color.Black;
            this.chkUnicode.Location = new System.Drawing.Point(18, 45);
            this.chkUnicode.Name = "chkUnicode";
            this.chkUnicode.Size = new System.Drawing.Size(145, 17);
            this.chkUnicode.TabIndex = 1;
            this.chkUnicode.Text = "Send as Unicode (UCS2)";
            this.chkUnicode.UseVisualStyleBackColor = true;
            // 
            // chkAlert
            // 
            this.chkAlert.AutoSize = true;
            this.chkAlert.ForeColor = System.Drawing.Color.Black;
            this.chkAlert.Location = new System.Drawing.Point(18, 20);
            this.chkAlert.Name = "chkAlert";
            this.chkAlert.Size = new System.Drawing.Size(180, 17);
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
            this.btnClear.Location = new System.Drawing.Point(120, 248);
            this.btnClear.Name = "btnClear";
            this.btnClear.Size = new System.Drawing.Size(79, 25);
            this.btnClear.TabIndex = 153;
            this.btnClear.Text = "Clear";
            this.btnClear.UseVisualStyleBackColor = false;
            // 
            // butClosse
            // 
            this.butClosse.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.butClosse.BackColor = System.Drawing.SystemColors.Menu;
            this.butClosse.Cursor = System.Windows.Forms.Cursors.Hand;
            this.butClosse.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.butClosse.ForeColor = System.Drawing.SystemColors.Control;
            this.butClosse.Image = ((System.Drawing.Image)(resources.GetObject("butClosse.Image")));
            this.butClosse.Location = new System.Drawing.Point(220, 248);
            this.butClosse.Name = "butClosse";
            this.butClosse.Size = new System.Drawing.Size(79, 25);
            this.butClosse.TabIndex = 150;
            this.butClosse.Text = "Close";
            this.butClosse.UseVisualStyleBackColor = false;
            // 
            // but_Send
            // 
            this.but_Send.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.but_Send.BackColor = System.Drawing.SystemColors.Menu;
            this.but_Send.Cursor = System.Windows.Forms.Cursors.Default;
            this.but_Send.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Send.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Send.Image = ((System.Drawing.Image)(resources.GetObject("but_Send.Image")));
            this.but_Send.Location = new System.Drawing.Point(24, 248);
            this.but_Send.Name = "but_Send";
            this.but_Send.Size = new System.Drawing.Size(79, 25);
            this.but_Send.TabIndex = 149;
            this.but_Send.Text = "Send";
            this.but_Send.UseVisualStyleBackColor = false;
            // 
            // txt_Message
            // 
            this.txt_Message.AllowDrop = true;
            this.txt_Message.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.txt_Message.Location = new System.Drawing.Point(24, 120);
            this.txt_Message.MaxLength = 640;
            this.txt_Message.Multiline = true;
            this.txt_Message.Name = "txt_Message";
            this.txt_Message.Size = new System.Drawing.Size(275, 117);
            this.txt_Message.TabIndex = 152;
            // 
            // textBox1
            // 
            this.textBox1.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.textBox1.Location = new System.Drawing.Point(24, 70);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(275, 20);
            this.textBox1.TabIndex = 151;
            // 
            // lbMessage
            // 
            this.lbMessage.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.lbMessage.AutoSize = true;
            this.lbMessage.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbMessage.ForeColor = System.Drawing.Color.Black;
            this.lbMessage.Location = new System.Drawing.Point(20, 95);
            this.lbMessage.Name = "lbMessage";
            this.lbMessage.Size = new System.Drawing.Size(66, 19);
            this.lbMessage.TabIndex = 147;
            this.lbMessage.Text = "Message:";
            // 
            // lbNumberPhone
            // 
            this.lbNumberPhone.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.lbNumberPhone.AutoSize = true;
            this.lbNumberPhone.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbNumberPhone.ForeColor = System.Drawing.Color.Black;
            this.lbNumberPhone.Location = new System.Drawing.Point(20, 43);
            this.lbNumberPhone.Name = "lbNumberPhone";
            this.lbNumberPhone.Size = new System.Drawing.Size(179, 19);
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
            // FormCompose
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.InactiveCaptionText;
            this.ClientSize = new System.Drawing.Size(573, 279);
            this.Controls.Add(this.lbTitle);
            this.Controls.Add(this.piboCompose);
            this.Controls.Add(this.gboOptions);
            this.Controls.Add(this.btnClear);
            this.Controls.Add(this.butClosse);
            this.Controls.Add(this.but_Send);
            this.Controls.Add(this.txt_Message);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.lbMessage);
            this.Controls.Add(this.lbNumberPhone);
            this.ForeColor = System.Drawing.Color.Maroon;
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
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.CheckBox checkBox2;
        private System.Windows.Forms.GroupBox gboOptions;
        private System.Windows.Forms.Label lbTimes;
        private System.Windows.Forms.CheckBox chkUnicode;
        private System.Windows.Forms.CheckBox chkAlert;
        private System.Windows.Forms.Button btnClear;
        private System.Windows.Forms.Button butClosse;
        private System.Windows.Forms.Button but_Send;
        internal System.Windows.Forms.TextBox txt_Message;
        internal System.Windows.Forms.TextBox textBox1;
        internal System.Windows.Forms.Label lbMessage;
        internal System.Windows.Forms.Label lbNumberPhone;
        private System.Windows.Forms.Label lbTitle;




    }
}