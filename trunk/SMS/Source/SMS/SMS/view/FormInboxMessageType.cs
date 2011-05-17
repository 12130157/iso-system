using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SMS.common;
using SMS.dao;
using SMS.model;
using SMS.view;

namespace SMS
{
    public partial class FormInboxMessageType : Form
    {
        LoaiHopThuDAO loaHopThuDao = new LoaiHopThuDAO();
        LoaiHopThuMODEL loaiHopThuModel = new LoaiHopThuMODEL();
        String lblTenHopThu = "";
        public FormInboxMessageType()
        {
            InitializeComponent();
        }

       

        private void FormInboxMessageType_Load(object sender, EventArgs e)
        {
            
            dlv_InboxType.DataSource = loaHopThuDao.getAllLoaiHopThu();
            pnl_InboxType.Visible = false;
            lbl_YouChoose.Text = "Bạn chọn dòng: ";
        }

        private void dlv_InboxType_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            common.Constants.id = dlv_InboxType.CurrentRow.Cells["Ma Hop Thu"].Value.ToString();
            lblTenHopThu=dlv_InboxType.CurrentRow.Cells["Ten hop thu"].Value.ToString();
            lbl_YouChoose.Text = "Bạn chọn mã hộp thư là: " + common.Constants.id + ", tên hộp thư là: " + lblTenHopThu;
            but_Edit.Enabled = true;
            but_Delete.Enabled = true;
        }


        private void but_Add_Click(object sender, EventArgs e)
        {
            pnl_InboxType.Visible = true;
            Constants.choose = 1;
            but_Ok.Text = "Thêm";
        }

        private void but_Ok_Click(object sender, EventArgs e)
        {
            loaiHopThuModel.Ten = txt_NameInbox.Text.ToString();
            loaiHopThuModel.Ghi_Chu = txt_Note.Text.ToString();
            if (Constants.choose == 1)
            {
                bool result = LoaiHopThuDAO.insertLoaiHopThu(loaiHopThuModel);
                if (result == true)
                {
                    FormInboxMessageType_Load(sender, e);
                    Constants.choose = 0;
                }
                else
                {
                    MessageBox.Show("Thêm mới thất bại!!!!! ", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            else
            {
                if (MessageBox.Show("Bạn có muốn cập nhật? ", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    bool result = LoaiHopThuDAO.updateLoaiHopThuById(loaiHopThuModel);
                    if (result == true)
                    {
                        FormInboxMessageType_Load(sender, e);
                        Constants.choose = 0;
                        Constants.id = "";
                    }
                    else
                    {
                        MessageBox.Show("Cập nhật thất bại!!!!! ", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }
            }
            txt_IDInbox.Text = "";
            txt_NameInbox.Text = "";
            txt_Note.Text = "";

            but_Edit.Enabled = false;
            but_Delete.Enabled = false;
        }

        private void but_Close2_Click(object sender, EventArgs e)
        {
            pnl_InboxType.Visible = false;
            FormInboxMessageType_Load(sender, e);
            but_Edit.Enabled = false;
            but_Delete.Enabled = false;
            //but_Add.Enabled = true;
            txt_IDInbox.Text = "";
            txt_NameInbox.Text = "";
            txt_Note.Text = "";
        }

        private void but_Close_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có chắc là muốn thoát không? ", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information) == DialogResult.Yes)
            {
                this.Close();
            }
        }

        private void but_Delete_Click(object sender, EventArgs e)
        {
            if (Constants.id.Equals(""))
            {
                MessageBox.Show("Bạn chưa chọn dòng để xóa, Xin hãy chọn lại:",  "Thông Báo");
            }
            else
            {
                if (MessageBox.Show(this, "Bạn có chắc là muốn xóa không?  ", " Thông Báo ", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    bool result = LoaiHopThuDAO.deleteLoaiHopThu(Convert.ToInt32(Constants.id));
                    if (result == true)
                    {
                        FormInboxMessageType_Load(sender, e);
                        Constants.id = "";
                    }
                    else
                    {
                        MessageBox.Show("Không thể xóa !!! ", "Thông Báo");
                    }
                }
                else
                {
                    //FormInboxMessageType_Load(sender, e);
                }
            }
            but_Edit.Enabled = false;
            but_Delete.Enabled = false;
            //but_Add.Enabled = true;
        }

        private void but_Edit_Click(object sender, EventArgs e)
        {
            but_Add.Enabled = false;
            if (Constants.id.Equals(""))
            {
                MessageBox.Show("bạn chưa chọn dòng để thay đổi. Xin hãy chọn lại:", "Thông Báo");
            }
            else
            {
                pnl_InboxType.Visible = true;
                Constants.choose = 2;
                loaiHopThuModel = LoaiHopThuDAO.getLoaiHopThuByID(Convert.ToInt32(Constants.id));
                txt_IDInbox.Text = loaiHopThuModel.Id;
                txt_NameInbox.Text = loaiHopThuModel.Ten;
                txt_Note.Text = loaiHopThuModel.Ghi_Chu;
                but_Ok.Text = "Cập Nhật";
            }
            
        }

        private void txt_EnterTen_TextChanged(object sender, EventArgs e)
        {
            string name = txt_EnterTen.Text.ToString();
            dlv_InboxType.DataSource = LoaiHopThuDAO.getTenLoaiHopThu(name);
        }

    }
}
