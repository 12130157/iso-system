using System;
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

namespace SMS.view
{
    public partial class form_Login : Form
    {
        public form_Login()
        {
            InitializeComponent();
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
                form_Main formMain = new form_Main();
                this.Visible = false;
                formMain.Focus();
                formMain.ShowDialog();
            }
            else
            {
                MessageBox.Show(this, "Đăng Nhập Thất Bại !", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }
    }
}
