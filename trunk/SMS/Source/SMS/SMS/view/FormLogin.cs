using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SMS
{
    public partial class FormLogin : Form
    {
        public FormLogin()
        {
            InitializeComponent();
        }

        private void butCancel_Click(object sender, EventArgs e)
        {
            Close();
        }



        private void butlogin_Click(object sender, EventArgs e)
        {
            FormMain formMain = new FormMain();
            this.Visible = false;
            formMain.Focus();
            formMain.ShowDialog();
        }

       

        
    }
}
