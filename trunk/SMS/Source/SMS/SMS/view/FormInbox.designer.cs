namespace SMS
{
    partial class FormInbox
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
            this.tabControls = new System.Windows.Forms.TabControl();
            this.tabSyntaxMess = new System.Windows.Forms.TabPage();
            this.btnComposeInbox = new System.Windows.Forms.Button();
            this.btnDeleteInbox = new System.Windows.Forms.Button();
            this.btnReloadInbox = new System.Windows.Forms.Button();
            this.cboFilterInbox = new System.Windows.Forms.ComboBox();
            this.lbFilterInbox = new System.Windows.Forms.Label();
            this.tblSyntaxMess = new System.Windows.Forms.DataGridView();
            this.tabNormalMessage = new System.Windows.Forms.TabPage();
            this.btnComposeSpam = new System.Windows.Forms.Button();
            this.btnDeleteSpam = new System.Windows.Forms.Button();
            this.btnReloadSpam = new System.Windows.Forms.Button();
            this.cboFilterSpam = new System.Windows.Forms.ComboBox();
            this.lbFilterSpam = new System.Windows.Forms.Label();
            this.tblSpam = new System.Windows.Forms.DataGridView();
            this.clmIdSpam = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmPhoneNumberSpam = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmContentSpam = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmStatusSpam = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmDataTimeSpam = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmIdSyntaxMess = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmNumberPhoneSyntax = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmContentSyntaxMess = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmSyntaxMess = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmStatusSyntaxMess = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmDateTimeSyntaxMess = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tabControls.SuspendLayout();
            this.tabSyntaxMess.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tblSyntaxMess)).BeginInit();
            this.tabNormalMessage.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tblSpam)).BeginInit();
            this.SuspendLayout();
            // 
            // lbTitle
            // 
            this.lbTitle.AutoSize = true;
            this.lbTitle.Font = new System.Drawing.Font("Times New Roman", 18F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbTitle.ForeColor = System.Drawing.Color.Maroon;
            this.lbTitle.Location = new System.Drawing.Point(302, 9);
            this.lbTitle.Name = "lbTitle";
            this.lbTitle.Size = new System.Drawing.Size(148, 26);
            this.lbTitle.TabIndex = 2;
            this.lbTitle.Text = "Inbox - Spam";
            // 
            // tabControls
            // 
            this.tabControls.AllowDrop = true;
            this.tabControls.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.tabControls.Controls.Add(this.tabSyntaxMess);
            this.tabControls.Controls.Add(this.tabNormalMessage);
            this.tabControls.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabControls.Location = new System.Drawing.Point(0, 38);
            this.tabControls.Name = "tabControls";
            this.tabControls.SelectedIndex = 0;
            this.tabControls.Size = new System.Drawing.Size(880, 325);
            this.tabControls.TabIndex = 3;
            // 
            // tabSyntaxMess
            // 
            this.tabSyntaxMess.Controls.Add(this.btnComposeInbox);
            this.tabSyntaxMess.Controls.Add(this.btnDeleteInbox);
            this.tabSyntaxMess.Controls.Add(this.btnReloadInbox);
            this.tabSyntaxMess.Controls.Add(this.cboFilterInbox);
            this.tabSyntaxMess.Controls.Add(this.lbFilterInbox);
            this.tabSyntaxMess.Controls.Add(this.tblSyntaxMess);
            this.tabSyntaxMess.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabSyntaxMess.Location = new System.Drawing.Point(4, 25);
            this.tabSyntaxMess.Name = "tabSyntaxMess";
            this.tabSyntaxMess.Padding = new System.Windows.Forms.Padding(3);
            this.tabSyntaxMess.Size = new System.Drawing.Size(872, 296);
            this.tabSyntaxMess.TabIndex = 0;
            this.tabSyntaxMess.Text = "Syntax Message";
            this.tabSyntaxMess.UseVisualStyleBackColor = true;
            // 
            // btnComposeInbox
            // 
            this.btnComposeInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnComposeInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnComposeInbox.Location = new System.Drawing.Point(368, 263);
            this.btnComposeInbox.Name = "btnComposeInbox";
            this.btnComposeInbox.Size = new System.Drawing.Size(94, 23);
            this.btnComposeInbox.TabIndex = 10;
            this.btnComposeInbox.Text = "Compose";
            this.btnComposeInbox.UseVisualStyleBackColor = true;
            // 
            // btnDeleteInbox
            // 
            this.btnDeleteInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnDeleteInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDeleteInbox.Location = new System.Drawing.Point(483, 263);
            this.btnDeleteInbox.Name = "btnDeleteInbox";
            this.btnDeleteInbox.Size = new System.Drawing.Size(94, 23);
            this.btnDeleteInbox.TabIndex = 9;
            this.btnDeleteInbox.Text = "Delete";
            this.btnDeleteInbox.UseVisualStyleBackColor = true;
            // 
            // btnReloadInbox
            // 
            this.btnReloadInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnReloadInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnReloadInbox.Location = new System.Drawing.Point(254, 263);
            this.btnReloadInbox.Name = "btnReloadInbox";
            this.btnReloadInbox.Size = new System.Drawing.Size(94, 23);
            this.btnReloadInbox.TabIndex = 8;
            this.btnReloadInbox.Text = "Reload";
            this.btnReloadInbox.UseVisualStyleBackColor = true;
            // 
            // cboFilterInbox
            // 
            this.cboFilterInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.cboFilterInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cboFilterInbox.FormattingEnabled = true;
            this.cboFilterInbox.Items.AddRange(new object[] {
            "All",
            "Phone Number",
            "Status",
            "Date-Time"});
            this.cboFilterInbox.Location = new System.Drawing.Point(71, 263);
            this.cboFilterInbox.Name = "cboFilterInbox";
            this.cboFilterInbox.Size = new System.Drawing.Size(138, 24);
            this.cboFilterInbox.TabIndex = 7;
            this.cboFilterInbox.Text = "All";
            // 
            // lbFilterInbox
            // 
            this.lbFilterInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lbFilterInbox.AutoSize = true;
            this.lbFilterInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbFilterInbox.ForeColor = System.Drawing.Color.Navy;
            this.lbFilterInbox.Location = new System.Drawing.Point(8, 264);
            this.lbFilterInbox.Name = "lbFilterInbox";
            this.lbFilterInbox.Size = new System.Drawing.Size(48, 18);
            this.lbFilterInbox.TabIndex = 6;
            this.lbFilterInbox.Text = "Filter :";
            // 
            // tblSyntaxMess
            // 
            this.tblSyntaxMess.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.tblSyntaxMess.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.tblSyntaxMess.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.tblSyntaxMess.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.clmIdSyntaxMess,
            this.clmNumberPhoneSyntax,
            this.clmContentSyntaxMess,
            this.clmSyntaxMess,
            this.clmStatusSyntaxMess,
            this.clmDateTimeSyntaxMess});
            this.tblSyntaxMess.Location = new System.Drawing.Point(0, 0);
            this.tblSyntaxMess.Name = "tblSyntaxMess";
            this.tblSyntaxMess.RowHeadersVisible = false;
            this.tblSyntaxMess.Size = new System.Drawing.Size(872, 248);
            this.tblSyntaxMess.TabIndex = 0;
            // 
            // tabNormalMessage
            // 
            this.tabNormalMessage.AllowDrop = true;
            this.tabNormalMessage.CausesValidation = false;
            this.tabNormalMessage.Controls.Add(this.btnComposeSpam);
            this.tabNormalMessage.Controls.Add(this.btnDeleteSpam);
            this.tabNormalMessage.Controls.Add(this.btnReloadSpam);
            this.tabNormalMessage.Controls.Add(this.cboFilterSpam);
            this.tabNormalMessage.Controls.Add(this.lbFilterSpam);
            this.tabNormalMessage.Controls.Add(this.tblSpam);
            this.tabNormalMessage.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabNormalMessage.Location = new System.Drawing.Point(4, 25);
            this.tabNormalMessage.Name = "tabNormalMessage";
            this.tabNormalMessage.Padding = new System.Windows.Forms.Padding(3);
            this.tabNormalMessage.Size = new System.Drawing.Size(872, 296);
            this.tabNormalMessage.TabIndex = 1;
            this.tabNormalMessage.Text = "Normal Message";
            this.tabNormalMessage.UseVisualStyleBackColor = true;
            // 
            // btnComposeSpam
            // 
            this.btnComposeSpam.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnComposeSpam.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnComposeSpam.Location = new System.Drawing.Point(352, 263);
            this.btnComposeSpam.Name = "btnComposeSpam";
            this.btnComposeSpam.Size = new System.Drawing.Size(94, 23);
            this.btnComposeSpam.TabIndex = 5;
            this.btnComposeSpam.Text = "Compose";
            this.btnComposeSpam.UseVisualStyleBackColor = true;
            // 
            // btnDeleteSpam
            // 
            this.btnDeleteSpam.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnDeleteSpam.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDeleteSpam.Location = new System.Drawing.Point(464, 263);
            this.btnDeleteSpam.Name = "btnDeleteSpam";
            this.btnDeleteSpam.Size = new System.Drawing.Size(94, 23);
            this.btnDeleteSpam.TabIndex = 4;
            this.btnDeleteSpam.Text = "Delete";
            this.btnDeleteSpam.UseVisualStyleBackColor = true;
            // 
            // btnReloadSpam
            // 
            this.btnReloadSpam.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnReloadSpam.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnReloadSpam.Location = new System.Drawing.Point(242, 263);
            this.btnReloadSpam.Name = "btnReloadSpam";
            this.btnReloadSpam.Size = new System.Drawing.Size(94, 23);
            this.btnReloadSpam.TabIndex = 3;
            this.btnReloadSpam.Text = "Reload";
            this.btnReloadSpam.UseVisualStyleBackColor = true;
            // 
            // cboFilterSpam
            // 
            this.cboFilterSpam.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.cboFilterSpam.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cboFilterSpam.FormattingEnabled = true;
            this.cboFilterSpam.Items.AddRange(new object[] {
            "All",
            "Phone Number",
            "Status",
            "Date-Time"});
            this.cboFilterSpam.Location = new System.Drawing.Point(73, 261);
            this.cboFilterSpam.Name = "cboFilterSpam";
            this.cboFilterSpam.Size = new System.Drawing.Size(138, 24);
            this.cboFilterSpam.TabIndex = 2;
            this.cboFilterSpam.Text = "All";
            // 
            // lbFilterSpam
            // 
            this.lbFilterSpam.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lbFilterSpam.AutoSize = true;
            this.lbFilterSpam.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbFilterSpam.ForeColor = System.Drawing.Color.Navy;
            this.lbFilterSpam.Location = new System.Drawing.Point(8, 264);
            this.lbFilterSpam.Name = "lbFilterSpam";
            this.lbFilterSpam.Size = new System.Drawing.Size(48, 18);
            this.lbFilterSpam.TabIndex = 1;
            this.lbFilterSpam.Text = "Filter :";
            // 
            // tblSpam
            // 
            this.tblSpam.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.tblSpam.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.tblSpam.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.clmIdSpam,
            this.clmPhoneNumberSpam,
            this.clmContentSpam,
            this.clmStatusSpam,
            this.clmDataTimeSpam});
            this.tblSpam.Location = new System.Drawing.Point(0, 0);
            this.tblSpam.Name = "tblSpam";
            this.tblSpam.RowHeadersVisible = false;
            this.tblSpam.Size = new System.Drawing.Size(872, 248);
            this.tblSpam.TabIndex = 0;
            // 
            // clmIdSpam
            // 
            this.clmIdSpam.HeaderText = "ID";
            this.clmIdSpam.Name = "clmIdSpam";
            // 
            // clmPhoneNumberSpam
            // 
            this.clmPhoneNumberSpam.HeaderText = "Phone Number";
            this.clmPhoneNumberSpam.Name = "clmPhoneNumberSpam";
            // 
            // clmContentSpam
            // 
            this.clmContentSpam.HeaderText = "Content";
            this.clmContentSpam.Name = "clmContentSpam";
            // 
            // clmStatusSpam
            // 
            this.clmStatusSpam.HeaderText = "Status";
            this.clmStatusSpam.Name = "clmStatusSpam";
            // 
            // clmDataTimeSpam
            // 
            this.clmDataTimeSpam.HeaderText = "Date-Time";
            this.clmDataTimeSpam.Name = "clmDataTimeSpam";
            // 
            // clmIdSyntaxMess
            // 
            this.clmIdSyntaxMess.DataPropertyName = "id";
            this.clmIdSyntaxMess.HeaderText = "ID";
            this.clmIdSyntaxMess.Name = "clmIdSyntaxMess";
            // 
            // clmNumberPhoneSyntax
            // 
            this.clmNumberPhoneSyntax.DataPropertyName = "so_dien_thoai";
            this.clmNumberPhoneSyntax.HeaderText = " Phone Number";
            this.clmNumberPhoneSyntax.Name = "clmNumberPhoneSyntax";
            // 
            // clmContentSyntaxMess
            // 
            this.clmContentSyntaxMess.DataPropertyName = "noi_dung_tin_nhan";
            this.clmContentSyntaxMess.HeaderText = "Content";
            this.clmContentSyntaxMess.Name = "clmContentSyntaxMess";
            // 
            // clmSyntaxMess
            // 
            this.clmSyntaxMess.DataPropertyName = "cu_phap";
            this.clmSyntaxMess.HeaderText = "Syntax";
            this.clmSyntaxMess.Name = "clmSyntaxMess";
            // 
            // clmStatusSyntaxMess
            // 
            this.clmStatusSyntaxMess.DataPropertyName = "tinh_trang";
            this.clmStatusSyntaxMess.HeaderText = "Status";
            this.clmStatusSyntaxMess.Name = "clmStatusSyntaxMess";
            // 
            // clmDateTimeSyntaxMess
            // 
            this.clmDateTimeSyntaxMess.DataPropertyName = "ngay_nhan";
            this.clmDateTimeSyntaxMess.HeaderText = "Date-Time";
            this.clmDateTimeSyntaxMess.Name = "clmDateTimeSyntaxMess";
            // 
            // FormInbox
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(877, 361);
            this.Controls.Add(this.tabControls);
            this.Controls.Add(this.lbTitle);
            this.Name = "FormInbox";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Inbook";
            this.tabControls.ResumeLayout(false);
            this.tabSyntaxMess.ResumeLayout(false);
            this.tabSyntaxMess.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tblSyntaxMess)).EndInit();
            this.tabNormalMessage.ResumeLayout(false);
            this.tabNormalMessage.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tblSpam)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbTitle;
        private System.Windows.Forms.TabControl tabControls;
        private System.Windows.Forms.TabPage tabSyntaxMess;
        private System.Windows.Forms.TabPage tabNormalMessage;
        private System.Windows.Forms.DataGridView tblSyntaxMess;
        private System.Windows.Forms.DataGridView tblSpam;
        private System.Windows.Forms.Label lbFilterSpam;
        private System.Windows.Forms.ComboBox cboFilterSpam;
        private System.Windows.Forms.Button btnComposeSpam;
        private System.Windows.Forms.Button btnDeleteSpam;
        private System.Windows.Forms.Button btnReloadSpam;
        private System.Windows.Forms.Button btnComposeInbox;
        private System.Windows.Forms.Button btnDeleteInbox;
        private System.Windows.Forms.Button btnReloadInbox;
        private System.Windows.Forms.ComboBox cboFilterInbox;
        private System.Windows.Forms.Label lbFilterInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmIdSpam;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmPhoneNumberSpam;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmContentSpam;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmStatusSpam;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmDataTimeSpam;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmIdSyntaxMess;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmNumberPhoneSyntax;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmContentSyntaxMess;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmSyntaxMess;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmStatusSyntaxMess;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmDateTimeSyntaxMess;
    }
}