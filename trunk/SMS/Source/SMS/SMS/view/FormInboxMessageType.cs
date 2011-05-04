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
        public FormInboxMessageType()
        {
            InitializeComponent();
        }

       

        private void FormInboxMessageType_Load(object sender, EventArgs e)
        {
            
            dlv_InboxType.DataSource = loaHopThuDao.getAllLoaiHopThu();
            pnl_InboxType.Visible = false;
            lbl_YouChoose.Text = "Enter choose row: ";
        }

        private void dlv_InboxType_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            common.Constants.id = dlv_InboxType.CurrentRow.Cells["ID"].Value.ToString();
            lbl_YouChoose.Text = "You Choose, ID: " + common.Constants.id;
            but_Edit.Enabled = true;
            but_Delete.Enabled = true;
        }

        private void but_Add_Click(object sender, EventArgs e)
        {
            pnl_InboxType.Visible = true;
            Constants.choose = 1;
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
                    MessageBox.Show("Insert failed");
                }
                
            }
            else
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
                    MessageBox.Show("Insert failed");
                }
            }
            txt_IDInbox.Text = "";
            txt_NameInbox.Text = "";
            txt_Note.Text = "";
            but_Add.Enabled = true;
            but_Edit.Enabled = false;
            but_Delete.Enabled = false;
        }

        private void but_Close2_Click(object sender, EventArgs e)
        {
            pnl_InboxType.Visible = false;
            FormInboxMessageType_Load(sender, e);
            but_Edit.Enabled = false;
            but_Delete.Enabled = false;
            but_Add.Enabled = true;
            txt_IDInbox.Text = "";
            txt_NameInbox.Text = "";
            txt_Note.Text = "";
        }

        private void but_Close_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void but_Delete_Click(object sender, EventArgs e)
        {
            if (Constants.id.Equals(""))
            {
                MessageBox.Show("You may choose to delete the line. Plesae choose again:  ", "Warning!  ");
            }
            else
            {
                if (MessageBox.Show(this, "Do you want to Deleting?  ", " Notice ", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    bool result = LoaiHopThuDAO.deleteLoaiHopThu(Convert.ToInt32(Constants.id));
                    if (result == true)
                    {
                        FormInboxMessageType_Load(sender, e);
                        Constants.id = "";
                    }
                    else
                    {
                        MessageBox.Show("Deleting failed!!! ", "Warning! ");
                    }
                }
                else
                {
                    FormInboxMessageType_Load(sender, e);
                }
            }
            but_Edit.Enabled = false;
            but_Delete.Enabled = false;
            but_Add.Enabled = true;
        }

        private void but_Edit_Click(object sender, EventArgs e)
        {
            but_Add.Enabled = false;
            if (Constants.id.Equals(""))
            {
                MessageBox.Show("You may choose to edit the line. Plesae choose again:", "Warning!  ");
            }
            else
            {
                pnl_InboxType.Visible = true;
                Constants.choose = 2;
                loaiHopThuModel = LoaiHopThuDAO.getLoaiHopThuByID(Convert.ToInt32(Constants.id));
                txt_IDInbox.Text = loaiHopThuModel.Id;
                txt_NameInbox.Text = loaiHopThuModel.Ten;
                txt_Note.Text = loaiHopThuModel.Ghi_Chu;
            }
            
        }

        private void txt_EnterTen_TextChanged(object sender, EventArgs e)
        {
            string name = txt_EnterTen.Text.ToString();
            dlv_InboxType.DataSource = LoaiHopThuDAO.getTenLoaiHopThu(name);
        }
    }
}
