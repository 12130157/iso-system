using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SMS.dao;


namespace SMS.view
{
    public partial class FormDetailAccount : Form
    {
        ChiTietTaiKhoanSmsDAO ctTaiKhoanSMS = new ChiTietTaiKhoanSmsDAO();
        public FormDetailAccount()
        {
            InitializeComponent();
        }

        private void Loaddata()
        {
            dgv_AccountDetail.DataSource = ctTaiKhoanSMS.getAllChiTietTaiKhoanSms(Convert.ToInt32(common.Constants.id));
            lblYouChoose.Text = "";
        }

        private void FormDetailAccount_Load(object sender, EventArgs e)
        {
            Loaddata();
            common.Constants.Ma_tai_khoan_SMS = "";
        }

        private void but_Edit_Click(object sender, EventArgs e)
        {
            if (lblYouChoose.Text.Equals(""))
            {
                MessageBox.Show("Choose Account details: ");
            }
            else
            {
                common.Constants.chooce = 2;
                view.FormAddAccount fr = new view.FormAddAccount();
                fr.MdiParent = this.MdiParent;
                this.Visible = false;
                fr.Show();
            }
        }

        private void dgv_AccountDetail_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            common.Constants.idDetail = dgv_AccountDetail.CurrentRow.Cells["ID"].Value.ToString();
             common.Constants.Ma_tai_khoan_SMS = dgv_AccountDetail.CurrentRow.Cells["Account ID"].Value.ToString();

            lblYouChoose.Text = "You Choose, ID: " + common.Constants.idDetail;
        }

        private void but_Close_Click(object sender, EventArgs e)
        {
            FormManageAccount fr = new FormManageAccount();
            fr.MdiParent=this.MdiParent;
            fr.Show();
            this.Close();
        }

        private void but_Delete_Click(object sender, EventArgs e)
        {
            if (lblYouChoose.Text.Equals(""))
            {
                MessageBox.Show("You may choose to delete the line. Plesae choose again ");
            }
            else
            {
                String result1 = Convert.ToString(MessageBox.Show("Do you want to Deleting? ", "Important Question", MessageBoxButtons.YesNo));
                if (result1.Equals("Yes"))
                {
                    Boolean result = ctTaiKhoanSMS.deletechiTietTaiKhoanSMS(Convert.ToInt32(common.Constants.idDetail));
                    if (result.Equals(true))
                    {
                        MessageBox.Show("Deleting susseccfull!!! ");
                        Loaddata();
                    }
                    else
                    {
                        MessageBox.Show("Deleting failed!!! ");
                    }
                }
                else
                {
                    Loaddata() ;
                }
            }
        }

        private void but_Add_Click(object sender, EventArgs e)
        {
            
            common.Constants.chooce = 1;
            common.Constants.chooseUpdate = 1;
            //view.FormAddAccount fr = new view.FormAddAccount();
            //fr.MdiParent = this.MdiParent;
            //this.Visible = false;
            //fr.Show();
            pnl_Add.Enabled = true;
        }
    }
}
