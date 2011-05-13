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
            this.txtMessage = new System.Windows.Forms.TextBox();
            this.piboCompose = new System.Windows.Forms.PictureBox();
            this.lbTitle = new System.Windows.Forms.Label();
            this.btnContacts = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.txtPhoneNumber = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.chkUnicode = new System.Windows.Forms.CheckBox();
            this.btnSent = new System.Windows.Forms.Button();
            this.btnClear = new System.Windows.Forms.Button();
            this.butClosse = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.piboCompose)).BeginInit();
            this.SuspendLayout();
            // 
            // txtMessage
            // 
            this.txtMessage.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMessage.Location = new System.Drawing.Point(5, 100);
            this.txtMessage.Multiline = true;
            this.txtMessage.Name = "txtMessage";
            this.txtMessage.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtMessage.Size = new System.Drawing.Size(316, 95);
            this.txtMessage.TabIndex = 163;
            // 
            // piboCompose
            // 
            this.piboCompose.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("piboCompose.BackgroundImage")));
            this.piboCompose.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.piboCompose.ErrorImage = ((System.Drawing.Image)(resources.GetObject("piboCompose.ErrorImage")));
            this.piboCompose.InitialImage = ((System.Drawing.Image)(resources.GetObject("piboCompose.InitialImage")));
            this.piboCompose.Location = new System.Drawing.Point(327, 97);
            this.piboCompose.Name = "piboCompose";
            this.piboCompose.Size = new System.Drawing.Size(234, 100);
            this.piboCompose.TabIndex = 155;
            this.piboCompose.TabStop = false;
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
            // btnContacts
            // 
            this.btnContacts.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnContacts.ForeColor = System.Drawing.Color.Black;
            this.btnContacts.Location = new System.Drawing.Point(493, 41);
            this.btnContacts.Name = "btnContacts";
            this.btnContacts.Size = new System.Drawing.Size(68, 23);
            this.btnContacts.TabIndex = 158;
            this.btnContacts.Text = "Danh Bạ";
            this.btnContacts.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.Black;
            this.label1.Location = new System.Drawing.Point(2, 46);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(100, 13);
            this.label1.TabIndex = 159;
            this.label1.Text = "Số Điện Thoại : ";
            // 
            // txtPhoneNumber
            // 
            this.txtPhoneNumber.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPhoneNumber.Location = new System.Drawing.Point(105, 42);
            this.txtPhoneNumber.Name = "txtPhoneNumber";
            this.txtPhoneNumber.Size = new System.Drawing.Size(382, 22);
            this.txtPhoneNumber.TabIndex = 160;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.Black;
            this.label2.Location = new System.Drawing.Point(2, 77);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(128, 13);
            this.label2.TabIndex = 161;
            this.label2.Text = "Nội Dung Tin Nhắn : ";
            // 
            // chkUnicode
            // 
            this.chkUnicode.AutoSize = true;
            this.chkUnicode.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkUnicode.ForeColor = System.Drawing.Color.Black;
            this.chkUnicode.Location = new System.Drawing.Point(150, 74);
            this.chkUnicode.Name = "chkUnicode";
            this.chkUnicode.Size = new System.Drawing.Size(134, 20);
            this.chkUnicode.TabIndex = 162;
            this.chkUnicode.Text = "Tiếng Việt (UCS2)";
            this.chkUnicode.UseVisualStyleBackColor = true;
            // 
            // btnSent
            // 
            this.btnSent.BackColor = System.Drawing.Color.Navy;
            this.btnSent.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSent.ForeColor = System.Drawing.Color.White;
            this.btnSent.Location = new System.Drawing.Point(5, 203);
            this.btnSent.Name = "btnSent";
            this.btnSent.Size = new System.Drawing.Size(99, 23);
            this.btnSent.TabIndex = 164;
            this.btnSent.Text = "Gửi";
            this.btnSent.UseVisualStyleBackColor = false;
            this.btnSent.Click += new System.EventHandler(this.but_Send_Click);
            // 
            // btnClear
            // 
            this.btnClear.BackColor = System.Drawing.Color.Navy;
            this.btnClear.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnClear.ForeColor = System.Drawing.Color.White;
            this.btnClear.Location = new System.Drawing.Point(110, 203);
            this.btnClear.Name = "btnClear";
            this.btnClear.Size = new System.Drawing.Size(99, 23);
            this.btnClear.TabIndex = 165;
            this.btnClear.Text = "Xóa Trường";
            this.btnClear.UseVisualStyleBackColor = false;
            this.btnClear.Click += new System.EventHandler(this.btnClear_Click);
            // 
            // butClosse
            // 
            this.butClosse.BackColor = System.Drawing.Color.Navy;
            this.butClosse.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.butClosse.ForeColor = System.Drawing.Color.White;
            this.butClosse.Location = new System.Drawing.Point(215, 203);
            this.butClosse.Name = "butClosse";
            this.butClosse.Size = new System.Drawing.Size(99, 23);
            this.butClosse.TabIndex = 166;
            this.butClosse.Text = "Đóng";
            this.butClosse.UseVisualStyleBackColor = false;
            this.butClosse.Click += new System.EventHandler(this.butClosse_Click);
            // 
            // FormCompose
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(566, 229);
            this.Controls.Add(this.butClosse);
            this.Controls.Add(this.btnClear);
            this.Controls.Add(this.btnSent);
            this.Controls.Add(this.txtMessage);
            this.Controls.Add(this.chkUnicode);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtPhoneNumber);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnContacts);
            this.Controls.Add(this.lbTitle);
            this.Controls.Add(this.piboCompose);
            this.ForeColor = System.Drawing.Color.Maroon;
            this.MaximizeBox = false;
            this.Name = "FormCompose";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Compose";
            ((System.ComponentModel.ISupportInitialize)(this.piboCompose)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox piboCompose;
        private System.Windows.Forms.Label lbTitle;
        private System.Windows.Forms.Button btnContacts;
        private System.Windows.Forms.Label label1;
        public System.Windows.Forms.TextBox txtPhoneNumber;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.CheckBox chkUnicode;
        private System.Windows.Forms.Button btnSent;
        private System.Windows.Forms.Button btnClear;
        private System.Windows.Forms.Button butClosse;
        public System.Windows.Forms.TextBox txtMessage;
        
    }
}