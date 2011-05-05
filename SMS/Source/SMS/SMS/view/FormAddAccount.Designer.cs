
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormAddAccount));
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.lbl_TitleAccount = new System.Windows.Forms.Label();
            this.pic_choose = new System.Windows.Forms.PictureBox();
            this.dtp_NgayDangKy = new System.Windows.Forms.DateTimePicker();
            this.txt_ServiceCharges = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.txt_Note = new System.Windows.Forms.TextBox();
            this.lbl_Note = new System.Windows.Forms.Label();
            this.txt_StudentID = new System.Windows.Forms.TextBox();
            this.txt_NumberPhone3 = new System.Windows.Forms.TextBox();
            this.txt_NumberPhone2 = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.txt_NumberPhone = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.lbl_StudentID = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.cbo_AccountType = new System.Windows.Forms.ComboBox();
            this.button1 = new System.Windows.Forms.Button();
            this.but_Close = new System.Windows.Forms.Button();
            this.but_Add = new System.Windows.Forms.Button();
            this.imageList1 = new System.Windows.Forms.ImageList(this.components);
            this.timer_giay = new System.Windows.Forms.Timer(this.components);
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pic_choose)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.groupBox1.BackColor = System.Drawing.Color.Transparent;
            this.groupBox1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.groupBox1.Controls.Add(this.lbl_TitleAccount);
            this.groupBox1.Controls.Add(this.pic_choose);
            this.groupBox1.Controls.Add(this.dtp_NgayDangKy);
            this.groupBox1.Controls.Add(this.txt_ServiceCharges);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.txt_Note);
            this.groupBox1.Controls.Add(this.lbl_Note);
            this.groupBox1.Controls.Add(this.txt_StudentID);
            this.groupBox1.Controls.Add(this.txt_NumberPhone3);
            this.groupBox1.Controls.Add(this.txt_NumberPhone2);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.txt_NumberPhone);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.lbl_StudentID);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.cbo_AccountType);
            this.groupBox1.Controls.Add(this.button1);
            this.groupBox1.Controls.Add(this.but_Close);
            this.groupBox1.Controls.Add(this.but_Add);
            this.groupBox1.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(22, 8);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(556, 276);
            this.groupBox1.TabIndex = 20;
            this.groupBox1.TabStop = false;
            // 
            // lbl_TitleAccount
            // 
            this.lbl_TitleAccount.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.lbl_TitleAccount.AutoSize = true;
            this.lbl_TitleAccount.BackColor = System.Drawing.Color.Transparent;
            this.lbl_TitleAccount.Font = new System.Drawing.Font("Times New Roman", 21.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_TitleAccount.Location = new System.Drawing.Point(128, 18);
            this.lbl_TitleAccount.Name = "lbl_TitleAccount";
            this.lbl_TitleAccount.Size = new System.Drawing.Size(291, 32);
            this.lbl_TitleAccount.TabIndex = 145;
            this.lbl_TitleAccount.Text = "Thêm Tài Khoản SMS";
            // 
            // pic_choose
            // 
            this.pic_choose.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.pic_choose.Location = new System.Drawing.Point(406, 151);
            this.pic_choose.Name = "pic_choose";
            this.pic_choose.Size = new System.Drawing.Size(110, 110);
            this.pic_choose.TabIndex = 180;
            this.pic_choose.TabStop = false;
            // 
            // dtp_NgayDangKy
            // 
            this.dtp_NgayDangKy.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.dtp_NgayDangKy.Enabled = false;
            this.dtp_NgayDangKy.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtp_NgayDangKy.Location = new System.Drawing.Point(390, 65);
            this.dtp_NgayDangKy.Name = "dtp_NgayDangKy";
            this.dtp_NgayDangKy.Size = new System.Drawing.Size(150, 22);
            this.dtp_NgayDangKy.TabIndex = 179;
            this.dtp_NgayDangKy.Leave += new System.EventHandler(this.dtp_NgayDangKy_Leave);
            // 
            // txt_ServiceCharges
            // 
            this.txt_ServiceCharges.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.txt_ServiceCharges.Enabled = false;
            this.txt_ServiceCharges.Location = new System.Drawing.Point(112, 206);
            this.txt_ServiceCharges.Name = "txt_ServiceCharges";
            this.txt_ServiceCharges.Size = new System.Drawing.Size(150, 22);
            this.txt_ServiceCharges.TabIndex = 178;
            // 
            // label7
            // 
            this.label7.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(290, 69);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(85, 15);
            this.label7.TabIndex = 177;
            this.label7.Text = "Ngày đăng ký:";
            // 
            // label1
            // 
            this.label1.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(11, 209);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(70, 15);
            this.label1.TabIndex = 177;
            this.label1.Text = "Phí dịch vụ:";
            // 
            // txt_Note
            // 
            this.txt_Note.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.txt_Note.Enabled = false;
            this.txt_Note.Location = new System.Drawing.Point(349, 91);
            this.txt_Note.MaxLength = 500;
            this.txt_Note.Multiline = true;
            this.txt_Note.Name = "txt_Note";
            this.txt_Note.Size = new System.Drawing.Size(191, 54);
            this.txt_Note.TabIndex = 174;
            // 
            // lbl_Note
            // 
            this.lbl_Note.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.lbl_Note.AutoSize = true;
            this.lbl_Note.Location = new System.Drawing.Point(290, 99);
            this.lbl_Note.Name = "lbl_Note";
            this.lbl_Note.Size = new System.Drawing.Size(51, 15);
            this.lbl_Note.TabIndex = 170;
            this.lbl_Note.Text = "Ghi chú:";
            // 
            // txt_StudentID
            // 
            this.txt_StudentID.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.txt_StudentID.Location = new System.Drawing.Point(112, 67);
            this.txt_StudentID.Name = "txt_StudentID";
            this.txt_StudentID.Size = new System.Drawing.Size(150, 22);
            this.txt_StudentID.TabIndex = 175;
            this.txt_StudentID.TextChanged += new System.EventHandler(this.txt_StudentID_TextChanged);
            this.txt_StudentID.Leave += new System.EventHandler(this.txt_StudentID_Leave);
            // 
            // txt_NumberPhone3
            // 
            this.txt_NumberPhone3.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.txt_NumberPhone3.Enabled = false;
            this.txt_NumberPhone3.Location = new System.Drawing.Point(112, 151);
            this.txt_NumberPhone3.MaxLength = 11;
            this.txt_NumberPhone3.Name = "txt_NumberPhone3";
            this.txt_NumberPhone3.Size = new System.Drawing.Size(150, 22);
            this.txt_NumberPhone3.TabIndex = 176;
            this.txt_NumberPhone3.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txt_NumberPhone3_KeyPress);
            // 
            // txt_NumberPhone2
            // 
            this.txt_NumberPhone2.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.txt_NumberPhone2.Enabled = false;
            this.txt_NumberPhone2.Location = new System.Drawing.Point(112, 123);
            this.txt_NumberPhone2.MaxLength = 11;
            this.txt_NumberPhone2.Name = "txt_NumberPhone2";
            this.txt_NumberPhone2.Size = new System.Drawing.Size(150, 22);
            this.txt_NumberPhone2.TabIndex = 176;
            this.txt_NumberPhone2.TextChanged += new System.EventHandler(this.txt_NumberPhone2_TextChanged);
            this.txt_NumberPhone2.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txt_NumberPhone2_KeyPress);
            // 
            // label6
            // 
            this.label6.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(11, 155);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(89, 15);
            this.label6.TabIndex = 167;
            this.label6.Text = "Số điện thoại 3:";
            // 
            // txt_NumberPhone
            // 
            this.txt_NumberPhone.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.txt_NumberPhone.Enabled = false;
            this.txt_NumberPhone.Location = new System.Drawing.Point(112, 95);
            this.txt_NumberPhone.MaxLength = 11;
            this.txt_NumberPhone.Name = "txt_NumberPhone";
            this.txt_NumberPhone.Size = new System.Drawing.Size(150, 22);
            this.txt_NumberPhone.TabIndex = 176;
            this.txt_NumberPhone.TextChanged += new System.EventHandler(this.txt_NumberPhone_TextChanged);
            this.txt_NumberPhone.Leave += new System.EventHandler(this.txt_NumberPhone_Leave);
            this.txt_NumberPhone.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txt_NumberPhone_KeyPress);
            // 
            // label4
            // 
            this.label4.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(11, 127);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(89, 15);
            this.label4.TabIndex = 167;
            this.label4.Text = "Số điện thoại 2:";
            // 
            // lbl_StudentID
            // 
            this.lbl_StudentID.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.lbl_StudentID.AutoSize = true;
            this.lbl_StudentID.Location = new System.Drawing.Point(11, 67);
            this.lbl_StudentID.Name = "lbl_StudentID";
            this.lbl_StudentID.Size = new System.Drawing.Size(80, 15);
            this.lbl_StudentID.TabIndex = 166;
            this.lbl_StudentID.Text = "Mã sinh viên:";
            // 
            // label2
            // 
            this.label2.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(11, 99);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(89, 15);
            this.label2.TabIndex = 167;
            this.label2.Text = "Số điện thoại 1:";
            // 
            // label5
            // 
            this.label5.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(11, 182);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(82, 15);
            this.label5.TabIndex = 169;
            this.label5.Text = "Loại TK SMS:";
            // 
            // cbo_AccountType
            // 
            this.cbo_AccountType.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.cbo_AccountType.Enabled = false;
            this.cbo_AccountType.FormattingEnabled = true;
            this.cbo_AccountType.Location = new System.Drawing.Point(112, 179);
            this.cbo_AccountType.Name = "cbo_AccountType";
            this.cbo_AccountType.Size = new System.Drawing.Size(150, 23);
            this.cbo_AccountType.TabIndex = 171;
            this.cbo_AccountType.SelectedIndexChanged += new System.EventHandler(this.cbo_AccountType_SelectedIndexChanged);
            // 
            // button1
            // 
            this.button1.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.button1.Cursor = System.Windows.Forms.Cursors.Hand;
            this.button1.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.Image = ((System.Drawing.Image)(resources.GetObject("button1.Image")));
            this.button1.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.button1.Location = new System.Drawing.Point(268, 238);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(118, 25);
            this.button1.TabIndex = 162;
            this.button1.Text = "In Thông Tin";
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.but_Close_Click);
            // 
            // but_Close
            // 
            this.but_Close.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.but_Close.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Close.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Close.Image = ((System.Drawing.Image)(resources.GetObject("but_Close.Image")));
            this.but_Close.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Close.Location = new System.Drawing.Point(143, 238);
            this.but_Close.Name = "but_Close";
            this.but_Close.Size = new System.Drawing.Size(110, 25);
            this.but_Close.TabIndex = 162;
            this.but_Close.Text = "Thoát";
            this.but_Close.UseVisualStyleBackColor = false;
            this.but_Close.Click += new System.EventHandler(this.but_Close_Click);
            // 
            // but_Add
            // 
            this.but_Add.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.but_Add.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Add.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.but_Add.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Add.Image = ((System.Drawing.Image)(resources.GetObject("but_Add.Image")));
            this.but_Add.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Add.Location = new System.Drawing.Point(20, 238);
            this.but_Add.Name = "but_Add";
            this.but_Add.Size = new System.Drawing.Size(110, 25);
            this.but_Add.TabIndex = 163;
            this.but_Add.Text = "Thêm";
            this.but_Add.UseVisualStyleBackColor = false;
            this.but_Add.Click += new System.EventHandler(this.but_Add_Click);
            // 
            // imageList1
            // 
            this.imageList1.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("imageList1.ImageStream")));
            this.imageList1.TransparentColor = System.Drawing.Color.Transparent;
            this.imageList1.Images.SetKeyName(0, "1.bmp");
            this.imageList1.Images.SetKeyName(1, "2.bmp");
            this.imageList1.Images.SetKeyName(2, "3.bmp");
            this.imageList1.Images.SetKeyName(3, "4.bmp");
            this.imageList1.Images.SetKeyName(4, "5.bmp");
            this.imageList1.Images.SetKeyName(5, "6.bmp");
            this.imageList1.Images.SetKeyName(6, "7.bmp");
            this.imageList1.Images.SetKeyName(7, "8.bmp");
            this.imageList1.Images.SetKeyName(8, "9.bmp");
            this.imageList1.Images.SetKeyName(9, "10.bmp");
            this.imageList1.Images.SetKeyName(10, "11.bmp");
            this.imageList1.Images.SetKeyName(11, "12.bmp");
            this.imageList1.Images.SetKeyName(12, "13.bmp");
            this.imageList1.Images.SetKeyName(13, "14.bmp");
            this.imageList1.Images.SetKeyName(14, "15.bmp");
            this.imageList1.Images.SetKeyName(15, "16.bmp");
            this.imageList1.Images.SetKeyName(16, "17.bmp");
            this.imageList1.Images.SetKeyName(17, "18.bmp");
            this.imageList1.Images.SetKeyName(18, "19.bmp");
            this.imageList1.Images.SetKeyName(19, "20.bmp");
            // 
            // timer_giay
            // 
            this.timer_giay.Tick += new System.EventHandler(this.timer_giay_Tick);
            // 
            // FormAddAccount
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Inherit;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.ClientSize = new System.Drawing.Size(599, 304);
            this.Controls.Add(this.groupBox1);
            this.Name = "FormAddAccount";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FormAddAccount";
            this.Load += new System.EventHandler(this.FormAddAccount_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pic_choose)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button but_Close;
        private System.Windows.Forms.Button but_Add;
        private System.Windows.Forms.TextBox txt_Note;
        private System.Windows.Forms.Label lbl_Note;
        private System.Windows.Forms.TextBox txt_StudentID;
        private System.Windows.Forms.TextBox txt_NumberPhone;
        private System.Windows.Forms.Label lbl_StudentID;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ComboBox cbo_AccountType;
        private System.Windows.Forms.Label lbl_TitleAccount;
        private System.Windows.Forms.TextBox txt_ServiceCharges;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DateTimePicker dtp_NgayDangKy;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox txt_NumberPhone3;
        private System.Windows.Forms.TextBox txt_NumberPhone2;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.PictureBox pic_choose;
        private System.Windows.Forms.ImageList imageList1;
        private System.Windows.Forms.Timer timer_giay;
        private System.Windows.Forms.Button button1;
    }
}