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
    public partial class FormAddTypeSMS : Form
    {
        #region khai bao bien
        LoaiTaiKhoanSmsDAO loaitaikhoansmsDao = new LoaiTaiKhoanSmsDAO();
        LoaiTaiKhoanSmsMODEL loaitaikhoansmsModel = new LoaiTaiKhoanSmsMODEL();
        #endregion
        public FormAddTypeSMS()
        {
            InitializeComponent();
        }

        private void FormAddTypeSMS_Load(object sender, EventArgs e)
        {
            dgv_Account.DataSource = loaitaikhoansmsDao.getAllLoaiTaiKhoanSMS2();
            txt_TypeAccount.Focus();
            lbl_choose.Text = "Bạn chọn dòng: ";
        }

        private void dgv_Account_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            but_CapNhat.Enabled = true;
            but_Xoa.Enabled = true;
            Constants.id = dgv_Account.CurrentRow.Cells["Ma hop thu"].Value.ToString();
            txt_TypeAccount.Text = dgv_Account.CurrentRow.Cells["Ten hop thu"].Value.ToString();
            txt_ServiceCharges.Text = dgv_Account.CurrentRow.Cells["Phi dich vu"].Value.ToString();
            txt_Note.Text = dgv_Account.CurrentRow.Cells["Ghi chu"].Value.ToString();
            lbl_choose.Text = "Bạn đang chọn dòng có ID là: "+Constants.id;
        }

        
        private void but_CapNhat_Click(object sender, EventArgs e)
        {

            try
            {
                loaitaikhoansmsModel.Id = Constants.id;
                loaitaikhoansmsModel.Ten = txt_TypeAccount.Text;
                loaitaikhoansmsModel.Phi_Dich_Vu = txt_ServiceCharges.Text;
                loaitaikhoansmsModel.Ghi_Chu = txt_Note.Text;
                if (MessageBox.Show("bạn có muốn cập nhật? ", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    Boolean result = loaitaikhoansmsDao.updateLoaiTaiKhoanSMSById(loaitaikhoansmsModel);
                    if (result == true)
                    {
                        FormAddTypeSMS_Load(sender, e);
                        but_CapNhat.Enabled = false;
                        but_Xoa.Enabled = false;
                        txt_TypeAccount.Text = "";
                        txt_ServiceCharges.Text = "";
                        txt_Note.Text = "";
                        Constants.id = "";
                    }
                    else
                    {
                        MessageBox.Show(" Cập nhật thất bại! ", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void but_Add_Click(object sender, EventArgs e)
        {
            loaitaikhoansmsModel.Ten = txt_TypeAccount.Text.ToString();
            loaitaikhoansmsModel.Phi_Dich_Vu = txt_ServiceCharges.Text.ToString();
            loaitaikhoansmsModel.Ghi_Chu = txt_Note.Text.ToString();
            Boolean result = loaitaikhoansmsDao.insertLoaiTaiKhoanSMS(loaitaikhoansmsModel);
            if (result == true)
            {
                FormAddTypeSMS_Load(sender, e);
                txt_Note.Text = "";
                txt_ServiceCharges.Text = "";
                txt_TypeAccount.Text = "";
                but_Add.Enabled = false;
            }
            else
            {
                MessageBox.Show("Thêm thất bại! ","Thông Báo",MessageBoxButtons.OK,MessageBoxIcon.Warning);
            }

        }

        private void txt_ServiceCharges_KeyPress(object sender, KeyPressEventArgs e)
        {
                if (!Char.IsDigit(e.KeyChar) && !Char.IsControl(e.KeyChar))
                {
                    e.Handled = true;
                }
        }

        private void txt_TypeAccount_TextChanged(object sender, EventArgs e)
        {
            if (!txt_TypeAccount.Text.Equals(""))
            {
                txt_ServiceCharges.Enabled = true;
            }
            else
            {
                txt_ServiceCharges.Text = "";
                txt_ServiceCharges.Enabled = false;
                txt_ServiceCharges_TextChanged(sender, e);
            }
        }

        private void txt_ServiceCharges_TextChanged(object sender, EventArgs e)
        {
            if (!txt_ServiceCharges.Text.Equals(""))
            {
                txt_Note.Enabled = true;
            }
            else
            {
                txt_Note.Text = "";
                txt_Note.Enabled = false;
            }
        }

        private void txt_Note_TextChanged(object sender, EventArgs e)
        {
            if (!txt_Note.Text.Equals("") && Constants.id.Equals(""))
            {
                but_Add.Enabled = true;
            }
        }

        private void but_Close_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn thoát không? ", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                this.Close();
            }
        }

        private void but_Xoa_Click(object sender, EventArgs e)
        {
            if (Constants.id.Equals(""))
            {
                MessageBox.Show("Bạn chưa chọn dòng để xóa! ", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                if (MessageBox.Show("Bạn có chắc là muốn xóa không? ", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    Boolean result = loaitaikhoansmsDao.deleteLoaiTaiKhoanSMS(int.Parse(Constants.id));
                    if (result == false)
                    {
                        MessageBox.Show("Không thể xóa! ", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        FormAddTypeSMS_Load(sender, e);
                    }
                    else
                    {
                        FormAddTypeSMS_Load(sender, e);
                        but_CapNhat.Enabled = false;
                        but_Xoa.Enabled = false;
                        txt_TypeAccount.Text = "";
                        txt_ServiceCharges.Text = "";
                        txt_Note.Text = "";
                        Constants.id = "";
                    }
                }
                else
                {
                    FormAddTypeSMS_Load(sender, e);
                    but_CapNhat.Enabled = false;
                    but_Xoa.Enabled = false;
                    txt_TypeAccount.Text = "";
                    txt_ServiceCharges.Text = "";
                    txt_Note.Text = "";
                    Constants.id = "";
                    lbl_choose.Text = "Bạn chọn dòng: ";
                }
            }
        }

       

    }
}

