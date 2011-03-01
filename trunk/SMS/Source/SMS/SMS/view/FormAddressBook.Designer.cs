namespace SMS.view
{
    partial class FormAddressBook
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormAddressBook));
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel5 = new System.Windows.Forms.Panel();
            this.but_Edit = new System.Windows.Forms.Button();
            this.checkBox1 = new System.Windows.Forms.CheckBox();
            this.but_Add = new System.Windows.Forms.Button();
            this.but_Delete = new System.Windows.Forms.Button();
            this.dateTimePicker1 = new System.Windows.Forms.DateTimePicker();
            this.but_Close = new System.Windows.Forms.Button();
            this.label7 = new System.Windows.Forms.Label();
            this.but_Refresh = new System.Windows.Forms.Button();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.butLastPage = new System.Windows.Forms.Button();
            this.butPreviousPage = new System.Windows.Forms.Button();
            this.butFirstPage = new System.Windows.Forms.Button();
            this.butNextPage = new System.Windows.Forms.Button();
            this.panel3 = new System.Windows.Forms.Panel();
            this.txtPhone = new System.Windows.Forms.TextBox();
            this.txtEmail = new System.Windows.Forms.TextBox();
            this.txtAddress = new System.Windows.Forms.TextBox();
            this.txtFullName = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.txtNumber = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.dtpBrithday = new System.Windows.Forms.DateTimePicker();
            this.label1 = new System.Windows.Forms.Label();
            this.panel2 = new System.Windows.Forms.Panel();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.Number = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Name = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Phone = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Address = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.panel1.SuspendLayout();
            this.panel5.SuspendLayout();
            this.panel3.SuspendLayout();
            this.panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel1.Controls.Add(this.panel5);
            this.panel1.Controls.Add(this.panel3);
            this.panel1.Controls.Add(this.panel2);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(665, 487);
            this.panel1.TabIndex = 0;
            // 
            // panel5
            // 
            this.panel5.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.panel5.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel5.Controls.Add(this.but_Edit);
            this.panel5.Controls.Add(this.checkBox1);
            this.panel5.Controls.Add(this.but_Add);
            this.panel5.Controls.Add(this.but_Delete);
            this.panel5.Controls.Add(this.dateTimePicker1);
            this.panel5.Controls.Add(this.but_Close);
            this.panel5.Controls.Add(this.label7);
            this.panel5.Controls.Add(this.but_Refresh);
            this.panel5.Controls.Add(this.comboBox1);
            this.panel5.Controls.Add(this.butLastPage);
            this.panel5.Controls.Add(this.butPreviousPage);
            this.panel5.Controls.Add(this.butFirstPage);
            this.panel5.Controls.Add(this.butNextPage);
            this.panel5.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.panel5.Location = new System.Drawing.Point(6, 417);
            this.panel5.Name = "panel5";
            this.panel5.Size = new System.Drawing.Size(650, 63);
            this.panel5.TabIndex = 2;
            this.panel5.UseWaitCursor = true;
            // 
            // but_Edit
            // 
            this.but_Edit.BackColor = System.Drawing.Color.Blue;
            this.but_Edit.Cursor = System.Windows.Forms.Cursors.WaitCursor;
            this.but_Edit.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Edit.Image = ((System.Drawing.Image)(resources.GetObject("but_Edit.Image")));
            this.but_Edit.Location = new System.Drawing.Point(359, 32);
            this.but_Edit.Name = "but_Edit";
            this.but_Edit.Size = new System.Drawing.Size(75, 23);
            this.but_Edit.TabIndex = 127;
            this.but_Edit.Text = "Edit";
            this.but_Edit.UseVisualStyleBackColor = false;
            this.but_Edit.UseWaitCursor = true;
            // 
            // checkBox1
            // 
            this.checkBox1.AutoSize = true;
            this.checkBox1.Location = new System.Drawing.Point(572, 7);
            this.checkBox1.Name = "checkBox1";
            this.checkBox1.Size = new System.Drawing.Size(40, 17);
            this.checkBox1.TabIndex = 129;
            this.checkBox1.Text = "All";
            this.checkBox1.UseVisualStyleBackColor = true;
            this.checkBox1.UseWaitCursor = true;
            // 
            // but_Add
            // 
            this.but_Add.BackColor = System.Drawing.Color.Blue;
            this.but_Add.Cursor = System.Windows.Forms.Cursors.WaitCursor;
            this.but_Add.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Add.Image = ((System.Drawing.Image)(resources.GetObject("but_Add.Image")));
            this.but_Add.Location = new System.Drawing.Point(266, 32);
            this.but_Add.Name = "but_Add";
            this.but_Add.Size = new System.Drawing.Size(75, 23);
            this.but_Add.TabIndex = 128;
            this.but_Add.Text = "Add";
            this.but_Add.UseVisualStyleBackColor = false;
            this.but_Add.UseWaitCursor = true;
            // 
            // but_Delete
            // 
            this.but_Delete.BackColor = System.Drawing.Color.Blue;
            this.but_Delete.Cursor = System.Windows.Forms.Cursors.WaitCursor;
            this.but_Delete.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Delete.Image = ((System.Drawing.Image)(resources.GetObject("but_Delete.Image")));
            this.but_Delete.Location = new System.Drawing.Point(177, 32);
            this.but_Delete.Name = "but_Delete";
            this.but_Delete.Size = new System.Drawing.Size(75, 23);
            this.but_Delete.TabIndex = 126;
            this.but_Delete.Text = "Delete";
            this.but_Delete.UseVisualStyleBackColor = false;
            this.but_Delete.UseWaitCursor = true;
            // 
            // dateTimePicker1
            // 
            this.dateTimePicker1.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dateTimePicker1.Location = new System.Drawing.Point(453, 4);
            this.dateTimePicker1.Name = "dateTimePicker1";
            this.dateTimePicker1.Size = new System.Drawing.Size(102, 20);
            this.dateTimePicker1.TabIndex = 128;
            this.dateTimePicker1.UseWaitCursor = true;
            // 
            // but_Close
            // 
            this.but_Close.BackColor = System.Drawing.Color.Blue;
            this.but_Close.Cursor = System.Windows.Forms.Cursors.WaitCursor;
            this.but_Close.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Close.Image = ((System.Drawing.Image)(resources.GetObject("but_Close.Image")));
            this.but_Close.Location = new System.Drawing.Point(451, 32);
            this.but_Close.Name = "but_Close";
            this.but_Close.Size = new System.Drawing.Size(86, 23);
            this.but_Close.TabIndex = 125;
            this.but_Close.Text = "Close";
            this.but_Close.UseVisualStyleBackColor = false;
            this.but_Close.UseWaitCursor = true;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.BackColor = System.Drawing.Color.Pink;
            this.label7.Location = new System.Drawing.Point(276, 9);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(49, 13);
            this.label7.TabIndex = 127;
            this.label7.Text = "Filter>>";
            this.label7.UseWaitCursor = true;
            // 
            // but_Refresh
            // 
            this.but_Refresh.BackColor = System.Drawing.Color.Blue;
            this.but_Refresh.Cursor = System.Windows.Forms.Cursors.WaitCursor;
            this.but_Refresh.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Refresh.Image = ((System.Drawing.Image)(resources.GetObject("but_Refresh.Image")));
            this.but_Refresh.Location = new System.Drawing.Point(81, 32);
            this.but_Refresh.Name = "but_Refresh";
            this.but_Refresh.Size = new System.Drawing.Size(75, 23);
            this.but_Refresh.TabIndex = 129;
            this.but_Refresh.Text = "Refresh";
            this.but_Refresh.UseVisualStyleBackColor = false;
            this.but_Refresh.UseWaitCursor = true;
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Items.AddRange(new object[] {
            "Number phone",
            "Keyword ID",
            "Message type",
            "Status",
            "Inbox type"});
            this.comboBox1.Location = new System.Drawing.Point(339, 4);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(108, 21);
            this.comboBox1.TabIndex = 126;
            this.comboBox1.UseWaitCursor = true;
            // 
            // butLastPage
            // 
            this.butLastPage.BackColor = System.Drawing.Color.Blue;
            this.butLastPage.Cursor = System.Windows.Forms.Cursors.WaitCursor;
            this.butLastPage.ForeColor = System.Drawing.SystemColors.Control;
            this.butLastPage.Image = ((System.Drawing.Image)(resources.GetObject("butLastPage.Image")));
            this.butLastPage.Location = new System.Drawing.Point(207, 3);
            this.butLastPage.Name = "butLastPage";
            this.butLastPage.Size = new System.Drawing.Size(63, 23);
            this.butLastPage.TabIndex = 125;
            this.butLastPage.Text = ">>";
            this.butLastPage.UseVisualStyleBackColor = false;
            this.butLastPage.UseWaitCursor = true;
            // 
            // butPreviousPage
            // 
            this.butPreviousPage.BackColor = System.Drawing.Color.Blue;
            this.butPreviousPage.Cursor = System.Windows.Forms.Cursors.WaitCursor;
            this.butPreviousPage.ForeColor = System.Drawing.SystemColors.Control;
            this.butPreviousPage.Image = ((System.Drawing.Image)(resources.GetObject("butPreviousPage.Image")));
            this.butPreviousPage.Location = new System.Drawing.Point(69, 3);
            this.butPreviousPage.Name = "butPreviousPage";
            this.butPreviousPage.Size = new System.Drawing.Size(63, 23);
            this.butPreviousPage.TabIndex = 123;
            this.butPreviousPage.Text = "<";
            this.butPreviousPage.UseVisualStyleBackColor = false;
            this.butPreviousPage.UseWaitCursor = true;
            // 
            // butFirstPage
            // 
            this.butFirstPage.BackColor = System.Drawing.Color.Blue;
            this.butFirstPage.Cursor = System.Windows.Forms.Cursors.WaitCursor;
            this.butFirstPage.ForeColor = System.Drawing.SystemColors.Control;
            this.butFirstPage.Image = ((System.Drawing.Image)(resources.GetObject("butFirstPage.Image")));
            this.butFirstPage.Location = new System.Drawing.Point(5, 4);
            this.butFirstPage.Name = "butFirstPage";
            this.butFirstPage.Size = new System.Drawing.Size(63, 23);
            this.butFirstPage.TabIndex = 122;
            this.butFirstPage.Text = "<<";
            this.butFirstPage.UseVisualStyleBackColor = false;
            this.butFirstPage.UseWaitCursor = true;
            // 
            // butNextPage
            // 
            this.butNextPage.BackColor = System.Drawing.Color.Blue;
            this.butNextPage.Cursor = System.Windows.Forms.Cursors.WaitCursor;
            this.butNextPage.ForeColor = System.Drawing.SystemColors.Control;
            this.butNextPage.Image = ((System.Drawing.Image)(resources.GetObject("butNextPage.Image")));
            this.butNextPage.Location = new System.Drawing.Point(138, 3);
            this.butNextPage.Name = "butNextPage";
            this.butNextPage.Size = new System.Drawing.Size(63, 23);
            this.butNextPage.TabIndex = 124;
            this.butNextPage.Text = ">";
            this.butNextPage.UseVisualStyleBackColor = false;
            this.butNextPage.UseWaitCursor = true;
            // 
            // panel3
            // 
            this.panel3.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.panel3.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel3.Controls.Add(this.txtPhone);
            this.panel3.Controls.Add(this.txtEmail);
            this.panel3.Controls.Add(this.txtAddress);
            this.panel3.Controls.Add(this.txtFullName);
            this.panel3.Controls.Add(this.label4);
            this.panel3.Controls.Add(this.label6);
            this.panel3.Controls.Add(this.label3);
            this.panel3.Controls.Add(this.label5);
            this.panel3.Controls.Add(this.txtNumber);
            this.panel3.Controls.Add(this.label2);
            this.panel3.Controls.Add(this.dtpBrithday);
            this.panel3.Controls.Add(this.label1);
            this.panel3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.panel3.Location = new System.Drawing.Point(6, 319);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(650, 92);
            this.panel3.TabIndex = 1;
            // 
            // txtPhone
            // 
            this.txtPhone.Location = new System.Drawing.Point(412, 9);
            this.txtPhone.Name = "txtPhone";
            this.txtPhone.Size = new System.Drawing.Size(165, 20);
            this.txtPhone.TabIndex = 2;
            this.txtPhone.UseWaitCursor = true;
            // 
            // txtEmail
            // 
            this.txtEmail.Location = new System.Drawing.Point(412, 64);
            this.txtEmail.Name = "txtEmail";
            this.txtEmail.Size = new System.Drawing.Size(200, 20);
            this.txtEmail.TabIndex = 2;
            this.txtEmail.UseWaitCursor = true;
            // 
            // txtAddress
            // 
            this.txtAddress.Location = new System.Drawing.Point(85, 61);
            this.txtAddress.Name = "txtAddress";
            this.txtAddress.Size = new System.Drawing.Size(201, 20);
            this.txtAddress.TabIndex = 2;
            this.txtAddress.UseWaitCursor = true;
            // 
            // txtFullName
            // 
            this.txtFullName.Location = new System.Drawing.Point(85, 35);
            this.txtFullName.Name = "txtFullName";
            this.txtFullName.Size = new System.Drawing.Size(201, 20);
            this.txtFullName.TabIndex = 2;
            this.txtFullName.UseWaitCursor = true;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(337, 38);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(53, 13);
            this.label4.TabIndex = 0;
            this.label4.Text = "Brithday";
            this.label4.UseWaitCursor = true;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(337, 68);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(45, 13);
            this.label6.TabIndex = 0;
            this.label6.Text = "Email: ";
            this.label6.UseWaitCursor = true;
            // 
            // label3
            // 
            this.label3.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(337, 12);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(43, 13);
            this.label3.TabIndex = 0;
            this.label3.Text = "Phone";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(5, 64);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(60, 13);
            this.label5.TabIndex = 0;
            this.label5.Text = "Address: ";
            this.label5.UseWaitCursor = true;
            // 
            // txtNumber
            // 
            this.txtNumber.Location = new System.Drawing.Point(85, 9);
            this.txtNumber.Name = "txtNumber";
            this.txtNumber.Size = new System.Drawing.Size(109, 20);
            this.txtNumber.TabIndex = 2;
            this.txtNumber.UseWaitCursor = true;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(5, 38);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(67, 13);
            this.label2.TabIndex = 0;
            this.label2.Text = "FullName: ";
            this.label2.UseWaitCursor = true;
            // 
            // dtpBrithday
            // 
            this.dtpBrithday.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpBrithday.Location = new System.Drawing.Point(412, 35);
            this.dtpBrithday.Name = "dtpBrithday";
            this.dtpBrithday.Size = new System.Drawing.Size(200, 20);
            this.dtpBrithday.TabIndex = 1;
            this.dtpBrithday.UseWaitCursor = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(5, 12);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(58, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Number: ";
            this.label1.UseWaitCursor = true;
            // 
            // panel2
            // 
            this.panel2.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.panel2.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.panel2.Controls.Add(this.dataGridView1);
            this.panel2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.panel2.Location = new System.Drawing.Point(5, 3);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(650, 310);
            this.panel2.TabIndex = 0;
            this.panel2.UseWaitCursor = true;
            // 
            // dataGridView1
            // 
            this.dataGridView1.BackgroundColor = System.Drawing.SystemColors.ButtonHighlight;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Number,
            this.Name,
            this.Phone,
            this.Address});
            this.dataGridView1.Location = new System.Drawing.Point(3, 3);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersVisible = false;
            this.dataGridView1.Size = new System.Drawing.Size(636, 299);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.UseWaitCursor = true;
            // 
            // Number
            // 
            this.Number.HeaderText = "Number";
            this.Number.Name = "Number";
            // 
            // Name
            // 
            this.Name.HeaderText = "FullName";
            this.Name.Name = "Name";
            this.Name.Width = 180;
            // 
            // Phone
            // 
            this.Phone.HeaderText = "Phone";
            this.Phone.Name = "Phone";
            this.Phone.Width = 120;
            // 
            // Address
            // 
            this.Address.HeaderText = "Address";
            this.Address.Name = "Address";
            this.Address.Width = 230;
            // 
            // FormAddressBook
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.InactiveCaptionText;
            this.ClientSize = new System.Drawing.Size(665, 487);
            this.Controls.Add(this.panel1);
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FormAddressBook";
            this.panel1.ResumeLayout(false);
            this.panel5.ResumeLayout(false);
            this.panel5.PerformLayout();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.TextBox txtNumber;
        private System.Windows.Forms.DateTimePicker dtpBrithday;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtPhone;
        private System.Windows.Forms.TextBox txtFullName;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtEmail;
        private System.Windows.Forms.TextBox txtAddress;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.DataGridViewTextBoxColumn Number;
        private System.Windows.Forms.DataGridViewTextBoxColumn Name;
        private System.Windows.Forms.DataGridViewTextBoxColumn Phone;
        private System.Windows.Forms.DataGridViewTextBoxColumn Address;
        private System.Windows.Forms.Panel panel5;
        private System.Windows.Forms.CheckBox checkBox1;
        private System.Windows.Forms.DateTimePicker dateTimePicker1;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.ComboBox comboBox1;
        internal System.Windows.Forms.Button butLastPage;
        internal System.Windows.Forms.Button butPreviousPage;
        internal System.Windows.Forms.Button butFirstPage;
        internal System.Windows.Forms.Button butNextPage;
        private System.Windows.Forms.Button but_Edit;
        private System.Windows.Forms.Button but_Add;
        private System.Windows.Forms.Button but_Delete;
        private System.Windows.Forms.Button but_Close;
        private System.Windows.Forms.Button but_Refresh;
    }
}