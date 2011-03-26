
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
            desgin();
        }
        #region function

        private void desgin()
        {
            if (common.Constants.chooce.Equals(1))
            {
                lbl_TitleAccount.Text = "New Account";
                but_Add.Text = "Add";
                common.Constants.chooce = 0;
                txt_ID.Enabled = false;
            }
            else if (common.Constants.chooce.Equals(2))
            {
                lbl_TitleAccount.Text = "Edit Account";
                but_Add.Text = "Apply";
                txt_ID.Enabled = false;
                common.Constants.chooce = 0;
            }
        }

        private void loaddata()
        {
            taiKhoanSMSModel = taiKhoanSMSDao.getTaiKhoanSMSByID(Convert.ToInt32(Constants.Ma_tai_khoan_SMS));
            txt_ID.Text = taiKhoanSMSModel.Id;
            txt_NumberPhone.Text = taiKhoanSMSModel.So_Dien_Thoai;
            txt_StudentID.Text = taiKhoanSMSModel.Ma_Sinh_Vien;
            //load data combox
            ArrayList arr = loaiTaiKhoanSMSDao.getAllLoaiTaiKhoanSMS();
            foreach (LoaiTaiKhoanSmsMODEL loaiTKSMS in arr)
            {
                cbo_AccountType.Items.Add(new KeyValuePair(loaiTKSMS.Id, loaiTKSMS.Ten));
            }
            // kiện selected  cua cbo_AccountType
            loaiTaiKhoanSMSModel = loaiTaiKhoanSMSDao.getLoaiTaiKhoanSMSByID(Convert.ToInt32(taiKhoanSMSModel.Loai_Tai_Khoan));
            cbo_AccountType.SelectedText = loaiTaiKhoanSMSModel.Ten.ToString();
            txt_Note.Text = loaiTaiKhoanSMSModel.Ghi_Chu;
            //load  thang, ngay dang ky trong ChitietTaiKhoanSMS
            ctTaiKhoanSMSModel = ctTaiKhoanSMSDao.getChiTietTaiKhoanSMSByID(Convert.ToInt32(common.Constants.id));
            txt_RegistrationMonth.Text = ctTaiKhoanSMSModel.Dang_Ki_Thang;
            txt_Registrationyear.Text = ctTaiKhoanSMSModel.Dang_Ki_Nam;
            // tra ve gia tri ban dau cua bien
            Constants.id = "";
            Constants.Ma_tai_khoan_SMS = "";
        }
        #endregion

        private void but_Close_Click(object sender, EventArgs e)
        {
            formAccount.MdiParent = this.MdiParent;
            formAccount.Show();
            this.Close();
        }

        private void but_Add_Click(object sender, EventArgs e)
        {
            if (but_Add.Text.Equals("Add"))
            {
                taiKhoanSMSModel.Ma_Sinh_Vien = txt_StudentID.Text;

                Boolean result = true;

                if (result == true)
                {
                    DialogResult mess = MessageBox.Show("Insert successfully");
                }
                else
                {
                    DialogResult mess = MessageBox.Show("Insert failed");
                }
                    DialogResult result1 = MessageBox.Show("Do you want to continue to add new?", "Important Question", MessageBoxButtons.YesNo);
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
                taiKhoanSMSModel.Id = txt_ID.Text;
                taiKhoanSMSModel.So_Dien_Thoai=txt_NumberPhone.Text;
                taiKhoanSMSModel.Ma_Sinh_Vien = txt_StudentID.Text;

                Boolean result = true;

                if (result == true)
                {
                    //DialogResult mess = MessageBox.Show("Update successfully");
                    //fomKeyword.MdiParent = this.MdiParent;
                    //fomKeyword.Show();
                    //this.Close();

                }
                else
                {
                    DialogResult mess = MessageBox.Show("Update failed");
                }
            }
        }
     
        private void FormAddAccount_Load(object sender, EventArgs e)
        {
            loaddata();
          
        }
      
       

        
    }
}

