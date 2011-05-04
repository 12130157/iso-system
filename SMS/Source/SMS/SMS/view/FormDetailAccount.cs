﻿using System;
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
                try
                {
                    dgv_AccountDetail.DataSource = ctTaiKhoanSMSDao.getAllChiTietTaiKhoanSms(common.Constants.id);
                    lblYouChoose.Text = "Bạn chọn dòng: ";
                    common.Constants.Ma_tai_khoan_SMS = "";
                    pnl_Add.Visible = false;
                }
                catch (Exception)
                {
                    throw;
                }
            }

            private void dgv_AccountDetail_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
            {
                try
                {
                    common.Constants.idDetail = dgv_AccountDetail.CurrentRow.Cells["Ma CTTK SMS"].Value.ToString();
                    common.Constants.Ma_tai_khoan_SMS = dgv_AccountDetail.CurrentRow.Cells["Ma TK SMS"].Value.ToString();

                    lblYouChoose.Text = "Bạn chọn Ma CTTK SMS: " + common.Constants.idDetail;
                    but_Delete.Enabled = true;
                    but_Edit.Enabled = true;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(Convert.ToString(ex));
                }
            }

        #endregion

        #region  cac su kien onClick 
        
            private void but_Edit_Click(object sender, EventArgs e)
            {
                try
                {
                    pnl_Add.Visible = true;
                    lb_tilte.Text = "Cập Nhật Thông Tin Tài Khoản";
                    but_Ok.Text = "Cập Nhật";
                    ctTaiKhoanSMSModel = ctTaiKhoanSMSDao.getChiTietTaiKhoanSMSByID(Convert.ToInt32(common.Constants.idDetail));
                    txt_RegistrationMonth.Text = ctTaiKhoanSMSModel.Dang_Ki_Thang;
                    txt_Registrationyear.Text = ctTaiKhoanSMSModel.Dang_Ki_Nam;
                    common.Constants.idDetail = "";
                    common.Constants.chooseUpdate = 1;
                    lblYouChoose.Text = "Bạn chọn dòng: ";
                    but_Delete.Enabled = false;
                    but_Edit.Enabled = false;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(Convert.ToString(ex));
                }

            }

            private void but_Close_Click(object sender, EventArgs e)
            {
                common.Constants.id = "";
                this.Close();
            }

            private void but_Delete_Click(object sender, EventArgs e)
            {
                try
                {
                    if (common.Constants.idDetail.Equals(""))
                    {
                        MessageBox.Show("Bạn chưa chọn dòng để xóa. Vui long chọn lại!!!   ");
                    }
                    else
                    {
                        if (MessageBox.Show(this, "bạn có chắc là muốn Xóa không?   ", " Thông Báo ", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                        {
                            try
                            {
                                Boolean result = ctTaiKhoanSMSDao.deletechiTietTaiKhoanSMS(Convert.ToInt32(common.Constants.idDetail));
                                if (result.Equals(true))
                                {
                                    FormDetailAccount_Load(sender, e);
                                    common.Constants.idDetail = "";
                                }
                                else
                                {
                                    MessageBox.Show("Không thể Xóa!!! ");
                                }
                            }
                            catch (Exception ex)
                            {
                                MessageBox.Show(Convert.ToString(ex));
                            }
                        }
                        else
                        {
                            FormDetailAccount_Load(sender, e);
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(Convert.ToString(ex));
                }
                but_Edit.Enabled = false;
                but_Delete.Enabled = false;
            }

            private void but_Add_Click(object sender, EventArgs e)
            {
                common.Constants.choose = 1;
                pnl_Add.Visible = true;
                lb_tilte.Text = "Thêm Thông Tin Tài Khoản";
                but_Ok.Text = "Thêm";
                lblYouChoose.Text = "Bạn chọn dòng:";
                txt_RegistrationMonth.Text = "";
                txt_Registrationyear.Text = "";
            }

            private void but_Close2_Click(object sender, EventArgs e)
            {
                pnl_Add.Visible = false;
                but_Edit.Enabled = false;
                but_Delete.Enabled = false;
            }

            private void but_Ok_Click(object sender, EventArgs e)
            {
                if (common.Constants.chooseUpdate == 1)
                {
                    try
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
                        { MessageBox.Show("Cập nhật thất bại!!!  "); }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(Convert.ToString(ex));
                    }
                }
                else
                {
                    try
                    {
                        ctTaiKhoanSMSModel.Ma_Tai_Khoan_Sms = common.Constants.id;
                        ctTaiKhoanSMSModel.Dang_Ki_Thang = txt_RegistrationMonth.Text.ToString();
                        ctTaiKhoanSMSModel.Dang_Ki_Nam = txt_Registrationyear.Text.ToString();
                        bool result = ctTaiKhoanSMSDao.insertChiTietTaiKhoan(ctTaiKhoanSMSModel);
                        if (result == true)
                        {
                            if (MessageBox.Show(this, "Bạn có muốn tiếp tục không? ", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
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
                        { MessageBox.Show("Thêm mới thất bại!  ,Vui lòng kiểm tra lại  "); }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(Convert.ToString(ex));
                    }
                }
                but_Edit.Enabled = false;
                but_Delete.Enabled = false;
            }
        #endregion

        
    }
}
