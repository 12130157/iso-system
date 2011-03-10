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
            this.tabInBox = new System.Windows.Forms.TabPage();
            this.tblInbox = new System.Windows.Forms.DataGridView();
            this.clmID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmPhoneNumber = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmSyntax = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmContent = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmStatus = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmDateTime = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tabSpam = new System.Windows.Forms.TabPage();
            this.btnCompose = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnReload = new System.Windows.Forms.Button();
            this.cboFilter = new System.Windows.Forms.ComboBox();
            this.lbFilter = new System.Windows.Forms.Label();
            this.tblSpam = new System.Windows.Forms.DataGridView();
            this.dataGridViewTextBoxColumn1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dataGridViewTextBoxColumn4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmDataTime = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.tabControls.SuspendLayout();
            this.tabInBox.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tblInbox)).BeginInit();
            this.tabSpam.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tblSpam)).BeginInit();
            this.SuspendLayout();
            // 
            // lbTitle
            // 
            this.lbTitle.AutoSize = true;
            this.lbTitle.Font = new System.Drawing.Font("Times New Roman", 18F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbTitle.ForeColor = System.Drawing.Color.Maroon;
            this.lbTitle.Location = new System.Drawing.Point(208, 9);
            this.lbTitle.Name = "lbTitle";
            this.lbTitle.Size = new System.Drawing.Size(148, 26);
            this.lbTitle.TabIndex = 2;
            this.lbTitle.Text = "Inbox - Spam";
            // 
            // tabControls
            // 
            this.tabControls.Controls.Add(this.tabInBox);
            this.tabControls.Controls.Add(this.tabSpam);
            this.tabControls.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabControls.Location = new System.Drawing.Point(0, 38);
            this.tabControls.Name = "tabControls";
            this.tabControls.SelectedIndex = 0;
            this.tabControls.Size = new System.Drawing.Size(574, 307);
            this.tabControls.TabIndex = 3;
            // 
            // tabInBox
            // 
            this.tabInBox.Controls.Add(this.button1);
            this.tabInBox.Controls.Add(this.button2);
            this.tabInBox.Controls.Add(this.button3);
            this.tabInBox.Controls.Add(this.comboBox1);
            this.tabInBox.Controls.Add(this.label1);
            this.tabInBox.Controls.Add(this.tblInbox);
            this.tabInBox.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabInBox.Location = new System.Drawing.Point(4, 24);
            this.tabInBox.Name = "tabInBox";
            this.tabInBox.Padding = new System.Windows.Forms.Padding(3);
            this.tabInBox.Size = new System.Drawing.Size(566, 279);
            this.tabInBox.TabIndex = 0;
            this.tabInBox.Text = "InBox";
            this.tabInBox.UseVisualStyleBackColor = true;
            // 
            // tblInbox
            // 
            this.tblInbox.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.tblInbox.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.clmID,
            this.clmPhoneNumber,
            this.clmSyntax,
            this.clmContent,
            this.clmStatus,
            this.clmDateTime});
            this.tblInbox.Location = new System.Drawing.Point(0, 0);
            this.tblInbox.Name = "tblInbox";
            this.tblInbox.Size = new System.Drawing.Size(566, 230);
            this.tblInbox.TabIndex = 0;
            // 
            // clmID
            // 
            this.clmID.HeaderText = "ID";
            this.clmID.Name = "clmID";
            this.clmID.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable;
            // 
            // clmPhoneNumber
            // 
            this.clmPhoneNumber.HeaderText = "Phone Number";
            this.clmPhoneNumber.Name = "clmPhoneNumber";
            // 
            // clmSyntax
            // 
            this.clmSyntax.HeaderText = "Syntax Type";
            this.clmSyntax.Name = "clmSyntax";
            // 
            // clmContent
            // 
            this.clmContent.HeaderText = "Content";
            this.clmContent.Name = "clmContent";
            // 
            // clmStatus
            // 
            this.clmStatus.HeaderText = "Status";
            this.clmStatus.Name = "clmStatus";
            // 
            // clmDateTime
            // 
            this.clmDateTime.HeaderText = "Date-Time";
            this.clmDateTime.Name = "clmDateTime";
            // 
            // tabSpam
            // 
            this.tabSpam.AllowDrop = true;
            this.tabSpam.CausesValidation = false;
            this.tabSpam.Controls.Add(this.btnCompose);
            this.tabSpam.Controls.Add(this.btnDelete);
            this.tabSpam.Controls.Add(this.btnReload);
            this.tabSpam.Controls.Add(this.cboFilter);
            this.tabSpam.Controls.Add(this.lbFilter);
            this.tabSpam.Controls.Add(this.tblSpam);
            this.tabSpam.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabSpam.Location = new System.Drawing.Point(4, 24);
            this.tabSpam.Name = "tabSpam";
            this.tabSpam.Padding = new System.Windows.Forms.Padding(3);
            this.tabSpam.Size = new System.Drawing.Size(566, 279);
            this.tabSpam.TabIndex = 1;
            this.tabSpam.Text = "Spam";
            this.tabSpam.UseVisualStyleBackColor = true;
            // 
            // btnCompose
            // 
            this.btnCompose.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCompose.Location = new System.Drawing.Point(382, 243);
            this.btnCompose.Name = "btnCompose";
            this.btnCompose.Size = new System.Drawing.Size(78, 23);
            this.btnCompose.TabIndex = 5;
            this.btnCompose.Text = "Compose";
            this.btnCompose.UseVisualStyleBackColor = true;
            // 
            // btnDelete
            // 
            this.btnDelete.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDelete.Location = new System.Drawing.Point(482, 243);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(78, 23);
            this.btnDelete.TabIndex = 4;
            this.btnDelete.Text = "Delete";
            this.btnDelete.UseVisualStyleBackColor = true;
            // 
            // btnReload
            // 
            this.btnReload.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnReload.Location = new System.Drawing.Point(283, 243);
            this.btnReload.Name = "btnReload";
            this.btnReload.Size = new System.Drawing.Size(78, 23);
            this.btnReload.TabIndex = 3;
            this.btnReload.Text = "Reload";
            this.btnReload.UseVisualStyleBackColor = true;
            // 
            // cboFilter
            // 
            this.cboFilter.FormattingEnabled = true;
            this.cboFilter.Items.AddRange(new object[] {
            "All",
            "Phone Number",
            "Status",
            "Date-Time"});
            this.cboFilter.Location = new System.Drawing.Point(73, 243);
            this.cboFilter.Name = "cboFilter";
            this.cboFilter.Size = new System.Drawing.Size(138, 23);
            this.cboFilter.TabIndex = 2;
            this.cboFilter.Text = "All";
            // 
            // lbFilter
            // 
            this.lbFilter.AutoSize = true;
            this.lbFilter.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbFilter.ForeColor = System.Drawing.Color.Navy;
            this.lbFilter.Location = new System.Drawing.Point(8, 246);
            this.lbFilter.Name = "lbFilter";
            this.lbFilter.Size = new System.Drawing.Size(45, 17);
            this.lbFilter.TabIndex = 1;
            this.lbFilter.Text = "Filter :";
            // 
            // tblSpam
            // 
            this.tblSpam.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.tblSpam.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.dataGridViewTextBoxColumn1,
            this.dataGridViewTextBoxColumn2,
            this.dataGridViewTextBoxColumn3,
            this.dataGridViewTextBoxColumn4,
            this.clmDataTime});
            this.tblSpam.Location = new System.Drawing.Point(0, 0);
            this.tblSpam.Name = "tblSpam";
            this.tblSpam.Size = new System.Drawing.Size(566, 230);
            this.tblSpam.TabIndex = 0;
            // 
            // dataGridViewTextBoxColumn1
            // 
            this.dataGridViewTextBoxColumn1.HeaderText = "ID";
            this.dataGridViewTextBoxColumn1.Name = "dataGridViewTextBoxColumn1";
            // 
            // dataGridViewTextBoxColumn2
            // 
            this.dataGridViewTextBoxColumn2.HeaderText = "Phone Number";
            this.dataGridViewTextBoxColumn2.Name = "dataGridViewTextBoxColumn2";
            // 
            // dataGridViewTextBoxColumn3
            // 
            this.dataGridViewTextBoxColumn3.HeaderText = "Content";
            this.dataGridViewTextBoxColumn3.Name = "dataGridViewTextBoxColumn3";
            // 
            // dataGridViewTextBoxColumn4
            // 
            this.dataGridViewTextBoxColumn4.HeaderText = "Status";
            this.dataGridViewTextBoxColumn4.Name = "dataGridViewTextBoxColumn4";
            // 
            // clmDataTime
            // 
            this.clmDataTime.HeaderText = "Date-Time";
            this.clmDataTime.Name = "clmDataTime";
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.Location = new System.Drawing.Point(382, 244);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(78, 23);
            this.button1.TabIndex = 10;
            this.button1.Text = "Compose";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // button2
            // 
            this.button2.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button2.Location = new System.Drawing.Point(482, 244);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(78, 23);
            this.button2.TabIndex = 9;
            this.button2.Text = "Delete";
            this.button2.UseVisualStyleBackColor = true;
            // 
            // button3
            // 
            this.button3.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button3.Location = new System.Drawing.Point(283, 244);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(78, 23);
            this.button3.TabIndex = 8;
            this.button3.Text = "Reload";
            this.button3.UseVisualStyleBackColor = true;
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Items.AddRange(new object[] {
            "All",
            "Phone Number",
            "Status",
            "Date-Time"});
            this.comboBox1.Location = new System.Drawing.Point(73, 244);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(138, 23);
            this.comboBox1.TabIndex = 7;
            this.comboBox1.Text = "All";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.Navy;
            this.label1.Location = new System.Drawing.Point(8, 248);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(45, 17);
            this.label1.TabIndex = 6;
            this.label1.Text = "Filter :";
            // 
            // FormInbox
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(574, 343);
            this.Controls.Add(this.tabControls);
            this.Controls.Add(this.lbTitle);
            this.Name = "FormInbox";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Inbook";
            this.tabControls.ResumeLayout(false);
            this.tabInBox.ResumeLayout(false);
            this.tabInBox.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tblInbox)).EndInit();
            this.tabSpam.ResumeLayout(false);
            this.tabSpam.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tblSpam)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbTitle;
        private System.Windows.Forms.TabControl tabControls;
        private System.Windows.Forms.TabPage tabInBox;
        private System.Windows.Forms.TabPage tabSpam;
        private System.Windows.Forms.DataGridView tblInbox;
        private System.Windows.Forms.DataGridView tblSpam;
        private System.Windows.Forms.Label lbFilter;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmID;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmPhoneNumber;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmSyntax;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmContent;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmStatus;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmDateTime;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn1;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn2;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn3;
        private System.Windows.Forms.DataGridViewTextBoxColumn dataGridViewTextBoxColumn4;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmDataTime;
        private System.Windows.Forms.ComboBox cboFilter;
        private System.Windows.Forms.Button btnCompose;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnReload;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Label label1;
    }
}