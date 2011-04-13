
﻿namespace SMS.view
{
    partial class FormAddAccount
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormAddAccount));
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.dtp_NgayDangKy = new System.Windows.Forms.DateTimePicker();
            this.txt_ServiceCharges = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.txt_Note = new System.Windows.Forms.TextBox();
            this.lbl_Note = new System.Windows.Forms.Label();
            this.txt_StudentID = new System.Windows.Forms.TextBox();
            this.txt_NumberPhone = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.cbo_AccountType = new System.Windows.Forms.ComboBox();
            this.but_Close = new System.Windows.Forms.Button();
            this.but_Add = new System.Windows.Forms.Button();
            this.lbl_TitleAccount = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.groupBox1.Controls.Add(this.dtp_NgayDangKy);
            this.groupBox1.Controls.Add(this.txt_ServiceCharges);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.txt_Note);
            this.groupBox1.Controls.Add(this.lbl_Note);
            this.groupBox1.Controls.Add(this.txt_StudentID);
            this.groupBox1.Controls.Add(this.txt_NumberPhone);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.cbo_AccountType);
            this.groupBox1.Controls.Add(this.but_Close);
            this.groupBox1.Controls.Add(this.but_Add);
            this.groupBox1.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(22, 45);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(556, 200);
            this.groupBox1.TabIndex = 20;
            this.groupBox1.TabStop = false;
            // 
            // dtp_NgayDangKy
            // 
            this.dtp_NgayDangKy.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.dtp_NgayDangKy.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtp_NgayDangKy.Location = new System.Drawing.Point(385, 11);
            this.dtp_NgayDangKy.Name = "dtp_NgayDangKy";
            this.dtp_NgayDangKy.Size = new System.Drawing.Size(150, 22);
            this.dtp_NgayDangKy.TabIndex = 179;
            // 
            // txt_ServiceCharges
            // 
            this.txt_ServiceCharges.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.txt_ServiceCharges.Enabled = false;
            this.txt_ServiceCharges.Location = new System.Drawing.Point(106, 93);
            this.txt_ServiceCharges.Name = "txt_ServiceCharges";
            this.txt_ServiceCharges.Size = new System.Drawing.Size(150, 22);
            this.txt_ServiceCharges.TabIndex = 178;
            // 
            // label7
            // 
            this.label7.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(285, 16);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(101, 15);
            this.label7.TabIndex = 177;
            this.label7.Text = "Registration date:";
            // 
            // label1
            // 
            this.label1.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(5, 96);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(94, 15);
            this.label1.TabIndex = 177;
            this.label1.Text = "Service charges:";
            // 
            // txt_Note
            // 
            this.txt_Note.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.txt_Note.Location = new System.Drawing.Point(344, 37);
            this.txt_Note.Multiline = true;
            this.txt_Note.Name = "txt_Note";
            this.txt_Note.Size = new System.Drawing.Size(191, 76);
            this.txt_Note.TabIndex = 174;
            // 
            // lbl_Note
            // 
            this.lbl_Note.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.lbl_Note.AutoSize = true;
            this.lbl_Note.Location = new System.Drawing.Point(285, 40);
            this.lbl_Note.Name = "lbl_Note";
            this.lbl_Note.Size = new System.Drawing.Size(39, 15);
            this.lbl_Note.TabIndex = 170;
            this.lbl_Note.Text = "Note: ";
            // 
            // txt_StudentID
            // 
            this.txt_StudentID.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.txt_StudentID.Location = new System.Drawing.Point(106, 40);
            this.txt_StudentID.Name = "txt_StudentID";
            this.txt_StudentID.Size = new System.Drawing.Size(150, 22);
            this.txt_StudentID.TabIndex = 175;
            // 
            // txt_NumberPhone
            // 
            this.txt_NumberPhone.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.txt_NumberPhone.Location = new System.Drawing.Point(106, 11);
            this.txt_NumberPhone.Name = "txt_NumberPhone";
            this.txt_NumberPhone.Size = new System.Drawing.Size(150, 22);
            this.txt_NumberPhone.TabIndex = 176;
            // 
            // label3
            // 
            this.label3.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(5, 40);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(68, 15);
            this.label3.TabIndex = 166;
            this.label3.Text = "StudentID: ";
            // 
            // label2
            // 
            this.label2.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(5, 15);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(89, 15);
            this.label2.TabIndex = 167;
            this.label2.Text = "Number phone:";
            // 
            // label5
            // 
            this.label5.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(5, 69);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(87, 15);
            this.label5.TabIndex = 169;
            this.label5.Text = "Account type: ";
            // 
            // cbo_AccountType
            // 
            this.cbo_AccountType.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.cbo_AccountType.FormattingEnabled = true;
            this.cbo_AccountType.Location = new System.Drawing.Point(106, 66);
            this.cbo_AccountType.Name = "cbo_AccountType";
            this.cbo_AccountType.Size = new System.Drawing.Size(150, 23);
            this.cbo_AccountType.TabIndex = 171;
            this.cbo_AccountType.SelectedIndexChanged += new System.EventHandler(this.cbo_AccountType_SelectedIndexChanged);
            // 
            // but_Close
            // 
            this.but_Close.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.but_Close.BackColor = System.Drawing.Color.Blue;
            this.but_Close.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Close.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Close.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Close.Image = ((System.Drawing.Image)(resources.GetObject("but_Close.Image")));
            this.but_Close.Location = new System.Drawing.Point(287, 157);
            this.but_Close.Name = "but_Close";
            this.but_Close.Size = new System.Drawing.Size(98, 23);
            this.but_Close.TabIndex = 162;
            this.but_Close.Text = "Close";
            this.but_Close.UseVisualStyleBackColor = false;
            this.but_Close.Click += new System.EventHandler(this.but_Close_Click);
            // 
            // but_Add
            // 
            this.but_Add.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.but_Add.BackColor = System.Drawing.Color.Blue;
            this.but_Add.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Add.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Add.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Add.Image = ((System.Drawing.Image)(resources.GetObject("but_Add.Image")));
            this.but_Add.Location = new System.Drawing.Point(164, 157);
            this.but_Add.Name = "but_Add";
            this.but_Add.Size = new System.Drawing.Size(98, 23);
            this.but_Add.TabIndex = 163;
            this.but_Add.Text = "Add";
            this.but_Add.UseVisualStyleBackColor = false;
            this.but_Add.Click += new System.EventHandler(this.but_Add_Click);
            // 
            // lbl_TitleAccount
            // 
            this.lbl_TitleAccount.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.lbl_TitleAccount.AutoSize = true;
            this.lbl_TitleAccount.Font = new System.Drawing.Font("Times New Roman", 21.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_TitleAccount.Location = new System.Drawing.Point(211, 4);
            this.lbl_TitleAccount.Name = "lbl_TitleAccount";
            this.lbl_TitleAccount.Size = new System.Drawing.Size(178, 32);
            this.lbl_TitleAccount.TabIndex = 145;
            this.lbl_TitleAccount.Text = "New Account";
            // 
            // FormAddAccount
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(599, 260);
            this.Controls.Add(this.lbl_TitleAccount);
            this.Controls.Add(this.groupBox1);
            this.MaximizeBox = false;
            this.Name = "FormAddAccount";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FormAddAccount";
            this.Load += new System.EventHandler(this.FormAddAccount_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button but_Close;
        private System.Windows.Forms.Button but_Add;
        private System.Windows.Forms.TextBox txt_Note;
        private System.Windows.Forms.Label lbl_Note;
        private System.Windows.Forms.TextBox txt_StudentID;
        private System.Windows.Forms.TextBox txt_NumberPhone;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ComboBox cbo_AccountType;
        private System.Windows.Forms.Label lbl_TitleAccount;
        private System.Windows.Forms.TextBox txt_ServiceCharges;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DateTimePicker dtp_NgayDangKy;
        private System.Windows.Forms.Label label7;
    }
}