namespace nhungfileexcel
{
    partial class frmrptbailam
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
            this.cv = new CrystalDecisions.Windows.Forms.CrystalReportViewer();
            this.SuspendLayout();
            // 
            // cv
            // 
            this.cv.ActiveViewIndex = -1;
            this.cv.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.cv.DisplayGroupTree = false;
            this.cv.Dock = System.Windows.Forms.DockStyle.Fill;
            this.cv.Location = new System.Drawing.Point(0, 0);
            this.cv.Name = "cv";
            this.cv.SelectionFormula = "";
            this.cv.Size = new System.Drawing.Size(292, 273);
            this.cv.TabIndex = 0;
            this.cv.ViewTimeSelectionFormula = "";
            // 
            // frmrptbailam
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(292, 273);
            this.Controls.Add(this.cv);
            this.Name = "frmrptbailam";
            this.Text = "frmrptbailam";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.frmrptbailam_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private CrystalDecisions.Windows.Forms.CrystalReportViewer cv;
    }
}