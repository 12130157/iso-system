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
            this.clmReplySyntaxMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tabNormalMessage = new System.Windows.Forms.TabPage();
            this.tblNormalMess = new System.Windows.Forms.DataGridView();
            this.clmIdNormalMessInBox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmNbPhoneNormalMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmContentNormalMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmStatusNormalMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmDataTimeNormalMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmReplyNormalMessInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tabMessDeleted = new System.Windows.Forms.TabPage();
            this.tabDeletedInbox = new System.Windows.Forms.TabControl();
            this.tabSyntaxMessDeletedInbox = new System.Windows.Forms.TabPage();
            this.tblSyntaxMessDeletedInbox = new System.Windows.Forms.DataGridView();
            this.clmIdSyntaxMessDeletedInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmNbPhoneSyntaxMessDeletedInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmContentSyntaxMessDeletedInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmSyntaxMessDeletedInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmDateTimeSyntaxMessDeletedInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmReplySyntaxMessDeletedInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tabNormalMessDeletedInbox = new System.Windows.Forms.TabPage();
            this.tblNormalMessDeletedInbox = new System.Windows.Forms.DataGridView();
            this.clmIdNormalMessDeletedInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmNbPhoneNormalMessDeletedInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmContentNormalMessDeletedInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmDateTimeNormalMessDeletedInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmReplyNormalMessDeletedInbox = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btnReplyMessInbox = new System.Windows.Forms.Button();
            this.btnDeleteMessInbox = new System.Windows.Forms.Button();
            this.btnMaskReadMessInbox = new System.Windows.Forms.Button();
            this.cboFilterMessInbox = new System.Windows.Forms.ComboBox();
            this.btnRemoveMessInbox = new System.Windows.Forms.Button();
            this.btnForwardMessInbox = new System.Windows.Forms.Button();
            this.txtContentFilterInbox = new System.Windows.Forms.TextBox();
            this.lbNbPhoneDt = new System.Windows.Forms.Label();
            this.txtNbPhoneDe = new System.Windows.Forms.TextBox();
            this.lbSyntaxDe = new System.Windows.Forms.Label();
            this.txtSyntaxDe = new System.Windows.Forms.TextBox();
            this.lbDateTimeDe = new System.Windows.Forms.Label();
            this.txtDateTimeDe = new System.Windows.Forms.TextBox();
            this.txtContentMessDe = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
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
            this.lbTitle.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.lbTitle.AutoSize = true;
            this.lbTitle.Font = new System.Drawing.Font("Times New Roman", 26.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbTitle.ForeColor = System.Drawing.Color.Red;
            this.lbTitle.Location = new System.Drawing.Point(144, 4);
            this.lbTitle.Name = "lbTitle";
            this.lbTitle.Size = new System.Drawing.Size(220, 41);
            this.lbTitle.TabIndex = 2;
            this.lbTitle.Text = "Hộp Thư Đến";
            this.lbTitle.TextAlign = System.Drawing.ContentAlignment.TopCenter;
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
            this.tabInbox.Location = new System.Drawing.Point(0, 53);
            this.tabInbox.Name = "tabInbox";
            this.tabInbox.SelectedIndex = 0;
            this.tabInbox.Size = new System.Drawing.Size(895, 367);
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
            this.tabSyntaxMess.Size = new System.Drawing.Size(887, 338);
            this.tabSyntaxMess.TabIndex = 0;
            this.tabSyntaxMess.Text = "Tin Nhắn Cú Pháp";
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
            this.tblSyntaxMess.ColumnHeadersHeight = 40;
            this.tblSyntaxMess.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.clmIdSyntaxMessInbox,
            this.clmNbPhoneSyntaxInbox,
            this.clmContentSyntaxMessInbox,
            this.clmSyntaxMessInbox,
            this.clmStatusSyntaxMessInbox,
            this.clmDateTimeSyntaxMessInbox,
            this.clmReplySyntaxMessInbox});
            this.tblSyntaxMess.Location = new System.Drawing.Point(0, 0);
            this.tblSyntaxMess.Margin = new System.Windows.Forms.Padding(0);
            this.tblSyntaxMess.Name = "tblSyntaxMess";
            this.tblSyntaxMess.ReadOnly = true;
            this.tblSyntaxMess.RowHeadersVisible = false;
            this.tblSyntaxMess.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.tblSyntaxMess.Size = new System.Drawing.Size(887, 338);
            this.tblSyntaxMess.StandardTab = true;
            this.tblSyntaxMess.TabIndex = 0;
            this.tblSyntaxMess.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.tblSyntaxMess_CellClick);
            // 
            // clmIdSyntaxMessInbox
            // 
            this.clmIdSyntaxMessInbox.DataPropertyName = "ID";
            this.clmIdSyntaxMessInbox.FillWeight = 113.7056F;
            this.clmIdSyntaxMessInbox.HeaderText = "ID";
            this.clmIdSyntaxMessInbox.Name = "clmIdSyntaxMessInbox";
            this.clmIdSyntaxMessInbox.ReadOnly = true;
            // 
            // clmNbPhoneSyntaxInbox
            // 
            this.clmNbPhoneSyntaxInbox.DataPropertyName = "So_dien_thoai";
            this.clmNbPhoneSyntaxInbox.FillWeight = 113.7056F;
            this.clmNbPhoneSyntaxInbox.HeaderText = "Số Điện Thoại";
            this.clmNbPhoneSyntaxInbox.Name = "clmNbPhoneSyntaxInbox";
            this.clmNbPhoneSyntaxInbox.ReadOnly = true;
            // 
            // clmContentSyntaxMessInbox
            // 
            this.clmContentSyntaxMessInbox.DataPropertyName = "Noi_dung_tin_nhan";
            this.clmContentSyntaxMessInbox.FillWeight = 113.7056F;
            this.clmContentSyntaxMessInbox.HeaderText = "Nội Dung Tin Nhắn";
            this.clmContentSyntaxMessInbox.Name = "clmContentSyntaxMessInbox";
            this.clmContentSyntaxMessInbox.ReadOnly = true;
            // 
            // clmSyntaxMessInbox
            // 
            this.clmSyntaxMessInbox.DataPropertyName = "Cu_phap";
            this.clmSyntaxMessInbox.FillWeight = 113.7056F;
            this.clmSyntaxMessInbox.HeaderText = "Cú Pháp";
            this.clmSyntaxMessInbox.Name = "clmSyntaxMessInbox";
            this.clmSyntaxMessInbox.ReadOnly = true;
            // 
            // clmStatusSyntaxMessInbox
            // 
            this.clmStatusSyntaxMessInbox.DataPropertyName = "Tinh_trang";
            this.clmStatusSyntaxMessInbox.FillWeight = 113.7056F;
            this.clmStatusSyntaxMessInbox.HeaderText = "Đọc/Chưa Đọc";
            this.clmStatusSyntaxMessInbox.Name = "clmStatusSyntaxMessInbox";
            this.clmStatusSyntaxMessInbox.ReadOnly = true;
            // 
            // clmDateTimeSyntaxMessInbox
            // 
            this.clmDateTimeSyntaxMessInbox.DataPropertyName = "Ngay_nhan";
            this.clmDateTimeSyntaxMessInbox.FillWeight = 113.7056F;
            this.clmDateTimeSyntaxMessInbox.HeaderText = "Ngày Nhận";
            this.clmDateTimeSyntaxMessInbox.Name = "clmDateTimeSyntaxMessInbox";
            this.clmDateTimeSyntaxMessInbox.ReadOnly = true;
            // 
            // clmReplySyntaxMessInbox
            // 
            this.clmReplySyntaxMessInbox.DataPropertyName = "Tinh_Trang_Tra_Loi";
            this.clmReplySyntaxMessInbox.HeaderText = "Trả lời/Chưa Trả Lời";
            this.clmReplySyntaxMessInbox.Name = "clmReplySyntaxMessInbox";
            this.clmReplySyntaxMessInbox.ReadOnly = true;
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
            this.tabNormalMessage.Size = new System.Drawing.Size(887, 338);
            this.tabNormalMessage.TabIndex = 1;
            this.tabNormalMessage.Text = "Tin Nhắn Thủ Công";
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
            this.tblNormalMess.ColumnHeadersHeight = 40;
            this.tblNormalMess.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.clmIdNormalMessInBox,
            this.clmNbPhoneNormalMessInbox,
            this.clmContentNormalMessInbox,
            this.clmStatusNormalMessInbox,
            this.clmDataTimeNormalMessInbox,
            this.clmReplyNormalMessInbox});
            this.tblNormalMess.Location = new System.Drawing.Point(0, 0);
            this.tblNormalMess.Name = "tblNormalMess";
            this.tblNormalMess.ReadOnly = true;
            this.tblNormalMess.RowHeadersVisible = false;
            this.tblNormalMess.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.tblNormalMess.Size = new System.Drawing.Size(887, 338);
            this.tblNormalMess.TabIndex = 0;
            this.tblNormalMess.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.tblNormalMess_CellClick);
            // 
            // clmIdNormalMessInBox
            // 
            this.clmIdNormalMessInBox.DataPropertyName = "id";
            this.clmIdNormalMessInBox.HeaderText = "ID";
            this.clmIdNormalMessInBox.Name = "clmIdNormalMessInBox";
            this.clmIdNormalMessInBox.ReadOnly = true;
            // 
            // clmNbPhoneNormalMessInbox
            // 
            this.clmNbPhoneNormalMessInbox.DataPropertyName = "so_dien_thoai";
            this.clmNbPhoneNormalMessInbox.HeaderText = "Số Điện Thoại";
            this.clmNbPhoneNormalMessInbox.Name = "clmNbPhoneNormalMessInbox";
            this.clmNbPhoneNormalMessInbox.ReadOnly = true;
            // 
            // clmContentNormalMessInbox
            // 
            this.clmContentNormalMessInbox.DataPropertyName = "noi_dung_tin_nhan";
            this.clmContentNormalMessInbox.HeaderText = "Nội Dung Tin Nhắn";
            this.clmContentNormalMessInbox.Name = "clmContentNormalMessInbox";
            this.clmContentNormalMessInbox.ReadOnly = true;
            // 
            // clmStatusNormalMessInbox
            // 
            this.clmStatusNormalMessInbox.DataPropertyName = "tinh_trang";
            this.clmStatusNormalMessInbox.HeaderText = "Đọc/Chưa Đọc";
            this.clmStatusNormalMessInbox.Name = "clmStatusNormalMessInbox";
            this.clmStatusNormalMessInbox.ReadOnly = true;
            // 
            // clmDataTimeNormalMessInbox
            // 
            this.clmDataTimeNormalMessInbox.DataPropertyName = "ngay_nhan";
            this.clmDataTimeNormalMessInbox.HeaderText = "Ngày Nhận";
            this.clmDataTimeNormalMessInbox.Name = "clmDataTimeNormalMessInbox";
            this.clmDataTimeNormalMessInbox.ReadOnly = true;
            // 
            // clmReplyNormalMessInbox
            // 
            this.clmReplyNormalMessInbox.DataPropertyName = "tinh_trang_tra_loi";
            this.clmReplyNormalMessInbox.HeaderText = "Trả Lời/Chưa Trả Lời";
            this.clmReplyNormalMessInbox.Name = "clmReplyNormalMessInbox";
            this.clmReplyNormalMessInbox.ReadOnly = true;
            // 
            // tabMessDeleted
            // 
            this.tabMessDeleted.Controls.Add(this.tabDeletedInbox);
            this.tabMessDeleted.Location = new System.Drawing.Point(4, 25);
            this.tabMessDeleted.Name = "tabMessDeleted";
            this.tabMessDeleted.Size = new System.Drawing.Size(887, 338);
            this.tabMessDeleted.TabIndex = 2;
            this.tabMessDeleted.Text = "Tin Nhắn Đã Xóa";
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
            this.tabDeletedInbox.Size = new System.Drawing.Size(887, 338);
            this.tabDeletedInbox.TabIndex = 0;
            this.tabDeletedInbox.SelectedIndexChanged += new System.EventHandler(this.tabDeletedInbox_SelectedIndexChanged);
            // 
            // tabSyntaxMessDeletedInbox
            // 
            this.tabSyntaxMessDeletedInbox.Controls.Add(this.tblSyntaxMessDeletedInbox);
            this.tabSyntaxMessDeletedInbox.Location = new System.Drawing.Point(4, 4);
            this.tabSyntaxMessDeletedInbox.Name = "tabSyntaxMessDeletedInbox";
            this.tabSyntaxMessDeletedInbox.Padding = new System.Windows.Forms.Padding(3);
            this.tabSyntaxMessDeletedInbox.Size = new System.Drawing.Size(879, 309);
            this.tabSyntaxMessDeletedInbox.TabIndex = 0;
            this.tabSyntaxMessDeletedInbox.Text = "Tin Nhắn Cú Pháp Đã Xóa";
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
            this.clmDateTimeSyntaxMessDeletedInbox,
            this.clmReplySyntaxMessDeletedInbox});
            this.tblSyntaxMessDeletedInbox.Location = new System.Drawing.Point(0, 0);
            this.tblSyntaxMessDeletedInbox.Name = "tblSyntaxMessDeletedInbox";
            this.tblSyntaxMessDeletedInbox.ReadOnly = true;
            this.tblSyntaxMessDeletedInbox.RowHeadersVisible = false;
            this.tblSyntaxMessDeletedInbox.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.tblSyntaxMessDeletedInbox.Size = new System.Drawing.Size(879, 309);
            this.tblSyntaxMessDeletedInbox.TabIndex = 0;
            this.tblSyntaxMessDeletedInbox.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.tblSyntaxMessDeletedInbox_CellClick);
            // 
            // clmIdSyntaxMessDeletedInbox
            // 
            this.clmIdSyntaxMessDeletedInbox.DataPropertyName = "id";
            this.clmIdSyntaxMessDeletedInbox.HeaderText = "ID";
            this.clmIdSyntaxMessDeletedInbox.Name = "clmIdSyntaxMessDeletedInbox";
            this.clmIdSyntaxMessDeletedInbox.ReadOnly = true;
            // 
            // clmNbPhoneSyntaxMessDeletedInbox
            // 
            this.clmNbPhoneSyntaxMessDeletedInbox.DataPropertyName = "so_dien_thoai";
            this.clmNbPhoneSyntaxMessDeletedInbox.HeaderText = "Số Điện Thoại";
            this.clmNbPhoneSyntaxMessDeletedInbox.Name = "clmNbPhoneSyntaxMessDeletedInbox";
            this.clmNbPhoneSyntaxMessDeletedInbox.ReadOnly = true;
            // 
            // clmContentSyntaxMessDeletedInbox
            // 
            this.clmContentSyntaxMessDeletedInbox.DataPropertyName = "noi_dung_tin_nhan";
            this.clmContentSyntaxMessDeletedInbox.HeaderText = "Nội Dung Tin Nhắn";
            this.clmContentSyntaxMessDeletedInbox.Name = "clmContentSyntaxMessDeletedInbox";
            this.clmContentSyntaxMessDeletedInbox.ReadOnly = true;
            // 
            // clmSyntaxMessDeletedInbox
            // 
            this.clmSyntaxMessDeletedInbox.DataPropertyName = "cu_phap";
            this.clmSyntaxMessDeletedInbox.HeaderText = "Cú Pháp";
            this.clmSyntaxMessDeletedInbox.Name = "clmSyntaxMessDeletedInbox";
            this.clmSyntaxMessDeletedInbox.ReadOnly = true;
            // 
            // clmDateTimeSyntaxMessDeletedInbox
            // 
            this.clmDateTimeSyntaxMessDeletedInbox.DataPropertyName = "ngay_nhan";
            this.clmDateTimeSyntaxMessDeletedInbox.HeaderText = "Ngày Nhận";
            this.clmDateTimeSyntaxMessDeletedInbox.Name = "clmDateTimeSyntaxMessDeletedInbox";
            this.clmDateTimeSyntaxMessDeletedInbox.ReadOnly = true;
            // 
            // clmReplySyntaxMessDeletedInbox
            // 
            this.clmReplySyntaxMessDeletedInbox.DataPropertyName = "tinh_trang_tra_loi";
            this.clmReplySyntaxMessDeletedInbox.HeaderText = "Trả Lời/Chưa Trả Lời";
            this.clmReplySyntaxMessDeletedInbox.Name = "clmReplySyntaxMessDeletedInbox";
            this.clmReplySyntaxMessDeletedInbox.ReadOnly = true;
            // 
            // tabNormalMessDeletedInbox
            // 
            this.tabNormalMessDeletedInbox.Controls.Add(this.tblNormalMessDeletedInbox);
            this.tabNormalMessDeletedInbox.Location = new System.Drawing.Point(4, 4);
            this.tabNormalMessDeletedInbox.Name = "tabNormalMessDeletedInbox";
            this.tabNormalMessDeletedInbox.Padding = new System.Windows.Forms.Padding(3);
            this.tabNormalMessDeletedInbox.Size = new System.Drawing.Size(879, 312);
            this.tabNormalMessDeletedInbox.TabIndex = 1;
            this.tabNormalMessDeletedInbox.Text = "Tin Nhắn Thủ Công Đã Xóa";
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
            this.clmDateTimeNormalMessDeletedInbox,
            this.clmReplyNormalMessDeletedInbox});
            this.tblNormalMessDeletedInbox.Location = new System.Drawing.Point(0, 0);
            this.tblNormalMessDeletedInbox.Name = "tblNormalMessDeletedInbox";
            this.tblNormalMessDeletedInbox.ReadOnly = true;
            this.tblNormalMessDeletedInbox.RowHeadersVisible = false;
            this.tblNormalMessDeletedInbox.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.tblNormalMessDeletedInbox.Size = new System.Drawing.Size(879, 324);
            this.tblNormalMessDeletedInbox.TabIndex = 1;
            this.tblNormalMessDeletedInbox.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.tblNormalMessDeletedInbox_CellClick);
            // 
            // clmIdNormalMessDeletedInbox
            // 
            this.clmIdNormalMessDeletedInbox.DataPropertyName = "id";
            this.clmIdNormalMessDeletedInbox.HeaderText = "ID";
            this.clmIdNormalMessDeletedInbox.Name = "clmIdNormalMessDeletedInbox";
            this.clmIdNormalMessDeletedInbox.ReadOnly = true;
            // 
            // clmNbPhoneNormalMessDeletedInbox
            // 
            this.clmNbPhoneNormalMessDeletedInbox.DataPropertyName = "so_dien_thoai";
            this.clmNbPhoneNormalMessDeletedInbox.HeaderText = "Số Điện Thoại";
            this.clmNbPhoneNormalMessDeletedInbox.Name = "clmNbPhoneNormalMessDeletedInbox";
            this.clmNbPhoneNormalMessDeletedInbox.ReadOnly = true;
            // 
            // clmContentNormalMessDeletedInbox
            // 
            this.clmContentNormalMessDeletedInbox.DataPropertyName = "noi_dung_tin_nhan";
            this.clmContentNormalMessDeletedInbox.HeaderText = "Nội Dung Tin Nhắn";
            this.clmContentNormalMessDeletedInbox.Name = "clmContentNormalMessDeletedInbox";
            this.clmContentNormalMessDeletedInbox.ReadOnly = true;
            // 
            // clmDateTimeNormalMessDeletedInbox
            // 
            this.clmDateTimeNormalMessDeletedInbox.DataPropertyName = "ngay_nhan";
            this.clmDateTimeNormalMessDeletedInbox.HeaderText = "Ngày Nhận";
            this.clmDateTimeNormalMessDeletedInbox.Name = "clmDateTimeNormalMessDeletedInbox";
            this.clmDateTimeNormalMessDeletedInbox.ReadOnly = true;
            // 
            // clmReplyNormalMessDeletedInbox
            // 
            this.clmReplyNormalMessDeletedInbox.DataPropertyName = "tinh_trang_tra_loi";
            this.clmReplyNormalMessDeletedInbox.HeaderText = "Trả Lời/Chưa Trả Lời";
            this.clmReplyNormalMessDeletedInbox.Name = "clmReplyNormalMessDeletedInbox";
            this.clmReplyNormalMessDeletedInbox.ReadOnly = true;
            // 
            // btnReplyMessInbox
            // 
            this.btnReplyMessInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnReplyMessInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnReplyMessInbox.Location = new System.Drawing.Point(4, 424);
            this.btnReplyMessInbox.Name = "btnReplyMessInbox";
            this.btnReplyMessInbox.Size = new System.Drawing.Size(165, 23);
            this.btnReplyMessInbox.TabIndex = 10;
            this.btnReplyMessInbox.Text = "Trả Lời";
            this.btnReplyMessInbox.UseVisualStyleBackColor = true;
            this.btnReplyMessInbox.Click += new System.EventHandler(this.btnReplyMessInbox_Click);
            // 
            // btnDeleteMessInbox
            // 
            this.btnDeleteMessInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnDeleteMessInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDeleteMessInbox.Location = new System.Drawing.Point(724, 455);
            this.btnDeleteMessInbox.Name = "btnDeleteMessInbox";
            this.btnDeleteMessInbox.Size = new System.Drawing.Size(165, 23);
            this.btnDeleteMessInbox.TabIndex = 9;
            this.btnDeleteMessInbox.Text = "Xóa Vào Thùng Rác";
            this.btnDeleteMessInbox.UseVisualStyleBackColor = true;
            this.btnDeleteMessInbox.Click += new System.EventHandler(this.btnDeleteMessInbox_Click);
            // 
            // btnMaskReadMessInbox
            // 
            this.btnMaskReadMessInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnMaskReadMessInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnMaskReadMessInbox.Location = new System.Drawing.Point(4, 482);
            this.btnMaskReadMessInbox.Name = "btnMaskReadMessInbox";
            this.btnMaskReadMessInbox.Size = new System.Drawing.Size(165, 23);
            this.btnMaskReadMessInbox.TabIndex = 8;
            this.btnMaskReadMessInbox.Text = "Đánh Dấu Đã Đọc";
            this.btnMaskReadMessInbox.UseVisualStyleBackColor = true;
            this.btnMaskReadMessInbox.Click += new System.EventHandler(this.btnMaskReadMessInbox_Click);
            // 
            // cboFilterMessInbox
            // 
            this.cboFilterMessInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.cboFilterMessInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cboFilterMessInbox.FormattingEnabled = true;
            this.cboFilterMessInbox.Items.AddRange(new object[] {
            "Số Điện Thoại",
            "Nội Dung Tin Nhắn ",
            "Cú Pháp"});
            this.cboFilterMessInbox.Location = new System.Drawing.Point(751, 21);
            this.cboFilterMessInbox.Name = "cboFilterMessInbox";
            this.cboFilterMessInbox.Size = new System.Drawing.Size(138, 24);
            this.cboFilterMessInbox.TabIndex = 7;
            this.cboFilterMessInbox.Text = "Choose...";
            this.cboFilterMessInbox.SelectedIndexChanged += new System.EventHandler(this.cboFilterSyntaxMessInbox_SelectedIndexChanged);
            // 
            // btnRemoveMessInbox
            // 
            this.btnRemoveMessInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnRemoveMessInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRemoveMessInbox.Location = new System.Drawing.Point(724, 426);
            this.btnRemoveMessInbox.Name = "btnRemoveMessInbox";
            this.btnRemoveMessInbox.Size = new System.Drawing.Size(165, 23);
            this.btnRemoveMessInbox.TabIndex = 11;
            this.btnRemoveMessInbox.Text = "Xóa Vĩnh Viễn";
            this.btnRemoveMessInbox.UseVisualStyleBackColor = true;
            this.btnRemoveMessInbox.Click += new System.EventHandler(this.btnRemoveMessInbox_Click);
            // 
            // btnForwardMessInbox
            // 
            this.btnForwardMessInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnForwardMessInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnForwardMessInbox.Location = new System.Drawing.Point(4, 453);
            this.btnForwardMessInbox.Name = "btnForwardMessInbox";
            this.btnForwardMessInbox.Size = new System.Drawing.Size(165, 23);
            this.btnForwardMessInbox.TabIndex = 12;
            this.btnForwardMessInbox.Text = "Chuyển Tiếp";
            this.btnForwardMessInbox.UseVisualStyleBackColor = true;
            this.btnForwardMessInbox.Click += new System.EventHandler(this.btnForwardMessInbox_Click);
            // 
            // txtContentFilterInbox
            // 
            this.txtContentFilterInbox.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.txtContentFilterInbox.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtContentFilterInbox.Location = new System.Drawing.Point(593, 21);
            this.txtContentFilterInbox.Name = "txtContentFilterInbox";
            this.txtContentFilterInbox.Size = new System.Drawing.Size(152, 24);
            this.txtContentFilterInbox.TabIndex = 13;
            this.txtContentFilterInbox.TextChanged += new System.EventHandler(this.txtContentFilterInbox_TextChanged);
            // 
            // lbNbPhoneDt
            // 
            this.lbNbPhoneDt.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lbNbPhoneDt.AutoSize = true;
            this.lbNbPhoneDt.Location = new System.Drawing.Point(178, 440);
            this.lbNbPhoneDt.Name = "lbNbPhoneDt";
            this.lbNbPhoneDt.Size = new System.Drawing.Size(75, 13);
            this.lbNbPhoneDt.TabIndex = 15;
            this.lbNbPhoneDt.Text = "Số Điện Thoại";
            // 
            // txtNbPhoneDe
            // 
            this.txtNbPhoneDe.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.txtNbPhoneDe.Location = new System.Drawing.Point(259, 437);
            this.txtNbPhoneDe.Name = "txtNbPhoneDe";
            this.txtNbPhoneDe.Size = new System.Drawing.Size(138, 20);
            this.txtNbPhoneDe.TabIndex = 16;
            // 
            // lbSyntaxDe
            // 
            this.lbSyntaxDe.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lbSyntaxDe.AutoSize = true;
            this.lbSyntaxDe.Location = new System.Drawing.Point(178, 464);
            this.lbSyntaxDe.Name = "lbSyntaxDe";
            this.lbSyntaxDe.Size = new System.Drawing.Size(48, 13);
            this.lbSyntaxDe.TabIndex = 17;
            this.lbSyntaxDe.Text = "Cú Pháp";
            // 
            // txtSyntaxDe
            // 
            this.txtSyntaxDe.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.txtSyntaxDe.Location = new System.Drawing.Point(259, 461);
            this.txtSyntaxDe.Name = "txtSyntaxDe";
            this.txtSyntaxDe.Size = new System.Drawing.Size(138, 20);
            this.txtSyntaxDe.TabIndex = 18;
            // 
            // lbDateTimeDe
            // 
            this.lbDateTimeDe.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lbDateTimeDe.AutoSize = true;
            this.lbDateTimeDe.Location = new System.Drawing.Point(178, 488);
            this.lbDateTimeDe.Name = "lbDateTimeDe";
            this.lbDateTimeDe.Size = new System.Drawing.Size(61, 13);
            this.lbDateTimeDe.TabIndex = 17;
            this.lbDateTimeDe.Text = "Ngày Nhận";
            // 
            // txtDateTimeDe
            // 
            this.txtDateTimeDe.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.txtDateTimeDe.Location = new System.Drawing.Point(259, 485);
            this.txtDateTimeDe.Name = "txtDateTimeDe";
            this.txtDateTimeDe.Size = new System.Drawing.Size(138, 20);
            this.txtDateTimeDe.TabIndex = 18;
            // 
            // txtContentMessDe
            // 
            this.txtContentMessDe.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txtContentMessDe.Location = new System.Drawing.Point(403, 437);
            this.txtContentMessDe.Multiline = true;
            this.txtContentMessDe.Name = "txtContentMessDe";
            this.txtContentMessDe.Size = new System.Drawing.Size(302, 68);
            this.txtContentMessDe.TabIndex = 19;
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(400, 422);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(99, 13);
            this.label1.TabIndex = 20;
            this.label1.Text = "Nội Dung Tin Nhắn";
            // 
            // FormInbox
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Inherit;
            this.AutoScroll = true;
            this.AutoSize = true;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(892, 509);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtContentMessDe);
            this.Controls.Add(this.txtDateTimeDe);
            this.Controls.Add(this.txtSyntaxDe);
            this.Controls.Add(this.lbDateTimeDe);
            this.Controls.Add(this.lbSyntaxDe);
            this.Controls.Add(this.txtNbPhoneDe);
            this.Controls.Add(this.lbNbPhoneDt);
            this.Controls.Add(this.txtContentFilterInbox);
            this.Controls.Add(this.btnForwardMessInbox);
            this.Controls.Add(this.btnRemoveMessInbox);
            this.Controls.Add(this.btnDeleteMessInbox);
            this.Controls.Add(this.btnReplyMessInbox);
            this.Controls.Add(this.tabInbox);
            this.Controls.Add(this.lbTitle);
            this.Controls.Add(this.btnMaskReadMessInbox);
            this.Controls.Add(this.cboFilterMessInbox);
            this.Name = "FormInbox";
            this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Show;
            this.StartPosition = System.Windows.Forms.FormStartPosition.Manual;
            this.Text = "Hộp Thư Đến";
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
        private System.Windows.Forms.TabPage tabMessDeleted;
        private System.Windows.Forms.Button btnReplyMessInbox;
        private System.Windows.Forms.TabControl tabDeletedInbox;
        private System.Windows.Forms.TabPage tabSyntaxMessDeletedInbox;
        private System.Windows.Forms.TabPage tabNormalMessDeletedInbox;
        private System.Windows.Forms.DataGridView tblSyntaxMessDeletedInbox;
        private System.Windows.Forms.DataGridView tblNormalMessDeletedInbox;
        private System.Windows.Forms.Button btnRemoveMessInbox;
        private System.Windows.Forms.Button btnForwardMessInbox;
        private System.Windows.Forms.TextBox txtContentFilterInbox;
        private System.Windows.Forms.Label lbNbPhoneDt;
        private System.Windows.Forms.TextBox txtNbPhoneDe;
        private System.Windows.Forms.Label lbSyntaxDe;
        private System.Windows.Forms.TextBox txtSyntaxDe;
        private System.Windows.Forms.Label lbDateTimeDe;
        private System.Windows.Forms.TextBox txtDateTimeDe;
        private System.Windows.Forms.TextBox txtContentMessDe;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmIdSyntaxMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmNbPhoneSyntaxInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmContentSyntaxMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmSyntaxMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmStatusSyntaxMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmDateTimeSyntaxMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmReplySyntaxMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmIdNormalMessInBox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmNbPhoneNormalMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmContentNormalMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmStatusNormalMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmDataTimeNormalMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmReplyNormalMessInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmIdSyntaxMessDeletedInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmNbPhoneSyntaxMessDeletedInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmContentSyntaxMessDeletedInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmSyntaxMessDeletedInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmDateTimeSyntaxMessDeletedInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmReplySyntaxMessDeletedInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmIdNormalMessDeletedInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmNbPhoneNormalMessDeletedInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmContentNormalMessDeletedInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmDateTimeNormalMessDeletedInbox;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmReplyNormalMessDeletedInbox;
        private System.Windows.Forms.ComboBox cboFilterMessInbox;
    }
}