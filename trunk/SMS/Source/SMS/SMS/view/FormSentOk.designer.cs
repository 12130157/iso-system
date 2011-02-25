namespace SMS
{
    partial class FormSentOk
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormSentOk));
            this.but_Delete = new System.Windows.Forms.Button();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.ID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.so_dien_thoai = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Noi_dung_tin_nhan = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Tinh_trang = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.label16 = new System.Windows.Forms.Label();
            this.but_Refresh = new System.Windows.Forms.Button();
            this.panel4 = new System.Windows.Forms.Panel();
            this.chk_All = new System.Windows.Forms.CheckBox();
            this.dtp_Choose = new System.Windows.Forms.DateTimePicker();
            this.label15 = new System.Windows.Forms.Label();
            this.cbo_Choose = new System.Windows.Forms.ComboBox();
            this.but_LastPage = new System.Windows.Forms.Button();
            this.but_PreviousPage = new System.Windows.Forms.Button();
            this.but_FirstPage = new System.Windows.Forms.Button();
            this.but_NextPage = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel5 = new System.Windows.Forms.Panel();
            this.but_Close = new System.Windows.Forms.Button();
            this.panel6 = new System.Windows.Forms.Panel();
            this.label18 = new System.Windows.Forms.Label();
            this.label19 = new System.Windows.Forms.Label();
            this.but_AddressBook = new System.Windows.Forms.Button();
            this.but_Draft = new System.Windows.Forms.Button();
            this.but_Send = new System.Windows.Forms.Button();
            this.txt_Message = new System.Windows.Forms.TextBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label17 = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.panel4.SuspendLayout();
            this.panel1.SuspendLayout();
            this.panel5.SuspendLayout();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // but_Delete
            // 
            this.but_Delete.BackColor = System.Drawing.Color.Blue;
            this.but_Delete.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Delete.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Delete.Image = ((System.Drawing.Image)(resources.GetObject("but_Delete.Image")));
            this.but_Delete.Location = new System.Drawing.Point(610, 3);
            this.but_Delete.Name = "but_Delete";
            this.but_Delete.Size = new System.Drawing.Size(75, 23);
            this.but_Delete.TabIndex = 122;
            this.but_Delete.Text = "Delete";
            this.but_Delete.UseVisualStyleBackColor = false;
            // 
            // dataGridView1
            // 
            this.dataGridView1.BackgroundColor = System.Drawing.SystemColors.ButtonHighlight;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.ID,
            this.so_dien_thoai,
            this.Noi_dung_tin_nhan,
            this.Tinh_trang});
            this.dataGridView1.Location = new System.Drawing.Point(3, 3);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersVisible = false;
            this.dataGridView1.Size = new System.Drawing.Size(692, 254);
            this.dataGridView1.TabIndex = 0;
            // 
            // ID
            // 
            this.ID.HeaderText = "ID";
            this.ID.Name = "ID";
            // 
            // so_dien_thoai
            // 
            this.so_dien_thoai.HeaderText = "Phone Number";
            this.so_dien_thoai.Name = "so_dien_thoai";
            this.so_dien_thoai.Width = 150;
            // 
            // Noi_dung_tin_nhan
            // 
            this.Noi_dung_tin_nhan.HeaderText = "Message Content";
            this.Noi_dung_tin_nhan.Name = "Noi_dung_tin_nhan";
            this.Noi_dung_tin_nhan.Width = 320;
            // 
            // Tinh_trang
            // 
            this.Tinh_trang.HeaderText = "Status";
            this.Tinh_trang.Name = "Tinh_trang";
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Location = new System.Drawing.Point(16, 17);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(90, 13);
            this.label16.TabIndex = 118;
            this.label16.Text = "Number Phone";
            // 
            // but_Refresh
            // 
            this.but_Refresh.BackColor = System.Drawing.Color.Blue;
            this.but_Refresh.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Refresh.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Refresh.Image = ((System.Drawing.Image)(resources.GetObject("but_Refresh.Image")));
            this.but_Refresh.Location = new System.Drawing.Point(529, 3);
            this.but_Refresh.Name = "but_Refresh";
            this.but_Refresh.Size = new System.Drawing.Size(75, 23);
            this.but_Refresh.TabIndex = 123;
            this.but_Refresh.Text = "Refresh";
            this.but_Refresh.UseVisualStyleBackColor = false;
            // 
            // panel4
            // 
            this.panel4.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel4.Controls.Add(this.but_Delete);
            this.panel4.Controls.Add(this.but_Refresh);
            this.panel4.Controls.Add(this.chk_All);
            this.panel4.Controls.Add(this.dtp_Choose);
            this.panel4.Controls.Add(this.label15);
            this.panel4.Controls.Add(this.cbo_Choose);
            this.panel4.Controls.Add(this.but_LastPage);
            this.panel4.Controls.Add(this.but_PreviousPage);
            this.panel4.Controls.Add(this.but_FirstPage);
            this.panel4.Controls.Add(this.but_NextPage);
            this.panel4.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.panel4.ForeColor = System.Drawing.Color.Indigo;
            this.panel4.Location = new System.Drawing.Point(10, 280);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(702, 38);
            this.panel4.TabIndex = 125;
            // 
            // chk_All
            // 
            this.chk_All.AutoSize = true;
            this.chk_All.Location = new System.Drawing.Point(484, 5);
            this.chk_All.Name = "chk_All";
            this.chk_All.Size = new System.Drawing.Size(40, 17);
            this.chk_All.TabIndex = 121;
            this.chk_All.Text = "All";
            this.chk_All.UseVisualStyleBackColor = true;
            // 
            // dtp_Choose
            // 
            this.dtp_Choose.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtp_Choose.Location = new System.Drawing.Point(381, 3);
            this.dtp_Choose.Name = "dtp_Choose";
            this.dtp_Choose.Size = new System.Drawing.Size(97, 20);
            this.dtp_Choose.TabIndex = 120;
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.BackColor = System.Drawing.Color.Pink;
            this.label15.Location = new System.Drawing.Point(192, 10);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(49, 13);
            this.label15.TabIndex = 119;
            this.label15.Text = "Filter>>";
            // 
            // cbo_Choose
            // 
            this.cbo_Choose.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbo_Choose.FormattingEnabled = true;
            this.cbo_Choose.Items.AddRange(new object[] {
            "Number phone",
            "Keyword ID",
            "Message type",
            "Status",
            "Inbox type"});
            this.cbo_Choose.Location = new System.Drawing.Point(238, 3);
            this.cbo_Choose.Name = "cbo_Choose";
            this.cbo_Choose.Size = new System.Drawing.Size(137, 21);
            this.cbo_Choose.TabIndex = 118;
            // 
            // but_LastPage
            // 
            this.but_LastPage.BackColor = System.Drawing.Color.Blue;
            this.but_LastPage.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_LastPage.ForeColor = System.Drawing.SystemColors.Control;
            this.but_LastPage.Image = ((System.Drawing.Image)(resources.GetObject("but_LastPage.Image")));
            this.but_LastPage.Location = new System.Drawing.Point(144, 3);
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
            this.but_PreviousPage.Location = new System.Drawing.Point(48, 3);
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
            this.but_FirstPage.Location = new System.Drawing.Point(2, 3);
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
            this.but_NextPage.Location = new System.Drawing.Point(96, 3);
            this.but_NextPage.Name = "but_NextPage";
            this.but_NextPage.Size = new System.Drawing.Size(42, 23);
            this.but_NextPage.TabIndex = 116;
            this.but_NextPage.Text = ">";
            this.but_NextPage.UseVisualStyleBackColor = false;
            // 
            // panel1
            // 
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel1.Controls.Add(this.panel5);
            this.panel1.Controls.Add(this.panel4);
            this.panel1.Controls.Add(this.panel2);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(722, 466);
            this.panel1.TabIndex = 2;
            // 
            // panel5
            // 
            this.panel5.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel5.Controls.Add(this.but_Close);
            this.panel5.Controls.Add(this.panel6);
            this.panel5.Controls.Add(this.label18);
            this.panel5.Controls.Add(this.label19);
            this.panel5.Controls.Add(this.but_AddressBook);
            this.panel5.Controls.Add(this.but_Draft);
            this.panel5.Controls.Add(this.but_Send);
            this.panel5.Controls.Add(this.txt_Message);
            this.panel5.Controls.Add(this.textBox1);
            this.panel5.Controls.Add(this.label17);
            this.panel5.Controls.Add(this.label16);
            this.panel5.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.panel5.ForeColor = System.Drawing.Color.Indigo;
            this.panel5.Location = new System.Drawing.Point(10, 324);
            this.panel5.Name = "panel5";
            this.panel5.Size = new System.Drawing.Size(702, 129);
            this.panel5.TabIndex = 126;
            // 
            // but_Close
            // 
            this.but_Close.BackColor = System.Drawing.Color.Blue;
            this.but_Close.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Close.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Close.Image = ((System.Drawing.Image)(resources.GetObject("but_Close.Image")));
            this.but_Close.Location = new System.Drawing.Point(459, 99);
            this.but_Close.Name = "but_Close";
            this.but_Close.Size = new System.Drawing.Size(92, 23);
            this.but_Close.TabIndex = 122;
            this.but_Close.Text = "Close";
            this.but_Close.UseVisualStyleBackColor = false;
            // 
            // panel6
            // 
            this.panel6.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("panel6.BackgroundImage")));
            this.panel6.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel6.Location = new System.Drawing.Point(572, 5);
            this.panel6.Name = "panel6";
            this.panel6.Size = new System.Drawing.Size(113, 110);
            this.panel6.TabIndex = 133;
            // 
            // label18
            // 
            this.label18.AutoSize = true;
            this.label18.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label18.ForeColor = System.Drawing.SystemColors.ActiveCaption;
            this.label18.Location = new System.Drawing.Point(51, 83);
            this.label18.Name = "label18";
            this.label18.Size = new System.Drawing.Size(67, 13);
            this.label18.TabIndex = 130;
            this.label18.Text = "Remain: 640";
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label19.ForeColor = System.Drawing.SystemColors.ActiveCaption;
            this.label19.Location = new System.Drawing.Point(51, 70);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(65, 13);
            this.label19.TabIndex = 129;
            this.label19.Text = "Character: 0";
            // 
            // but_AddressBook
            // 
            this.but_AddressBook.BackColor = System.Drawing.Color.Blue;
            this.but_AddressBook.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_AddressBook.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_AddressBook.ForeColor = System.Drawing.SystemColors.Control;
            this.but_AddressBook.Image = ((System.Drawing.Image)(resources.GetObject("but_AddressBook.Image")));
            this.but_AddressBook.Location = new System.Drawing.Point(459, 73);
            this.but_AddressBook.Name = "but_AddressBook";
            this.but_AddressBook.Size = new System.Drawing.Size(92, 23);
            this.but_AddressBook.TabIndex = 119;
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
            this.but_Draft.Location = new System.Drawing.Point(459, 45);
            this.but_Draft.Name = "but_Draft";
            this.but_Draft.Size = new System.Drawing.Size(92, 23);
            this.but_Draft.TabIndex = 120;
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
            this.but_Send.Location = new System.Drawing.Point(459, 16);
            this.but_Send.Name = "but_Send";
            this.but_Send.Size = new System.Drawing.Size(92, 23);
            this.but_Send.TabIndex = 121;
            this.but_Send.Text = "Send";
            this.but_Send.UseVisualStyleBackColor = false;
            // 
            // txt_Message
            // 
            this.txt_Message.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_Message.Location = new System.Drawing.Point(124, 40);
            this.txt_Message.MaxLength = 640;
            this.txt_Message.Multiline = true;
            this.txt_Message.Name = "txt_Message";
            this.txt_Message.Size = new System.Drawing.Size(310, 75);
            this.txt_Message.TabIndex = 122;
            // 
            // textBox1
            // 
            this.textBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox1.Location = new System.Drawing.Point(124, 14);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(310, 20);
            this.textBox1.TabIndex = 123;
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.Location = new System.Drawing.Point(16, 40);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(57, 13);
            this.label17.TabIndex = 117;
            this.label17.Text = "Message";
            // 
            // panel2
            // 
            this.panel2.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel2.Controls.Add(this.dataGridView1);
            this.panel2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.panel2.Location = new System.Drawing.Point(10, 10);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(702, 264);
            this.panel2.TabIndex = 0;
            // 
            // FormSentOk
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(722, 466);
            this.Controls.Add(this.panel1);
            this.MaximizeBox = false;
            this.Name = "FormSentOk";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Sent Ok";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.panel4.ResumeLayout(false);
            this.panel4.PerformLayout();
            this.panel1.ResumeLayout(false);
            this.panel5.ResumeLayout(false);
            this.panel5.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button but_Delete;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.DataGridViewTextBoxColumn ID;
        private System.Windows.Forms.DataGridViewTextBoxColumn so_dien_thoai;
        private System.Windows.Forms.DataGridViewTextBoxColumn Noi_dung_tin_nhan;
        private System.Windows.Forms.DataGridViewTextBoxColumn Tinh_trang;
        internal System.Windows.Forms.Label label16;
        private System.Windows.Forms.Button but_Refresh;
        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.CheckBox chk_All;
        private System.Windows.Forms.DateTimePicker dtp_Choose;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.ComboBox cbo_Choose;
        internal System.Windows.Forms.Button but_LastPage;
        internal System.Windows.Forms.Button but_PreviousPage;
        internal System.Windows.Forms.Button but_FirstPage;
        internal System.Windows.Forms.Button but_NextPage;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel5;
        private System.Windows.Forms.Button but_Close;
        private System.Windows.Forms.Panel panel6;
        internal System.Windows.Forms.Label label18;
        internal System.Windows.Forms.Label label19;
        private System.Windows.Forms.Button but_AddressBook;
        private System.Windows.Forms.Button but_Draft;
        private System.Windows.Forms.Button but_Send;
        internal System.Windows.Forms.TextBox txt_Message;
        internal System.Windows.Forms.TextBox textBox1;
        internal System.Windows.Forms.Label label17;
        private System.Windows.Forms.Panel panel2;



    }
}