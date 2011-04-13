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
            this.tabInbox = new System.Windows.Forms.TabControl();
            this.tabSyntaxMess = new System.Windows.Forms.TabPage();
            this.tblSyntaxMess = new System.Windows.Forms.DataGridView();
            this.clmIdSyntaxMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmNbPhoneSyntaxInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmContentSyntaxMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmSyntaxMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmStatusSyntaxMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmDateTimeSyntaxMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tabNormalMessage = new System.Windows.Forms.TabPage();
            this.tblNormalMess = new System.Windows.Forms.DataGridView();
            this.clmIdNormalMessInBox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmNbPhoneNormalMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmContentNormalMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmStatusNormalMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmDataTimeNormalMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tabMessDeleted = new System.Windows.Forms.TabPage();
            this.tabDeletedInbox = new System.Windows.Forms.TabControl();
            this.tabSyntaxMessDeletedInbox = new System.Windows.Forms.TabPage();
            this.tblSyntaxMessDeletedInbox = new System.Windows.Forms.DataGridView();
            this.clmIdSyntaxMessDeletedInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmNbPhoneSyntaxMessDeletedInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmContentSyntaxMessDeletedInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmSyntaxMessDeletedInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmDateTimeSyntaxMessDeletedInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tabNormalMessDeletedInbox = new System.Windows.Forms.TabPage();
            this.tblNormalMessDeletedInbox = new System.Windows.Forms.DataGridView();
            this.clmIdNormalMessDeletedInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmNbPhoneNormalMessDeletedInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmContentNormalMessDeletedInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmDateTimeNormalMessDeletedInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btnReplyMessInbox = new System.Windows.Forms.Button();
            this.btnDeleteMessInbox = new System.Windows.Forms.Button();
            this.btnMaskReadMessInbox = new System.Windows.Forms.Button();
            this.cboFilterSyntaxMessInbox = new System.Windows.Forms.ComboBox();
            this.btnRemoveMessInbox = new System.Windows.Forms.Button();
            this.btnForwardMessInbox = new System.Windows.Forms.Button();
            this.lbFilterSyntaxMessInbox = new System.Windows.Forms.Label();
            this.tabInbox.SuspendLayout();
            this.tabSyntaxMess.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tblSyntaxMess)).BeginInit();
            this.tabNormalMessage.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tblNormalMess)).BeginInit();
            this.tabMessDeleted.SuspendLayout();
            this.tabDeletedInbox.SuspendLayout();
            this.tabSyntaxMessDeletedInbox.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tblSyntaxMessDeletedInbox)).BeginInit();
            this.tabNormalMessDeletedInbox.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.tblNormalMessDeletedInbox)).BeginInit();
            this.SuspendLayout();
            // 
            // lbTitle
            // 
            this.lbTitle.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.lbTitle.AutoSize = true;
            this.lbTitle.Font = new System.Drawing.Font("Times New Roman", 20.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbTitle.ForeColor = System.Drawing.Color.Maroon;
            this.lbTitle.Location = new System.Drawing.Point(244, 9);
            this.lbTitle.Name = "lbTitle";
            this.lbTitle.Size = new System.Drawing.Size(385, 31);
            this.lbTitle.TabIndex = 2;
            this.lbTitle.Text = "Syntax - Normal Message Inbox";
            // 
            // tabInbox
            // 
            this.tabInbox.AllowDrop = true;
            this.tabInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.tabInbox.Controls.Add(this.tabSyntaxMess);
            this.tabInbox.Controls.Add(this.tabNormalMessage);
            this.tabInbox.Controls.Add(this.tabMessDeleted);
            this.tabInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabInbox.Location = new System.Drawing.Point(-1, 52);
            this.tabInbox.Name = "tabInbox";
            this.tabInbox.SelectedIndex = 0;
            this.tabInbox.Size = new System.Drawing.Size(880, 323);
            this.tabInbox.TabIndex = 3;
            this.tabInbox.SelectedIndexChanged += new System.EventHandler(this.tabControls_SelectedIndexChanged);
            // 
            // tabSyntaxMess
            // 
            this.tabSyntaxMess.Controls.Add(this.tblSyntaxMess);
            this.tabSyntaxMess.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabSyntaxMess.Location = new System.Drawing.Point(4, 25);
            this.tabSyntaxMess.Name = "tabSyntaxMess";
            this.tabSyntaxMess.Padding = new System.Windows.Forms.Padding(3);
            this.tabSyntaxMess.Size = new System.Drawing.Size(872, 294);
            this.tabSyntaxMess.TabIndex = 0;
            this.tabSyntaxMess.Text = "Syntax Message";
            this.tabSyntaxMess.UseVisualStyleBackColor = true;
            // 
            // tblSyntaxMess
            // 
            this.tblSyntaxMess.AllowUserToAddRows = false;
            this.tblSyntaxMess.AllowUserToDeleteRows = false;
            this.tblSyntaxMess.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.tblSyntaxMess.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.tblSyntaxMess.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.tblSyntaxMess.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.Raised;
            this.tblSyntaxMess.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.clmIdSyntaxMessInbox,
            this.clmNbPhoneSyntaxInbox,
            this.clmContentSyntaxMessInbox,
            this.clmSyntaxMessInbox,
            this.clmStatusSyntaxMessInbox,
            this.clmDateTimeSyntaxMessInbox});
            this.tblSyntaxMess.Location = new System.Drawing.Point(0, 0);
            this.tblSyntaxMess.Name = "tblSyntaxMess";
            this.tblSyntaxMess.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.tblSyntaxMess.Size = new System.Drawing.Size(872, 294);
            this.tblSyntaxMess.StandardTab = true;
            this.tblSyntaxMess.TabIndex = 0;
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
            this.tabNormalMessage.Controls.Add(this.tblNormalMess);
            this.tabNormalMessage.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabNormalMessage.Location = new System.Drawing.Point(4, 25);
            this.tabNormalMessage.Name = "tabNormalMessage";
            this.tabNormalMessage.Padding = new System.Windows.Forms.Padding(3);
            this.tabNormalMessage.Size = new System.Drawing.Size(872, 294);
            this.tabNormalMessage.TabIndex = 1;
            this.tabNormalMessage.Text = "Normal Message";
            this.tabNormalMessage.UseVisualStyleBackColor = true;
            // 
            // tblNormalMess
            // 
            this.tblNormalMess.AllowUserToAddRows = false;
            this.tblNormalMess.AllowUserToDeleteRows = false;
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
            this.tblNormalMess.Size = new System.Drawing.Size(872, 294);
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
            this.tabMessDeleted.Controls.Add(this.tabDeletedInbox);
            this.tabMessDeleted.Location = new System.Drawing.Point(4, 25);
            this.tabMessDeleted.Name = "tabMessDeleted";
            this.tabMessDeleted.Size = new System.Drawing.Size(872, 294);
            this.tabMessDeleted.TabIndex = 2;
            this.tabMessDeleted.Text = "Message Deleted";
            this.tabMessDeleted.UseVisualStyleBackColor = true;
            // 
            // tabDeletedInbox
            // 
            this.tabDeletedInbox.Alignment = System.Windows.Forms.TabAlignment.Bottom;
            this.tabDeletedInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.tabDeletedInbox.Controls.Add(this.tabSyntaxMessDeletedInbox);
            this.tabDeletedInbox.Controls.Add(this.tabNormalMessDeletedInbox);
            this.tabDeletedInbox.Location = new System.Drawing.Point(0, 0);
            this.tabDeletedInbox.Multiline = true;
            this.tabDeletedInbox.Name = "tabDeletedInbox";
            this.tabDeletedInbox.SelectedIndex = 0;
            this.tabDeletedInbox.Size = new System.Drawing.Size(872, 294);
            this.tabDeletedInbox.TabIndex = 0;
            this.tabDeletedInbox.SelectedIndexChanged += new System.EventHandler(this.tabDeletedInbox_SelectedIndexChanged);
            // 
            // tabSyntaxMessDeletedInbox
            // 
            this.tabSyntaxMessDeletedInbox.Controls.Add(this.tblSyntaxMessDeletedInbox);
            this.tabSyntaxMessDeletedInbox.Location = new System.Drawing.Point(4, 4);
            this.tabSyntaxMessDeletedInbox.Name = "tabSyntaxMessDeletedInbox";
            this.tabSyntaxMessDeletedInbox.Padding = new System.Windows.Forms.Padding(3);
            this.tabSyntaxMessDeletedInbox.Size = new System.Drawing.Size(864, 265);
            this.tabSyntaxMessDeletedInbox.TabIndex = 0;
            this.tabSyntaxMessDeletedInbox.Text = "Syntax Message Deleted";
            this.tabSyntaxMessDeletedInbox.UseVisualStyleBackColor = true;
            // 
            // tblSyntaxMessDeletedInbox
            // 
            this.tblSyntaxMessDeletedInbox.AllowUserToAddRows = false;
            this.tblSyntaxMessDeletedInbox.AllowUserToDeleteRows = false;
            this.tblSyntaxMessDeletedInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.tblSyntaxMessDeletedInbox.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.tblSyntaxMessDeletedInbox.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.tblSyntaxMessDeletedInbox.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.clmIdSyntaxMessDeletedInbox,
            this.clmNbPhoneSyntaxMessDeletedInbox,
            this.clmContentSyntaxMessDeletedInbox,
            this.clmSyntaxMessDeletedInbox,
            this.clmDateTimeSyntaxMessDeletedInbox});
            this.tblSyntaxMessDeletedInbox.Location = new System.Drawing.Point(0, 0);
            this.tblSyntaxMessDeletedInbox.Name = "tblSyntaxMessDeletedInbox";
            this.tblSyntaxMessDeletedInbox.Size = new System.Drawing.Size(864, 265);
            this.tblSyntaxMessDeletedInbox.TabIndex = 0;
            // 
            // clmIdSyntaxMessDeletedInbox
            // 
            this.clmIdSyntaxMessDeletedInbox.DataPropertyName = "id";
            this.clmIdSyntaxMessDeletedInbox.HeaderText = "ID";
            this.clmIdSyntaxMessDeletedInbox.Name = "clmIdSyntaxMessDeletedInbox";
            // 
            // clmNbPhoneSyntaxMessDeletedInbox
            // 
            this.clmNbPhoneSyntaxMessDeletedInbox.DataPropertyName = "so_dien_thoai";
            this.clmNbPhoneSyntaxMessDeletedInbox.HeaderText = "Phone Number";
            this.clmNbPhoneSyntaxMessDeletedInbox.Name = "clmNbPhoneSyntaxMessDeletedInbox";
            // 
            // clmContentSyntaxMessDeletedInbox
            // 
            this.clmContentSyntaxMessDeletedInbox.DataPropertyName = "noi_dung_tin_nhan";
            this.clmContentSyntaxMessDeletedInbox.HeaderText = "Content";
            this.clmContentSyntaxMessDeletedInbox.Name = "clmContentSyntaxMessDeletedInbox";
            // 
            // clmSyntaxMessDeletedInbox
            // 
            this.clmSyntaxMessDeletedInbox.DataPropertyName = "cu_phap";
            this.clmSyntaxMessDeletedInbox.HeaderText = "Syntax";
            this.clmSyntaxMessDeletedInbox.Name = "clmSyntaxMessDeletedInbox";
            // 
            // clmDateTimeSyntaxMessDeletedInbox
            // 
            this.clmDateTimeSyntaxMessDeletedInbox.DataPropertyName = "ngay_nhan";
            this.clmDateTimeSyntaxMessDeletedInbox.HeaderText = "Date-Time";
            this.clmDateTimeSyntaxMessDeletedInbox.Name = "clmDateTimeSyntaxMessDeletedInbox";
            // 
            // tabNormalMessDeletedInbox
            // 
            this.tabNormalMessDeletedInbox.Controls.Add(this.tblNormalMessDeletedInbox);
            this.tabNormalMessDeletedInbox.Location = new System.Drawing.Point(4, 4);
            this.tabNormalMessDeletedInbox.Name = "tabNormalMessDeletedInbox";
            this.tabNormalMessDeletedInbox.Padding = new System.Windows.Forms.Padding(3);
            this.tabNormalMessDeletedInbox.Size = new System.Drawing.Size(864, 265);
            this.tabNormalMessDeletedInbox.TabIndex = 1;
            this.tabNormalMessDeletedInbox.Text = "Normal Message Deleted";
            this.tabNormalMessDeletedInbox.UseVisualStyleBackColor = true;
            // 
            // tblNormalMessDeletedInbox
            // 
            this.tblNormalMessDeletedInbox.AllowUserToAddRows = false;
            this.tblNormalMessDeletedInbox.AllowUserToDeleteRows = false;
            this.tblNormalMessDeletedInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.tblNormalMessDeletedInbox.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.tblNormalMessDeletedInbox.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.tblNormalMessDeletedInbox.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.clmIdNormalMessDeletedInbox,
            this.clmNbPhoneNormalMessDeletedInbox,
            this.clmContentNormalMessDeletedInbox,
            this.clmDateTimeNormalMessDeletedInbox});
            this.tblNormalMessDeletedInbox.Location = new System.Drawing.Point(0, 0);
            this.tblNormalMessDeletedInbox.Name = "tblNormalMessDeletedInbox";
            this.tblNormalMessDeletedInbox.Size = new System.Drawing.Size(864, 274);
            this.tblNormalMessDeletedInbox.TabIndex = 1;
            // 
            // clmIdNormalMessDeletedInbox
            // 
            this.clmIdNormalMessDeletedInbox.DataPropertyName = "id";
            this.clmIdNormalMessDeletedInbox.HeaderText = "ID";
            this.clmIdNormalMessDeletedInbox.Name = "clmIdNormalMessDeletedInbox";
            // 
            // clmNbPhoneNormalMessDeletedInbox
            // 
            this.clmNbPhoneNormalMessDeletedInbox.DataPropertyName = "so_dien_thoai";
            this.clmNbPhoneNormalMessDeletedInbox.HeaderText = "Phone Number";
            this.clmNbPhoneNormalMessDeletedInbox.Name = "clmNbPhoneNormalMessDeletedInbox";
            // 
            // clmContentNormalMessDeletedInbox
            // 
            this.clmContentNormalMessDeletedInbox.DataPropertyName = "noi_dung_tin_nhan";
            this.clmContentNormalMessDeletedInbox.HeaderText = "Content";
            this.clmContentNormalMessDeletedInbox.Name = "clmContentNormalMessDeletedInbox";
            // 
            // clmDateTimeNormalMessDeletedInbox
            // 
            this.clmDateTimeNormalMessDeletedInbox.DataPropertyName = "ngay_nhan";
            this.clmDateTimeNormalMessDeletedInbox.HeaderText = "Date-Time";
            this.clmDateTimeNormalMessDeletedInbox.Name = "clmDateTimeNormalMessDeletedInbox";
            // 
            // btnReplyMessInbox
            // 
            this.btnReplyMessInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnReplyMessInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnReplyMessInbox.Location = new System.Drawing.Point(618, 383);
            this.btnReplyMessInbox.Name = "btnReplyMessInbox";
            this.btnReplyMessInbox.Size = new System.Drawing.Size(117, 23);
            this.btnReplyMessInbox.TabIndex = 10;
            this.btnReplyMessInbox.Text = "Reply";
            this.btnReplyMessInbox.UseVisualStyleBackColor = true;
            this.btnReplyMessInbox.Click += new System.EventHandler(this.btnReplyMessInbox_Click);
            // 
            // btnDeleteMessInbox
            // 
            this.btnDeleteMessInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnDeleteMessInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDeleteMessInbox.Location = new System.Drawing.Point(220, 383);
            this.btnDeleteMessInbox.Name = "btnDeleteMessInbox";
            this.btnDeleteMessInbox.Size = new System.Drawing.Size(117, 23);
            this.btnDeleteMessInbox.TabIndex = 9;
            this.btnDeleteMessInbox.Text = "Delete";
            this.btnDeleteMessInbox.UseVisualStyleBackColor = true;
            this.btnDeleteMessInbox.Click += new System.EventHandler(this.btnDeleteMessInbox_Click);
            // 
            // btnMaskReadMessInbox
            // 
            this.btnMaskReadMessInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnMaskReadMessInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnMaskReadMessInbox.Location = new System.Drawing.Point(485, 383);
            this.btnMaskReadMessInbox.Name = "btnMaskReadMessInbox";
            this.btnMaskReadMessInbox.Size = new System.Drawing.Size(117, 23);
            this.btnMaskReadMessInbox.TabIndex = 8;
            this.btnMaskReadMessInbox.Text = "Mask as Read";
            this.btnMaskReadMessInbox.UseVisualStyleBackColor = true;
            this.btnMaskReadMessInbox.Click += new System.EventHandler(this.btnMaskReadMessInbox_Click);
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
            this.cboFilterSyntaxMessInbox.Location = new System.Drawing.Point(66, 383);
            this.cboFilterSyntaxMessInbox.Name = "cboFilterSyntaxMessInbox";
            this.cboFilterSyntaxMessInbox.Size = new System.Drawing.Size(138, 24);
            this.cboFilterSyntaxMessInbox.TabIndex = 7;
            this.cboFilterSyntaxMessInbox.Text = "All";
            // 
            // btnRemoveMessInbox
            // 
            this.btnRemoveMessInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnRemoveMessInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRemoveMessInbox.Location = new System.Drawing.Point(351, 383);
            this.btnRemoveMessInbox.Name = "btnRemoveMessInbox";
            this.btnRemoveMessInbox.Size = new System.Drawing.Size(117, 23);
            this.btnRemoveMessInbox.TabIndex = 11;
            this.btnRemoveMessInbox.Text = "Remove";
            this.btnRemoveMessInbox.UseVisualStyleBackColor = true;
            this.btnRemoveMessInbox.Click += new System.EventHandler(this.btnRemoveMessInbox_Click);
            // 
            // btnForwardMessInbox
            // 
            this.btnForwardMessInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnForwardMessInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnForwardMessInbox.Location = new System.Drawing.Point(751, 382);
            this.btnForwardMessInbox.Name = "btnForwardMessInbox";
            this.btnForwardMessInbox.Size = new System.Drawing.Size(117, 23);
            this.btnForwardMessInbox.TabIndex = 12;
            this.btnForwardMessInbox.Text = "Forward";
            this.btnForwardMessInbox.UseVisualStyleBackColor = true;
            this.btnForwardMessInbox.Click += new System.EventHandler(this.btnForwardMessInbox_Click);
            // 
            // lbFilterSyntaxMessInbox
            // 
            this.lbFilterSyntaxMessInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lbFilterSyntaxMessInbox.AutoSize = true;
            this.lbFilterSyntaxMessInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbFilterSyntaxMessInbox.ForeColor = System.Drawing.Color.Navy;
            this.lbFilterSyntaxMessInbox.Location = new System.Drawing.Point(5, 383);
            this.lbFilterSyntaxMessInbox.Name = "lbFilterSyntaxMessInbox";
            this.lbFilterSyntaxMessInbox.Size = new System.Drawing.Size(48, 18);
            this.lbFilterSyntaxMessInbox.TabIndex = 6;
            this.lbFilterSyntaxMessInbox.Text = "Filter :";
            // 
            // FormInbox
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoScroll = true;
            this.AutoSize = true;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(877, 413);
            this.Controls.Add(this.btnForwardMessInbox);
            this.Controls.Add(this.btnRemoveMessInbox);
            this.Controls.Add(this.btnDeleteMessInbox);
            this.Controls.Add(this.btnReplyMessInbox);
            this.Controls.Add(this.tabInbox);
            this.Controls.Add(this.lbTitle);
            this.Controls.Add(this.btnMaskReadMessInbox);
            this.Controls.Add(this.lbFilterSyntaxMessInbox);
            this.Controls.Add(this.cboFilterSyntaxMessInbox);
            this.Name = "FormInbox";
            this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Show;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Inbook";
            this.tabInbox.ResumeLayout(false);
            this.tabSyntaxMess.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.tblSyntaxMess)).EndInit();
            this.tabNormalMessage.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.tblNormalMess)).EndInit();
            this.tabMessDeleted.ResumeLayout(false);
            this.tabDeletedInbox.ResumeLayout(false);
            this.tabSyntaxMessDeletedInbox.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.tblSyntaxMessDeletedInbox)).EndInit();
            this.tabNormalMessDeletedInbox.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.tblNormalMessDeletedInbox)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbTitle;
        private System.Windows.Forms.TabControl tabInbox;
        private System.Windows.Forms.TabPage tabSyntaxMess;
        private System.Windows.Forms.TabPage tabNormalMessage;
        private System.Windows.Forms.DataGridView tblSyntaxMess;
        private System.Windows.Forms.DataGridView tblNormalMess;
        private System.Windows.Forms.Button btnDeleteMessInbox;
        private System.Windows.Forms.Button btnMaskReadMessInbox;
        private System.Windows.Forms.ComboBox cboFilterSyntaxMessInbox;
        private System.Windows.Forms.TabPage tabMessDeleted;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmIdNormalMessInBox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmNbPhoneNormalMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmContentNormalMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmStatusNormalMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmDataTimeNormalMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmIdSyntaxMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmNbPhoneSyntaxInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmContentSyntaxMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmSyntaxMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmStatusSyntaxMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmDateTimeSyntaxMessInbox;
        private System.Windows.Forms.Button btnReplyMessInbox;
        private System.Windows.Forms.TabControl tabDeletedInbox;
        private System.Windows.Forms.TabPage tabSyntaxMessDeletedInbox;
        private System.Windows.Forms.TabPage tabNormalMessDeletedInbox;
        private System.Windows.Forms.DataGridView tblSyntaxMessDeletedInbox;
        private System.Windows.Forms.DataGridView tblNormalMessDeletedInbox;
        private System.Windows.Forms.Button btnRemoveMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmIdSyntaxMessDeletedInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmNbPhoneSyntaxMessDeletedInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmContentSyntaxMessDeletedInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmSyntaxMessDeletedInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmDateTimeSyntaxMessDeletedInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmIdNormalMessDeletedInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmNbPhoneNormalMessDeletedInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmContentNormalMessDeletedInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmDateTimeNormalMessDeletedInbox;
        private System.Windows.Forms.Button btnForwardMessInbox;
        private System.Windows.Forms.Label lbFilterSyntaxMessInbox;
    }
}