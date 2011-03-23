using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SMS.model;
using SMS.dao;


namespace SMS
{
    public partial class FormManageAccount : Form
    {
        public FormManageAccount()
        {
            InitializeComponent();
        }
<<<<<<< .mine
        #region Function
 
        #endregion
        
        private void FormManageAccount_Load(object sender, EventArgs e)
        {
            dgv_manageAccount.DataSource = TaiKhoanSmsDAO.getAllDRVTaiKhoanSMS();
        
        }
        public void loadGrid()
        {
            //dlv_ManageKeyword.DataSource = CuPhapDAO.getAllDRVCuPhap();
        }
        private void butClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }
=======
        #region Function
 
        #endregion
        
        private void FormManageAccount_Load(object sender, EventArgs e)
        {
            dgv_manageAccount.DataSource = TaiKhoanSmsDAO.getAllDRVTaiKhoanSMS();
        }
        public void loadGrid()
        {
            //dlv_ManageKeyword.DataSource = CuPhapDAO.getAllDRVCuPhap();
        }
        private void butClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }
>>>>>>> .r240

        private void but_Add_Click(object sender, EventArgs e)
        {
            common.Constants.chooce = 1;
            view.FormAddAccount fr = new view.FormAddAccount();
            fr.MdiParent = this.MdiParent;
            this.Visible = false;
            fr.Show();
        }

        private void but_Edit_Click(object sender, EventArgs e)
        {
            common.Constants.chooce = 2;
            view.FormAddAccount fr = new view.FormAddAccount();
            fr.MdiParent = this.MdiParent;
            this.Visible = false;
            fr.Show();
        }

        private void dgv_manageAccount_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            common.Constants.i = dgv_manageAccount.CurrentRow.Cells["ID"].Value.ToString();
            lblYouChoose.Text = "You Choose, ID: " + common.Constants.i;
        }

    }
}
