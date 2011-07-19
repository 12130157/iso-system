namespace nhungfileexcel
{
    partial class frmindiem
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
            this.components = new System.ComponentModel.Container();
            this.dtgrid_chuakyten = new System.Windows.Forms.DataGridView();
            this.dtgrid_dakyten = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.cmdin_dakyten = new System.Windows.Forms.Button();
            this.cmdintatca_dakyten = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.button5 = new System.Windows.Forms.Button();
            this.cmdreset = new System.Windows.Forms.Button();
            this.txtmatkhau = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.button4 = new System.Windows.Forms.Button();
            this.txtfileexcel = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.txttongsothisinhdakyten = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.txttongsothisinhduthi = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.cbocathi = new System.Windows.Forms.ComboBox();
            this.label6 = new System.Windows.Forms.Label();
            this.cbonghe = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.cbomonthi = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.dateTimePicker_tungay = new System.Windows.Forms.DateTimePicker();
            this.txtgiothi = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.tt = new System.Windows.Forms.Timer(this.components);
            this.opf = new System.Windows.Forms.OpenFileDialog();
            this.txtkythi = new System.Windows.Forms.TextBox();
            this.label13 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dtgrid_chuakyten)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dtgrid_dakyten)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dtgrid_chuakyten
            // 
            this.dtgrid_chuakyten.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgrid_chuakyten.Location = new System.Drawing.Point(517, 299);
            this.dtgrid_chuakyten.Name = "dtgrid_chuakyten";
            this.dtgrid_chuakyten.Size = new System.Drawing.Size(452, 333);
            this.dtgrid_chuakyten.TabIndex = 0;
            this.dtgrid_chuakyten.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dtgrid_chuakyten_CellClick);
            this.dtgrid_chuakyten.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dtgrid_chuakyten_CellContentClick);
            // 
            // dtgrid_dakyten
            // 
            this.dtgrid_dakyten.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgrid_dakyten.Location = new System.Drawing.Point(48, 299);
            this.dtgrid_dakyten.Name = "dtgrid_dakyten";
            this.dtgrid_dakyten.Size = new System.Drawing.Size(442, 333);
            this.dtgrid_dakyten.TabIndex = 1;
            this.dtgrid_dakyten.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dtgrid_dakyten_CellClick);
            this.dtgrid_dakyten.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dtgrid_dakyten_CellContentClick);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.SystemColors.MenuHighlight;
            this.label1.Location = new System.Drawing.Point(45, 278);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(198, 16);
            this.label1.TabIndex = 2;
            this.label1.Text = "Danh sách học viên đã ký tên";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.SystemColors.MenuHighlight;
            this.label2.Location = new System.Drawing.Point(517, 278);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(214, 16);
            this.label2.TabIndex = 3;
            this.label2.Text = "Danh sách học viên chưa ký tên";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Tahoma", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.OrangeRed;
            this.label3.Location = new System.Drawing.Point(328, 9);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(385, 33);
            this.label3.TabIndex = 4;
            this.label3.Text = "IN BÀI LÀM CHO HỌC VIÊN";
            // 
            // cmdin_dakyten
            // 
            this.cmdin_dakyten.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmdin_dakyten.Location = new System.Drawing.Point(48, 649);
            this.cmdin_dakyten.Name = "cmdin_dakyten";
            this.cmdin_dakyten.Size = new System.Drawing.Size(168, 25);
            this.cmdin_dakyten.TabIndex = 5;
            this.cmdin_dakyten.Text = "In bài làm HV đã ký tên";
            this.cmdin_dakyten.UseVisualStyleBackColor = true;
            this.cmdin_dakyten.Click += new System.EventHandler(this.cmdin_dakyten_Click);
            // 
            // cmdintatca_dakyten
            // 
            this.cmdintatca_dakyten.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmdintatca_dakyten.Location = new System.Drawing.Point(322, 650);
            this.cmdintatca_dakyten.Name = "cmdintatca_dakyten";
            this.cmdintatca_dakyten.Size = new System.Drawing.Size(168, 25);
            this.cmdintatca_dakyten.TabIndex = 6;
            this.cmdintatca_dakyten.Text = "In tất cả HV đã ký tên";
            this.cmdintatca_dakyten.UseVisualStyleBackColor = true;
            this.cmdintatca_dakyten.Click += new System.EventHandler(this.cmdintatca_dakyten_Click);
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.Location = new System.Drawing.Point(784, 649);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(185, 25);
            this.button1.TabIndex = 8;
            this.button1.Text = "In tất cả HV chưa ký tên";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button2.Location = new System.Drawing.Point(517, 650);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(184, 25);
            this.button2.TabIndex = 7;
            this.button2.Text = "In bài làm HV chưa ký tên";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button3
            // 
            this.button3.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button3.Location = new System.Drawing.Point(576, 185);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(275, 25);
            this.button3.TabIndex = 9;
            this.button3.Text = "Refresh";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.txtkythi);
            this.groupBox1.Controls.Add(this.label13);
            this.groupBox1.Controls.Add(this.button5);
            this.groupBox1.Controls.Add(this.cmdreset);
            this.groupBox1.Controls.Add(this.txtmatkhau);
            this.groupBox1.Controls.Add(this.label12);
            this.groupBox1.Controls.Add(this.button4);
            this.groupBox1.Controls.Add(this.txtfileexcel);
            this.groupBox1.Controls.Add(this.label11);
            this.groupBox1.Controls.Add(this.txttongsothisinhdakyten);
            this.groupBox1.Controls.Add(this.label10);
            this.groupBox1.Controls.Add(this.txttongsothisinhduthi);
            this.groupBox1.Controls.Add(this.label9);
            this.groupBox1.Controls.Add(this.cbocathi);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.cbonghe);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.cbomonthi);
            this.groupBox1.Controls.Add(this.button3);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(47, 41);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(922, 222);
            this.groupBox1.TabIndex = 10;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Thông tin bài làm";
            // 
            // button5
            // 
            this.button5.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button5.Location = new System.Drawing.Point(576, 63);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(275, 25);
            this.button5.TabIndex = 28;
            this.button5.Text = "In Bản tổng hợp kết quả thi";
            this.button5.UseVisualStyleBackColor = true;
            this.button5.Click += new System.EventHandler(this.button5_Click);
            // 
            // cmdreset
            // 
            this.cmdreset.Enabled = false;
            this.cmdreset.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmdreset.Location = new System.Drawing.Point(857, 98);
            this.cmdreset.Name = "cmdreset";
            this.cmdreset.Size = new System.Drawing.Size(59, 25);
            this.cmdreset.TabIndex = 27;
            this.cmdreset.Text = "Reset";
            this.cmdreset.UseVisualStyleBackColor = true;
            this.cmdreset.Click += new System.EventHandler(this.cmdreset_Click);
            // 
            // txtmatkhau
            // 
            this.txtmatkhau.Location = new System.Drawing.Point(576, 100);
            this.txtmatkhau.Name = "txtmatkhau";
            this.txtmatkhau.PasswordChar = '*';
            this.txtmatkhau.Size = new System.Drawing.Size(275, 23);
            this.txtmatkhau.TabIndex = 26;
            this.txtmatkhau.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.txtmatkhau.KeyDown += new System.Windows.Forms.KeyEventHandler(this.txtmatkhau_KeyDown);
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.ForeColor = System.Drawing.SystemColors.ControlText;
            this.label12.Location = new System.Drawing.Point(479, 103);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(93, 16);
            this.label12.TabIndex = 25;
            this.label12.Text = "Reset dữ liệu";
            // 
            // button4
            // 
            this.button4.Font = new System.Drawing.Font("Tahoma", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button4.Location = new System.Drawing.Point(857, 154);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(59, 25);
            this.button4.TabIndex = 24;
            this.button4.Text = "---";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // txtfileexcel
            // 
            this.txtfileexcel.Enabled = false;
            this.txtfileexcel.Location = new System.Drawing.Point(576, 156);
            this.txtfileexcel.Name = "txtfileexcel";
            this.txtfileexcel.Size = new System.Drawing.Size(275, 23);
            this.txtfileexcel.TabIndex = 23;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.ForeColor = System.Drawing.SystemColors.ControlText;
            this.label11.Location = new System.Drawing.Point(473, 160);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(100, 16);
            this.label11.TabIndex = 22;
            this.label11.Text = "Nhập File Excel";
            // 
            // txttongsothisinhdakyten
            // 
            this.txttongsothisinhdakyten.Enabled = false;
            this.txttongsothisinhdakyten.Location = new System.Drawing.Point(306, 190);
            this.txttongsothisinhdakyten.Name = "txttongsothisinhdakyten";
            this.txttongsothisinhdakyten.Size = new System.Drawing.Size(104, 23);
            this.txttongsothisinhdakyten.TabIndex = 21;
            this.txttongsothisinhdakyten.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.ForeColor = System.Drawing.SystemColors.ControlText;
            this.label10.Location = new System.Drawing.Point(134, 193);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(174, 16);
            this.label10.TabIndex = 20;
            this.label10.Text = "Tổng số thí sinh đã ký tên";
            // 
            // txttongsothisinhduthi
            // 
            this.txttongsothisinhduthi.Enabled = false;
            this.txttongsothisinhduthi.Location = new System.Drawing.Point(306, 161);
            this.txttongsothisinhduthi.Name = "txttongsothisinhduthi";
            this.txttongsothisinhduthi.Size = new System.Drawing.Size(104, 23);
            this.txttongsothisinhduthi.TabIndex = 11;
            this.txttongsothisinhduthi.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(7, 163);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(302, 16);
            this.label9.TabIndex = 10;
            this.label9.Text = "Tổng số thí sinh đủ điều kiện dự thi theo nghề";
            // 
            // cbocathi
            // 
            this.cbocathi.FormattingEnabled = true;
            this.cbocathi.Location = new System.Drawing.Point(72, 99);
            this.cbocathi.Name = "cbocathi";
            this.cbocathi.Size = new System.Drawing.Size(338, 24);
            this.cbocathi.TabIndex = 5;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(23, 102);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(45, 16);
            this.label6.TabIndex = 4;
            this.label6.Text = "Ca thi";
            // 
            // cbonghe
            // 
            this.cbonghe.FormattingEnabled = true;
            this.cbonghe.Location = new System.Drawing.Point(72, 129);
            this.cbonghe.Name = "cbonghe";
            this.cbonghe.Size = new System.Drawing.Size(338, 24);
            this.cbonghe.TabIndex = 3;
            this.cbonghe.SelectedIndexChanged += new System.EventHandler(this.cbonghe_SelectedIndexChanged);
            this.cbonghe.SelectedValueChanged += new System.EventHandler(this.cbonghe_SelectedValueChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(28, 132);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(40, 16);
            this.label5.TabIndex = 2;
            this.label5.Text = "Nghề";
            // 
            // cbomonthi
            // 
            this.cbomonthi.FormattingEnabled = true;
            this.cbomonthi.Location = new System.Drawing.Point(72, 69);
            this.cbomonthi.Name = "cbomonthi";
            this.cbomonthi.Size = new System.Drawing.Size(338, 24);
            this.cbomonthi.TabIndex = 1;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(12, 72);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(56, 16);
            this.label4.TabIndex = 0;
            this.label4.Text = "Môn thi";
            // 
            // dateTimePicker_tungay
            // 
            this.dateTimePicker_tungay.CustomFormat = "dd\'/\'MM\'/\'yyyy";
            this.dateTimePicker_tungay.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dateTimePicker_tungay.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dateTimePicker_tungay.Location = new System.Drawing.Point(821, 11);
            this.dateTimePicker_tungay.Name = "dateTimePicker_tungay";
            this.dateTimePicker_tungay.Size = new System.Drawing.Size(148, 22);
            this.dateTimePicker_tungay.TabIndex = 17;
            this.dateTimePicker_tungay.Visible = false;
            // 
            // txtgiothi
            // 
            this.txtgiothi.Location = new System.Drawing.Point(796, 12);
            this.txtgiothi.Name = "txtgiothi";
            this.txtgiothi.Size = new System.Drawing.Size(148, 21);
            this.txtgiothi.TabIndex = 9;
            this.txtgiothi.Visible = false;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(747, 15);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(37, 13);
            this.label8.TabIndex = 8;
            this.label8.Text = "Giờ thi";
            this.label8.Visible = false;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(759, 15);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(47, 13);
            this.label7.TabIndex = 6;
            this.label7.Text = "Ngày thi";
            this.label7.Visible = false;
            // 
            // tt
            // 
            this.tt.Enabled = true;
            this.tt.Interval = 3000;
            this.tt.Tick += new System.EventHandler(this.tt_Tick);
            // 
            // opf
            // 
            this.opf.FileName = "c:\\data.xls";
            this.opf.Filter = "Excel Worksheets|*.xls";
            // 
            // txtkythi
            // 
            this.txtkythi.Location = new System.Drawing.Point(73, 33);
            this.txtkythi.Name = "txtkythi";
            this.txtkythi.Size = new System.Drawing.Size(337, 23);
            this.txtkythi.TabIndex = 30;
            this.txtkythi.Text = "KỲ THI KỸ NĂNG NGHỀ";
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.ForeColor = System.Drawing.SystemColors.ControlText;
            this.label13.Location = new System.Drawing.Point(24, 36);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(45, 16);
            this.label13.TabIndex = 29;
            this.label13.Text = "Kỳ thi";
            // 
            // frmindiem
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(988, 687);
            this.Controls.Add(this.dateTimePicker_tungay);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.txtgiothi);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.cmdintatca_dakyten);
            this.Controls.Add(this.cmdin_dakyten);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dtgrid_dakyten);
            this.Controls.Add(this.dtgrid_chuakyten);
            this.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.MaximizeBox = false;
            this.Name = "frmindiem";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "In bài làm cho học viên";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dtgrid_chuakyten)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dtgrid_dakyten)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dtgrid_chuakyten;
        private System.Windows.Forms.DataGridView dtgrid_dakyten;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button cmdin_dakyten;
        private System.Windows.Forms.Button cmdintatca_dakyten;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ComboBox cbonghe;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ComboBox cbomonthi;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox cbocathi;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox txtgiothi;
        private System.Windows.Forms.DateTimePicker dateTimePicker_tungay;
        private System.Windows.Forms.Timer tt;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox txttongsothisinhduthi;
        private System.Windows.Forms.TextBox txttongsothisinhdakyten;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox txtfileexcel;
        private System.Windows.Forms.OpenFileDialog opf;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button cmdreset;
        private System.Windows.Forms.TextBox txtmatkhau;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.TextBox txtkythi;
        private System.Windows.Forms.Label label13;
    }
}

