
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

namespace SMS.view
{
    public partial class FormAddAccount : Form
    {

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

                //// tra ve gia tri ban dau cua bien
                ////Constants.id = "";
                //Constants.Ma_tai_khoan_SMS = "";
            }

            private void loadCombox()
            {
                //load data combox
                ArrayList arr = loaiTaiKhoanSMSDao.getAllLoaiTaiKhoanSMS();
                
                foreach (LoaiTaiKhoanSmsMODEL loaiTKSMS in arr)
                {
                    cbo_AccountType.Items.Add(new KeyValuePair(loaiTKSMS.Id, loaiTKSMS.Ten));
                }
            }

        #endregion

        #region xu kien onClick
           
            private void but_Close_Click(object sender, EventArgs e)
            {
                formAccount.MdiParent = this.MdiParent;
                formAccount.Show();
                common.Constants.id = "";
                this.Close();
            }

            private void but_Add_Click(object sender, EventArgs e)
            {
                if (but_Add.Text.Equals("Add"))
                {

                    taiKhoanSMSModel.So_Dien_Thoai = txt_NumberPhone.Text;
                    taiKhoanSMSModel.Ma_Sinh_Vien = txt_StudentID.Text;
                    taiKhoanSMSModel.Ngay_Dang_Ki = dtp_NgayDangKy.Text;

                    Boolean result1 = taiKhoanSMSDao.insertTaiKhoanSMS(taiKhoanSMSModel);
                    if (result1 == true)
                    {
                        if (MessageBox.Show(this, "Do you want to continue?  ", " Notice ", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                        {
                            formAccount.MdiParent = this.MdiParent;
                            formAccount.Show();
                            this.Close();
                        }
                    }
                    else
                    {
                        DialogResult mess = MessageBox.Show("Insert failed");
                    }

                }
                else if (but_Add.Text.Equals("Apply"))
                {
                    //update taikhoanSMS
                    taiKhoanSMSModel.So_Dien_Thoai = txt_NumberPhone.Text;
                    taiKhoanSMSModel.Ma_Sinh_Vien = txt_StudentID.Text;
                    taiKhoanSMSModel.Ngay_Dang_Ki = dtp_NgayDangKy.Text;

                    Boolean result1 = taiKhoanSMSDao.updateTaiKhoanSMSById(taiKhoanSMSModel);

                    if (result1 == true)
                    {
                        formAccount.MdiParent = this.MdiParent;
                        formAccount.Show();
                        but_Add.Text = "Add";
                        this.Close();
                    }
                    else
                    {
                        DialogResult mess = MessageBox.Show("Update failed");
                    }
                }
            }

        #endregion 

        #region Xu kien Double Click

            private void cbo_AccountType_SelectedIndexChanged(object sender, EventArgs e)
        {
            KeyValuePair objKeyValuePair = (KeyValuePair)cbo_AccountType.SelectedItem;
            int id = Convert.ToInt32(objKeyValuePair.m_objKey.ToString());
            taiKhoanSMSModel.Loai_Tai_Khoan = objKeyValuePair.m_objKey.ToString();
            loaiTaiKhoanSMSModel = loaiTaiKhoanSMSDao.getLoaiTaiKhoanSMSByID(id);
            txt_ServiceCharges.Text = loaiTaiKhoanSMSModel.Phi_Dich_Vu;
        }

            private void FormAddAccount_Load(object sender, EventArgs e)
            {
                loadCombox();
                if (common.Constants.choose.Equals(1))
                {
                    lbl_TitleAccount.Text = "New Account";
                    but_Add.Text = "Add";
                    common.Constants.chooseUpdate = 0;
                    common.Constants.choose = 0;
                }
                else if (common.Constants.choose.Equals(2))
                {
                    lbl_TitleAccount.Text = "Edit Account";
                    but_Add.Text = "Apply";
                    loaddata();
                    common.Constants.choose = 0;
                    common.Constants.id = "";
                }

            }

        #endregion


    }
}

