namespace SMS
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
            this.groupAddress = new System.Windows.Forms.GroupBox();
            this.txt_Phone = new System.Windows.Forms.TextBox();
            this.txt_Name = new System.Windows.Forms.TextBox();
            this.but_Compose = new System.Windows.Forms.Button();
            this.but_Close = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.dgv_AddressBox = new System.Windows.Forms.DataGridView();
            this.label2 = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.groupAddress.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_AddressBox)).BeginInit();
            this.SuspendLayout();
            // 
            // groupAddress
            // 
            this.groupAddress.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.groupAddress.BackColor = System.Drawing.Color.Transparent;
            this.groupAddress.Controls.Add(this.txt_Phone);
            this.groupAddress.Controls.Add(this.txt_Name);
            this.groupAddress.Controls.Add(this.button3);
            this.groupAddress.Controls.Add(this.button2);
            this.groupAddress.Controls.Add(this.button1);
            this.groupAddress.Controls.Add(this.but_Compose);
            this.groupAddress.Controls.Add(this.but_Close);
            this.groupAddress.Controls.Add(this.label1);
            this.groupAddress.Controls.Add(this.label7);
            this.groupAddress.Controls.Add(this.dgv_AddressBox);
            this.groupAddress.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupAddress.Location = new System.Drawing.Point(12, 44);
            this.groupAddress.Name = "groupAddress";
            this.groupAddress.Size = new System.Drawing.Size(781, 447);
            this.groupAddress.TabIndex = 1;
            this.groupAddress.TabStop = false;
            // 
            // txt_Phone
            // 
            this.txt_Phone.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.txt_Phone.Location = new System.Drawing.Point(402, 14);
            this.txt_Phone.Name = "txt_Phone";
            this.txt_Phone.Size = new System.Drawing.Size(123, 22);
            this.txt_Phone.TabIndex = 139;
            this.txt_Phone.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txt_Phone_KeyPress);
            // 
            // txt_Name
            // 
            this.txt_Name.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.txt_Name.Location = new System.Drawing.Point(85, 14);
            this.txt_Name.Name = "txt_Name";
            this.txt_Name.Size = new System.Drawing.Size(154, 22);
            this.txt_Name.TabIndex = 139;
            // 
            // but_Compose
            // 
            this.but_Compose.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Compose.BackColor = System.Drawing.SystemColors.Control;
            this.but_Compose.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Compose.Enabled = false;
            this.but_Compose.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Compose.ForeColor = System.Drawing.SystemColors.ControlText;
            this.but_Compose.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Compose.Location = new System.Drawing.Point(469, 420);
            this.but_Compose.Name = "but_Compose";
            this.but_Compose.Size = new System.Drawing.Size(110, 25);
            this.but_Compose.TabIndex = 136;
            this.but_Compose.Text = "Gửi Tin Nhắn";
            this.but_Compose.UseVisualStyleBackColor = false;
            // 
            // but_Close
            // 
            this.but_Close.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Close.BackColor = System.Drawing.SystemColors.Control;
            this.but_Close.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Close.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Close.ForeColor = System.Drawing.SystemColors.ControlText;
            this.but_Close.Location = new System.Drawing.Point(601, 420);
            this.but_Close.Name = "but_Close";
            this.but_Close.Size = new System.Drawing.Size(110, 25);
            this.but_Close.TabIndex = 133;
            this.but_Close.Text = "Thoát";
            this.but_Close.UseVisualStyleBackColor = false;
            this.but_Close.Click += new System.EventHandler(this.but_Close_Click);
            // 
            // label1
            // 
            this.label1.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Location = new System.Drawing.Point(285, 17);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(118, 15);
            this.label1.TabIndex = 138;
            this.label1.Text = "Nhập Số Điện Thoại:";
            // 
            // label7
            // 
            this.label7.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.label7.AutoSize = true;
            this.label7.BackColor = System.Drawing.Color.Transparent;
            this.label7.Location = new System.Drawing.Point(13, 17);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(66, 15);
            this.label7.TabIndex = 138;
            this.label7.Text = "Nhập Tên: ";
            // 
            // dgv_AddressBox
            // 
            this.dgv_AddressBox.AllowUserToAddRows = false;
            this.dgv_AddressBox.AllowUserToDeleteRows = false;
            this.dgv_AddressBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.dgv_AddressBox.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.DisplayedCells;
            this.dgv_AddressBox.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.DisplayedCells;
            this.dgv_AddressBox.BackgroundColor = System.Drawing.SystemColors.ControlDarkDark;
            this.dgv_AddressBox.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_AddressBox.Location = new System.Drawing.Point(11, 50);
            this.dgv_AddressBox.Name = "dgv_AddressBox";
            this.dgv_AddressBox.ReadOnly = true;
            this.dgv_AddressBox.RowHeadersVisible = false;
            this.dgv_AddressBox.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgv_AddressBox.Size = new System.Drawing.Size(757, 364);
            this.dgv_AddressBox.TabIndex = 0;
            // 
            // label2
            // 
            this.label2.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 21.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.Red;
            this.label2.Location = new System.Drawing.Point(233, 9);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(341, 32);
            this.label2.TabIndex = 138;
            this.label2.Text = "Danh Sách Các Tài Khoản";
            // 
            // button1
            // 
            this.button1.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.button1.BackColor = System.Drawing.SystemColors.Control;
            this.button1.Cursor = System.Windows.Forms.Cursors.Hand;
            this.button1.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.ForeColor = System.Drawing.SystemColors.ControlText;
            this.button1.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.button1.Location = new System.Drawing.Point(68, 420);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(110, 25);
            this.button1.TabIndex = 136;
            this.button1.Text = "Thêm";
            this.button1.UseVisualStyleBackColor = false;
            // 
            // button2
            // 
            this.button2.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.button2.BackColor = System.Drawing.SystemColors.Control;
            this.button2.Cursor = System.Windows.Forms.Cursors.Hand;
            this.button2.Enabled = false;
            this.button2.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button2.ForeColor = System.Drawing.SystemColors.ControlText;
            this.button2.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.button2.Location = new System.Drawing.Point(207, 420);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(110, 25);
            this.button2.TabIndex = 136;
            this.button2.Text = "Chỉnh Sữa";
            this.button2.UseVisualStyleBackColor = false;
            // 
            // button3
            // 
            this.button3.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.button3.BackColor = System.Drawing.SystemColors.Control;
            this.button3.Cursor = System.Windows.Forms.Cursors.Hand;
            this.button3.Enabled = false;
            this.button3.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button3.ForeColor = System.Drawing.SystemColors.ControlText;
            this.button3.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.button3.Location = new System.Drawing.Point(336, 419);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(110, 25);
            this.button3.TabIndex = 136;
            this.button3.Text = "Xóa";
            this.button3.UseVisualStyleBackColor = false;
            // 
            // FormAddressBook
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(805, 512);
            this.Controls.Add(this.groupAddress);
            this.Controls.Add(this.label2);
            this.MaximizeBox = false;
            this.Name = "FormAddressBook";
            this.StartPosition = System.Windows.Forms.FormStartPosition.Manual;
            this.Text = "FormAddressBook";
            this.groupAddress.ResumeLayout(false);
            this.groupAddress.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_AddressBox)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox groupAddress;
        private System.Windows.Forms.TextBox txt_Phone;
        private System.Windows.Forms.TextBox txt_Name;
        private System.Windows.Forms.Button but_Compose;
        private System.Windows.Forms.Button but_Close;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.DataGridView dgv_AddressBox;
        //private System.Windows.Forms.DataGridViewTextBoxColumn Name;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button1;



    }
}