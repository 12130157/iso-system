﻿namespace SMS
{
    partial class FormInboxMessageType
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormInboxMessageType));
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.but_Edit = new System.Windows.Forms.Button();
            this.but_Add = new System.Windows.Forms.Button();
            this.but_Close = new System.Windows.Forms.Button();
            this.but_Delete = new System.Windows.Forms.Button();
            this.pnl_InboxType = new System.Windows.Forms.Panel();
            this.lbl_LoaiHopThu = new System.Windows.Forms.Label();
            this.but_Close2 = new System.Windows.Forms.Button();
            this.but_Ok = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.txt_NameInbox = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txt_Note = new System.Windows.Forms.TextBox();
            this.Label1 = new System.Windows.Forms.Label();
            this.txt_IDInbox = new System.Windows.Forms.TextBox();
            this.dlv_InboxType = new System.Windows.Forms.DataGridView();
            this.lbl_YouChoose = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label15 = new System.Windows.Forms.Label();
            this.txt_EnterTen = new System.Windows.Forms.TextBox();
            this.groupBox1.SuspendLayout();
            this.pnl_InboxType.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dlv_InboxType)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox1.Controls.Add(this.but_Edit);
            this.groupBox1.Controls.Add(this.but_Add);
            this.groupBox1.Controls.Add(this.txt_EnterTen);
            this.groupBox1.Controls.Add(this.label15);
            this.groupBox1.Controls.Add(this.pnl_InboxType);
            this.groupBox1.Controls.Add(this.but_Close);
            this.groupBox1.Controls.Add(this.but_Delete);
            this.groupBox1.Controls.Add(this.dlv_InboxType);
            this.groupBox1.Controls.Add(this.lbl_YouChoose);
            this.groupBox1.Location = new System.Drawing.Point(12, 44);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(535, 313);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            // 
            // but_Edit
            // 
            this.but_Edit.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Edit.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Edit.Enabled = false;
            this.but_Edit.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Edit.Image = ((System.Drawing.Image)(resources.GetObject("but_Edit.Image")));
            this.but_Edit.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Edit.Location = new System.Drawing.Point(165, 271);
            this.but_Edit.Name = "but_Edit";
            this.but_Edit.Size = new System.Drawing.Size(110, 25);
            this.but_Edit.TabIndex = 134;
            this.but_Edit.Text = "Chỉnh Sữa";
            this.but_Edit.UseVisualStyleBackColor = false;
            this.but_Edit.Click += new System.EventHandler(this.but_Edit_Click);
            // 
            // but_Add
            // 
            this.but_Add.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Add.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Add.Enabled = false;
            this.but_Add.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Add.ForeColor = System.Drawing.SystemColors.ControlText;
            this.but_Add.Image = ((System.Drawing.Image)(resources.GetObject("but_Add.Image")));
            this.but_Add.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Add.Location = new System.Drawing.Point(38, 271);
            this.but_Add.Name = "but_Add";
            this.but_Add.Size = new System.Drawing.Size(110, 25);
            this.but_Add.TabIndex = 137;
            this.but_Add.Text = "Thêm Mới";
            this.but_Add.UseVisualStyleBackColor = false;
            this.but_Add.Click += new System.EventHandler(this.but_Add_Click);
            // 
            // but_Close
            // 
            this.but_Close.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Close.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Close.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Close.Image = ((System.Drawing.Image)(resources.GetObject("but_Close.Image")));
            this.but_Close.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Close.Location = new System.Drawing.Point(406, 272);
            this.but_Close.Name = "but_Close";
            this.but_Close.Size = new System.Drawing.Size(110, 25);
            this.but_Close.TabIndex = 133;
            this.but_Close.Text = "Thoát";
            this.but_Close.UseVisualStyleBackColor = false;
            this.but_Close.Click += new System.EventHandler(this.but_Close_Click);
            // 
            // but_Delete
            // 
            this.but_Delete.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Delete.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Delete.Enabled = false;
            this.but_Delete.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Delete.Image = ((System.Drawing.Image)(resources.GetObject("but_Delete.Image")));
            this.but_Delete.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Delete.Location = new System.Drawing.Point(287, 272);
            this.but_Delete.Name = "but_Delete";
            this.but_Delete.Size = new System.Drawing.Size(110, 25);
            this.but_Delete.TabIndex = 135;
            this.but_Delete.Text = "Xóa";
            this.but_Delete.UseVisualStyleBackColor = false;
            this.but_Delete.Click += new System.EventHandler(this.but_Delete_Click);
            // 
            // pnl_InboxType
            // 
            this.pnl_InboxType.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.pnl_InboxType.Controls.Add(this.lbl_LoaiHopThu);
            this.pnl_InboxType.Controls.Add(this.but_Close2);
            this.pnl_InboxType.Controls.Add(this.but_Ok);
            this.pnl_InboxType.Controls.Add(this.label4);
            this.pnl_InboxType.Controls.Add(this.txt_NameInbox);
            this.pnl_InboxType.Controls.Add(this.label5);
            this.pnl_InboxType.Controls.Add(this.txt_Note);
            this.pnl_InboxType.Controls.Add(this.Label1);
            this.pnl_InboxType.Controls.Add(this.txt_IDInbox);
            this.pnl_InboxType.Location = new System.Drawing.Point(50, 53);
            this.pnl_InboxType.Name = "pnl_InboxType";
            this.pnl_InboxType.Size = new System.Drawing.Size(435, 182);
            this.pnl_InboxType.TabIndex = 138;
            // 
            // lbl_LoaiHopThu
            // 
            this.lbl_LoaiHopThu.AutoSize = true;
            this.lbl_LoaiHopThu.Font = new System.Drawing.Font("Times New Roman", 14.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_LoaiHopThu.ForeColor = System.Drawing.Color.Red;
            this.lbl_LoaiHopThu.Location = new System.Drawing.Point(111, 14);
            this.lbl_LoaiHopThu.Name = "lbl_LoaiHopThu";
            this.lbl_LoaiHopThu.Size = new System.Drawing.Size(177, 22);
            this.lbl_LoaiHopThu.TabIndex = 110;
            this.lbl_LoaiHopThu.Text = "Thêm Loại Hộp Thư";
            // 
            // but_Close2
            // 
            this.but_Close2.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.but_Close2.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Close2.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Close2.ForeColor = System.Drawing.SystemColors.ControlText;
            this.but_Close2.Image = ((System.Drawing.Image)(resources.GetObject("but_Close2.Image")));
            this.but_Close2.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Close2.Location = new System.Drawing.Point(224, 154);
            this.but_Close2.Name = "but_Close2";
            this.but_Close2.Size = new System.Drawing.Size(110, 25);
            this.but_Close2.TabIndex = 137;
            this.but_Close2.Text = "Thoát";
            this.but_Close2.UseVisualStyleBackColor = false;
            this.but_Close2.Click += new System.EventHandler(this.but_Close2_Click);
            // 
            // but_Ok
            // 
            this.but_Ok.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.but_Ok.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Ok.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Ok.ForeColor = System.Drawing.SystemColors.ControlText;
            this.but_Ok.Image = ((System.Drawing.Image)(resources.GetObject("but_Ok.Image")));
            this.but_Ok.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.but_Ok.Location = new System.Drawing.Point(102, 154);
            this.but_Ok.Name = "but_Ok";
            this.but_Ok.Size = new System.Drawing.Size(110, 25);
            this.but_Ok.TabIndex = 137;
            this.but_Ok.Text = "Thêm";
            this.but_Ok.UseVisualStyleBackColor = false;
            this.but_Ok.Click += new System.EventHandler(this.but_Ok_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(4, 88);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(76, 15);
            this.label4.TabIndex = 110;
            this.label4.Text = "Tên hộp thư:";
            // 
            // txt_NameInbox
            // 
            this.txt_NameInbox.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_NameInbox.Location = new System.Drawing.Point(82, 85);
            this.txt_NameInbox.MaxLength = 40;
            this.txt_NameInbox.Multiline = true;
            this.txt_NameInbox.Name = "txt_NameInbox";
            this.txt_NameInbox.Size = new System.Drawing.Size(151, 52);
            this.txt_NameInbox.TabIndex = 111;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(201, 60);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(51, 15);
            this.label5.TabIndex = 110;
            this.label5.Text = "Ghi chú:";
            // 
            // txt_Note
            // 
            this.txt_Note.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_Note.Location = new System.Drawing.Point(258, 60);
            this.txt_Note.MaxLength = 500;
            this.txt_Note.Multiline = true;
            this.txt_Note.Name = "txt_Note";
            this.txt_Note.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txt_Note.Size = new System.Drawing.Size(162, 77);
            this.txt_Note.TabIndex = 111;
            // 
            // Label1
            // 
            this.Label1.AutoSize = true;
            this.Label1.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Label1.Location = new System.Drawing.Point(6, 60);
            this.Label1.Name = "Label1";
            this.Label1.Size = new System.Drawing.Size(73, 15);
            this.Label1.TabIndex = 110;
            this.Label1.Text = "Mã hộp thư:";
            // 
            // txt_IDInbox
            // 
            this.txt_IDInbox.Enabled = false;
            this.txt_IDInbox.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_IDInbox.Location = new System.Drawing.Point(85, 60);
            this.txt_IDInbox.Name = "txt_IDInbox";
            this.txt_IDInbox.Size = new System.Drawing.Size(89, 22);
            this.txt_IDInbox.TabIndex = 111;
            // 
            // dlv_InboxType
            // 
            this.dlv_InboxType.AllowUserToAddRows = false;
            this.dlv_InboxType.AllowUserToDeleteRows = false;
            this.dlv_InboxType.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.dlv_InboxType.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dlv_InboxType.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.DisplayedCells;
            this.dlv_InboxType.BackgroundColor = System.Drawing.SystemColors.ControlDarkDark;
            this.dlv_InboxType.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.dlv_InboxType.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dlv_InboxType.Location = new System.Drawing.Point(9, 37);
            this.dlv_InboxType.Name = "dlv_InboxType";
            this.dlv_InboxType.ReadOnly = true;
            this.dlv_InboxType.RowHeadersVisible = false;
            this.dlv_InboxType.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dlv_InboxType.Size = new System.Drawing.Size(520, 213);
            this.dlv_InboxType.TabIndex = 134;
            this.dlv_InboxType.CellMouseClick += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dlv_InboxType_CellMouseClick);
            // 
            // lbl_YouChoose
            // 
            this.lbl_YouChoose.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.lbl_YouChoose.AutoSize = true;
            this.lbl_YouChoose.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl_YouChoose.Location = new System.Drawing.Point(6, 253);
            this.lbl_YouChoose.Name = "lbl_YouChoose";
            this.lbl_YouChoose.Size = new System.Drawing.Size(91, 15);
            this.lbl_YouChoose.TabIndex = 130;
            this.lbl_YouChoose.Text = "Bạn đang chọn:";
            // 
            // label2
            // 
            this.label2.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 21.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.Red;
            this.label2.Location = new System.Drawing.Point(183, 9);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(180, 32);
            this.label2.TabIndex = 137;
            this.label2.Text = "Loại Hộp thư";
            // 
            // label15
            // 
            this.label15.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.label15.AutoSize = true;
            this.label15.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label15.Location = new System.Drawing.Point(9, 16);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(79, 15);
            this.label15.TabIndex = 130;
            this.label15.Text = "Tên hộp thư :";
            // 
            // txt_EnterTen
            // 
            this.txt_EnterTen.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.txt_EnterTen.Cursor = System.Windows.Forms.Cursors.Hand;
            this.txt_EnterTen.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txt_EnterTen.HideSelection = false;
            this.txt_EnterTen.Location = new System.Drawing.Point(109, 13);
            this.txt_EnterTen.Name = "txt_EnterTen";
            this.txt_EnterTen.Size = new System.Drawing.Size(288, 22);
            this.txt_EnterTen.TabIndex = 111;
            this.txt_EnterTen.TextChanged += new System.EventHandler(this.txt_EnterTen_TextChanged);
            // 
            // FormInboxMessageType
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(559, 369);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.label2);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "FormInboxMessageType";
            this.StartPosition = System.Windows.Forms.FormStartPosition.Manual;
            this.Text = "Quan Ly Loai Hop Thu";
            this.Load += new System.EventHandler(this.FormInboxMessageType_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.pnl_InboxType.ResumeLayout(false);
            this.pnl_InboxType.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dlv_InboxType)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button but_Edit;
        private System.Windows.Forms.Button but_Add;
        private System.Windows.Forms.Button but_Close;
        private System.Windows.Forms.Button but_Delete;
        private System.Windows.Forms.Panel pnl_InboxType;
        internal System.Windows.Forms.Label label4;
        internal System.Windows.Forms.TextBox txt_NameInbox;
        internal System.Windows.Forms.Label label5;
        internal System.Windows.Forms.TextBox txt_Note;
        internal System.Windows.Forms.Label Label1;
        internal System.Windows.Forms.TextBox txt_IDInbox;
        internal System.Windows.Forms.Label label2;
        internal System.Windows.Forms.DataGridView dlv_InboxType;
        private System.Windows.Forms.Label lbl_YouChoose;
        private System.Windows.Forms.Button but_Close2;
        private System.Windows.Forms.Button but_Ok;
        internal System.Windows.Forms.Label lbl_LoaiHopThu;
        internal System.Windows.Forms.TextBox txt_EnterTen;
        private System.Windows.Forms.Label label15;



    }
}