namespace SMS
{
    partial class FormInbox
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormInbox));
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel4 = new System.Windows.Forms.Panel();
            this.panel6 = new System.Windows.Forms.Panel();
            this.panel5 = new System.Windows.Forms.Panel();
            this.but_Close = new System.Windows.Forms.Button();
            this.but_Delete = new System.Windows.Forms.Button();
            this.but_Refresh = new System.Windows.Forms.Button();
            this.chk_All = new System.Windows.Forms.CheckBox();
            this.dtp_Choose = new System.Windows.Forms.DateTimePicker();
            this.label15 = new System.Windows.Forms.Label();
            this.cbo_Choose = new System.Windows.Forms.ComboBox();
            this.but_LastPage = new System.Windows.Forms.Button();
            this.but_PreviousPage = new System.Windows.Forms.Button();
            this.but_FirstPage = new System.Windows.Forms.Button();
            this.but_NextPage = new System.Windows.Forms.Button();
            this.label18 = new System.Windows.Forms.Label();
            this.label19 = new System.Windows.Forms.Label();
            this.but_AddressBook = new System.Windows.Forms.Button();
            this.but_Draft = new System.Windows.Forms.Button();
            this.but_Send = new System.Windows.Forms.Button();
            this.txt_Message = new System.Windows.Forms.TextBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label17 = new System.Windows.Forms.Label();
            this.label16 = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.dlv_Inbox = new System.Windows.Forms.DataGridView();
            this.Id = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Name = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.So_dien_thoai = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Ma_cu_phap = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Noi_dung_tin_nhan = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Loai_tin_nhan = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Loai_Hop_thu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Tinh_trang = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.panel1.SuspendLayout();
            this.panel4.SuspendLayout();
            this.panel5.SuspendLayout();
            this.panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dlv_Inbox)).BeginInit();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel1.Controls.Add(this.panel4);
            this.panel1.Controls.Add(this.panel2);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(901, 517);
            this.panel1.TabIndex = 0;
            // 
            // panel4
            // 
            this.panel4.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel4.Controls.Add(this.panel6);
            this.panel4.Controls.Add(this.panel5);
            this.panel4.Controls.Add(this.label18);
            this.panel4.Controls.Add(this.label19);
            this.panel4.Controls.Add(this.but_AddressBook);
            this.panel4.Controls.Add(this.but_Draft);
            this.panel4.Controls.Add(this.but_Send);
            this.panel4.Controls.Add(this.txt_Message);
            this.panel4.Controls.Add(this.textBox1);
            this.panel4.Controls.Add(this.label17);
            this.panel4.Controls.Add(this.label16);
            this.panel4.Location = new System.Drawing.Point(10, 330);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(877, 173);
            this.panel4.TabIndex = 119;
            // 
            // panel6
            // 
            this.panel6.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("panel6.BackgroundImage")));
            this.panel6.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel6.Location = new System.Drawing.Point(744, 61);
            this.panel6.Name = "panel6";
            this.panel6.Size = new System.Drawing.Size(113, 110);
            this.panel6.TabIndex = 133;
            // 
            // panel5
            // 
            this.panel5.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel5.Controls.Add(this.but_Close);
            this.panel5.Controls.Add(this.but_Delete);
            this.panel5.Controls.Add(this.but_Refresh);
            this.panel5.Controls.Add(this.chk_All);
            this.panel5.Controls.Add(this.dtp_Choose);
            this.panel5.Controls.Add(this.label15);
            this.panel5.Controls.Add(this.cbo_Choose);
            this.panel5.Controls.Add(this.but_LastPage);
            this.panel5.Controls.Add(this.but_PreviousPage);
            this.panel5.Controls.Add(this.but_FirstPage);
            this.panel5.Controls.Add(this.but_NextPage);
            this.panel5.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.panel5.Location = new System.Drawing.Point(14, 11);
            this.panel5.Name = "panel5";
            this.panel5.Size = new System.Drawing.Size(843, 50);
            this.panel5.TabIndex = 129;
            // 
            // but_Close
            // 
            this.but_Close.BackColor = System.Drawing.Color.Blue;
            this.but_Close.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Close.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Close.Image = ((System.Drawing.Image)(resources.GetObject("but_Close.Image")));
            this.but_Close.Location = new System.Drawing.Point(755, 12);
            this.but_Close.Name = "but_Close";
            this.but_Close.Size = new System.Drawing.Size(75, 23);
            this.but_Close.TabIndex = 122;
            this.but_Close.Text = "Close";
            this.but_Close.UseVisualStyleBackColor = false;
            // 
            // but_Delete
            // 
            this.but_Delete.BackColor = System.Drawing.Color.Blue;
            this.but_Delete.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Delete.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Delete.Image = ((System.Drawing.Image)(resources.GetObject("but_Delete.Image")));
            this.but_Delete.Location = new System.Drawing.Point(668, 13);
            this.but_Delete.Name = "but_Delete";
            this.but_Delete.Size = new System.Drawing.Size(75, 23);
            this.but_Delete.TabIndex = 123;
            this.but_Delete.Text = "Delete";
            this.but_Delete.UseVisualStyleBackColor = false;
            // 
            // but_Refresh
            // 
            this.but_Refresh.BackColor = System.Drawing.Color.Blue;
            this.but_Refresh.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Refresh.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Refresh.Image = ((System.Drawing.Image)(resources.GetObject("but_Refresh.Image")));
            this.but_Refresh.Location = new System.Drawing.Point(571, 13);
            this.but_Refresh.Name = "but_Refresh";
            this.but_Refresh.Size = new System.Drawing.Size(75, 23);
            this.but_Refresh.TabIndex = 124;
            this.but_Refresh.Text = "Refresh";
            this.but_Refresh.UseVisualStyleBackColor = false;
            // 
            // chk_All
            // 
            this.chk_All.AutoSize = true;
            this.chk_All.Location = new System.Drawing.Point(502, 19);
            this.chk_All.Name = "chk_All";
            this.chk_All.Size = new System.Drawing.Size(40, 17);
            this.chk_All.TabIndex = 121;
            this.chk_All.Text = "All";
            this.chk_All.UseVisualStyleBackColor = true;
            // 
            // dtp_Choose
            // 
            this.dtp_Choose.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtp_Choose.Location = new System.Drawing.Point(388, 16);
            this.dtp_Choose.Name = "dtp_Choose";
            this.dtp_Choose.Size = new System.Drawing.Size(102, 20);
            this.dtp_Choose.TabIndex = 120;
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.BackColor = System.Drawing.Color.Pink;
            this.label15.Location = new System.Drawing.Point(203, 22);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(49, 13);
            this.label15.TabIndex = 119;
            this.label15.Text = "Filter>>";
            // 
            // cbo_Choose
            // 
            this.cbo_Choose.FormattingEnabled = true;
            this.cbo_Choose.Items.AddRange(new object[] {
            "Number phone",
            "Keyword ID",
            "Message type",
            "Status",
            "Inbox type"});
            this.cbo_Choose.Location = new System.Drawing.Point(258, 17);
            this.cbo_Choose.Name = "cbo_Choose";
            this.cbo_Choose.Size = new System.Drawing.Size(108, 21);
            this.cbo_Choose.TabIndex = 118;
            // 
            // but_LastPage
            // 
            this.but_LastPage.BackColor = System.Drawing.Color.Blue;
            this.but_LastPage.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_LastPage.ForeColor = System.Drawing.SystemColors.Control;
            this.but_LastPage.Image = ((System.Drawing.Image)(resources.GetObject("but_LastPage.Image")));
            this.but_LastPage.Location = new System.Drawing.Point(155, 15);
            this.but_LastPage.Name = "but_LastPage";
            this.but_LastPage.Size = new System.Drawing.Size(42, 23);
            this.but_LastPage.TabIndex = 117;
            this.but_LastPage.Text = ">>";
            this.but_LastPage.UseVisualStyleBackColor = false;
            // 
            // but_PreviousPage
            // 
            this.but_PreviousPage.BackColor = System.Drawing.Color.Blue;
            this.but_PreviousPage.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_PreviousPage.ForeColor = System.Drawing.SystemColors.Control;
            this.but_PreviousPage.Image = ((System.Drawing.Image)(resources.GetObject("but_PreviousPage.Image")));
            this.but_PreviousPage.Location = new System.Drawing.Point(59, 15);
            this.but_PreviousPage.Name = "but_PreviousPage";
            this.but_PreviousPage.Size = new System.Drawing.Size(42, 23);
            this.but_PreviousPage.TabIndex = 115;
            this.but_PreviousPage.Text = "<";
            this.but_PreviousPage.UseVisualStyleBackColor = false;
            // 
            // but_FirstPage
            // 
            this.but_FirstPage.BackColor = System.Drawing.Color.Blue;
            this.but_FirstPage.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_FirstPage.ForeColor = System.Drawing.SystemColors.Control;
            this.but_FirstPage.Image = ((System.Drawing.Image)(resources.GetObject("but_FirstPage.Image")));
            this.but_FirstPage.Location = new System.Drawing.Point(13, 15);
            this.but_FirstPage.Name = "but_FirstPage";
            this.but_FirstPage.Size = new System.Drawing.Size(42, 23);
            this.but_FirstPage.TabIndex = 114;
            this.but_FirstPage.Text = "<<";
            this.but_FirstPage.UseVisualStyleBackColor = false;
            // 
            // but_NextPage
            // 
            this.but_NextPage.BackColor = System.Drawing.Color.Blue;
            this.but_NextPage.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_NextPage.ForeColor = System.Drawing.SystemColors.Control;
            this.but_NextPage.Image = ((System.Drawing.Image)(resources.GetObject("but_NextPage.Image")));
            this.but_NextPage.Location = new System.Drawing.Point(107, 15);
            this.but_NextPage.Name = "but_NextPage";
            this.but_NextPage.Size = new System.Drawing.Size(42, 23);
            this.but_NextPage.TabIndex = 116;
            this.but_NextPage.Text = ">";
            this.but_NextPage.UseVisualStyleBackColor = false;
            // 
            // label18
            // 
            this.label18.AutoSize = true;
            this.label18.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label18.ForeColor = System.Drawing.SystemColors.ActiveCaption;
            this.label18.Location = new System.Drawing.Point(41, 128);
            this.label18.Name = "label18";
            this.label18.Size = new System.Drawing.Size(67, 13);
            this.label18.TabIndex = 128;
            this.label18.Text = "Remain: 640";
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label19.ForeColor = System.Drawing.SystemColors.ActiveCaption;
            this.label19.Location = new System.Drawing.Point(41, 115);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(65, 13);
            this.label19.TabIndex = 127;
            this.label19.Text = "Character: 0";
            // 
            // but_AddressBook
            // 
            this.but_AddressBook.BackColor = System.Drawing.Color.Blue;
            this.but_AddressBook.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_AddressBook.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_AddressBook.ForeColor = System.Drawing.SystemColors.Control;
            this.but_AddressBook.Image = ((System.Drawing.Image)(resources.GetObject("but_AddressBook.Image")));
            this.but_AddressBook.Location = new System.Drawing.Point(616, 129);
            this.but_AddressBook.Name = "but_AddressBook";
            this.but_AddressBook.Size = new System.Drawing.Size(109, 23);
            this.but_AddressBook.TabIndex = 124;
            this.but_AddressBook.Text = "Address book";
            this.but_AddressBook.UseVisualStyleBackColor = false;
            // 
            // but_Draft
            // 
            this.but_Draft.BackColor = System.Drawing.Color.Blue;
            this.but_Draft.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Draft.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Draft.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Draft.Image = ((System.Drawing.Image)(resources.GetObject("but_Draft.Image")));
            this.but_Draft.Location = new System.Drawing.Point(616, 101);
            this.but_Draft.Name = "but_Draft";
            this.but_Draft.Size = new System.Drawing.Size(109, 23);
            this.but_Draft.TabIndex = 123;
            this.but_Draft.Text = "Darft";
            this.but_Draft.UseVisualStyleBackColor = false;
            // 
            // but_Send
            // 
            this.but_Send.BackColor = System.Drawing.Color.Blue;
            this.but_Send.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Send.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Send.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Send.Image = ((System.Drawing.Image)(resources.GetObject("but_Send.Image")));
            this.but_Send.Location = new System.Drawing.Point(616, 72);
            this.but_Send.Name = "but_Send";
            this.but_Send.Size = new System.Drawing.Size(109, 23);
            this.but_Send.TabIndex = 122;
            this.but_Send.Text = "Send";
            this.but_Send.UseVisualStyleBackColor = false;
            // 
            // txt_Message
            // 
            this.txt_Message.Location = new System.Drawing.Point(123, 95);
            this.txt_Message.MaxLength = 640;
            this.txt_Message.Multiline = true;
            this.txt_Message.Name = "txt_Message";
            this.txt_Message.Size = new System.Drawing.Size(472, 57);
            this.txt_Message.TabIndex = 126;
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(123, 69);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(472, 20);
            this.textBox1.TabIndex = 125;
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label17.ForeColor = System.Drawing.Color.Indigo;
            this.label17.Location = new System.Drawing.Point(15, 95);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(57, 13);
            this.label17.TabIndex = 120;
            this.label17.Text = "Message";
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label16.ForeColor = System.Drawing.Color.Indigo;
            this.label16.Location = new System.Drawing.Point(15, 72);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(90, 13);
            this.label16.TabIndex = 121;
            this.label16.Text = "Number Phone";
            // 
            // panel2
            // 
            this.panel2.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel2.Controls.Add(this.dlv_Inbox);
            this.panel2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.panel2.Location = new System.Drawing.Point(10, 10);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(877, 314);
            this.panel2.TabIndex = 117;
            // 
            // dlv_Inbox
            // 
            this.dlv_Inbox.AllowUserToAddRows = false;
            this.dlv_Inbox.AllowUserToDeleteRows = false;
            this.dlv_Inbox.BackgroundColor = System.Drawing.SystemColors.ButtonHighlight;
            this.dlv_Inbox.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.dlv_Inbox.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dlv_Inbox.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Id,
            this.Name,
            this.So_dien_thoai,
            this.Ma_cu_phap,
            this.Noi_dung_tin_nhan,
            this.Loai_tin_nhan,
            this.Loai_Hop_thu,
            this.Tinh_trang});
            this.dlv_Inbox.Location = new System.Drawing.Point(3, 3);
            this.dlv_Inbox.Name = "dlv_Inbox";
            this.dlv_Inbox.ReadOnly = true;
            this.dlv_Inbox.RowHeadersVisible = false;
            this.dlv_Inbox.Size = new System.Drawing.Size(867, 309);
            this.dlv_Inbox.TabIndex = 115;
            // 
            // Id
            // 
            this.Id.HeaderText = "ID";
            this.Id.Name = "Id";
            this.Id.ReadOnly = true;
            this.Id.Width = 50;
            // 
            // Name
            // 
            this.Name.HeaderText = "Name";
            this.Name.Name = "Name";
            this.Name.ReadOnly = true;
            // 
            // So_dien_thoai
            // 
            this.So_dien_thoai.HeaderText = "Number Phone";
            this.So_dien_thoai.Name = "So_dien_thoai";
            this.So_dien_thoai.ReadOnly = true;
            // 
            // Ma_cu_phap
            // 
            this.Ma_cu_phap.HeaderText = "Keyword ID";
            this.Ma_cu_phap.Name = "Ma_cu_phap";
            this.Ma_cu_phap.ReadOnly = true;
            // 
            // Noi_dung_tin_nhan
            // 
            this.Noi_dung_tin_nhan.HeaderText = "Message content";
            this.Noi_dung_tin_nhan.Name = "Noi_dung_tin_nhan";
            this.Noi_dung_tin_nhan.ReadOnly = true;
            this.Noi_dung_tin_nhan.Width = 250;
            // 
            // Loai_tin_nhan
            // 
            this.Loai_tin_nhan.HeaderText = "Message type";
            this.Loai_tin_nhan.Name = "Loai_tin_nhan";
            this.Loai_tin_nhan.ReadOnly = true;
            // 
            // Loai_Hop_thu
            // 
            this.Loai_Hop_thu.HeaderText = "Inbox type";
            this.Loai_Hop_thu.Name = "Loai_Hop_thu";
            this.Loai_Hop_thu.ReadOnly = true;
            // 
            // Tinh_trang
            // 
            this.Tinh_trang.HeaderText = "Status";
            this.Tinh_trang.Name = "Tinh_trang";
            this.Tinh_trang.ReadOnly = true;
            this.Tinh_trang.Width = 80;
            // 
            // FormInbox
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ControlLight;
            this.ClientSize = new System.Drawing.Size(901, 517);
            this.Controls.Add(this.panel1);
            this.MaximizeBox = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Inbook";
            this.panel1.ResumeLayout(false);
            this.panel4.ResumeLayout(false);
            this.panel4.PerformLayout();
            this.panel5.ResumeLayout(false);
            this.panel5.PerformLayout();
            this.panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dlv_Inbox)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
        internal System.Windows.Forms.DataGridView dlv_Inbox;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Panel panel5;
        private System.Windows.Forms.Button but_Close;
        private System.Windows.Forms.Button but_Delete;
        private System.Windows.Forms.Button but_Refresh;
        private System.Windows.Forms.CheckBox chk_All;
        private System.Windows.Forms.DateTimePicker dtp_Choose;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.ComboBox cbo_Choose;
        internal System.Windows.Forms.Button but_LastPage;
        internal System.Windows.Forms.Button but_PreviousPage;
        internal System.Windows.Forms.Button but_FirstPage;
        internal System.Windows.Forms.Button but_NextPage;
        internal System.Windows.Forms.Label label18;
        internal System.Windows.Forms.Label label19;
        private System.Windows.Forms.Button but_AddressBook;
        private System.Windows.Forms.Button but_Draft;
        private System.Windows.Forms.Button but_Send;
        internal System.Windows.Forms.TextBox txt_Message;
        internal System.Windows.Forms.TextBox textBox1;
        internal System.Windows.Forms.Label label17;
        internal System.Windows.Forms.Label label16;
        private System.Windows.Forms.Panel panel6;
        private System.Windows.Forms.DataGridViewTextBoxColumn Id;
        private System.Windows.Forms.DataGridViewTextBoxColumn Name;
        private System.Windows.Forms.DataGridViewTextBoxColumn So_dien_thoai;
        private System.Windows.Forms.DataGridViewTextBoxColumn Ma_cu_phap;
        private System.Windows.Forms.DataGridViewTextBoxColumn Noi_dung_tin_nhan;
        private System.Windows.Forms.DataGridViewTextBoxColumn Loai_tin_nhan;
        private System.Windows.Forms.DataGridViewTextBoxColumn Loai_Hop_thu;
        private System.Windows.Forms.DataGridViewTextBoxColumn Tinh_trang;


    }
}