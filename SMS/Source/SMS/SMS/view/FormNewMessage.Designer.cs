namespace SMS.view
{
    partial class FormNewMessage
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
            this.dataBridVwNewMess = new System.Windows.Forms.DataGridView();
            this.clmSoDienThoai = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.clmNoiDungTinNhan = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dataBridVwNewMess)).BeginInit();
            this.SuspendLayout();
            // 
            // dataBridVwNewMess
            // 
            this.dataBridVwNewMess.AllowUserToAddRows = false;
            this.dataBridVwNewMess.AllowUserToDeleteRows = false;
            this.dataBridVwNewMess.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.Raised;
            this.dataBridVwNewMess.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataBridVwNewMess.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.clmSoDienThoai,
            this.clmNoiDungTinNhan});
            this.dataBridVwNewMess.Location = new System.Drawing.Point(6, 6);
            this.dataBridVwNewMess.Name = "dataBridVwNewMess";
            this.dataBridVwNewMess.ReadOnly = true;
            this.dataBridVwNewMess.RowHeadersVisible = false;
            this.dataBridVwNewMess.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataBridVwNewMess.Size = new System.Drawing.Size(294, 350);
            this.dataBridVwNewMess.TabIndex = 0;
            // 
            // clmSoDienThoai
            // 
            this.clmSoDienThoai.DataPropertyName = "So_Dien_Thoai";
            this.clmSoDienThoai.HeaderText = "Số DT";
            this.clmSoDienThoai.Name = "clmSoDienThoai";
            this.clmSoDienThoai.ReadOnly = true;
            this.clmSoDienThoai.Width = 120;
            // 
            // clmNoiDungTinNhan
            // 
            this.clmNoiDungTinNhan.DataPropertyName = "Noi_Dung_Tin_Nhan";
            this.clmNoiDungTinNhan.HeaderText = "Tin Nhắn";
            this.clmNoiDungTinNhan.Name = "clmNoiDungTinNhan";
            this.clmNoiDungTinNhan.ReadOnly = true;
            this.clmNoiDungTinNhan.Width = 172;
            // 
            // FormNewMessage
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(306, 362);
            this.Controls.Add(this.dataBridVwNewMess);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FormNewMessage";
            this.Text = "FormNewMessage";
            ((System.ComponentModel.ISupportInitialize)(this.dataBridVwNewMess)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataBridVwNewMess;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmSoDienThoai;
        private System.Windows.Forms.DataGridViewTextBoxColumn clmNoiDungTinNhan;
    }
}