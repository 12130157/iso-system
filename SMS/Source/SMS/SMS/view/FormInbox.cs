using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SMS
{
    public partial class FormInbox : Form
    {
        public FormInbox()
        {
            InitializeComponent();
            showSyntaxMessInbox();
            showNormalMessInbox();
        }
        public void showSyntaxMessInbox()
        {
            DataTable tableSyntaxMessInbox = HopThuDenDAO.getAllSyntaxMessInbox();
            tblSyntaxMess.DataSource = tableSyntaxMessInbox;
        }
        public void showNormalMessInbox()
        {
            DataTable tableNormalMessInbox = HopThuDenDAO.getAllNormalMessInbox();
            tblNormalMess.DataSource = tableNormalMessInbox;
        }

        private void btnReadUnReadSyntaxMessInbox_Click(object sender, EventArgs e)
        {
            DataGridViewSelectedRowCollection selectedSyntaxMessRows = tblSyntaxMess.SelectedRows;
            if (selectedSyntaxMessRows.Count > 0)
            {
                foreach (DataGridViewRow row in selectedSyntaxMessRows)
                {
                        bool result = HopThuDenDAO.updateTinhTrangMessInbox(row.Cells["clmIdSyntaxMessInbox"].Value.ToString());
                        //if (result == true)
                        //{
                        //    MessageBox.Show("Update Thanh Cong");
                        //}
                        //else
                        //{
                        //    MessageBox.Show("Update That Bai");
                        //}
                }
                showSyntaxMessInbox();
            }
            else
            {
                MessageBox.Show("Ban chua chon tin nhan.");
            }
        }

        private void btnDeleteSyntaxMessInbox_Click(object sender, EventArgs e)
        {
            DataGridViewSelectedRowCollection selectedSyntaxMessRows = tblSyntaxMess.SelectedRows;
            if (selectedSyntaxMessRows.Count > 0)
            {
                foreach (DataGridViewRow row in selectedSyntaxMessRows)
                {
                    bool result = HopThuDenDAO.deleteMesssInbox(row.Cells["clmIdSyntaxMessInbox"].Value.ToString());
                    //if (result == true)
                    //{
                    //    MessageBox.Show("Update Thanh Cong");
                    //}
                    //else
                    //{
                    //    MessageBox.Show("Update That Bai");
                    //}
                }
                showSyntaxMessInbox();
            }
            else
            {
                MessageBox.Show("Ban chua chon tin nhan.");
            }
        }
    }
}
