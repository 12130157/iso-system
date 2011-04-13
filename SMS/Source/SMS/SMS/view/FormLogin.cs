using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using SMS.dao;
using SMS.model;
//using SMS.util;
using SMS.common;
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
            String userName = txtTenDN.Text.Trim();
            String password = txtMatKhau.Text.Trim();

            MemberModel memberModel = MemberDAO.getAdminByUserNameNPass(userName, password);

            if (memberModel != null)
            {
                Constants.USER_LOGIN = memberModel;
                FormMain formMain = new FormMain();
                this.Hide();
                formMain.ShowDialog();
            }
            else
            {
                MessageBox.Show(this, "Đăng Nhập Thất Bại !", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Ban co chac chan thoat khoi ung dung ?", "Xac Nhan Thoat .", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                Application.Exit();
                Dispose();
            }
        }
    }
}
