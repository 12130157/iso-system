﻿using System;
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


        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            this.Visible = false;
            FormMain formMain = new FormMain();

            formMain.Focus();
            formMain.ShowDialog();
        }

       

        
    }
}
