﻿namespace SMS
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
            this.Number = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Phone = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Address = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.label2 = new System.Windows.Forms.Label();
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
            this.groupAddress.Controls.Add(this.but_Compose);
            this.groupAddress.Controls.Add(this.but_Close);
            this.groupAddress.Controls.Add(this.label1);
            this.groupAddress.Controls.Add(this.label7);
            this.groupAddress.Controls.Add(this.dgv_AddressBox);
            this.groupAddress.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupAddress.Location = new System.Drawing.Point(12, 44);
            this.groupAddress.Name = "groupAddress";
            this.groupAddress.Size = new System.Drawing.Size(781, 398);
            this.groupAddress.TabIndex = 1;
            this.groupAddress.TabStop = false;
            // 
            // txt_Phone
            // 
            this.txt_Phone.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.txt_Phone.Location = new System.Drawing.Point(378, 371);
            this.txt_Phone.Name = "txt_Phone";
            this.txt_Phone.Size = new System.Drawing.Size(123, 22);
            this.txt_Phone.TabIndex = 139;
            // 
            // txt_Name
            // 
            this.txt_Name.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.txt_Name.Location = new System.Drawing.Point(137, 369);
            this.txt_Name.Name = "txt_Name";
            this.txt_Name.Size = new System.Drawing.Size(154, 22);
            this.txt_Name.TabIndex = 139;
            // 
            // but_Compose
            // 
            this.but_Compose.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Compose.BackColor = System.Drawing.SystemColors.Control;
            this.but_Compose.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Compose.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Compose.ForeColor = System.Drawing.SystemColors.ControlText;
            this.but_Compose.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Compose.Location = new System.Drawing.Point(520, 370);
            this.but_Compose.Name = "but_Compose";
            this.but_Compose.Size = new System.Drawing.Size(82, 23);
            this.but_Compose.TabIndex = 136;
            this.but_Compose.Text = "Compose";
            this.but_Compose.UseVisualStyleBackColor = false;
            // 
            // but_Close
            // 
            this.but_Close.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Close.BackColor = System.Drawing.SystemColors.Control;
            this.but_Close.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Close.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Close.ForeColor = System.Drawing.SystemColors.ControlText;
            this.but_Close.Location = new System.Drawing.Point(621, 370);
            this.but_Close.Name = "but_Close";
            this.but_Close.Size = new System.Drawing.Size(86, 23);
            this.but_Close.TabIndex = 133;
            this.but_Close.Text = "Close";
            this.but_Close.UseVisualStyleBackColor = false;
            // 
            // label1
            // 
            this.label1.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Location = new System.Drawing.Point(297, 374);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(75, 15);
            this.label1.TabIndex = 138;
            this.label1.Text = "Enter Phone:";
            // 
            // label7
            // 
            this.label7.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.label7.AutoSize = true;
            this.label7.BackColor = System.Drawing.Color.Transparent;
            this.label7.Location = new System.Drawing.Point(68, 374);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(74, 15);
            this.label7.TabIndex = 138;
            this.label7.Text = "Enter Name: ";
            // 
            // dgv_AddressBox
            // 
            this.dgv_AddressBox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.dgv_AddressBox.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgv_AddressBox.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.DisplayedCells;
            this.dgv_AddressBox.BackgroundColor = System.Drawing.SystemColors.ControlDarkDark;
            this.dgv_AddressBox.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_AddressBox.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Number,
            this.Phone,
            this.Address});
            this.dgv_AddressBox.Location = new System.Drawing.Point(11, 16);
            this.dgv_AddressBox.Name = "dgv_AddressBox";
            this.dgv_AddressBox.RowHeadersVisible = false;
            this.dgv_AddressBox.Size = new System.Drawing.Size(757, 349);
            this.dgv_AddressBox.TabIndex = 0;
            // 
            // Number
            // 
            this.Number.HeaderText = "Number";
            this.Number.Name = "Number";
            // 
            // Phone
            // 
            this.Phone.HeaderText = "Phone";
            this.Phone.Name = "Phone";
            // 
            // Address
            // 
            this.Address.HeaderText = "Address";
            this.Address.Name = "Address";
            // 
            // label2
            // 
            this.label2.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 21.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(321, 9);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(169, 32);
            this.label2.TabIndex = 138;
            this.label2.Text = "Address Box";
            // 
            // FormAddressBook
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(805, 463);
            this.Controls.Add(this.groupAddress);
            this.Controls.Add(this.label2);
            this.Name = "FormAddressBook";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
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
        private System.Windows.Forms.DataGridViewTextBoxColumn Number;
        //private System.Windows.Forms.DataGridViewTextBoxColumn Name;
        private System.Windows.Forms.DataGridViewTextBoxColumn Phone;
        private System.Windows.Forms.DataGridViewTextBoxColumn Address;
        private System.Windows.Forms.Label label2;



    }
}