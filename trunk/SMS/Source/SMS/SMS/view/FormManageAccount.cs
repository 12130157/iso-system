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
using SMS.view;
using System.Resources;


namespace SMS
{
    public partial class FormManageAccount : Form
    {
        #region khai bao bien
            ChiTietTaiKhoanSmsDAO ctTaiKhoanSMSDao = new ChiTietTaiKhoanSmsDAO();
            TaiKhoanSmsDAO taikhoanSMSDao = new TaiKhoanSmsDAO();
            string phone = "";
            String id = "";
        #endregion

        #region Xu kien double Click

                public FormManageAccount()
                {
                    InitializeComponent();
                }

               public void FormManageAccount_Load(object sender, EventArgs e)
                {
                    try
                    {
                        dgv_manageAccount.DataSource = TaiKhoanSmsDAO.getAllDRVTaiKhoanSMS();
                        dgv_manageAccount.Refresh();
                        lblYouChoose.Text = "Bạn chọn dòng: ";
                    }
                    catch (Exception)
                    {
                        
                        throw;
                    }

                }

            #endregion
 
        #region Function
 
        #endregion

        #region xu kien onClick

               private void butClose_Click(object sender, EventArgs e)
               {
                   if (MessageBox.Show("Bạn có muốn thoát không? ", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                   {
                       this.Close();
                   }
               }

            private void but_Add_Click(object sender, EventArgs e)
            {
                common.Constants.choose = 1;
                view.FormAddAccount fr = new view.FormAddAccount();
                fr.MdiParent = this.MdiParent;
                fr.Show();
                
                //FormManageAccount fr1 = new FormManageAccount();
                //FormAddAccount lg = new FormAddAccount(ref fr1);
                //lg.MdiParent = this.MdiParent;
                //lg.Show();

            }

            private void but_Details_Click(object sender, EventArgs e)
            {
                try
                {
                    if (common.Constants.id.Equals(""))
                    {
                        MessageBox.Show("Bạn chưa chọn dòng để xem. Vui lòng chọn lại: ");
                    }
                    else
                    {
                        view.FormDetailAccount fr = new view.FormDetailAccount();
                        fr.MdiParent = this.MdiParent;
                        fr.Show();
                        Enablebut();
                    }
                }
                catch (Exception)
                {
                    
                    throw;
                }
            }

            private void but_Edit_Click(object sender, EventArgs e)
            {
                try
                {
                    if (common.Constants.id.Equals(""))
                    {
                        MessageBox.Show("Bạn chưa chọn dòng để cập nhật. Vui lòng chọn lại: ");
                    }
                    else
                    {
                        common.Constants.choose = 2;
                        view.FormAddAccount fr = new view.FormAddAccount();
                        fr.MdiParent = this.MdiParent;
                        fr.Show();
                        Enablebut();
                    }
                }
                catch (Exception)
                {
                    
                    throw;
                }
            }

            private void but_Delete_Click(object sender, EventArgs e)
            {
                try
                {
                    if (common.Constants.id.Equals(""))
                    {
                        MessageBox.Show("Bạn chưa chọn dòng để xóa. Vui lòng chọn lại: ");
                    }
                    else
                    {
                        if (MessageBox.Show(this, "Bạn có chắc là muốn xóa?  ", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
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
                                MessageBox.Show("Không Thể Xóa  ");
                                common.Constants.id = "";
                            }
                        }
                    }
                    
                }
                catch (Exception)
                {
                    
                    throw;
                }
                Enablebut();
            }

        #endregion


            private void dgv_manageAccount_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
            {
                try
                {
                    common.Constants.id = dgv_manageAccount.CurrentRow.Cells["Ma TK SMS"].Value.ToString();
                    lblYouChoose.Text = "Bạn đang chọn dòng có Mã Tài Khoản là: " + common.Constants.id;
                    but_Delete.Enabled = true;
                    but_Details.Enabled = true;
                    but_Edit.Enabled = true;
                }
                catch (Exception)
                {
                    throw;
                }
               
            }

            private void Enablebut()
            {
                but_Delete.Enabled = false;
                but_Details.Enabled = false;
                but_Edit.Enabled = false;
                lblYouChoose.Text = "Bạn chọn dòng: ";
            }

            private void FormManageAccount_Activated(object sender, EventArgs e)
            {
                FormManageAccount_Load(sender, e);
            }

            private void txt_Numberphone_TextChanged(object sender, EventArgs e)
            {
                try
                {
                  
                    phone = txt_Numberphone.Text;
                    id = txt_StudentID.Text;

                    dgv_manageAccount.DataSource = taikhoanSMSDao.getPhoneIDAllDRVTaiKhoanSMS(phone, id);
                    //txt_StudentID.Text = "";
                    //txt_Numberphone.Text = "";
                }
                catch (Exception)
                {
                    throw;
                }
            }

            private void txt_StudentID_TextChanged(object sender, EventArgs e)
            {
                try
                {
                    
                    phone = txt_Numberphone.Text;
                    id = txt_StudentID.Text;

                    dgv_manageAccount.DataSource = taikhoanSMSDao.getPhoneIDAllDRVTaiKhoanSMS(phone, id);
                    //txt_StudentID.Text = "";
                    //txt_Numberphone.Text = "";
                }
                catch (Exception)
                {
                    throw;
                }
            }

    }
}
