
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

namespace SMS.view
{
    public partial class FormAddAccount : Form
    {
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
            MessageBox.Show(Constants.i);
            taiKhoanSMSModel = taiKhoanSMSDao.getTaiKhoanSMSByID(Convert.ToInt32(Constants.i));
            txt_ID.Text = taiKhoanSMSModel.Id;
            txt_NumberPhone.Text = taiKhoanSMSModel.So_Dien_Thoai;
            txt_StudentID.Text = taiKhoanSMSModel.Ma_Sinh_Vien;

            loaiTaiKhoanSMSModel = loaiTaiKhoanSMSDao.getLoaiTaiKhoanSMSByID(Convert.ToInt32(taiKhoanSMSModel.Loai_Tai_Khoan));
            ArrayList arry = loaiTaiKhoanSMSDao.getAllLoaiTaiKhoanSMS();
           
            cboAccountType.DataSource=arry;
            cboAccountType.SelectedIndex = 0;
            txt_Note.Text = loaiTaiKhoanSMSModel.Ghi_Chu;

            Constants.i = "";
        }
        #endregion

        private void but_Close_Click(object sender, EventArgs e)
        {
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
                    //this.Close();
                    //fomKeyword.MdiParent = this.MdiParent;
                    //fomKeyword.Show();
                    //this.Close();
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

