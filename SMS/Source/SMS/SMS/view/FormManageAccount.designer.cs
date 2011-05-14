namespace SMS
{
    partial class FormManageAccount
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormManageAccount));
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.lblYouChoose = new System.Windows.Forms.Label();
            this.txt_StudentID = new System.Windows.Forms.TextBox();
            this.txt_Numberphone = new System.Windows.Forms.TextBox();
            this.dgv_manageAccount = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.label28 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.but_Details = new System.Windows.Forms.Button();
            this.but_Edit = new System.Windows.Forms.Button();
            this.but_Add = new System.Windows.Forms.Button();
            this.butClose = new System.Windows.Forms.Button();
            this.but_Delete = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_manageAccount)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox1.BackColor = System.Drawing.Color.Transparent;
            this.groupBox1.Controls.Add(this.lblYouChoose);
            this.groupBox1.Controls.Add(this.txt_StudentID);
            this.groupBox1.Controls.Add(this.txt_Numberphone);
            this.groupBox1.Controls.Add(this.dgv_manageAccount);
            this.groupBox1.Controls.Add(this.but_Details);
            this.groupBox1.Controls.Add(this.but_Edit);
            this.groupBox1.Controls.Add(this.but_Add);
            this.groupBox1.Controls.Add(this.butClose);
            this.groupBox1.Controls.Add(this.but_Delete);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.label28);
            this.groupBox1.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(12, 44);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(975, 422);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            // 
            // lblYouChoose
            // 
            this.lblYouChoose.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lblYouChoose.AutoSize = true;
            this.lblYouChoose.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblYouChoose.Location = new System.Drawing.Point(11, 370);
            this.lblYouChoose.Name = "lblYouChoose";
            this.lblYouChoose.Size = new System.Drawing.Size(94, 13);
            this.lblYouChoose.TabIndex = 3;
            this.lblYouChoose.Text = "Ban Chon dong";
            // 
            // txt_StudentID
            // 
            this.txt_StudentID.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.txt_StudentID.Location = new System.Drawing.Point(121, 388);
            this.txt_StudentID.Name = "txt_StudentID";
            this.txt_StudentID.Size = new System.Drawing.Size(79, 22);
            this.txt_StudentID.TabIndex = 150;
            this.txt_StudentID.TextChanged += new System.EventHandler(this.txt_StudentID_TextChanged);
            // 
            // txt_Numberphone
            // 
            this.txt_Numberphone.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.txt_Numberphone.Location = new System.Drawing.Point(277, 387);
            this.txt_Numberphone.Name = "txt_Numberphone";
            this.txt_Numberphone.Size = new System.Drawing.Size(122, 22);
            this.txt_Numberphone.TabIndex = 150;
            this.txt_Numberphone.TextChanged += new System.EventHandler(this.txt_Numberphone_TextChanged);
            // 
            // dgv_manageAccount
            // 
            this.dgv_manageAccount.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.dgv_manageAccount.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgv_manageAccount.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dgv_manageAccount.BackgroundColor = System.Drawing.SystemColors.ControlDarkDark;
            this.dgv_manageAccount.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.dgv_manageAccount.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_manageAccount.Location = new System.Drawing.Point(14, 23);
            this.dgv_manageAccount.Name = "dgv_manageAccount";
            this.dgv_manageAccount.RowHeadersVisible = false;
            this.dgv_manageAccount.Size = new System.Drawing.Size(937, 334);
            this.dgv_manageAccount.TabIndex = 141;
            this.dgv_manageAccount.CellMouseClick += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dgv_manageAccount_CellMouseClick);
            // 
            // label1
            // 
            this.label1.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(11, 394);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(109, 15);
            this.label1.TabIndex = 143;
            this.label1.Text = "Nhập mã sinh viên:";
            // 
            // label28
            // 
            this.label28.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.label28.AutoSize = true;
            this.label28.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label28.Location = new System.Drawing.Point(206, 394);
            this.label28.Name = "label28";
            this.label28.Size = new System.Drawing.Size(75, 15);
            this.label28.TabIndex = 143;
            this.label28.Text = "Nhập số ĐT:";
            // 
            // label7
            // 
            this.label7.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.label7.AutoSize = true;
            this.label7.BackColor = System.Drawing.Color.Transparent;
            this.label7.Font = new System.Drawing.Font("Times New Roman", 21.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(333, 9);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(328, 32);
            this.label7.TabIndex = 1;
            this.label7.Text = "Quản Lý Tài Khoản SMS";
            // 
            // but_Details
            // 
            this.but_Details.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Details.BackColor = System.Drawing.SystemColors.Control;
            this.but_Details.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Details.Enabled = false;
            this.but_Details.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
            this.but_Details.ForeColor = System.Drawing.SystemColors.ControlText;
            this.but_Details.Image = ((System.Drawing.Image)(resources.GetObject("but_Details.Image")));
            this.but_Details.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Details.Location = new System.Drawing.Point(627, 389);
            this.but_Details.Name = "but_Details";
            this.but_Details.Size = new System.Drawing.Size(105, 25);
            this.but_Details.TabIndex = 148;
            this.but_Details.Text = "Thông Tin TK";
            this.but_Details.UseVisualStyleBackColor = false;
            this.but_Details.Click += new System.EventHandler(this.but_Details_Click);
            // 
            // but_Edit
            // 
            this.but_Edit.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Edit.BackColor = System.Drawing.SystemColors.Control;
            this.but_Edit.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Edit.Enabled = false;
            this.but_Edit.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
            this.but_Edit.ForeColor = System.Drawing.SystemColors.ControlText;
            this.but_Edit.Image = ((System.Drawing.Image)(resources.GetObject("but_Edit.Image")));
            this.but_Edit.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Edit.Location = new System.Drawing.Point(521, 389);
            this.but_Edit.Name = "but_Edit";
            this.but_Edit.Size = new System.Drawing.Size(90, 25);
            this.but_Edit.TabIndex = 146;
            this.but_Edit.Text = "Chỉnh Sửa";
            this.but_Edit.UseVisualStyleBackColor = false;
            this.but_Edit.Click += new System.EventHandler(this.but_Edit_Click);
            // 
            // but_Add
            // 
            this.but_Add.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Add.BackColor = System.Drawing.SystemColors.Control;
            this.but_Add.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Add.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.but_Add.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Add.ForeColor = System.Drawing.SystemColors.ControlText;
            this.but_Add.Image = ((System.Drawing.Image)(resources.GetObject("but_Add.Image")));
            this.but_Add.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Add.Location = new System.Drawing.Point(415, 389);
            this.but_Add.Name = "but_Add";
            this.but_Add.Size = new System.Drawing.Size(90, 25);
            this.but_Add.TabIndex = 146;
            this.but_Add.Text = "Thêm Mới";
            this.but_Add.UseVisualStyleBackColor = false;
            this.but_Add.Click += new System.EventHandler(this.but_Add_Click);
            // 
            // butClose
            // 
            this.butClose.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.butClose.BackColor = System.Drawing.SystemColors.Control;
            this.butClose.Cursor = System.Windows.Forms.Cursors.Hand;
            this.butClose.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
            this.butClose.ForeColor = System.Drawing.SystemColors.ControlText;
            this.butClose.Image = ((System.Drawing.Image)(resources.GetObject("butClose.Image")));
            this.butClose.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.butClose.Location = new System.Drawing.Point(861, 389);
            this.butClose.Name = "butClose";
            this.butClose.Size = new System.Drawing.Size(90, 25);
            this.butClose.TabIndex = 147;
            this.butClose.Text = "Thoát";
            this.butClose.UseVisualStyleBackColor = false;
            this.butClose.Click += new System.EventHandler(this.butClose_Click);
            // 
            // but_Delete
            // 
            this.but_Delete.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Delete.BackColor = System.Drawing.SystemColors.Control;
            this.but_Delete.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Delete.Enabled = false;
            this.but_Delete.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
            this.but_Delete.ForeColor = System.Drawing.SystemColors.ControlText;
            this.but_Delete.Image = ((System.Drawing.Image)(resources.GetObject("but_Delete.Image")));
            this.but_Delete.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Delete.Location = new System.Drawing.Point(752, 388);
            this.but_Delete.Name = "but_Delete";
            this.but_Delete.Size = new System.Drawing.Size(90, 25);
            this.but_Delete.TabIndex = 147;
            this.but_Delete.Text = "Xóa";
            this.but_Delete.UseVisualStyleBackColor = false;
            this.but_Delete.Click += new System.EventHandler(this.but_Delete_Click);
            // 
            // FormManageAccount
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Inherit;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(999, 493);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.groupBox1);
            this.Name = "FormManageAccount";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Quan Ly Tai Khoan SMS";
            this.Load += new System.EventHandler(this.FormManageAccount_Load);
            this.Activated += new System.EventHandler(this.FormManageAccount_Activated);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_manageAccount)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.DataGridView dgv_manageAccount;
        private System.Windows.Forms.Button but_Details;
        private System.Windows.Forms.Button but_Add;
        private System.Windows.Forms.Button but_Delete;
        private System.Windows.Forms.Label label28;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Button butClose;
        private System.Windows.Forms.Label lblYouChoose;
        private System.Windows.Forms.Button but_Edit;
        private System.Windows.Forms.TextBox txt_Numberphone;
        private System.Windows.Forms.TextBox txt_StudentID;
        private System.Windows.Forms.Label label1;

    }
}