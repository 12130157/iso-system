namespace SMS
{
    partial class FormSend
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
            this.lbTitle = new System.Windows.Forms.Label();
            this.tabSent = new System.Windows.Forms.TabControl();
            this.tabSyntaxSent = new System.Windows.Forms.TabPage();
            this.btnReplySyntaxMessSent = new System.Windows.Forms.Button();
            this.btnDeleteSyntaxMessSent = new System.Windows.Forms.Button();
            this.btnReloadSyntaxMessSent = new System.Windows.Forms.Button();
            this.cboFilterSyntaxMessSent = new System.Windows.Forms.ComboBox();
            this.lbFilterSyntaxMessSent = new System.Windows.Forms.Label();
            this.tblSyntaxMessSent = new System.Windows.Forms.DataGridView();
            this.clmIdSyntaxMessSent = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmNbPhoneSyntaxMessSent = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmContentMessSent = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmDateTimeSyntaxMessSent = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tabNormalSent = new System.Windows.Forms.TabPage();
            this.tblNormalMessSent = new System.Windows.Forms.DataGridView();
            this.clmIdNormalMessSent = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmNbPhoneNormalMessSent = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmContentNormalMessSent = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmDateTimeNormalMessSent = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btnReplyNormalMessSent = new System.Windows.Forms.Button();
            this.btnDeleteNormalMessSent = new System.Windows.Forms.Button();
            this.btnReloadNormalMessSent = new System.Windows.Forms.Button();
            this.cboNormalMessSent = new System.Windows.Forms.ComboBox();
            this.lbFilterNormalMessSent = new System.Windows.Forms.Label();
            this.tabErrorMessSent = new System.Windows.Forms.TabPage();
            this.tabSentDeleted = new System.Windows.Forms.TabPage();
            this.tabSent.SuspendLayout();
            this.tabSyntaxSent.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tblSyntaxMessSent)).BeginInit();
            this.tabNormalSent.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tblNormalMessSent)).BeginInit();
            this.SuspendLayout();
            // 
            // lbTitle
            // 
            this.lbTitle.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lbTitle.AutoSize = true;
            this.lbTitle.Font = new System.Drawing.Font("Times New Roman", 20.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbTitle.ForeColor = System.Drawing.Color.Maroon;
            this.lbTitle.Location = new System.Drawing.Point(250, 9);
            this.lbTitle.Name = "lbTitle";
            this.lbTitle.Size = new System.Drawing.Size(369, 31);
            this.lbTitle.TabIndex = 1;
            this.lbTitle.Text = "Syntax - Normal Message Sent";
            // 
            // tabSent
            // 
            this.tabSent.Controls.Add(this.tabSyntaxSent);
            this.tabSent.Controls.Add(this.tabNormalSent);
            this.tabSent.Controls.Add(this.tabErrorMessSent);
            this.tabSent.Controls.Add(this.tabSentDeleted);
            this.tabSent.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabSent.Location = new System.Drawing.Point(1, 56);
            this.tabSent.Name = "tabSent";
            this.tabSent.SelectedIndex = 0;
            this.tabSent.Size = new System.Drawing.Size(880, 336);
            this.tabSent.TabIndex = 2;
            // 
            // tabSyntaxSent
            // 
            this.tabSyntaxSent.Controls.Add(this.btnReplySyntaxMessSent);
            this.tabSyntaxSent.Controls.Add(this.btnDeleteSyntaxMessSent);
            this.tabSyntaxSent.Controls.Add(this.btnReloadSyntaxMessSent);
            this.tabSyntaxSent.Controls.Add(this.cboFilterSyntaxMessSent);
            this.tabSyntaxSent.Controls.Add(this.lbFilterSyntaxMessSent);
            this.tabSyntaxSent.Controls.Add(this.tblSyntaxMessSent);
            this.tabSyntaxSent.Location = new System.Drawing.Point(4, 25);
            this.tabSyntaxSent.Name = "tabSyntaxSent";
            this.tabSyntaxSent.Padding = new System.Windows.Forms.Padding(3);
            this.tabSyntaxSent.Size = new System.Drawing.Size(872, 307);
            this.tabSyntaxSent.TabIndex = 0;
            this.tabSyntaxSent.Text = "Syntax Message Sent";
            this.tabSyntaxSent.UseVisualStyleBackColor = true;
            // 
            // btnReplySyntaxMessSent
            // 
            this.btnReplySyntaxMessSent.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnReplySyntaxMessSent.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnReplySyntaxMessSent.Location = new System.Drawing.Point(350, 273);
            this.btnReplySyntaxMessSent.Name = "btnReplySyntaxMessSent";
            this.btnReplySyntaxMessSent.Size = new System.Drawing.Size(94, 23);
            this.btnReplySyntaxMessSent.TabIndex = 10;
            this.btnReplySyntaxMessSent.Text = "Reply";
            this.btnReplySyntaxMessSent.UseVisualStyleBackColor = true;
            // 
            // btnDeleteSyntaxMessSent
            // 
            this.btnDeleteSyntaxMessSent.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnDeleteSyntaxMessSent.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDeleteSyntaxMessSent.Location = new System.Drawing.Point(460, 273);
            this.btnDeleteSyntaxMessSent.Name = "btnDeleteSyntaxMessSent";
            this.btnDeleteSyntaxMessSent.Size = new System.Drawing.Size(94, 23);
            this.btnDeleteSyntaxMessSent.TabIndex = 9;
            this.btnDeleteSyntaxMessSent.Text = "Delete";
            this.btnDeleteSyntaxMessSent.UseVisualStyleBackColor = true;
            // 
            // btnReloadSyntaxMessSent
            // 
            this.btnReloadSyntaxMessSent.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnReloadSyntaxMessSent.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnReloadSyntaxMessSent.Location = new System.Drawing.Point(240, 273);
            this.btnReloadSyntaxMessSent.Name = "btnReloadSyntaxMessSent";
            this.btnReloadSyntaxMessSent.Size = new System.Drawing.Size(94, 23);
            this.btnReloadSyntaxMessSent.TabIndex = 8;
            this.btnReloadSyntaxMessSent.Text = "Reload";
            this.btnReloadSyntaxMessSent.UseVisualStyleBackColor = true;
            // 
            // cboFilterSyntaxMessSent
            // 
            this.cboFilterSyntaxMessSent.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.cboFilterSyntaxMessSent.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cboFilterSyntaxMessSent.FormattingEnabled = true;
            this.cboFilterSyntaxMessSent.Items.AddRange(new object[] {
            "All",
            "Phone Number",
            "Status",
            "Date-Time"});
            this.cboFilterSyntaxMessSent.Location = new System.Drawing.Point(68, 271);
            this.cboFilterSyntaxMessSent.Name = "cboFilterSyntaxMessSent";
            this.cboFilterSyntaxMessSent.Size = new System.Drawing.Size(138, 24);
            this.cboFilterSyntaxMessSent.TabIndex = 7;
            this.cboFilterSyntaxMessSent.Text = "All";
            // 
            // lbFilterSyntaxMessSent
            // 
            this.lbFilterSyntaxMessSent.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lbFilterSyntaxMessSent.AutoSize = true;
            this.lbFilterSyntaxMessSent.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbFilterSyntaxMessSent.ForeColor = System.Drawing.Color.Navy;
            this.lbFilterSyntaxMessSent.Location = new System.Drawing.Point(8, 274);
            this.lbFilterSyntaxMessSent.Name = "lbFilterSyntaxMessSent";
            this.lbFilterSyntaxMessSent.Size = new System.Drawing.Size(48, 18);
            this.lbFilterSyntaxMessSent.TabIndex = 6;
            this.lbFilterSyntaxMessSent.Text = "Filter :";
            // 
            // tblSyntaxMessSent
            // 
            this.tblSyntaxMessSent.AllowDrop = true;
            this.tblSyntaxMessSent.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.tblSyntaxMessSent.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.tblSyntaxMessSent.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.tblSyntaxMessSent.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.tblSyntaxMessSent.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.clmIdSyntaxMessSent,
            this.clmNbPhoneSyntaxMessSent,
            this.clmContentMessSent,
            this.clmDateTimeSyntaxMessSent});
            this.tblSyntaxMessSent.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.tblSyntaxMessSent.Location = new System.Drawing.Point(0, 0);
            this.tblSyntaxMessSent.Name = "tblSyntaxMessSent";
            this.tblSyntaxMessSent.Size = new System.Drawing.Size(872, 259);
            this.tblSyntaxMessSent.TabIndex = 0;
            // 
            // clmIdSyntaxMessSent
            // 
            this.clmIdSyntaxMessSent.DataPropertyName = "id";
            this.clmIdSyntaxMessSent.HeaderText = "ID";
            this.clmIdSyntaxMessSent.Name = "clmIdSyntaxMessSent";
            // 
            // clmNbPhoneSyntaxMessSent
            // 
            this.clmNbPhoneSyntaxMessSent.DataPropertyName = "so_dien_thoai";
            this.clmNbPhoneSyntaxMessSent.HeaderText = "Phone Number";
            this.clmNbPhoneSyntaxMessSent.Name = "clmNbPhoneSyntaxMessSent";
            // 
            // clmContentMessSent
            // 
            this.clmContentMessSent.DataPropertyName = "noi_dung_tin_nhan";
            this.clmContentMessSent.HeaderText = "Content";
            this.clmContentMessSent.Name = "clmContentMessSent";
            // 
            // clmDateTimeSyntaxMessSent
            // 
            this.clmDateTimeSyntaxMessSent.DataPropertyName = "ngay_gui";
            this.clmDateTimeSyntaxMessSent.HeaderText = "Date-Time";
            this.clmDateTimeSyntaxMessSent.Name = "clmDateTimeSyntaxMessSent";
            // 
            // tabNormalSent
            // 
            this.tabNormalSent.Controls.Add(this.tblNormalMessSent);
            this.tabNormalSent.Controls.Add(this.btnReplyNormalMessSent);
            this.tabNormalSent.Controls.Add(this.btnDeleteNormalMessSent);
            this.tabNormalSent.Controls.Add(this.btnReloadNormalMessSent);
            this.tabNormalSent.Controls.Add(this.cboNormalMessSent);
            this.tabNormalSent.Controls.Add(this.lbFilterNormalMessSent);
            this.tabNormalSent.Location = new System.Drawing.Point(4, 25);
            this.tabNormalSent.Name = "tabNormalSent";
            this.tabNormalSent.Padding = new System.Windows.Forms.Padding(3);
            this.tabNormalSent.Size = new System.Drawing.Size(872, 307);
            this.tabNormalSent.TabIndex = 1;
            this.tabNormalSent.Text = "Normal Message Sent";
            this.tabNormalSent.UseVisualStyleBackColor = true;
            // 
            // tblNormalMessSent
            // 
            this.tblNormalMessSent.AllowDrop = true;
            this.tblNormalMessSent.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.tblNormalMessSent.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.tblNormalMessSent.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.tblNormalMessSent.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.tblNormalMessSent.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.clmIdNormalMessSent,
            this.clmNbPhoneNormalMessSent,
            this.clmContentNormalMessSent,
            this.clmDateTimeNormalMessSent});
            this.tblNormalMessSent.Location = new System.Drawing.Point(0, 0);
            this.tblNormalMessSent.Name = "tblNormalMessSent";
            this.tblNormalMessSent.Size = new System.Drawing.Size(872, 259);
            this.tblNormalMessSent.TabIndex = 16;
            // 
            // clmIdNormalMessSent
            // 
            this.clmIdNormalMessSent.DataPropertyName = "id";
            this.clmIdNormalMessSent.HeaderText = "ID";
            this.clmIdNormalMessSent.Name = "clmIdNormalMessSent";
            // 
            // clmNbPhoneNormalMessSent
            // 
            this.clmNbPhoneNormalMessSent.DataPropertyName = "so_dien_thoai";
            this.clmNbPhoneNormalMessSent.HeaderText = "Phone Number";
            this.clmNbPhoneNormalMessSent.Name = "clmNbPhoneNormalMessSent";
            // 
            // clmContentNormalMessSent
            // 
            this.clmContentNormalMessSent.DataPropertyName = "noi_dung_tin_nhan";
            this.clmContentNormalMessSent.HeaderText = "Content";
            this.clmContentNormalMessSent.Name = "clmContentNormalMessSent";
            // 
            // clmDateTimeNormalMessSent
            // 
            this.clmDateTimeNormalMessSent.DataPropertyName = "ngay_gui";
            this.clmDateTimeNormalMessSent.HeaderText = "Date-Time";
            this.clmDateTimeNormalMessSent.Name = "clmDateTimeNormalMessSent";
            // 
            // btnReplyNormalMessSent
            // 
            this.btnReplyNormalMessSent.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnReplyNormalMessSent.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnReplyNormalMessSent.Location = new System.Drawing.Point(350, 273);
            this.btnReplyNormalMessSent.Name = "btnReplyNormalMessSent";
            this.btnReplyNormalMessSent.Size = new System.Drawing.Size(94, 23);
            this.btnReplyNormalMessSent.TabIndex = 15;
            this.btnReplyNormalMessSent.Text = "Reply";
            this.btnReplyNormalMessSent.UseVisualStyleBackColor = true;
            // 
            // btnDeleteNormalMessSent
            // 
            this.btnDeleteNormalMessSent.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnDeleteNormalMessSent.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDeleteNormalMessSent.Location = new System.Drawing.Point(460, 273);
            this.btnDeleteNormalMessSent.Name = "btnDeleteNormalMessSent";
            this.btnDeleteNormalMessSent.Size = new System.Drawing.Size(94, 23);
            this.btnDeleteNormalMessSent.TabIndex = 14;
            this.btnDeleteNormalMessSent.Text = "Delete";
            this.btnDeleteNormalMessSent.UseVisualStyleBackColor = true;
            // 
            // btnReloadNormalMessSent
            // 
            this.btnReloadNormalMessSent.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnReloadNormalMessSent.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnReloadNormalMessSent.Location = new System.Drawing.Point(240, 273);
            this.btnReloadNormalMessSent.Name = "btnReloadNormalMessSent";
            this.btnReloadNormalMessSent.Size = new System.Drawing.Size(94, 23);
            this.btnReloadNormalMessSent.TabIndex = 13;
            this.btnReloadNormalMessSent.Text = "Reload";
            this.btnReloadNormalMessSent.UseVisualStyleBackColor = true;
            // 
            // cboNormalMessSent
            // 
            this.cboNormalMessSent.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.cboNormalMessSent.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cboNormalMessSent.FormattingEnabled = true;
            this.cboNormalMessSent.Items.AddRange(new object[] {
            "All",
            "Phone Number",
            "Status",
            "Date-Time"});
            this.cboNormalMessSent.Location = new System.Drawing.Point(68, 271);
            this.cboNormalMessSent.Name = "cboNormalMessSent";
            this.cboNormalMessSent.Size = new System.Drawing.Size(138, 24);
            this.cboNormalMessSent.TabIndex = 12;
            this.cboNormalMessSent.Text = "All";
            // 
            // lbFilterNormalMessSent
            // 
            this.lbFilterNormalMessSent.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lbFilterNormalMessSent.AutoSize = true;
            this.lbFilterNormalMessSent.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbFilterNormalMessSent.ForeColor = System.Drawing.Color.Navy;
            this.lbFilterNormalMessSent.Location = new System.Drawing.Point(8, 274);
            this.lbFilterNormalMessSent.Name = "lbFilterNormalMessSent";
            this.lbFilterNormalMessSent.Size = new System.Drawing.Size(48, 18);
            this.lbFilterNormalMessSent.TabIndex = 11;
            this.lbFilterNormalMessSent.Text = "Filter :";
            // 
            // tabErrorMessSent
            // 
            this.tabErrorMessSent.Location = new System.Drawing.Point(4, 25);
            this.tabErrorMessSent.Name = "tabErrorMessSent";
            this.tabErrorMessSent.Size = new System.Drawing.Size(872, 307);
            this.tabErrorMessSent.TabIndex = 3;
            this.tabErrorMessSent.Text = "Error Message Semt";
            this.tabErrorMessSent.UseVisualStyleBackColor = true;
            // 
            // tabSentDeleted
            // 
            this.tabSentDeleted.Location = new System.Drawing.Point(4, 25);
            this.tabSentDeleted.Name = "tabSentDeleted";
            this.tabSentDeleted.Size = new System.Drawing.Size(872, 307);
            this.tabSentDeleted.TabIndex = 2;
            this.tabSentDeleted.Text = "Sent Deleted";
            this.tabSentDeleted.UseVisualStyleBackColor = true;
            // 
            // FormSend
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(877, 389);
            this.Controls.Add(this.tabSent);
            this.Controls.Add(this.lbTitle);
            this.Name = "FormSend";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FormSend";
            this.tabSent.ResumeLayout(false);
            this.tabSyntaxSent.ResumeLayout(false);
            this.tabSyntaxSent.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tblSyntaxMessSent)).EndInit();
            this.tabNormalSent.ResumeLayout(false);
            this.tabNormalSent.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tblNormalMessSent)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbTitle;
        private System.Windows.Forms.TabControl tabSent;
        private System.Windows.Forms.TabPage tabSyntaxSent;
        private System.Windows.Forms.TabPage tabNormalSent;
        private System.Windows.Forms.DataGridView tblSyntaxMessSent;
        private System.Windows.Forms.TabPage tabSentDeleted;
        private System.Windows.Forms.Button btnReplySyntaxMessSent;
        private System.Windows.Forms.Button btnDeleteSyntaxMessSent;
        private System.Windows.Forms.Button btnReloadSyntaxMessSent;
        private System.Windows.Forms.ComboBox cboFilterSyntaxMessSent;
        private System.Windows.Forms.Label lbFilterSyntaxMessSent;
        private System.Windows.Forms.Button btnReplyNormalMessSent;
        private System.Windows.Forms.Button btnDeleteNormalMessSent;
        private System.Windows.Forms.Button btnReloadNormalMessSent;
        private System.Windows.Forms.ComboBox cboNormalMessSent;
        private System.Windows.Forms.Label lbFilterNormalMessSent;
        private System.Windows.Forms.TabPage tabErrorMessSent;
        private System.Windows.Forms.DataGridView tblNormalMessSent;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmIdSyntaxMessSent;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmNbPhoneSyntaxMessSent;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmContentMessSent;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmDateTimeSyntaxMessSent;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmIdNormalMessSent;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmNbPhoneNormalMessSent;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmContentNormalMessSent;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmDateTimeNormalMessSent;
    }
}