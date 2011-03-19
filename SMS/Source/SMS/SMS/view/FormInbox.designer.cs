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
            this.btnComposeSyntaxMessInbox = new System.Windows.Forms.Button();
            this.btnDeleteSyntaxMessInbox = new System.Windows.Forms.Button();
            this.btnReloadSyntaxMessInbox = new System.Windows.Forms.Button();
            this.cboFilterSyntaxMessInbox = new System.Windows.Forms.ComboBox();
            this.lbFilterSyntaxMessInbox = new System.Windows.Forms.Label();
            this.tblSyntaxMess = new System.Windows.Forms.DataGridView();
            this.clmCheckSyntaxMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmIdSyntaxMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmNbPhoneSyntaxInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmContentSyntaxMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmSyntaxMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmStatusSyntaxMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmDateTimeSyntaxMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tabNormalMessage = new System.Windows.Forms.TabPage();
            this.btnComposeNormalMessInbox = new System.Windows.Forms.Button();
            this.btnDeleteNormalMessInbox = new System.Windows.Forms.Button();
            this.btnReloadNormalMessInbox = new System.Windows.Forms.Button();
            this.cboFilterNormalMessinbox = new System.Windows.Forms.ComboBox();
            this.lbFilterNormalMessInbox = new System.Windows.Forms.Label();
            this.tblNormalMess = new System.Windows.Forms.DataGridView();
            this.clmIdNormalMessInBox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmNbPhoneNormalMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmContentNormalMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmStatusNormalMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmDataTimeNormalMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tabMessDeleted = new System.Windows.Forms.TabPage();
            this.tabControls.SuspendLayout();
            this.tabSyntaxMess.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tblSyntaxMess)).BeginInit();
            this.tabNormalMessage.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tblNormalMess)).BeginInit();
            this.SuspendLayout();
            // 
            // lbTitle
            // 
            this.lbTitle.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.lbTitle.AutoSize = true;
            this.lbTitle.Font = new System.Drawing.Font("Times New Roman", 20.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbTitle.ForeColor = System.Drawing.Color.Maroon;
            this.lbTitle.Location = new System.Drawing.Point(251, 9);
            this.lbTitle.Name = "lbTitle";
            this.lbTitle.Size = new System.Drawing.Size(385, 31);
            this.lbTitle.TabIndex = 2;
            this.lbTitle.Text = "Syntax - Normal Message Inbox";
            // 
            // tabControls
            // 
            this.tabControls.AllowDrop = true;
            this.tabControls.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.tabControls.Controls.Add(this.tabSyntaxMess);
            this.tabControls.Controls.Add(this.tabNormalMessage);
            this.tabControls.Controls.Add(this.tabMessDeleted);
            this.tabControls.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabControls.Location = new System.Drawing.Point(-1, 52);
            this.tabControls.Name = "tabControls";
            this.tabControls.SelectedIndex = 0;
            this.tabControls.Size = new System.Drawing.Size(880, 336);
            this.tabControls.TabIndex = 3;
            // 
            // tabSyntaxMess
            // 
            this.tabSyntaxMess.Controls.Add(this.btnComposeSyntaxMessInbox);
            this.tabSyntaxMess.Controls.Add(this.btnDeleteSyntaxMessInbox);
            this.tabSyntaxMess.Controls.Add(this.btnReloadSyntaxMessInbox);
            this.tabSyntaxMess.Controls.Add(this.cboFilterSyntaxMessInbox);
            this.tabSyntaxMess.Controls.Add(this.lbFilterSyntaxMessInbox);
            this.tabSyntaxMess.Controls.Add(this.tblSyntaxMess);
            this.tabSyntaxMess.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabSyntaxMess.Location = new System.Drawing.Point(4, 25);
            this.tabSyntaxMess.Name = "tabSyntaxMess";
            this.tabSyntaxMess.Padding = new System.Windows.Forms.Padding(3);
            this.tabSyntaxMess.Size = new System.Drawing.Size(872, 307);
            this.tabSyntaxMess.TabIndex = 0;
            this.tabSyntaxMess.Text = "Syntax Message";
            this.tabSyntaxMess.UseVisualStyleBackColor = true;
            // 
            // btnComposeSyntaxMessInbox
            // 
            this.btnComposeSyntaxMessInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnComposeSyntaxMessInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnComposeSyntaxMessInbox.Location = new System.Drawing.Point(368, 274);
            this.btnComposeSyntaxMessInbox.Name = "btnComposeSyntaxMessInbox";
            this.btnComposeSyntaxMessInbox.Size = new System.Drawing.Size(94, 23);
            this.btnComposeSyntaxMessInbox.TabIndex = 10;
            this.btnComposeSyntaxMessInbox.Text = "Compose";
            this.btnComposeSyntaxMessInbox.UseVisualStyleBackColor = true;
            // 
            // btnDeleteSyntaxMessInbox
            // 
            this.btnDeleteSyntaxMessInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnDeleteSyntaxMessInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDeleteSyntaxMessInbox.Location = new System.Drawing.Point(480, 274);
            this.btnDeleteSyntaxMessInbox.Name = "btnDeleteSyntaxMessInbox";
            this.btnDeleteSyntaxMessInbox.Size = new System.Drawing.Size(94, 23);
            this.btnDeleteSyntaxMessInbox.TabIndex = 9;
            this.btnDeleteSyntaxMessInbox.Text = "Delete";
            this.btnDeleteSyntaxMessInbox.UseVisualStyleBackColor = true;
            // 
            // btnReloadSyntaxMessInbox
            // 
            this.btnReloadSyntaxMessInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnReloadSyntaxMessInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnReloadSyntaxMessInbox.Location = new System.Drawing.Point(254, 274);
            this.btnReloadSyntaxMessInbox.Name = "btnReloadSyntaxMessInbox";
            this.btnReloadSyntaxMessInbox.Size = new System.Drawing.Size(94, 23);
            this.btnReloadSyntaxMessInbox.TabIndex = 8;
            this.btnReloadSyntaxMessInbox.Text = "Reload";
            this.btnReloadSyntaxMessInbox.UseVisualStyleBackColor = true;
            // 
            // cboFilterSyntaxMessInbox
            // 
            this.cboFilterSyntaxMessInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.cboFilterSyntaxMessInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cboFilterSyntaxMessInbox.FormattingEnabled = true;
            this.cboFilterSyntaxMessInbox.Items.AddRange(new object[] {
            "All",
            "Phone Number",
            "Status",
            "Date-Time"});
            this.cboFilterSyntaxMessInbox.Location = new System.Drawing.Point(71, 274);
            this.cboFilterSyntaxMessInbox.Name = "cboFilterSyntaxMessInbox";
            this.cboFilterSyntaxMessInbox.Size = new System.Drawing.Size(138, 24);
            this.cboFilterSyntaxMessInbox.TabIndex = 7;
            this.cboFilterSyntaxMessInbox.Text = "All";
            // 
            // lbFilterSyntaxMessInbox
            // 
            this.lbFilterSyntaxMessInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lbFilterSyntaxMessInbox.AutoSize = true;
            this.lbFilterSyntaxMessInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbFilterSyntaxMessInbox.ForeColor = System.Drawing.Color.Navy;
            this.lbFilterSyntaxMessInbox.Location = new System.Drawing.Point(8, 275);
            this.lbFilterSyntaxMessInbox.Name = "lbFilterSyntaxMessInbox";
            this.lbFilterSyntaxMessInbox.Size = new System.Drawing.Size(48, 18);
            this.lbFilterSyntaxMessInbox.TabIndex = 6;
            this.lbFilterSyntaxMessInbox.Text = "Filter :";
            // 
            // tblSyntaxMess
            // 
            this.tblSyntaxMess.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.tblSyntaxMess.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.tblSyntaxMess.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.tblSyntaxMess.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.clmCheckSyntaxMessInbox,
            this.clmIdSyntaxMessInbox,
            this.clmNbPhoneSyntaxInbox,
            this.clmContentSyntaxMessInbox,
            this.clmSyntaxMessInbox,
            this.clmStatusSyntaxMessInbox,
            this.clmDateTimeSyntaxMessInbox});
            this.tblSyntaxMess.Location = new System.Drawing.Point(0, 0);
            this.tblSyntaxMess.Name = "tblSyntaxMess";
            this.tblSyntaxMess.RowHeadersVisible = false;
            this.tblSyntaxMess.Size = new System.Drawing.Size(872, 259);
            this.tblSyntaxMess.TabIndex = 0;
            // 
            // clmCheckSyntaxMessInbox
            // 
            this.clmCheckSyntaxMessInbox.FillWeight = 17.7665F;
            this.clmCheckSyntaxMessInbox.HeaderText = "";
            this.clmCheckSyntaxMessInbox.Name = "clmCheckSyntaxMessInbox";
            // 
            // clmIdSyntaxMessInbox
            // 
            this.clmIdSyntaxMessInbox.DataPropertyName = "id";
            this.clmIdSyntaxMessInbox.FillWeight = 113.7056F;
            this.clmIdSyntaxMessInbox.HeaderText = "ID";
            this.clmIdSyntaxMessInbox.Name = "clmIdSyntaxMessInbox";
            // 
            // clmNbPhoneSyntaxInbox
            // 
            this.clmNbPhoneSyntaxInbox.DataPropertyName = "so_dien_thoai";
            this.clmNbPhoneSyntaxInbox.FillWeight = 113.7056F;
            this.clmNbPhoneSyntaxInbox.HeaderText = " Phone Number";
            this.clmNbPhoneSyntaxInbox.Name = "clmNbPhoneSyntaxInbox";
            // 
            // clmContentSyntaxMessInbox
            // 
            this.clmContentSyntaxMessInbox.DataPropertyName = "noi_dung_tin_nhan";
            this.clmContentSyntaxMessInbox.FillWeight = 113.7056F;
            this.clmContentSyntaxMessInbox.HeaderText = "Content";
            this.clmContentSyntaxMessInbox.Name = "clmContentSyntaxMessInbox";
            // 
            // clmSyntaxMessInbox
            // 
            this.clmSyntaxMessInbox.DataPropertyName = "cu_phap";
            this.clmSyntaxMessInbox.FillWeight = 113.7056F;
            this.clmSyntaxMessInbox.HeaderText = "Syntax";
            this.clmSyntaxMessInbox.Name = "clmSyntaxMessInbox";
            // 
            // clmStatusSyntaxMessInbox
            // 
            this.clmStatusSyntaxMessInbox.DataPropertyName = "tinh_trang";
            this.clmStatusSyntaxMessInbox.FillWeight = 113.7056F;
            this.clmStatusSyntaxMessInbox.HeaderText = "Status";
            this.clmStatusSyntaxMessInbox.Name = "clmStatusSyntaxMessInbox";
            // 
            // clmDateTimeSyntaxMessInbox
            // 
            this.clmDateTimeSyntaxMessInbox.DataPropertyName = "ngay_nhan";
            this.clmDateTimeSyntaxMessInbox.FillWeight = 113.7056F;
            this.clmDateTimeSyntaxMessInbox.HeaderText = "Date-Time";
            this.clmDateTimeSyntaxMessInbox.Name = "clmDateTimeSyntaxMessInbox";
            // 
            // tabNormalMessage
            // 
            this.tabNormalMessage.AllowDrop = true;
            this.tabNormalMessage.CausesValidation = false;
            this.tabNormalMessage.Controls.Add(this.btnComposeNormalMessInbox);
            this.tabNormalMessage.Controls.Add(this.btnDeleteNormalMessInbox);
            this.tabNormalMessage.Controls.Add(this.btnReloadNormalMessInbox);
            this.tabNormalMessage.Controls.Add(this.cboFilterNormalMessinbox);
            this.tabNormalMessage.Controls.Add(this.lbFilterNormalMessInbox);
            this.tabNormalMessage.Controls.Add(this.tblNormalMess);
            this.tabNormalMessage.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabNormalMessage.Location = new System.Drawing.Point(4, 25);
            this.tabNormalMessage.Name = "tabNormalMessage";
            this.tabNormalMessage.Padding = new System.Windows.Forms.Padding(3);
            this.tabNormalMessage.Size = new System.Drawing.Size(872, 307);
            this.tabNormalMessage.TabIndex = 1;
            this.tabNormalMessage.Text = "Normal Message";
            this.tabNormalMessage.UseVisualStyleBackColor = true;
            // 
            // btnComposeNormalMessInbox
            // 
            this.btnComposeNormalMessInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnComposeNormalMessInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnComposeNormalMessInbox.Location = new System.Drawing.Point(352, 274);
            this.btnComposeNormalMessInbox.Name = "btnComposeNormalMessInbox";
            this.btnComposeNormalMessInbox.Size = new System.Drawing.Size(94, 23);
            this.btnComposeNormalMessInbox.TabIndex = 5;
            this.btnComposeNormalMessInbox.Text = "Compose";
            this.btnComposeNormalMessInbox.UseVisualStyleBackColor = true;
            // 
            // btnDeleteNormalMessInbox
            // 
            this.btnDeleteNormalMessInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnDeleteNormalMessInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDeleteNormalMessInbox.Location = new System.Drawing.Point(462, 274);
            this.btnDeleteNormalMessInbox.Name = "btnDeleteNormalMessInbox";
            this.btnDeleteNormalMessInbox.Size = new System.Drawing.Size(94, 23);
            this.btnDeleteNormalMessInbox.TabIndex = 4;
            this.btnDeleteNormalMessInbox.Text = "Delete";
            this.btnDeleteNormalMessInbox.UseVisualStyleBackColor = true;
            // 
            // btnReloadNormalMessInbox
            // 
            this.btnReloadNormalMessInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnReloadNormalMessInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnReloadNormalMessInbox.Location = new System.Drawing.Point(242, 274);
            this.btnReloadNormalMessInbox.Name = "btnReloadNormalMessInbox";
            this.btnReloadNormalMessInbox.Size = new System.Drawing.Size(94, 23);
            this.btnReloadNormalMessInbox.TabIndex = 3;
            this.btnReloadNormalMessInbox.Text = "Reload";
            this.btnReloadNormalMessInbox.UseVisualStyleBackColor = true;
            // 
            // cboFilterNormalMessinbox
            // 
            this.cboFilterNormalMessinbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.cboFilterNormalMessinbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cboFilterNormalMessinbox.FormattingEnabled = true;
            this.cboFilterNormalMessinbox.Items.AddRange(new object[] {
            "All",
            "Phone Number",
            "Status",
            "Date-Time"});
            this.cboFilterNormalMessinbox.Location = new System.Drawing.Point(73, 272);
            this.cboFilterNormalMessinbox.Name = "cboFilterNormalMessinbox";
            this.cboFilterNormalMessinbox.Size = new System.Drawing.Size(138, 24);
            this.cboFilterNormalMessinbox.TabIndex = 2;
            this.cboFilterNormalMessinbox.Text = "All";
            // 
            // lbFilterNormalMessInbox
            // 
            this.lbFilterNormalMessInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lbFilterNormalMessInbox.AutoSize = true;
            this.lbFilterNormalMessInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbFilterNormalMessInbox.ForeColor = System.Drawing.Color.Navy;
            this.lbFilterNormalMessInbox.Location = new System.Drawing.Point(8, 275);
            this.lbFilterNormalMessInbox.Name = "lbFilterNormalMessInbox";
            this.lbFilterNormalMessInbox.Size = new System.Drawing.Size(48, 18);
            this.lbFilterNormalMessInbox.TabIndex = 1;
            this.lbFilterNormalMessInbox.Text = "Filter :";
            // 
            // tblNormalMess
            // 
            this.tblNormalMess.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.tblNormalMess.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.tblNormalMess.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.clmIdNormalMessInBox,
            this.clmNbPhoneNormalMessInbox,
            this.clmContentNormalMessInbox,
            this.clmStatusNormalMessInbox,
            this.clmDataTimeNormalMessInbox});
            this.tblNormalMess.Location = new System.Drawing.Point(0, 0);
            this.tblNormalMess.Name = "tblNormalMess";
            this.tblNormalMess.RowHeadersVisible = false;
            this.tblNormalMess.Size = new System.Drawing.Size(872, 259);
            this.tblNormalMess.TabIndex = 0;
            // 
            // clmIdNormalMessInBox
            // 
            this.clmIdNormalMessInBox.DataPropertyName = "id";
            this.clmIdNormalMessInBox.HeaderText = "ID";
            this.clmIdNormalMessInBox.Name = "clmIdNormalMessInBox";
            // 
            // clmNbPhoneNormalMessInbox
            // 
            this.clmNbPhoneNormalMessInbox.DataPropertyName = "so_dien_thoai";
            this.clmNbPhoneNormalMessInbox.HeaderText = "Phone Number";
            this.clmNbPhoneNormalMessInbox.Name = "clmNbPhoneNormalMessInbox";
            // 
            // clmContentNormalMessInbox
            // 
            this.clmContentNormalMessInbox.DataPropertyName = "noi_dung_tin_nhan";
            this.clmContentNormalMessInbox.HeaderText = "Content";
            this.clmContentNormalMessInbox.Name = "clmContentNormalMessInbox";
            // 
            // clmStatusNormalMessInbox
            // 
            this.clmStatusNormalMessInbox.DataPropertyName = "tinh_trang";
            this.clmStatusNormalMessInbox.HeaderText = "Status";
            this.clmStatusNormalMessInbox.Name = "clmStatusNormalMessInbox";
            // 
            // clmDataTimeNormalMessInbox
            // 
            this.clmDataTimeNormalMessInbox.DataPropertyName = "ngay_nhan";
            this.clmDataTimeNormalMessInbox.HeaderText = "Date-Time";
            this.clmDataTimeNormalMessInbox.Name = "clmDataTimeNormalMessInbox";
            // 
            // tabMessDeleted
            // 
            this.tabMessDeleted.Location = new System.Drawing.Point(4, 25);
            this.tabMessDeleted.Name = "tabMessDeleted";
            this.tabMessDeleted.Size = new System.Drawing.Size(872, 307);
            this.tabMessDeleted.TabIndex = 2;
            this.tabMessDeleted.Text = "Message Deleted";
            this.tabMessDeleted.UseVisualStyleBackColor = true;
            // 
            // FormInbox
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(877, 386);
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
            ((System.ComponentModel.ISupportInitialize)(this.tblNormalMess)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbTitle;
        private System.Windows.Forms.TabControl tabControls;
        private System.Windows.Forms.TabPage tabSyntaxMess;
        private System.Windows.Forms.TabPage tabNormalMessage;
        private System.Windows.Forms.DataGridView tblSyntaxMess;
        private System.Windows.Forms.DataGridView tblNormalMess;
        private System.Windows.Forms.Label lbFilterNormalMessInbox;
        private System.Windows.Forms.ComboBox cboFilterNormalMessinbox;
        private System.Windows.Forms.Button btnComposeNormalMessInbox;
        private System.Windows.Forms.Button btnDeleteNormalMessInbox;
        private System.Windows.Forms.Button btnReloadNormalMessInbox;
        private System.Windows.Forms.Button btnComposeSyntaxMessInbox;
        private System.Windows.Forms.Button btnDeleteSyntaxMessInbox;
        private System.Windows.Forms.Button btnReloadSyntaxMessInbox;
        private System.Windows.Forms.ComboBox cboFilterSyntaxMessInbox;
        private System.Windows.Forms.Label lbFilterSyntaxMessInbox;
        private System.Windows.Forms.TabPage tabMessDeleted;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmIdNormalMessInBox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmNbPhoneNormalMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmContentNormalMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmStatusNormalMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmDataTimeNormalMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmCheckSyntaxMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmIdSyntaxMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmNbPhoneSyntaxInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmContentSyntaxMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmSyntaxMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmStatusSyntaxMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmDateTimeSyntaxMessInbox;
    }
}