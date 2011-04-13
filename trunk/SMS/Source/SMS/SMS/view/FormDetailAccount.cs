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


namespace SMS.view
{
    public partial class FormDetailAccount : Form
    {
        #region Khoi tao bien
            FormManageAccount formAccount = new FormManageAccount();
            TaiKhoanSmsMODEL taiKhoanSMSModel = new TaiKhoanSmsMODEL();
            TaiKhoanSmsDAO taiKhoanSMSDao = new TaiKhoanSmsDAO();
            LoaiTaiKhoanSmsMODEL loaiTaiKhoanSMSModel = new LoaiTaiKhoanSmsMODEL();
            LoaiTaiKhoanSmsDAO loaiTaiKhoanSMSDao = new LoaiTaiKhoanSmsDAO();
            ChiTietTaiKhoanSmsMODEL ctTaiKhoanSMSModel = new ChiTietTaiKhoanSmsMODEL();
            ChiTietTaiKhoanSmsDAO ctTaiKhoanSMSDao = new ChiTietTaiKhoanSmsDAO();
        #endregion

        #region  cac su kien double Click 

            public FormDetailAccount()
                {
                    InitializeComponent();
                }

            private void FormDetailAccount_Load(object sender, EventArgs e)
            {
                dgv_AccountDetail.DataSource = ctTaiKhoanSMSDao.getAllChiTietTaiKhoanSms(Convert.ToInt32(common.Constants.id));
                lblYouChoose.Text = "Enter Choose row: ";
                common.Constants.Ma_tai_khoan_SMS = "";
                pnl_Add.Visible = false;
            }

            private void dgv_AccountDetail_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
            {
                common.Constants.idDetail = dgv_AccountDetail.CurrentRow.Cells["ID"].Value.ToString();
                common.Constants.Ma_tai_khoan_SMS = dgv_AccountDetail.CurrentRow.Cells["Account ID"].Value.ToString();

                lblYouChoose.Text = "You Choose, ID: " + common.Constants.idDetail;
            }

        #endregion

        #region  cac su kien onClick 
        
            private void but_Edit_Click(object sender, EventArgs e)
            {
                pnl_Add.Visible = true;
                ctTaiKhoanSMSModel = ctTaiKhoanSMSDao.getChiTietTaiKhoanSMSByID(Convert.ToInt32(common.Constants.idDetail));
                txt_RegistrationMonth.Text = ctTaiKhoanSMSModel.Dang_Ki_Thang;
                txt_Registrationyear.Text = ctTaiKhoanSMSModel.Dang_Ki_Nam;
                common.Constants.idDetail = "";
                common.Constants.chooseUpdate = 1;
                lblYouChoose.Text = "Enter Choose row: ";

            }

            private void but_Close_Click(object sender, EventArgs e)
            {
                FormManageAccount fr = new FormManageAccount();
                fr.MdiParent = this.MdiParent;
                fr.Show();
                common.Constants.id = "";
                this.Close();
            }

            private void but_Delete_Click(object sender, EventArgs e)
            {
                if (common.Constants.idDetail.Equals(""))
                {
                    MessageBox.Show("You may choose to delete the line. Plesae choose again ");
                }
                else
                {
                    if (MessageBox.Show(this, "Do you want to Deleting?  ", " Notice ", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                    {
                        Boolean result = ctTaiKhoanSMSDao.deletechiTietTaiKhoanSMS(Convert.ToInt32(common.Constants.idDetail));
                        if (result.Equals(true))
                        {
                            FormDetailAccount_Load(sender, e);
                            common.Constants.idDetail = "";
                        }
                        else
                        {
                            MessageBox.Show("Deleting failed!!! ");
                        }
                    }
                    else
                    {
                        FormDetailAccount_Load(sender, e);
                    }
                }
            }

            private void but_Add_Click(object sender, EventArgs e)
            {
                common.Constants.choose = 1;
                pnl_Add.Visible = true;
            }

            private void but_Close2_Click(object sender, EventArgs e)
            {
                pnl_Add.Visible = false;
            }

            private void but_Ok_Click(object sender, EventArgs e)
            {
                if (common.Constants.chooseUpdate == 1)
                {
                    ctTaiKhoanSMSModel.Ma_Tai_Khoan_Sms = common.Constants.id;
                    ctTaiKhoanSMSModel.Dang_Ki_Thang = txt_RegistrationMonth.Text.ToString();
                    ctTaiKhoanSMSModel.Dang_Ki_Nam = txt_Registrationyear.Text.ToString();
                    bool result = ctTaiKhoanSMSDao.updateChiTietTaiKhoanSMS(ctTaiKhoanSMSModel);
                    if (result == true)
                    {
                            FormDetailAccount_Load(sender, e);
                            pnl_Add.Visible = false;
                            common.Constants.chooseUpdate = 0;
                    }
                    else
                    { MessageBox.Show("Insert failed"); }
                }
                else
                {
                    ctTaiKhoanSMSModel.Ma_Tai_Khoan_Sms = common.Constants.id;
                    ctTaiKhoanSMSModel.Dang_Ki_Thang = txt_RegistrationMonth.Text.ToString();
                    ctTaiKhoanSMSModel.Dang_Ki_Nam = txt_Registrationyear.Text.ToString();
                    bool result = ctTaiKhoanSMSDao.insertChiTietTaiKhoan(ctTaiKhoanSMSModel);
                    if (result == true)
                    {
                        if (MessageBox.Show(this, "Are you sure you want to continue? ", "Notice", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                        {
                            FormDetailAccount_Load(sender, e);
                            txt_RegistrationMonth.Text = "";
                            txt_Registrationyear.Text = "";
                        }
                        else
                        {
                            FormDetailAccount_Load(sender, e);
                            pnl_Add.Visible = false;
                        }
                    }
                    else
                    { MessageBox.Show("Insert failed"); }
                }
            }
        #endregion

        
    }
}
