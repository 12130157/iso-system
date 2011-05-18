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
        #region xem lai
        //FormMain myForm;
        //public FormLogin(ref FormMain fr)
        //{
        //    InitializeComponent();
        //    this.myForm = fr;
        //    //this.BackColor = System.Drawing.SystemColors.WindowFrame;
        //}
        #endregion

        public FormLogin()
        {
            InitializeComponent();
            //this.BackColor = System.Drawing.Color.Transparent;
        }

        private void butCancel_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            String userName = txtTenDN.Text.Trim();
            String password = txtMatKhau.Text.Trim();

            MemberModel memberModel = MemberDAO.getAdminByUserNameNPass(userName, password);

            if (memberModel != null)
            {
                Constants.USER_LOGIN = memberModel;
                this.Hide();
                new FormMain().Show();
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
                Environment.Exit(0);
                Dispose();
            }
        }

        private void FormLogin_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
            Environment.Exit(0);
        }
    }
}
