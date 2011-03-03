﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SMS.model;
using SMS.common;
using SMS.dao;
using SMS.view;

namespace SMS
{
    public partial class FormLogin : Form
    {
        
        public FormLogin()
        {
            InitializeComponent();
            //this.BackgroundImage= new Bitmap("images/SentError.jpeg");
        }

        private void butCancel_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void butlogin_Click(object sender, EventArgs e)
        {
            String username = txtUserName.Text.Trim();
            String password = txtPassword.Text.Trim();

            MemberModel memberModel = MemberDAO.getMemberByUsernameAndPassword(username, password);

            if (memberModel != null)
            {
                Constants.USER_LOGIN = memberModel;
                FormMain formMain = new FormMain();
                this.Visible = false;
                formMain.Focus();
                formMain.ShowDialog();
            }
            else
            {
                MessageBox.Show(this, "Đăng Nhập Thất Bại !", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void FormLogin_Load(object sender, EventArgs e)
        {
            txtUserName.Focus();
        }
    }
}
