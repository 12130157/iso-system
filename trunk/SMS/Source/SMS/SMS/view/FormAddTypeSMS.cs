using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SMS.dao;
using SMS.model;
using SMS.common;

namespace SMS.view
{
    public partial class FormAddTypeSMS : Form
    {
        #region khai bao bien
        LoaiTaiKhoanSmsDAO loaitaikhoansmsDao = new LoaiTaiKhoanSmsDAO();
        #endregion
        public FormAddTypeSMS()
        {
            InitializeComponent();
        }

        private void FormAddTypeSMS_Load(object sender, EventArgs e)
        {
            dgv_Account.DataSource = loaitaikhoansmsDao.getAllLoaiTaiKhoanSMS2();
        }

        private void dgv_Account_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            but_CapNhat.Enabled = true;
            txt_TypeAccount.Text = dgv_Account.CurrentRow.Cells["Ten hop thu"].Value.ToString();
            txt_ServiceCharges.Text = dgv_Account.CurrentRow.Cells["Phi dich vu"].Value.ToString();
            txt_Note.Text = dgv_Account.CurrentRow.Cells["Ghi chu"].Value.ToString();
        }

    }
}
