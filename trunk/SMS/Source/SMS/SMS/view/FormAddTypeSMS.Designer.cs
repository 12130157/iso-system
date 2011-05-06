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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormAddTypeSMS));
            this.dgv_Account = new System.Windows.Forms.DataGridView();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.txt_Note = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txt_ServiceCharges = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txt_TypeAccount = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.but_CapNhat = new System.Windows.Forms.Button();
            this.but_Close = new System.Windows.Forms.Button();
            this.but_Add = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_Account)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dgv_Account
            // 
            this.dgv_Account.AllowUserToAddRows = false;
            this.dgv_Account.AllowUserToDeleteRows = false;
            this.dgv_Account.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.dgv_Account.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_Account.Location = new System.Drawing.Point(392, 61);
            this.dgv_Account.Name = "dgv_Account";
            this.dgv_Account.RowHeadersVisible = false;
            this.dgv_Account.Size = new System.Drawing.Size(359, 218);
            this.dgv_Account.TabIndex = 3;
            this.dgv_Account.CellMouseClick += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dgv_Account_CellMouseClick);
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
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.but_CapNhat);
            this.groupBox1.Controls.Add(this.but_Close);
            this.groupBox1.Controls.Add(this.but_Add);
            this.groupBox1.Location = new System.Drawing.Point(29, 63);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(357, 216);
            this.groupBox1.TabIndex = 4;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Thêm loại TK SMS ";
            // 
            // txt_Note
            // 
            this.txt_Note.Location = new System.Drawing.Point(108, 74);
            this.txt_Note.MaxLength = 500;
            this.txt_Note.Multiline = true;
            this.txt_Note.Name = "txt_Note";
            this.txt_Note.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txt_Note.Size = new System.Drawing.Size(226, 85);
            this.txt_Note.TabIndex = 8;
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
            this.txt_ServiceCharges.Location = new System.Drawing.Point(108, 48);
            this.txt_ServiceCharges.Name = "txt_ServiceCharges";
            this.txt_ServiceCharges.Size = new System.Drawing.Size(163, 20);
            this.txt_ServiceCharges.TabIndex = 10;
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
            this.but_CapNhat.Location = new System.Drawing.Point(120, 174);
            this.but_CapNhat.Name = "but_CapNhat";
            this.but_CapNhat.Size = new System.Drawing.Size(110, 25);
            this.but_CapNhat.TabIndex = 3;
            this.but_CapNhat.Text = "Cập Nhật";
            this.but_CapNhat.UseVisualStyleBackColor = true;
            // 
            // but_Close
            // 
            this.but_Close.Image = ((System.Drawing.Image)(resources.GetObject("but_Close.Image")));
            this.but_Close.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Close.Location = new System.Drawing.Point(241, 174);
            this.but_Close.Name = "but_Close";
            this.but_Close.Size = new System.Drawing.Size(110, 25);
            this.but_Close.TabIndex = 3;
            this.but_Close.Text = "Thoát";
            this.but_Close.UseVisualStyleBackColor = true;
            // 
            // but_Add
            // 
            this.but_Add.Image = ((System.Drawing.Image)(resources.GetObject("but_Add.Image")));
            this.but_Add.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Add.Location = new System.Drawing.Point(4, 174);
            this.but_Add.Name = "but_Add";
            this.but_Add.Size = new System.Drawing.Size(110, 25);
            this.but_Add.TabIndex = 4;
            this.but_Add.Text = "Thêm";
            this.but_Add.UseVisualStyleBackColor = true;
            // 
            // label4
            // 
            this.label4.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.Transparent;
            this.label4.Font = new System.Drawing.Font("Times New Roman", 21.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(131, 9);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(532, 32);
            this.label4.TabIndex = 5;
            this.label4.Text = "Quản Lý Thông Tin  Loại Tài Khoản SMS";
            // 
            // FormAddTypeSMS
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(774, 302);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.dgv_Account);
            this.Controls.Add(this.label4);
            this.MaximizeBox = false;
            this.Name = "FormAddTypeSMS";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Them Loai Tai Khoan SMS";
            this.Load += new System.EventHandler(this.FormAddTypeSMS_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgv_Account)).EndInit();
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

    }
}