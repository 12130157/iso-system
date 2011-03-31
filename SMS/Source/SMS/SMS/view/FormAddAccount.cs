
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
        FormManageAccount formAccount = new FormManageAccount();
        TaiKhoanSmsMODEL taiKhoanSMSModel = new TaiKhoanSmsMODEL();
        TaiKhoanSmsDAO taiKhoanSMSDao = new TaiKhoanSmsDAO();
        LoaiTaiKhoanSmsMODEL loaiTaiKhoanSMSModel = new LoaiTaiKhoanSmsMODEL();
        LoaiTaiKhoanSmsDAO loaiTaiKhoanSMSDao = new LoaiTaiKhoanSmsDAO();
        ChiTietTaiKhoanSmsMODEL ctTaiKhoanSMSModel = new ChiTietTaiKhoanSmsMODEL();
        ChiTietTaiKhoanSmsDAO ctTaiKhoanSMSDao = new ChiTietTaiKhoanSmsDAO();
        public FormAddAccount()
        {
            InitializeComponent();
        }
        #region function

        private void loaddata()
        {
            if (common.Constants.chooseUpdate.Equals(1))
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
            else
            {
                taiKhoanSMSModel = taiKhoanSMSDao.getTaiKhoanSMSByID(Convert.ToInt32(Constants.Ma_tai_khoan_SMS));

                txt_NumberPhone.Text = taiKhoanSMSModel.So_Dien_Thoai;
                txt_StudentID.Text = taiKhoanSMSModel.Ma_Sinh_Vien;
                dtp_NgayDangKy.Text = taiKhoanSMSModel.Ngay_Dang_Ki;

                // kiện selected  cua cbo_AccountType
                loaiTaiKhoanSMSModel = loaiTaiKhoanSMSDao.getLoaiTaiKhoanSMSByID(Convert.ToInt32(taiKhoanSMSModel.Loai_Tai_Khoan));
                cbo_AccountType.SelectedText = loaiTaiKhoanSMSModel.Ten.ToString();
                txt_ServiceCharges.Text = loaiTaiKhoanSMSModel.Phi_Dich_Vu;
                txt_Note.Text = loaiTaiKhoanSMSModel.Ghi_Chu;
                //load  thang, ngay dang ky trong ChitietTaiKhoanSMS

                ctTaiKhoanSMSModel = ctTaiKhoanSMSDao.getChiTietTaiKhoanSMSByID(Convert.ToInt32(common.Constants.idDetail));
                txt_RegistrationMonth.Text = ctTaiKhoanSMSModel.Dang_Ki_Thang;
                txt_Registrationyear.Text = ctTaiKhoanSMSModel.Dang_Ki_Nam;

            }
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

        private void but_Close_Click(object sender, EventArgs e)
        {
            if (but_Add.Text.Equals("Apply"))
            {
                view.FormDetailAccount fr = new view.FormDetailAccount();
                fr.MdiParent = this.MdiParent;
                fr.Show();
                this.Close();
            }
            else
            {
                formAccount.MdiParent = this.MdiParent;
                formAccount.Show();
                this.Close();
            }
        }

        private void but_Add_Click(object sender, EventArgs e)
        {
            if (but_Add.Text.Equals("Add"))
            {

                taiKhoanSMSModel.So_Dien_Thoai = txt_NumberPhone.Text;
                taiKhoanSMSModel.Ma_Sinh_Vien = txt_StudentID.Text;
                taiKhoanSMSModel.Ngay_Dang_Ki = dtp_NgayDangKy.Text;

                Boolean result1 = taiKhoanSMSDao.insertTaiKhoanSMS(taiKhoanSMSModel);
                //Update table ChiTietTaiKhoanSms
                taiKhoanSMSModel = taiKhoanSMSDao.getTaiKhoanSMSBySDT_MSV(txt_NumberPhone.Text, txt_StudentID.Text);
                ctTaiKhoanSMSModel.Ma_Tai_Khoan_Sms = taiKhoanSMSModel.Id;
                ctTaiKhoanSMSModel.Dang_Ki_Thang = txt_RegistrationMonth.Text.ToString();
                ctTaiKhoanSMSModel.Dang_Ki_Nam = txt_Registrationyear.Text.ToString();

                Boolean result2 = ctTaiKhoanSMSDao.insertChiTietTaiKhoan(ctTaiKhoanSMSModel);

                if (result1== true && result2==true)
                {
                   MessageBox.Show("Insert successfully");
                }
                else
                {
                    DialogResult mess = MessageBox.Show("Insert failed");
                }
                  DialogResult result= MessageBox.Show("Do you want to continue to add new?", "Important Question", MessageBoxButtons.YesNo);
                if (result.Equals(1))
                {
                    //clear();
                }
                else
                {
                    formAccount.MdiParent = this.MdiParent;
                    formAccount.Show();
                    this.Close();
                }
            }
            else if (but_Add.Text.Equals("Apply"))
            {
                //update taikhoanSMS
                taiKhoanSMSModel.So_Dien_Thoai=txt_NumberPhone.Text;
                taiKhoanSMSModel.Ma_Sinh_Vien = txt_StudentID.Text;
                taiKhoanSMSModel.Ngay_Dang_Ki = dtp_NgayDangKy.Text;
                
                Boolean result1 = taiKhoanSMSDao.updateTaiKhoanSMSById(taiKhoanSMSModel);
                //Update table ChiTietTaiKhoanSms
                ctTaiKhoanSMSModel.Dang_Ki_Thang = txt_RegistrationMonth.Text.ToString();
                ctTaiKhoanSMSModel.Dang_Ki_Nam = txt_Registrationyear.Text.ToString();
                
                Boolean result2 = ctTaiKhoanSMSDao.updateChiTietTaiKhoanSMS(ctTaiKhoanSMSModel);
                
                if (result1 == true && result2==true)
                {
                    MessageBox.Show("Update successfully");
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
     
        private void FormAddAccount_Load(object sender, EventArgs e)
        {
            loadCombox();
            if (common.Constants.chooce.Equals(1))
            {
                lbl_TitleAccount.Text = "New Account";
                but_Add.Text = "Add";
                if (common.Constants.chooseUpdate.Equals(1))
                {
                    loaddata();
                    txt_Note.Enabled = false;
                    txt_NumberPhone.Enabled = false;
                    txt_StudentID.Enabled = false;
                    cbo_AccountType.Enabled = false;
                    dtp_NgayDangKy.Enabled = false;
                }
                common.Constants.chooseUpdate = 0;
                common.Constants.chooce = 0;
            }
            else if (common.Constants.chooce.Equals(2))
            {
                lbl_TitleAccount.Text = "Edit Account";
                but_Add.Text = "Apply";
                loaddata();
                common.Constants.chooce = 0;
            }
            
        }

        private void cbo_AccountType_SelectedIndexChanged(object sender, EventArgs e)
        {
            KeyValuePair objKeyValuePair = (KeyValuePair)cbo_AccountType.SelectedItem;
            int id=Convert.ToInt32( objKeyValuePair.m_objKey.ToString());
            taiKhoanSMSModel.Loai_Tai_Khoan = objKeyValuePair.m_objKey.ToString();
            loaiTaiKhoanSMSModel = loaiTaiKhoanSMSDao.getLoaiTaiKhoanSMSByID(id);
            txt_ServiceCharges.Text = loaiTaiKhoanSMSModel.Phi_Dich_Vu;
        }
      
       

        
    }
}

