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
using SMS.common;

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
                loaddata();
                common.Constants.chooce = 0;
            }
        }

        private void loaddata()
        {
            //cuPhapModel = cuphapDao.getCuPhapByID(Convert.ToInt32(common.Constants.i));
            //txtID.Text = cuPhapModel.Id;
            //txt_Name.Text = cuPhapModel.Ten;
            //txtKeyword1.Text = cuPhapModel.Cum_Tu_1;
            //txtKeyword2.Text = cuPhapModel.Cum_Tu_2;
            //txtKeyword3.Text = cuPhapModel.Cum_Tu_3;
            //txtKeyword4.Text = cuPhapModel.Cum_Tu_4;
            //txtKeyword5.Text = cuPhapModel.Cum_Tu_5;
            //txtKeyword6.Text = cuPhapModel.Cum_Tu_6;
            //txtKeyword7.Text = cuPhapModel.Cum_Tu_7;
            //txtKeyword8.Text = cuPhapModel.Cum_Tu_8;
            //txtKeyword9.Text = cuPhapModel.Cum_Tu_9;
            //txtKeyword10.Text = cuPhapModel.Cum_Tu_10;
            //txt_Note.Text = cuPhapModel.Ghi_Chu;
            //common.Constants.i = "";
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

       

        
    }
}
