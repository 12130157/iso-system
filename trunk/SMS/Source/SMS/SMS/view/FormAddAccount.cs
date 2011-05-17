
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
using SMS.common;
using System.Collections;
using System.Reflection;
using System.Threading;
using System.Timers;

namespace SMS.view
{
    public partial class FormAddAccount : Form
    {
       private int i;
        #region khia bao bien

            FormManageAccount formAccount = new FormManageAccount();
            TaiKhoanSmsMODEL taiKhoanSMSModel = new TaiKhoanSmsMODEL();
            TaiKhoanSmsDAO taiKhoanSMSDao = new TaiKhoanSmsDAO();
            LoaiTaiKhoanSmsMODEL loaiTaiKhoanSMSModel = new LoaiTaiKhoanSmsMODEL();
            LoaiTaiKhoanSmsDAO loaiTaiKhoanSMSDao = new LoaiTaiKhoanSmsDAO();
            ChiTietTaiKhoanSmsMODEL ctTaiKhoanSMSModel = new ChiTietTaiKhoanSmsMODEL();
            ChiTietTaiKhoanSmsDAO ctTaiKhoanSMSDao = new ChiTietTaiKhoanSmsDAO();

        #endregion

        #region function
            //FormManageAccount myForm;
            //public FormAddAccount(ref FormManageAccount fr)
            //{
            //    InitializeComponent();
            //    this.myForm = fr;
            //}
            public FormAddAccount()
            {
                InitializeComponent();
            }

            private void loaddata()
            {
              
                    taiKhoanSMSModel = taiKhoanSMSDao.getTaiKhoanSMSByID(Convert.ToInt32(Constants.id));

                    txt_NumberPhone.Text = taiKhoanSMSModel.So_Dien_Thoai;
                    txt_StudentID.Text = taiKhoanSMSModel.Ma_Sinh_Vien;
                    dtp_NgayDangKy.Text = taiKhoanSMSModel.Ngay_Dang_Ki;

                    // kiện selected  cua cbo_AccountType
                    loaiTaiKhoanSMSModel = loaiTaiKhoanSMSDao.getLoaiTaiKhoanSMSByID(Convert.ToInt32(taiKhoanSMSModel.Loai_Tai_Khoan));
                    cbo_AccountType.SelectedText = loaiTaiKhoanSMSModel.Ten.ToString();
                    txt_ServiceCharges.Text = loaiTaiKhoanSMSModel.Phi_Dich_Vu;
                    txt_Note.Text = loaiTaiKhoanSMSModel.Ghi_Chu;

            }

            private void loadCombox()
            {
                //load data combox
                ArrayList arr = loaiTaiKhoanSMSDao.getAllLoaiTaiKhoanSMS();
                cbo_AccountType.Items.Add("[ Thêm mới ]");
                foreach (LoaiTaiKhoanSmsMODEL loaiTKSMS in arr)
                {
                    cbo_AccountType.Items.Add(new KeyValuePair(loaiTKSMS.Id, loaiTKSMS.Ten));
                }
            }

        #endregion

        #region xu kien onClick
           
            private void but_Close_Click(object sender, EventArgs e)
            {
                if (MessageBox.Show(this, "Bạn có chắc là muốn thoát?  ", " Thông Báo ", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    common.Constants.id = "";
                    this.Close();
                }
            }

            private void but_Add_Click(object sender, EventArgs e)
            {
                if (but_Add.Text.Equals("Thêm Mới"))
                {

                    taiKhoanSMSModel.So_Dien_Thoai = txt_NumberPhone.Text;
                    taiKhoanSMSModel.Ma_Sinh_Vien = txt_StudentID.Text;
                    taiKhoanSMSModel.Ngay_Dang_Ki = dtp_NgayDangKy.Text;

                    Boolean result1 = taiKhoanSMSDao.insertTaiKhoanSMS(taiKhoanSMSModel);
                    if (result1 == true)
                    {
                        this.Visible = false;
                    }
                    else
                    {
                        DialogResult mess = MessageBox.Show("Thêm mới tài khoản thất bại!!!  ");
                    }

                }
                else if (but_Add.Text.Equals("Cập Nhật"))
                {
                    //update taikhoanSMS
                    taiKhoanSMSModel.So_Dien_Thoai = txt_NumberPhone.Text;
                    taiKhoanSMSModel.Ma_Sinh_Vien = txt_StudentID.Text;
                    taiKhoanSMSModel.Ngay_Dang_Ki = dtp_NgayDangKy.Text;

                    Boolean result1 = taiKhoanSMSDao.updateTaiKhoanSMSById(taiKhoanSMSModel);

                    if (result1 == true)
                    {
                        //this.Hide();
                        //formAccount.FormManageAccount_Load(sender, e);
                        but_Add.Text = "Add";
                        this.Visible = false;
                    }
                    else
                    {
                        DialogResult mess = MessageBox.Show("Cập nhật thất bại!!!  ");
                    }
                }
            }

        #endregion 

        #region Xu kien Double Click

            private void cbo_AccountType_SelectedIndexChanged(object sender, EventArgs e)
            {
                if (cbo_AccountType.Text.Equals("[ Thêm mới ]"))
                {
                    FormAddTypeSMS fr = new FormAddTypeSMS();
                    fr.MdiParent = this.MdiParent;
                    fr.Show();
                }
                else
                {
                    KeyValuePair objKeyValuePair = (KeyValuePair)cbo_AccountType.SelectedItem;
                    int id = Convert.ToInt32(objKeyValuePair.m_objKey.ToString());
                    taiKhoanSMSModel.Loai_Tai_Khoan = objKeyValuePair.m_objKey.ToString();
                    loaiTaiKhoanSMSModel = loaiTaiKhoanSMSDao.getLoaiTaiKhoanSMSByID(id);
                    txt_ServiceCharges.Text = loaiTaiKhoanSMSModel.Phi_Dich_Vu;
                    txt_Note.Text = loaiTaiKhoanSMSModel.Ghi_Chu;
                }
                dtp_NgayDangKy.Enabled = true;
            }

            private void FormAddAccount_Load(object sender, EventArgs e)
            {
                loadCombox();
                if (common.Constants.choose.Equals(1))
                {
                    lbl_TitleAccount.Text = "Thêm Mới Tài Khoản SMS";
                    but_Add.Text = "Thêm Mới";
                    common.Constants.chooseUpdate = 0;
                    common.Constants.choose = 0;
                }
                else if (common.Constants.choose.Equals(2))
                {
                    lbl_TitleAccount.Text = "Cập Nhật Tài Khoản SMS";
                    but_Add.Text = "Cập Nhật";
                    loaddata();
                    common.Constants.choose = 0;
                    common.Constants.id = "";
                }
                timer_giay.Start();
            }

        #endregion

#region su kien text_change, leave, keypress
            private void txt_NumberPhone_Leave(object sender, EventArgs e)
            {
                if (!txt_NumberPhone.Text.Equals(""))
                {
                    //txt_NumberPhone2.Enabled = true;
                }
            }

            private void txt_StudentID_Leave(object sender, EventArgs e)
            {
                if (!txt_NumberPhone.Text.Equals(""))
                {
                    txt_NumberPhone.Focus();
                }
                
            }

            private void txt_NumberPhone_KeyPress(object sender, KeyPressEventArgs e)
            {
                if (!Char.IsDigit(e.KeyChar) && !Char.IsControl(e.KeyChar))
                {
                    e.Handled = true;
                }
            }

            private void txt_StudentID_TextChanged(object sender, EventArgs e)
            {
                if (txt_StudentID.Text.Equals(""))
                {
                    txt_NumberPhone.Text = "";
                    txt_Note.Text = "";

                    txt_NumberPhone.Enabled = false;
                    txt_Note.Enabled = false;
                    txt_NumberPhone_TextChanged(sender, e);
                }
                else
                {
                    txt_NumberPhone.Enabled = true;
                    txt_Note.Enabled = true;
                }
            }

            private void txt_NumberPhone_TextChanged(object sender, EventArgs e)
            {
                if (txt_NumberPhone.Text.Equals(""))
                {
                    cbo_AccountType.SelectedIndex = 1;
                    cbo_AccountType.Enabled = false;
                }
                else
                {
                    cbo_AccountType.Enabled = true;
                }
            }


            private void timer_giay_Tick(object sender, EventArgs e)
            {
                pic_choose.Image = imageList1.Images[i];
                i++;
                if (i == 20)
                {
                    i = 0;
                }
            }

            private void dtp_NgayDangKy_Leave(object sender, EventArgs e)
            {
                DateTime dt = DateTime.Today;
                DateTime dt1 = Convert.ToDateTime(dtp_NgayDangKy.Value);
                int ngayHH = dt.DayOfYear;
                int ngayDK = dt1.DayOfYear;
                if (ngayDK < ngayHH)
                {
                    MessageBox.Show("Ngày đăng ký không được nhỏ hơn ngày hiện hành! ", "Thông Báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning);
                    dtp_NgayDangKy.Focus();
                }
            }

#endregion

            
    }
}

