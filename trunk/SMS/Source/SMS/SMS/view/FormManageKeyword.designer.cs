namespace SMS
{
    partial class FormManageKeyword
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormManageKeyword));
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.lblYouChoose = new System.Windows.Forms.Label();
            this.cbo_Keyword = new System.Windows.Forms.ComboBox();
            this.cbo_Name = new System.Windows.Forms.ComboBox();
            this.but_Close = new System.Windows.Forms.Button();
            this.but_Edit = new System.Windows.Forms.Button();
            this.but_Add = new System.Windows.Forms.Button();
            this.but_Delete = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label28 = new System.Windows.Forms.Label();
            this.dlv_ManageKeyword = new System.Windows.Forms.DataGridView();
            this.label10 = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dlv_ManageKeyword)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox1.BackColor = System.Drawing.Color.Transparent;
            this.groupBox1.Controls.Add(this.lblYouChoose);
            this.groupBox1.Controls.Add(this.cbo_Keyword);
            this.groupBox1.Controls.Add(this.cbo_Name);
            this.groupBox1.Controls.Add(this.but_Close);
            this.groupBox1.Controls.Add(this.but_Edit);
            this.groupBox1.Controls.Add(this.but_Add);
            this.groupBox1.Controls.Add(this.but_Delete);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.label28);
            this.groupBox1.Controls.Add(this.dlv_ManageKeyword);
            this.groupBox1.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(22, 52);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(1144, 440);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            // 
            // lblYouChoose
            // 
            this.lblYouChoose.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.lblYouChoose.AutoSize = true;
            this.lblYouChoose.BackColor = System.Drawing.Color.Transparent;
            this.lblYouChoose.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblYouChoose.Location = new System.Drawing.Point(20, 424);
            this.lblYouChoose.Name = "lblYouChoose";
            this.lblYouChoose.Size = new System.Drawing.Size(0, 13);
            this.lblYouChoose.TabIndex = 2;
            // 
            // cbo_Keyword
            // 
            this.cbo_Keyword.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.cbo_Keyword.FormattingEnabled = true;
            this.cbo_Keyword.Location = new System.Drawing.Point(374, 392);
            this.cbo_Keyword.Name = "cbo_Keyword";
            this.cbo_Keyword.Size = new System.Drawing.Size(162, 23);
            this.cbo_Keyword.TabIndex = 144;
            this.cbo_Keyword.SelectedIndexChanged += new System.EventHandler(this.cbo_Keyword_SelectedIndexChanged);
            // 
            // cbo_Name
            // 
            this.cbo_Name.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.cbo_Name.FormattingEnabled = true;
            this.cbo_Name.Location = new System.Drawing.Point(114, 390);
            this.cbo_Name.Name = "cbo_Name";
            this.cbo_Name.Size = new System.Drawing.Size(152, 23);
            this.cbo_Name.TabIndex = 144;
            this.cbo_Name.SelectedIndexChanged += new System.EventHandler(this.cbo_Name_SelectedIndexChanged);
            // 
            // but_Close
            // 
            this.but_Close.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Close.BackColor = System.Drawing.SystemColors.Control;
            this.but_Close.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Close.DialogResult = System.Windows.Forms.DialogResult.Yes;
            this.but_Close.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Close.ForeColor = System.Drawing.SystemColors.ControlText;
            this.but_Close.Image = ((System.Drawing.Image)(resources.GetObject("but_Close.Image")));
            this.but_Close.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Close.Location = new System.Drawing.Point(1001, 390);
            this.but_Close.Name = "but_Close";
            this.but_Close.Size = new System.Drawing.Size(110, 25);
            this.but_Close.TabIndex = 139;
            this.but_Close.Text = "Thoát";
            this.but_Close.UseVisualStyleBackColor = false;
            this.but_Close.Click += new System.EventHandler(this.but_Close_Click_1);
            // 
            // but_Edit
            // 
            this.but_Edit.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Edit.BackColor = System.Drawing.SystemColors.Control;
            this.but_Edit.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Edit.Enabled = false;
            this.but_Edit.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Edit.ForeColor = System.Drawing.SystemColors.ControlText;
            this.but_Edit.Image = ((System.Drawing.Image)(resources.GetObject("but_Edit.Image")));
            this.but_Edit.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Edit.Location = new System.Drawing.Point(719, 390);
            this.but_Edit.Name = "but_Edit";
            this.but_Edit.Size = new System.Drawing.Size(110, 25);
            this.but_Edit.TabIndex = 142;
            this.but_Edit.Text = "Chỉnh Sửa";
            this.but_Edit.UseVisualStyleBackColor = false;
            this.but_Edit.Click += new System.EventHandler(this.but_Edit_Click);
            // 
            // but_Add
            // 
            this.but_Add.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Add.BackColor = System.Drawing.SystemColors.Control;
            this.but_Add.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Add.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Add.ForeColor = System.Drawing.SystemColors.ControlText;
            this.but_Add.Image = ((System.Drawing.Image)(resources.GetObject("but_Add.Image")));
            this.but_Add.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Add.Location = new System.Drawing.Point(577, 391);
            this.but_Add.Name = "but_Add";
            this.but_Add.Size = new System.Drawing.Size(110, 25);
            this.but_Add.TabIndex = 141;
            this.but_Add.Text = "Thêm Mới";
            this.but_Add.UseVisualStyleBackColor = false;
            this.but_Add.Click += new System.EventHandler(this.but_Add_Click);
            // 
            // but_Delete
            // 
            this.but_Delete.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Delete.BackColor = System.Drawing.SystemColors.Control;
            this.but_Delete.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Delete.Enabled = false;
            this.but_Delete.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Delete.ForeColor = System.Drawing.SystemColors.ControlText;
            this.but_Delete.Image = ((System.Drawing.Image)(resources.GetObject("but_Delete.Image")));
            this.but_Delete.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Delete.Location = new System.Drawing.Point(860, 390);
            this.but_Delete.Name = "but_Delete";
            this.but_Delete.Size = new System.Drawing.Size(110, 25);
            this.but_Delete.TabIndex = 140;
            this.but_Delete.Text = "Xóa";
            this.but_Delete.UseVisualStyleBackColor = false;
            this.but_Delete.Click += new System.EventHandler(this.but_Delete_Click);
            // 
            // label1
            // 
            this.label1.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(283, 395);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(85, 15);
            this.label1.TabIndex = 136;
            this.label1.Text = "Chọn cú pháp:";
            // 
            // label28
            // 
            this.label28.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.label28.AutoSize = true;
            this.label28.Location = new System.Drawing.Point(11, 393);
            this.label28.Name = "label28";
            this.label28.Size = new System.Drawing.Size(108, 15);
            this.label28.TabIndex = 136;
            this.label28.Text = "Chọn tên cú Pháp :";
            // 
            // dlv_ManageKeyword
            // 
            this.dlv_ManageKeyword.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.dlv_ManageKeyword.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dlv_ManageKeyword.BackgroundColor = System.Drawing.SystemColors.ControlDarkDark;
            this.dlv_ManageKeyword.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dlv_ManageKeyword.Location = new System.Drawing.Point(6, 28);
            this.dlv_ManageKeyword.Name = "dlv_ManageKeyword";
            this.dlv_ManageKeyword.Size = new System.Drawing.Size(1110, 357);
            this.dlv_ManageKeyword.TabIndex = 5;
            this.dlv_ManageKeyword.CellMouseClick += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dlv_ManageKeyword_CellMouseClick);
            // 
            // label10
            // 
            this.label10.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.label10.AutoSize = true;
            this.label10.BackColor = System.Drawing.Color.Transparent;
            this.label10.Font = new System.Drawing.Font("Times New Roman", 24F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(418, 13);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(417, 36);
            this.label10.TabIndex = 1;
            this.label10.Text = "Quản Lý Hệ Thống Cú  Pháp";
            // 
            // FormManageKeyword
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Inherit;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(1194, 535);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.groupBox1);
            this.Name = "FormManageKeyword";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Quan Ly Cu Phap SMS";
            this.Load += new System.EventHandler(this.FormManageKeyword_Load);
            this.Activated += new System.EventHandler(this.FormManageKeyword_Activated);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dlv_ManageKeyword)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.DataGridView dlv_ManageKeyword;
        private System.Windows.Forms.Button but_Close;
        private System.Windows.Forms.Button but_Edit;
        private System.Windows.Forms.Button but_Add;
        private System.Windows.Forms.Button but_Delete;
        private System.Windows.Forms.Label label28;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label lblYouChoose;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cbo_Keyword;
        private System.Windows.Forms.ComboBox cbo_Name;

    }
}