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
            this.txt_StudentID = new System.Windows.Forms.TextBox();
            this.txt_Numberphone = new System.Windows.Forms.TextBox();
            this.dgv_manageAccount = new System.Windows.Forms.DataGridView();
            this.but_Details = new System.Windows.Forms.Button();
            this.but_Edit = new System.Windows.Forms.Button();
            this.but_Add = new System.Windows.Forms.Button();
            this.butClose = new System.Windows.Forms.Button();
            this.but_Delete = new System.Windows.Forms.Button();
            this.but_Refresh = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label28 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.lblYouChoose = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_manageAccount)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox1.BackColor = System.Drawing.SystemColors.MenuBar;
            this.groupBox1.Controls.Add(this.txt_StudentID);
            this.groupBox1.Controls.Add(this.txt_Numberphone);
            this.groupBox1.Controls.Add(this.dgv_manageAccount);
            this.groupBox1.Controls.Add(this.but_Details);
            this.groupBox1.Controls.Add(this.but_Edit);
            this.groupBox1.Controls.Add(this.but_Add);
            this.groupBox1.Controls.Add(this.butClose);
            this.groupBox1.Controls.Add(this.but_Delete);
            this.groupBox1.Controls.Add(this.but_Refresh);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.label28);
            this.groupBox1.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(12, 58);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(975, 368);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            // 
            // txt_StudentID
            // 
            this.txt_StudentID.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.txt_StudentID.Location = new System.Drawing.Point(309, 333);
            this.txt_StudentID.Name = "txt_StudentID";
            this.txt_StudentID.Size = new System.Drawing.Size(93, 22);
            this.txt_StudentID.TabIndex = 150;
            // 
            // txt_Numberphone
            // 
            this.txt_Numberphone.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.txt_Numberphone.Location = new System.Drawing.Point(92, 335);
            this.txt_Numberphone.Name = "txt_Numberphone";
            this.txt_Numberphone.Size = new System.Drawing.Size(113, 22);
            this.txt_Numberphone.TabIndex = 150;
            // 
            // dgv_manageAccount
            // 
            this.dgv_manageAccount.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.dgv_manageAccount.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgv_manageAccount.BackgroundColor = System.Drawing.SystemColors.ControlDarkDark;
            this.dgv_manageAccount.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.dgv_manageAccount.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_manageAccount.Location = new System.Drawing.Point(20, 24);
            this.dgv_manageAccount.Name = "dgv_manageAccount";
            this.dgv_manageAccount.RowHeadersVisible = false;
            this.dgv_manageAccount.Size = new System.Drawing.Size(937, 299);
            this.dgv_manageAccount.TabIndex = 141;
            this.dgv_manageAccount.CellMouseClick += new System.Windows.Forms.DataGridViewCellMouseEventHandler(this.dgv_manageAccount_CellMouseClick);
            // 
            // but_Details
            // 
            this.but_Details.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Details.BackColor = System.Drawing.Color.Blue;
            this.but_Details.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Details.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
            this.but_Details.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Details.Image = ((System.Drawing.Image)(resources.GetObject("but_Details.Image")));
            this.but_Details.Location = new System.Drawing.Point(693, 333);
            this.but_Details.Name = "but_Details";
            this.but_Details.Size = new System.Drawing.Size(90, 25);
            this.but_Details.TabIndex = 148;
            this.but_Details.Text = "Details";
            this.but_Details.UseVisualStyleBackColor = false;
            this.but_Details.Click += new System.EventHandler(this.but_Details_Click);
            // 
            // but_Edit
            // 
            this.but_Edit.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Edit.BackColor = System.Drawing.Color.Blue;
            this.but_Edit.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Edit.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
            this.but_Edit.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Edit.Image = ((System.Drawing.Image)(resources.GetObject("but_Edit.Image")));
            this.but_Edit.Location = new System.Drawing.Point(600, 333);
            this.but_Edit.Name = "but_Edit";
            this.but_Edit.Size = new System.Drawing.Size(90, 25);
            this.but_Edit.TabIndex = 146;
            this.but_Edit.Text = "Edit";
            this.but_Edit.UseVisualStyleBackColor = false;
            this.but_Edit.Click += new System.EventHandler(this.but_Edit_Click);
            // 
            // but_Add
            // 
            this.but_Add.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Add.BackColor = System.Drawing.Color.Blue;
            this.but_Add.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Add.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Add.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Add.Image = ((System.Drawing.Image)(resources.GetObject("but_Add.Image")));
            this.but_Add.Location = new System.Drawing.Point(504, 332);
            this.but_Add.Name = "but_Add";
            this.but_Add.Size = new System.Drawing.Size(90, 25);
            this.but_Add.TabIndex = 146;
            this.but_Add.Text = "Add";
            this.but_Add.UseVisualStyleBackColor = false;
            this.but_Add.Click += new System.EventHandler(this.but_Add_Click);
            // 
            // butClose
            // 
            this.butClose.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.butClose.BackColor = System.Drawing.Color.Blue;
            this.butClose.Cursor = System.Windows.Forms.Cursors.Hand;
            this.butClose.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
            this.butClose.ForeColor = System.Drawing.SystemColors.Control;
            this.butClose.Image = ((System.Drawing.Image)(resources.GetObject("butClose.Image")));
            this.butClose.Location = new System.Drawing.Point(882, 332);
            this.butClose.Name = "butClose";
            this.butClose.Size = new System.Drawing.Size(90, 25);
            this.butClose.TabIndex = 147;
            this.butClose.Text = "Close";
            this.butClose.UseVisualStyleBackColor = false;
            this.butClose.Click += new System.EventHandler(this.butClose_Click);
            // 
            // but_Delete
            // 
            this.but_Delete.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Delete.BackColor = System.Drawing.Color.Blue;
            this.but_Delete.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Delete.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
            this.but_Delete.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Delete.Image = ((System.Drawing.Image)(resources.GetObject("but_Delete.Image")));
            this.but_Delete.Location = new System.Drawing.Point(786, 333);
            this.but_Delete.Name = "but_Delete";
            this.but_Delete.Size = new System.Drawing.Size(90, 25);
            this.but_Delete.TabIndex = 147;
            this.but_Delete.Text = "Delete";
            this.but_Delete.UseVisualStyleBackColor = false;
            this.but_Delete.Click += new System.EventHandler(this.but_Delete_Click);
            // 
            // but_Refresh
            // 
            this.but_Refresh.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.but_Refresh.BackColor = System.Drawing.Color.Blue;
            this.but_Refresh.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Refresh.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.but_Refresh.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Refresh.Image = ((System.Drawing.Image)(resources.GetObject("but_Refresh.Image")));
            this.but_Refresh.Location = new System.Drawing.Point(408, 332);
            this.but_Refresh.Name = "but_Refresh";
            this.but_Refresh.Size = new System.Drawing.Size(90, 25);
            this.but_Refresh.TabIndex = 149;
            this.but_Refresh.Text = "Refresh";
            this.but_Refresh.UseVisualStyleBackColor = false;
            this.but_Refresh.Click += new System.EventHandler(this.but_Refresh_Click);
            // 
            // label1
            // 
            this.label1.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Pink;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(211, 338);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(103, 15);
            this.label1.TabIndex = 143;
            this.label1.Text = "Enter StuddentID:";
            // 
            // label28
            // 
            this.label28.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.label28.AutoSize = true;
            this.label28.BackColor = System.Drawing.Color.Pink;
            this.label28.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label28.Location = new System.Drawing.Point(17, 338);
            this.label28.Name = "label28";
            this.label28.Size = new System.Drawing.Size(75, 15);
            this.label28.TabIndex = 143;
            this.label28.Text = "Enter Phone:";
            // 
            // label7
            // 
            this.label7.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Times New Roman", 21.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(354, 9);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(224, 32);
            this.label7.TabIndex = 1;
            this.label7.Text = "Manage Account";
            // 
            // lblYouChoose
            // 
            this.lblYouChoose.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.lblYouChoose.AutoSize = true;
            this.lblYouChoose.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblYouChoose.Location = new System.Drawing.Point(21, 436);
            this.lblYouChoose.Name = "lblYouChoose";
            this.lblYouChoose.Size = new System.Drawing.Size(0, 13);
            this.lblYouChoose.TabIndex = 3;
            // 
            // FormManageAccount
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(999, 458);
            this.Controls.Add(this.lblYouChoose);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.groupBox1);
            this.Name = "FormManageAccount";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Manage Account";
            this.Load += new System.EventHandler(this.FormManageAccount_Load);
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
        private System.Windows.Forms.Button but_Refresh;
        private System.Windows.Forms.TextBox txt_StudentID;
        private System.Windows.Forms.Label label1;

    }
}