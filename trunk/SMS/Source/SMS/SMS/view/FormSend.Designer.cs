namespace SMS
{
    partial class Sent
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
            this.tabErrorMessSent = new System.Windows.Forms.TabPage();
            this.tabSentDeleted = new System.Windows.Forms.TabPage();
            this.btnRemoveMessSent = new System.Windows.Forms.Button();
            this.btnDeleteMessSent = new System.Windows.Forms.Button();
            this.btnForwardMessSent = new System.Windows.Forms.Button();
            this.btnReSentMessSent = new System.Windows.Forms.Button();
            this.cboFilterMessSent = new System.Windows.Forms.ComboBox();
            this.lbFilterSyntaxMessSent = new System.Windows.Forms.Label();
            this.tabSent.SuspendLayout();
            this.tabSyntaxSent.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tblSyntaxMessSent)).BeginInit();
            this.tabNormalSent.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tblNormalMessSent)).BeginInit();
            this.SuspendLayout();
            // 
            // lbTitle
            // 
            this.lbTitle.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.lbTitle.AutoSize = true;
            this.lbTitle.Font = new System.Drawing.Font("Times New Roman", 20.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbTitle.ForeColor = System.Drawing.Color.Maroon;
            this.lbTitle.Location = new System.Drawing.Point(251, 9);
            this.lbTitle.Name = "lbTitle";
            this.lbTitle.Size = new System.Drawing.Size(369, 31);
            this.lbTitle.TabIndex = 1;
            this.lbTitle.Text = "Syntax - Normal Message Sent";
            // 
            // tabSent
            // 
            this.tabSent.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.tabSent.Controls.Add(this.tabSyntaxSent);
            this.tabSent.Controls.Add(this.tabNormalSent);
            this.tabSent.Controls.Add(this.tabErrorMessSent);
            this.tabSent.Controls.Add(this.tabSentDeleted);
            this.tabSent.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabSent.Location = new System.Drawing.Point(-1, 52);
            this.tabSent.Name = "tabSent";
            this.tabSent.SelectedIndex = 0;
            this.tabSent.Size = new System.Drawing.Size(880, 323);
            this.tabSent.TabIndex = 2;
            this.tabSent.SelectedIndexChanged += new System.EventHandler(this.tabSent_SelectedIndexChanged);
            // 
            // tabSyntaxSent
            // 
            this.tabSyntaxSent.Controls.Add(this.tblSyntaxMessSent);
            this.tabSyntaxSent.Location = new System.Drawing.Point(4, 25);
            this.tabSyntaxSent.Name = "tabSyntaxSent";
            this.tabSyntaxSent.Padding = new System.Windows.Forms.Padding(3);
            this.tabSyntaxSent.Size = new System.Drawing.Size(872, 294);
            this.tabSyntaxSent.TabIndex = 0;
            this.tabSyntaxSent.Text = "Syntax Message Sent";
            this.tabSyntaxSent.UseVisualStyleBackColor = true;
            // 
            // tblSyntaxMessSent
            // 
            this.tblSyntaxMessSent.AllowDrop = true;
            this.tblSyntaxMessSent.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
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
            this.tblSyntaxMessSent.Size = new System.Drawing.Size(872, 294);
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
            this.tabNormalSent.Location = new System.Drawing.Point(4, 25);
            this.tabNormalSent.Name = "tabNormalSent";
            this.tabNormalSent.Padding = new System.Windows.Forms.Padding(3);
            this.tabNormalSent.Size = new System.Drawing.Size(872, 294);
            this.tabNormalSent.TabIndex = 1;
            this.tabNormalSent.Text = "Normal Message Sent";
            this.tabNormalSent.UseVisualStyleBackColor = true;
            // 
            // tblNormalMessSent
            // 
            this.tblNormalMessSent.AllowDrop = true;
            this.tblNormalMessSent.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
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
            this.tblNormalMessSent.Size = new System.Drawing.Size(872, 294);
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
            // tabErrorMessSent
            // 
            this.tabErrorMessSent.Location = new System.Drawing.Point(4, 25);
            this.tabErrorMessSent.Name = "tabErrorMessSent";
            this.tabErrorMessSent.Size = new System.Drawing.Size(872, 294);
            this.tabErrorMessSent.TabIndex = 3;
            this.tabErrorMessSent.Text = "Error Message Semt";
            this.tabErrorMessSent.UseVisualStyleBackColor = true;
            // 
            // tabSentDeleted
            // 
            this.tabSentDeleted.Location = new System.Drawing.Point(4, 25);
            this.tabSentDeleted.Name = "tabSentDeleted";
            this.tabSentDeleted.Size = new System.Drawing.Size(872, 294);
            this.tabSentDeleted.TabIndex = 2;
            this.tabSentDeleted.Text = "Sent Deleted";
            this.tabSentDeleted.UseVisualStyleBackColor = true;
            // 
            // btnRemoveMessSent
            // 
            this.btnRemoveMessSent.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.btnRemoveMessSent.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRemoveMessSent.Location = new System.Drawing.Point(533, 383);
            this.btnRemoveMessSent.Name = "btnRemoveMessSent";
            this.btnRemoveMessSent.Size = new System.Drawing.Size(94, 23);
            this.btnRemoveMessSent.TabIndex = 10;
            this.btnRemoveMessSent.Text = "Remove";
            this.btnRemoveMessSent.UseVisualStyleBackColor = true;
            // 
            // btnDeleteMessSent
            // 
            this.btnDeleteMessSent.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.btnDeleteMessSent.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDeleteMessSent.Location = new System.Drawing.Point(429, 383);
            this.btnDeleteMessSent.Name = "btnDeleteMessSent";
            this.btnDeleteMessSent.Size = new System.Drawing.Size(94, 23);
            this.btnDeleteMessSent.TabIndex = 9;
            this.btnDeleteMessSent.Text = "Delete";
            this.btnDeleteMessSent.UseVisualStyleBackColor = true;
            // 
            // btnForwardMessSent
            // 
            this.btnForwardMessSent.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.btnForwardMessSent.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnForwardMessSent.Location = new System.Drawing.Point(325, 383);
            this.btnForwardMessSent.Name = "btnForwardMessSent";
            this.btnForwardMessSent.Size = new System.Drawing.Size(94, 23);
            this.btnForwardMessSent.TabIndex = 8;
            this.btnForwardMessSent.Text = "Forward";
            this.btnForwardMessSent.UseVisualStyleBackColor = true;
            // 
            // btnReSentMessSent
            // 
            this.btnReSentMessSent.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnReSentMessSent.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnReSentMessSent.Location = new System.Drawing.Point(220, 383);
            this.btnReSentMessSent.Name = "btnReSentMessSent";
            this.btnReSentMessSent.Size = new System.Drawing.Size(94, 23);
            this.btnReSentMessSent.TabIndex = 11;
            this.btnReSentMessSent.Text = "Re-Sent";
            this.btnReSentMessSent.UseVisualStyleBackColor = true;
            // 
            // cboFilterMessSent
            // 
            this.cboFilterMessSent.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.cboFilterMessSent.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cboFilterMessSent.FormattingEnabled = true;
            this.cboFilterMessSent.Items.AddRange(new object[] {
            "All",
            "Phone Number",
            "Status",
            "Date-Time"});
            this.cboFilterMessSent.Location = new System.Drawing.Point(66, 383);
            this.cboFilterMessSent.Name = "cboFilterMessSent";
            this.cboFilterMessSent.Size = new System.Drawing.Size(138, 24);
            this.cboFilterMessSent.TabIndex = 7;
            this.cboFilterMessSent.Text = "All";
            // 
            // lbFilterSyntaxMessSent
            // 
            this.lbFilterSyntaxMessSent.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.lbFilterSyntaxMessSent.AutoSize = true;
            this.lbFilterSyntaxMessSent.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbFilterSyntaxMessSent.ForeColor = System.Drawing.Color.Navy;
            this.lbFilterSyntaxMessSent.Location = new System.Drawing.Point(5, 383);
            this.lbFilterSyntaxMessSent.Name = "lbFilterSyntaxMessSent";
            this.lbFilterSyntaxMessSent.Size = new System.Drawing.Size(48, 18);
            this.lbFilterSyntaxMessSent.TabIndex = 6;
            this.lbFilterSyntaxMessSent.Text = "Filter :";
            // 
            // Sent
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(877, 413);
            this.Controls.Add(this.btnReSentMessSent);
            this.Controls.Add(this.tabSent);
            this.Controls.Add(this.btnRemoveMessSent);
            this.Controls.Add(this.lbTitle);
            this.Controls.Add(this.btnDeleteMessSent);
            this.Controls.Add(this.cboFilterMessSent);
            this.Controls.Add(this.btnForwardMessSent);
            this.Controls.Add(this.lbFilterSyntaxMessSent);
            this.Name = "Sent";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Sent";
            this.tabSent.ResumeLayout(false);
            this.tabSyntaxSent.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.tblSyntaxMessSent)).EndInit();
            this.tabNormalSent.ResumeLayout(false);
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
        private System.Windows.Forms.Button btnRemoveMessSent;
        private System.Windows.Forms.Button btnDeleteMessSent;
        private System.Windows.Forms.Button btnForwardMessSent;
        private System.Windows.Forms.Button btnReSentMessSent;
        private System.Windows.Forms.ComboBox cboFilterMessSent;
        private System.Windows.Forms.Label lbFilterSyntaxMessSent;
    }
}