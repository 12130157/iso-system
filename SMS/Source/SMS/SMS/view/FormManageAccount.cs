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
using System.Reflection;

namespace SMS
{
    public partial class FormManageAccount : Form
    {
        #region khai bao bien
            ChiTietTaiKhoanSmsDAO ctTaiKhoanSMSDao = new ChiTietTaiKhoanSmsDAO();
            TaiKhoanSmsDAO taikhoanSMSDao = new TaiKhoanSmsDAO();
        #endregion

        #region Xu kien double Click

                public FormManageAccount()
                {
                    InitializeComponent();
                }

                private void FormManageAccount_Load(object sender, EventArgs e)
                {
                    dgv_manageAccount.DataSource = TaiKhoanSmsDAO.getAllDRVTaiKhoanSMS();
                    lblYouChoose.Text = "Enter choose row: ";

                }

                //private void dgv_manageAccount_CellContentClick(object sender, DataGridViewCellEventArgs e)
                //{
                   
                //}

            #endregion
 
        #region Function
 
        #endregion

        #region xu kien onClick

            private void butClose_Click(object sender, EventArgs e)
                {
                    this.Close();
                }

            private void but_Add_Click(object sender, EventArgs e)
            {
                common.Constants.choose = 1;
                view.FormAddAccount fr = new view.FormAddAccount();
                fr.MdiParent = this.MdiParent;
                this.Visible = false;
                fr.Show();
            }

            private void but_Details_Click(object sender, EventArgs e)
            {
                if (common.Constants.id.Equals(""))
                {
                    MessageBox.Show("You may choose to detail the line. Plesae choose again: ");
                }
                else
                {
                    //common.Constants.chooce = 2;
                    view.FormDetailAccount fr = new view.FormDetailAccount();
                    fr.MdiParent = this.MdiParent;
                    this.Visible = false;
                    fr.Show();
                }
            }

            private void but_Edit_Click(object sender, EventArgs e)
            {
                if (common.Constants.id.Equals(""))
                {
                    MessageBox.Show("You may choose to edit the line. Plesae choose again: ");
                }
                else
                {
                    common.Constants.choose = 2;
                    view.FormAddAccount fr = new view.FormAddAccount();
                    fr.MdiParent = this.MdiParent;
                    this.Visible = false;
                    fr.Show();
                }
            }

            private void but_Delete_Click(object sender, EventArgs e)
            {
                if (common.Constants.id.Equals(""))
                {
                    MessageBox.Show("You may choose to delete the line. Plesae choose again: ");
                }
                else
                {
                    if (MessageBox.Show(this, "Are you sure you want to Deleted?  ", "Notice", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                    {
                        bool result = ctTaiKhoanSMSDao.deleteAllchiTietTaiKhoanSMS(Convert.ToInt32(common.Constants.id));
                        bool result1 = taikhoanSMSDao.deleteTaiKhoanSMS(Convert.ToInt32(common.Constants.id));
                        if (result == true && result1 == true)
                        {
                            FormManageAccount_Load(sender, e);

                            common.Constants.id = "";
                        }
                        else
                        {
                            MessageBox.Show("Deleting faile!!!  ");
                            common.Constants.id = "";
                        }
                    }
                }
                but_Delete.Enabled = false;
                but_Details.Enabled = false;
                but_Edit.Enabled = false;
               
            }

        #endregion

            private void but_Refresh_Click(object sender, EventArgs e)
            {
                string phone = "";
                String id = "";
                phone = txt_Numberphone.Text;
                id = txt_StudentID.Text;
              
                dgv_manageAccount.DataSource = taikhoanSMSDao.getPhoneIDAllDRVTaiKhoanSMS(phone,id);
                txt_StudentID.Text = "";
                txt_Numberphone.Text = "";
            }

            private void dgv_manageAccount_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
            {
                common.Constants.id = dgv_manageAccount.CurrentRow.Cells["ID"].Value.ToString();
                lblYouChoose.Text = "You Choose ID: " + common.Constants.id;
                but_Delete.Enabled = true;
                but_Details.Enabled = true;
                but_Edit.Enabled = true;
               
            }

    }
}
