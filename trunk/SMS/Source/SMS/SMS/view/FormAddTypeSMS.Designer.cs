namespace SMS.view
{
    partial class FormAddTypeSMS
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormAddTypeSMS));
            this.dgv_Account = new System.Windows.Forms.DataGridView();
            this.menu_Context = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.xóaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.txt_Note = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txt_ServiceCharges = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txt_TypeAccount = new System.Windows.Forms.TextBox();
            this.but_Xoa = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.but_CapNhat = new System.Windows.Forms.Button();
            this.but_Close = new System.Windows.Forms.Button();
            this.but_Add = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.lbl_choose = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_Account)).BeginInit();
            this.menu_Context.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dgv_Account
            // 
            this.dgv_Account.AllowUserToAddRows = false;
            this.dgv_Account.AllowUserToDeleteRows = false;
            this.dgv_Account.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.dgv_Account.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.DisplayedCells;
            this.dgv_Account.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.DisplayedCells;
            this.dgv_Account.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_Account.ContextMenuStrip = this.menu_Context;
            this.dgv_Account.Location = new System.Drawing.Point(375, 52);
            this.dgv_Account.Name = "dgv_Account";
            this.dgv_Account.ReadOnly = true;
            this.dgv_Account.RowHeadersVisible = false;
            this.dgv_Account.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgv_Account.Size = new System.Drawing.Size(387, 201);
            this.dgv_Account.TabIndex = 3;
            this.dgv_Account.CellMouseClick += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dgv_Account_CellMouseClick);
            // 
            // menu_Context
            // 
            this.menu_Context.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.xóaToolStripMenuItem});
            this.menu_Context.Name = "menu_Context";
            this.menu_Context.Size = new System.Drawing.Size(104, 26);
            // 
            // xóaToolStripMenuItem
            // 
            this.xóaToolStripMenuItem.Name = "xóaToolStripMenuItem";
            this.xóaToolStripMenuItem.Size = new System.Drawing.Size(103, 22);
            this.xóaToolStripMenuItem.Text = "Xóa";
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.groupBox1.BackColor = System.Drawing.Color.Transparent;
            this.groupBox1.Controls.Add(this.txt_Note);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.txt_ServiceCharges);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.txt_TypeAccount);
            this.groupBox1.Controls.Add(this.but_Xoa);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.but_CapNhat);
            this.groupBox1.Controls.Add(this.but_Close);
            this.groupBox1.Controls.Add(this.but_Add);
            this.groupBox1.Location = new System.Drawing.Point(12, 43);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(357, 216);
            this.groupBox1.TabIndex = 4;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Thêm loại TK SMS ";
            // 
            // txt_Note
            // 
            this.txt_Note.Enabled = false;
            this.txt_Note.Location = new System.Drawing.Point(108, 74);
            this.txt_Note.MaxLength = 500;
            this.txt_Note.Multiline = true;
            this.txt_Note.Name = "txt_Note";
            this.txt_Note.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txt_Note.Size = new System.Drawing.Size(226, 85);
            this.txt_Note.TabIndex = 8;
            this.txt_Note.TextChanged += new System.EventHandler(this.txt_Note_TextChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(14, 74);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(47, 13);
            this.label3.TabIndex = 7;
            this.label3.Text = "Ghi chú:";
            // 
            // txt_ServiceCharges
            // 
            this.txt_ServiceCharges.Enabled = false;
            this.txt_ServiceCharges.Location = new System.Drawing.Point(108, 48);
            this.txt_ServiceCharges.MaxLength = 6;
            this.txt_ServiceCharges.Name = "txt_ServiceCharges";
            this.txt_ServiceCharges.Size = new System.Drawing.Size(163, 20);
            this.txt_ServiceCharges.TabIndex = 10;
            this.txt_ServiceCharges.TextChanged += new System.EventHandler(this.txt_ServiceCharges_TextChanged);
            this.txt_ServiceCharges.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txt_ServiceCharges_KeyPress);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(14, 48);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(65, 13);
            this.label2.TabIndex = 6;
            this.label2.Text = "Phí dịch vụ:";
            // 
            // txt_TypeAccount
            // 
            this.txt_TypeAccount.Location = new System.Drawing.Point(108, 19);
            this.txt_TypeAccount.Name = "txt_TypeAccount";
            this.txt_TypeAccount.Size = new System.Drawing.Size(163, 20);
            this.txt_TypeAccount.TabIndex = 9;
            this.txt_TypeAccount.TextChanged += new System.EventHandler(this.txt_TypeAccount_TextChanged);
            // 
            // but_Xoa
            // 
            this.but_Xoa.Enabled = false;
            this.but_Xoa.Image = ((System.Drawing.Image)(resources.GetObject("but_Xoa.Image")));
            this.but_Xoa.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Xoa.Location = new System.Drawing.Point(176, 174);
            this.but_Xoa.Name = "but_Xoa";
            this.but_Xoa.Size = new System.Drawing.Size(76, 25);
            this.but_Xoa.TabIndex = 3;
            this.but_Xoa.Text = "Xóa";
            this.but_Xoa.UseVisualStyleBackColor = true;
            this.but_Xoa.Click += new System.EventHandler(this.but_Xoa_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(14, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(91, 13);
            this.label1.TabIndex = 5;
            this.label1.Text = "Tên loai TK SMS:";
            // 
            // but_CapNhat
            // 
            this.but_CapNhat.Enabled = false;
            this.but_CapNhat.Image = ((System.Drawing.Image)(resources.GetObject("but_CapNhat.Image")));
            this.but_CapNhat.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_CapNhat.Location = new System.Drawing.Point(85, 174);
            this.but_CapNhat.Name = "but_CapNhat";
            this.but_CapNhat.Size = new System.Drawing.Size(84, 25);
            this.but_CapNhat.TabIndex = 3;
            this.but_CapNhat.Text = "Cập Nhật";
            this.but_CapNhat.UseVisualStyleBackColor = true;
            this.but_CapNhat.Click += new System.EventHandler(this.but_CapNhat_Click);
            // 
            // but_Close
            // 
            this.but_Close.Image = ((System.Drawing.Image)(resources.GetObject("but_Close.Image")));
            this.but_Close.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Close.Location = new System.Drawing.Point(258, 174);
            this.but_Close.Name = "but_Close";
            this.but_Close.Size = new System.Drawing.Size(76, 25);
            this.but_Close.TabIndex = 3;
            this.but_Close.Text = "Thoát";
            this.but_Close.UseVisualStyleBackColor = true;
            this.but_Close.Click += new System.EventHandler(this.but_Close_Click);
            // 
            // but_Add
            // 
            this.but_Add.Enabled = false;
            this.but_Add.Image = ((System.Drawing.Image)(resources.GetObject("but_Add.Image")));
            this.but_Add.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Add.Location = new System.Drawing.Point(6, 174);
            this.but_Add.Name = "but_Add";
            this.but_Add.Size = new System.Drawing.Size(73, 25);
            this.but_Add.TabIndex = 4;
            this.but_Add.Text = "Thêm";
            this.but_Add.UseVisualStyleBackColor = true;
            this.but_Add.Click += new System.EventHandler(this.but_Add_Click);
            // 
            // label4
            // 
            this.label4.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.Transparent;
            this.label4.Font = new System.Drawing.Font("Times New Roman", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.ForeColor = System.Drawing.Color.Red;
            this.label4.Location = new System.Drawing.Point(131, 8);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(532, 32);
            this.label4.TabIndex = 5;
            this.label4.Text = "Quản Lý Thông Tin  Loại Tài Khoản SMS";
            // 
            // lbl_choose
            // 
            this.lbl_choose.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.lbl_choose.AutoSize = true;
            this.lbl_choose.Location = new System.Drawing.Point(372, 256);
            this.lbl_choose.Name = "lbl_choose";
            this.lbl_choose.Size = new System.Drawing.Size(83, 13);
            this.lbl_choose.TabIndex = 5;
            this.lbl_choose.Text = "Bạn chọn dòng:";
            // 
            // FormAddTypeSMS
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(774, 301);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.dgv_Account);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.lbl_choose);
            this.MaximizeBox = false;
            this.Name = "FormAddTypeSMS";
            this.StartPosition = System.Windows.Forms.FormStartPosition.Manual;
            this.Text = "Them Loai Tai Khoan SMS";
            this.Load += new System.EventHandler(this.FormAddTypeSMS_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgv_Account)).EndInit();
            this.menu_Context.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgv_Account;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox txt_Note;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txt_ServiceCharges;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txt_TypeAccount;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button but_Close;
        private System.Windows.Forms.Button but_Add;
        private System.Windows.Forms.Label label4;
        public System.Windows.Forms.Button but_CapNhat;
        private System.Windows.Forms.Label lbl_choose;
        private System.Windows.Forms.ContextMenuStrip menu_Context;
        private System.Windows.Forms.ToolStripMenuItem xóaToolStripMenuItem;
        private System.Windows.Forms.Button but_Xoa;

    }
}