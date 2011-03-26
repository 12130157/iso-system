namespace SMS.view
{
    partial class FormDetailAccount
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
            this.grp_DetailAccount = new System.Windows.Forms.GroupBox();
            this.dgv_AccountDetail = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.but_Edit = new System.Windows.Forms.Button();
            this.but_Delete = new System.Windows.Forms.Button();
            this.but_Close = new System.Windows.Forms.Button();
            this.lblYouChoose = new System.Windows.Forms.Label();
            this.grp_DetailAccount.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_AccountDetail)).BeginInit();
            this.SuspendLayout();
            // 
            // grp_DetailAccount
            // 
            this.grp_DetailAccount.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.grp_DetailAccount.Controls.Add(this.lblYouChoose);
            this.grp_DetailAccount.Controls.Add(this.but_Close);
            this.grp_DetailAccount.Controls.Add(this.but_Delete);
            this.grp_DetailAccount.Controls.Add(this.but_Edit);
            this.grp_DetailAccount.Controls.Add(this.dgv_AccountDetail);
            this.grp_DetailAccount.Location = new System.Drawing.Point(12, 65);
            this.grp_DetailAccount.Name = "grp_DetailAccount";
            this.grp_DetailAccount.Size = new System.Drawing.Size(633, 274);
            this.grp_DetailAccount.TabIndex = 0;
            this.grp_DetailAccount.TabStop = false;
            // 
            // dgv_AccountDetail
            // 
            this.dgv_AccountDetail.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.dgv_AccountDetail.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgv_AccountDetail.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgv_AccountDetail.Location = new System.Drawing.Point(15, 19);
            this.dgv_AccountDetail.Name = "dgv_AccountDetail";
            this.dgv_AccountDetail.Size = new System.Drawing.Size(601, 205);
            this.dgv_AccountDetail.TabIndex = 0;
            this.dgv_AccountDetail.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgv_AccountDetail_CellContentClick);
            // 
            // label1
            // 
            this.label1.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 21.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(206, 18);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(217, 33);
            this.label1.TabIndex = 1;
            this.label1.Text = "Account Detail";
            // 
            // but_Edit
            // 
            this.but_Edit.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.but_Edit.Location = new System.Drawing.Point(134, 245);
            this.but_Edit.Name = "but_Edit";
            this.but_Edit.Size = new System.Drawing.Size(97, 23);
            this.but_Edit.TabIndex = 1;
            this.but_Edit.Text = "Edit";
            this.but_Edit.UseVisualStyleBackColor = true;
            this.but_Edit.Click += new System.EventHandler(this.but_Edit_Click);
            // 
            // but_Delete
            // 
            this.but_Delete.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.but_Delete.Location = new System.Drawing.Point(264, 245);
            this.but_Delete.Name = "but_Delete";
            this.but_Delete.Size = new System.Drawing.Size(97, 23);
            this.but_Delete.TabIndex = 1;
            this.but_Delete.Text = "Delete";
            this.but_Delete.UseVisualStyleBackColor = true;
            this.but_Delete.Click += new System.EventHandler(this.but_Delete_Click);
            // 
            // but_Close
            // 
            this.but_Close.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.but_Close.Location = new System.Drawing.Point(386, 245);
            this.but_Close.Name = "but_Close";
            this.but_Close.Size = new System.Drawing.Size(97, 23);
            this.but_Close.TabIndex = 1;
            this.but_Close.Text = "Close";
            this.but_Close.UseVisualStyleBackColor = true;
            this.but_Close.Click += new System.EventHandler(this.but_Close_Click);
            // 
            // lblYouChoose
            // 
            this.lblYouChoose.AutoSize = true;
            this.lblYouChoose.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblYouChoose.Location = new System.Drawing.Point(12, 245);
            this.lblYouChoose.Name = "lblYouChoose";
            this.lblYouChoose.Size = new System.Drawing.Size(83, 13);
            this.lblYouChoose.TabIndex = 4;
            this.lblYouChoose.Text = "You Choose: ";
            // 
            // FormDetailAccount
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.BackColor = System.Drawing.SystemColors.InactiveCaptionText;
            this.ClientSize = new System.Drawing.Size(659, 351);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.grp_DetailAccount);
            this.Name = "FormDetailAccount";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Form Detail Account";
            this.Load += new System.EventHandler(this.FormDetailAccount_Load);
            this.grp_DetailAccount.ResumeLayout(false);
            this.grp_DetailAccount.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgv_AccountDetail)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox grp_DetailAccount;
        private System.Windows.Forms.Button but_Close;
        private System.Windows.Forms.Button but_Delete;
        private System.Windows.Forms.Button but_Edit;
        private System.Windows.Forms.DataGridView dgv_AccountDetail;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label lblYouChoose;
    }
}