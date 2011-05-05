namespace SMS.view
{
    partial class FormDetailAccount
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormDetailAccount));
            this.grp_DetailAccount = new System.Windows.Forms.GroupBox();
            this.pnl_Add = new System.Windows.Forms.Panel();
            this.but_Close2 = new System.Windows.Forms.Button();
            this.but_Ok = new System.Windows.Forms.Button();
            this.lb_tilte = new System.Windows.Forms.Label();
            this.txt_Registrationyear = new System.Windows.Forms.TextBox();
            this.txt_RegistrationMonth = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.but_Add = new System.Windows.Forms.Button();
            this.lblYouChoose = new System.Windows.Forms.Label();
            this.but_Close = new System.Windows.Forms.Button();
            this.but_Delete = new System.Windows.Forms.Button();
            this.but_Edit = new System.Windows.Forms.Button();
            this.dgv_AccountDetail = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.grp_DetailAccount.SuspendLayout();
            this.pnl_Add.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_AccountDetail)).BeginInit();
            this.SuspendLayout();
            // 
            // grp_DetailAccount
            // 
            this.grp_DetailAccount.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.grp_DetailAccount.BackColor = System.Drawing.Color.Transparent;
            this.grp_DetailAccount.Controls.Add(this.pnl_Add);
            this.grp_DetailAccount.Controls.Add(this.but_Add);
            this.grp_DetailAccount.Controls.Add(this.lblYouChoose);
            this.grp_DetailAccount.Controls.Add(this.but_Close);
            this.grp_DetailAccount.Controls.Add(this.but_Delete);
            this.grp_DetailAccount.Controls.Add(this.but_Edit);
            this.grp_DetailAccount.Controls.Add(this.dgv_AccountDetail);
            this.grp_DetailAccount.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grp_DetailAccount.Location = new System.Drawing.Point(12, 65);
            this.grp_DetailAccount.Name = "grp_DetailAccount";
            this.grp_DetailAccount.Size = new System.Drawing.Size(633, 274);
            this.grp_DetailAccount.TabIndex = 0;
            this.grp_DetailAccount.TabStop = false;
            // 
            // pnl_Add
            // 
            this.pnl_Add.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.pnl_Add.BackColor = System.Drawing.SystemColors.Control;
            this.pnl_Add.Controls.Add(this.but_Close2);
            this.pnl_Add.Controls.Add(this.but_Ok);
            this.pnl_Add.Controls.Add(this.lb_tilte);
            this.pnl_Add.Controls.Add(this.txt_Registrationyear);
            this.pnl_Add.Controls.Add(this.txt_RegistrationMonth);
            this.pnl_Add.Controls.Add(this.label6);
            this.pnl_Add.Controls.Add(this.label4);
            this.pnl_Add.Location = new System.Drawing.Point(133, 21);
            this.pnl_Add.Name = "pnl_Add";
            this.pnl_Add.Size = new System.Drawing.Size(344, 157);
            this.pnl_Add.TabIndex = 6;
            // 
            // but_Close2
            // 
            this.but_Close2.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.but_Close2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Close2.Image = ((System.Drawing.Image)(resources.GetObject("but_Close2.Image")));
            this.but_Close2.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Close2.Location = new System.Drawing.Point(194, 114);
            this.but_Close2.Name = "but_Close2";
            this.but_Close2.Size = new System.Drawing.Size(97, 23);
            this.but_Close2.TabIndex = 181;
            this.but_Close2.Text = "Thoát";
            this.but_Close2.UseVisualStyleBackColor = true;
            this.but_Close2.Click += new System.EventHandler(this.but_Close2_Click);
            // 
            // but_Ok
            // 
            this.but_Ok.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.but_Ok.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Ok.Image = ((System.Drawing.Image)(resources.GetObject("but_Ok.Image")));
            this.but_Ok.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Ok.Location = new System.Drawing.Point(77, 114);
            this.but_Ok.Name = "but_Ok";
            this.but_Ok.Size = new System.Drawing.Size(97, 23);
            this.but_Ok.TabIndex = 181;
            this.but_Ok.Text = "Thêm";
            this.but_Ok.UseVisualStyleBackColor = true;
            this.but_Ok.Click += new System.EventHandler(this.but_Ok_Click);
            // 
            // lb_tilte
            // 
            this.lb_tilte.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lb_tilte.AutoSize = true;
            this.lb_tilte.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lb_tilte.Location = new System.Drawing.Point(35, 9);
            this.lb_tilte.Name = "lb_tilte";
            this.lb_tilte.Size = new System.Drawing.Size(268, 24);
            this.lb_tilte.TabIndex = 180;
            this.lb_tilte.Text = "Thêm Thông Tin Tài Khoản";
            // 
            // txt_Registrationyear
            // 
            this.txt_Registrationyear.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.txt_Registrationyear.Location = new System.Drawing.Point(141, 77);
            this.txt_Registrationyear.MaxLength = 4;
            this.txt_Registrationyear.Name = "txt_Registrationyear";
            this.txt_Registrationyear.Size = new System.Drawing.Size(164, 22);
            this.txt_Registrationyear.TabIndex = 178;
            this.txt_Registrationyear.TextChanged += new System.EventHandler(this.txt_Registrationyear_TextChanged);
            this.txt_Registrationyear.Validated += new System.EventHandler(this.txt_Registrationyear_Validated);
            this.txt_Registrationyear.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txt_Registrationyear_KeyPress);
            // 
            // txt_RegistrationMonth
            // 
            this.txt_RegistrationMonth.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.txt_RegistrationMonth.Location = new System.Drawing.Point(141, 50);
            this.txt_RegistrationMonth.MaxLength = 2;
            this.txt_RegistrationMonth.Name = "txt_RegistrationMonth";
            this.txt_RegistrationMonth.Size = new System.Drawing.Size(164, 22);
            this.txt_RegistrationMonth.TabIndex = 179;
            this.txt_RegistrationMonth.Validated += new System.EventHandler(this.txt_RegistrationMonth_Validated);
            this.txt_RegistrationMonth.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txt_RegistrationMonth_KeyPress);
            // 
            // label6
            // 
            this.label6.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(34, 80);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(80, 15);
            this.label6.TabIndex = 176;
            this.label6.Text = "Đăng ký năm:";
            // 
            // label4
            // 
            this.label4.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(34, 53);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(93, 15);
            this.label4.TabIndex = 177;
            this.label4.Text = "Đăng ký Tháng:";
            // 
            // but_Add
            // 
            this.but_Add.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Add.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Add.Image = ((System.Drawing.Image)(resources.GetObject("but_Add.Image")));
            this.but_Add.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Add.Location = new System.Drawing.Point(158, 235);
            this.but_Add.Name = "but_Add";
            this.but_Add.Size = new System.Drawing.Size(110, 25);
            this.but_Add.TabIndex = 5;
            this.but_Add.Text = "Thêm";
            this.but_Add.UseVisualStyleBackColor = true;
            this.but_Add.Click += new System.EventHandler(this.but_Add_Click);
            // 
            // lblYouChoose
            // 
            this.lblYouChoose.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.lblYouChoose.AutoSize = true;
            this.lblYouChoose.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblYouChoose.Location = new System.Drawing.Point(12, 245);
            this.lblYouChoose.Name = "lblYouChoose";
            this.lblYouChoose.Size = new System.Drawing.Size(0, 13);
            this.lblYouChoose.TabIndex = 4;
            // 
            // but_Close
            // 
            this.but_Close.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Close.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Close.Image = ((System.Drawing.Image)(resources.GetObject("but_Close.Image")));
            this.but_Close.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Close.Location = new System.Drawing.Point(506, 235);
            this.but_Close.Name = "but_Close";
            this.but_Close.Size = new System.Drawing.Size(110, 25);
            this.but_Close.TabIndex = 1;
            this.but_Close.Text = "Thoát";
            this.but_Close.UseVisualStyleBackColor = true;
            this.but_Close.Click += new System.EventHandler(this.but_Close_Click);
            // 
            // but_Delete
            // 
            this.but_Delete.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Delete.Enabled = false;
            this.but_Delete.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Delete.Image = ((System.Drawing.Image)(resources.GetObject("but_Delete.Image")));
            this.but_Delete.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Delete.Location = new System.Drawing.Point(390, 235);
            this.but_Delete.Name = "but_Delete";
            this.but_Delete.Size = new System.Drawing.Size(110, 25);
            this.but_Delete.TabIndex = 1;
            this.but_Delete.Text = "Xóa";
            this.but_Delete.UseVisualStyleBackColor = true;
            this.but_Delete.Click += new System.EventHandler(this.but_Delete_Click);
            // 
            // but_Edit
            // 
            this.but_Edit.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Edit.Enabled = false;
            this.but_Edit.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Edit.Image = ((System.Drawing.Image)(resources.GetObject("but_Edit.Image")));
            this.but_Edit.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Edit.Location = new System.Drawing.Point(274, 235);
            this.but_Edit.Name = "but_Edit";
            this.but_Edit.Size = new System.Drawing.Size(110, 25);
            this.but_Edit.TabIndex = 1;
            this.but_Edit.Text = "Chỉnh Sửa";
            this.but_Edit.UseVisualStyleBackColor = true;
            this.but_Edit.Click += new System.EventHandler(this.but_Edit_Click);
            // 
            // dgv_AccountDetail
            // 
            this.dgv_AccountDetail.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.dgv_AccountDetail.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgv_AccountDetail.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_AccountDetail.Location = new System.Drawing.Point(15, 19);
            this.dgv_AccountDetail.Name = "dgv_AccountDetail";
            this.dgv_AccountDetail.Size = new System.Drawing.Size(601, 205);
            this.dgv_AccountDetail.TabIndex = 0;
            this.dgv_AccountDetail.CellMouseClick += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dgv_AccountDetail_CellMouseClick);
            // 
            // label1
            // 
            this.label1.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 24F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(78, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(512, 36);
            this.label1.TabIndex = 1;
            this.label1.Text = "Thông Tin Chi Tiết Tài Khoản SMS";
            // 
            // FormDetailAccount
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Inherit;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.ClientSize = new System.Drawing.Size(659, 351);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.grp_DetailAccount);
            this.Name = "FormDetailAccount";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Chi Tiet Tai Khoan SMS";
            this.Load += new System.EventHandler(this.FormDetailAccount_Load);
            this.grp_DetailAccount.ResumeLayout(false);
            this.grp_DetailAccount.PerformLayout();
            this.pnl_Add.ResumeLayout(false);
            this.pnl_Add.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_AccountDetail)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox grp_DetailAccount;
        private System.Windows.Forms.Button but_Close;
        private System.Windows.Forms.Button but_Delete;
        private System.Windows.Forms.Button but_Edit;
        private System.Windows.Forms.DataGridView dgv_AccountDetail;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label lblYouChoose;
        private System.Windows.Forms.Button but_Add;
        private System.Windows.Forms.Panel pnl_Add;
        private System.Windows.Forms.TextBox txt_Registrationyear;
        private System.Windows.Forms.TextBox txt_RegistrationMonth;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label lb_tilte;
        private System.Windows.Forms.Button but_Close2;
        private System.Windows.Forms.Button but_Ok;
    }
}