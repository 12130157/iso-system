namespace SMS
{
    partial class FormManageKeyword
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormManageKeyword));
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.txt_Enter = new System.Windows.Forms.TextBox();
            this.but_Close = new System.Windows.Forms.Button();
            this.but_Edit = new System.Windows.Forms.Button();
            this.but_Add = new System.Windows.Forms.Button();
            this.but_Delete = new System.Windows.Forms.Button();
            this.but_Refresh = new System.Windows.Forms.Button();
            this.chk_All = new System.Windows.Forms.CheckBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label28 = new System.Windows.Forms.Label();
            this.cbo_Choose = new System.Windows.Forms.ComboBox();
            this.dlv_ManageKeyword = new System.Windows.Forms.DataGridView();
            this.label10 = new System.Windows.Forms.Label();
            this.lblYouChoose = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dlv_ManageKeyword)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox1.BackColor = System.Drawing.SystemColors.MenuBar;
            this.groupBox1.Controls.Add(this.txt_Enter);
            this.groupBox1.Controls.Add(this.but_Close);
            this.groupBox1.Controls.Add(this.but_Edit);
            this.groupBox1.Controls.Add(this.but_Add);
            this.groupBox1.Controls.Add(this.but_Delete);
            this.groupBox1.Controls.Add(this.but_Refresh);
            this.groupBox1.Controls.Add(this.chk_All);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.label28);
            this.groupBox1.Controls.Add(this.cbo_Choose);
            this.groupBox1.Controls.Add(this.dlv_ManageKeyword);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(22, 52);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(1144, 440);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            // 
            // txt_Enter
            // 
            this.txt_Enter.Location = new System.Drawing.Point(271, 392);
            this.txt_Enter.Multiline = true;
            this.txt_Enter.Name = "txt_Enter";
            this.txt_Enter.Size = new System.Drawing.Size(167, 42);
            this.txt_Enter.TabIndex = 144;
            // 
            // but_Close
            // 
            this.but_Close.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.but_Close.BackColor = System.Drawing.Color.Blue;
            this.but_Close.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Close.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Close.Image = ((System.Drawing.Image)(resources.GetObject("but_Close.Image")));
            this.but_Close.Location = new System.Drawing.Point(1007, 391);
            this.but_Close.Name = "but_Close";
            this.but_Close.Size = new System.Drawing.Size(98, 23);
            this.but_Close.TabIndex = 139;
            this.but_Close.Text = "Close";
            this.but_Close.UseVisualStyleBackColor = false;
            this.but_Close.Click += new System.EventHandler(this.but_Close_Click_1);
            // 
            // but_Edit
            // 
            this.but_Edit.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.but_Edit.BackColor = System.Drawing.Color.Blue;
            this.but_Edit.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Edit.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Edit.Image = ((System.Drawing.Image)(resources.GetObject("but_Edit.Image")));
            this.but_Edit.Location = new System.Drawing.Point(772, 391);
            this.but_Edit.Name = "but_Edit";
            this.but_Edit.Size = new System.Drawing.Size(98, 23);
            this.but_Edit.TabIndex = 142;
            this.but_Edit.Text = "Edit";
            this.but_Edit.UseVisualStyleBackColor = false;
            this.but_Edit.Click += new System.EventHandler(this.but_Edit_Click);
            // 
            // but_Add
            // 
            this.but_Add.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.but_Add.BackColor = System.Drawing.Color.Blue;
            this.but_Add.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Add.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Add.Image = ((System.Drawing.Image)(resources.GetObject("but_Add.Image")));
            this.but_Add.Location = new System.Drawing.Point(654, 391);
            this.but_Add.Name = "but_Add";
            this.but_Add.Size = new System.Drawing.Size(98, 23);
            this.but_Add.TabIndex = 141;
            this.but_Add.Text = "Add";
            this.but_Add.UseVisualStyleBackColor = false;
            this.but_Add.Click += new System.EventHandler(this.but_Add_Click);
            // 
            // but_Delete
            // 
            this.but_Delete.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.but_Delete.BackColor = System.Drawing.Color.Blue;
            this.but_Delete.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Delete.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Delete.Image = ((System.Drawing.Image)(resources.GetObject("but_Delete.Image")));
            this.but_Delete.Location = new System.Drawing.Point(891, 391);
            this.but_Delete.Name = "but_Delete";
            this.but_Delete.Size = new System.Drawing.Size(98, 23);
            this.but_Delete.TabIndex = 140;
            this.but_Delete.Text = "Delete";
            this.but_Delete.UseVisualStyleBackColor = false;
            this.but_Delete.Click += new System.EventHandler(this.but_Delete_Click);
            // 
            // but_Refresh
            // 
            this.but_Refresh.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.but_Refresh.BackColor = System.Drawing.Color.Blue;
            this.but_Refresh.Cursor = System.Windows.Forms.Cursors.Hand;
            this.but_Refresh.ForeColor = System.Drawing.SystemColors.Control;
            this.but_Refresh.Image = ((System.Drawing.Image)(resources.GetObject("but_Refresh.Image")));
            this.but_Refresh.Location = new System.Drawing.Point(529, 391);
            this.but_Refresh.Name = "but_Refresh";
            this.but_Refresh.Size = new System.Drawing.Size(98, 23);
            this.but_Refresh.TabIndex = 143;
            this.but_Refresh.Text = "Refesh";
            this.but_Refresh.UseVisualStyleBackColor = false;
            this.but_Refresh.Click += new System.EventHandler(this.but_Refresh_Click);
            // 
            // chk_All
            // 
            this.chk_All.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.chk_All.AutoSize = true;
            this.chk_All.Location = new System.Drawing.Point(468, 394);
            this.chk_All.Name = "chk_All";
            this.chk_All.Size = new System.Drawing.Size(40, 17);
            this.chk_All.TabIndex = 138;
            this.chk_All.Text = "All";
            this.chk_All.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Pink;
            this.label1.Location = new System.Drawing.Point(201, 393);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(41, 13);
            this.label1.TabIndex = 136;
            this.label1.Text = "Enter:";
            // 
            // label28
            // 
            this.label28.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.label28.AutoSize = true;
            this.label28.BackColor = System.Drawing.Color.Pink;
            this.label28.Location = new System.Drawing.Point(11, 393);
            this.label28.Name = "label28";
            this.label28.Size = new System.Drawing.Size(49, 13);
            this.label28.TabIndex = 136;
            this.label28.Text = "Filter>>";
            // 
            // cbo_Choose
            // 
            this.cbo_Choose.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.cbo_Choose.FormattingEnabled = true;
            this.cbo_Choose.Items.AddRange(new object[] {
            "Name",
            "Keyword",
            "Note"});
            this.cbo_Choose.Location = new System.Drawing.Point(66, 390);
            this.cbo_Choose.Name = "cbo_Choose";
            this.cbo_Choose.Size = new System.Drawing.Size(129, 21);
            this.cbo_Choose.TabIndex = 135;
            // 
            // dlv_ManageKeyword
            // 
            this.dlv_ManageKeyword.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.dlv_ManageKeyword.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.DisplayedCells;
            this.dlv_ManageKeyword.BackgroundColor = System.Drawing.SystemColors.ButtonHighlight;
            this.dlv_ManageKeyword.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dlv_ManageKeyword.Location = new System.Drawing.Point(6, 28);
            this.dlv_ManageKeyword.Name = "dlv_ManageKeyword";
            this.dlv_ManageKeyword.RowHeadersVisible = false;
            this.dlv_ManageKeyword.Size = new System.Drawing.Size(1110, 357);
            this.dlv_ManageKeyword.TabIndex = 5;
            this.dlv_ManageKeyword.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dlv_ManageKeyword_CellContentClick);
            // 
            // label10
            // 
            this.label10.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(482, 9);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(238, 31);
            this.label10.TabIndex = 1;
            this.label10.Text = "Manage Keyword";
            // 
            // lblYouChoose
            // 
            this.lblYouChoose.AutoSize = true;
            this.lblYouChoose.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblYouChoose.Location = new System.Drawing.Point(22, 510);
            this.lblYouChoose.Name = "lblYouChoose";
            this.lblYouChoose.Size = new System.Drawing.Size(83, 13);
            this.lblYouChoose.TabIndex = 2;
            this.lblYouChoose.Text = "You Choose: ";
            // 
            // FormManageKeyword
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.InactiveCaptionText;
            this.ClientSize = new System.Drawing.Size(1194, 535);
            this.Controls.Add(this.lblYouChoose);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.groupBox1);
            this.Name = "FormManageKeyword";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Manage Keyword";
            this.Load += new System.EventHandler(this.FormManageKeyword_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dlv_ManageKeyword)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.DataGridView dlv_ManageKeyword;
        private System.Windows.Forms.Button but_Close;
        private System.Windows.Forms.Button but_Edit;
        private System.Windows.Forms.Button but_Add;
        private System.Windows.Forms.Button but_Delete;
        private System.Windows.Forms.Button but_Refresh;
        private System.Windows.Forms.CheckBox chk_All;
        private System.Windows.Forms.Label label28;
        private System.Windows.Forms.ComboBox cbo_Choose;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label lblYouChoose;
        private System.Windows.Forms.TextBox txt_Enter;
        private System.Windows.Forms.Label label1;

    }
}