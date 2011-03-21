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
            showSyntaxMessDeletedInbox();
            showNormalMessDeletedInbox();
            this.btnRemoveMessInbox.Enabled = false;
            this.btnForwardMessInbox.Enabled = false;
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

        public void showSyntaxMessDeletedInbox()
        {
            DataTable tableSyntaxMessDeletedInbox = HopThuDenDAO.getAllSyntaxMessDeletedInbox();
            tblSyntaxMessDeletedInbox.DataSource = tableSyntaxMessDeletedInbox;
        }
        public void showNormalMessDeletedInbox()
        {
            DataTable tableNormalMessDeletedInbox = HopThuDenDAO.getAllNormalMessDeletedInbox();
            tblNormalMessDeletedInbox.DataSource = tableNormalMessDeletedInbox;
        }

        private void btnDeleteMessInbox_Click(object sender, EventArgs e)
        {
            if (tabInbox.SelectedTab == tabSyntaxMess)
            {
                DataGridViewSelectedRowCollection selectedSyntaxMessRows = tblSyntaxMess.SelectedRows;
                if (selectedSyntaxMessRows.Count > 0)
                {
                    if (MessageBox.Show("Ban co chac chan xoa nhung tin nhan nay ?", "Xac Nhan Xoa .", MessageBoxButtons.YesNo) == DialogResult.Yes)
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
                    }
                    showSyntaxMessInbox();
                    showSyntaxMessDeletedInbox();
                }
                else
                {
                    MessageBox.Show("Ban chua chon tin nhan.");
                }
            }
            else if (tabInbox.SelectedTab == tabNormalMessage)
            {
                DataGridViewSelectedRowCollection selectedNormalMessRows = tblNormalMess.SelectedRows;
                if (selectedNormalMessRows.Count > 0)
                {
                    if (MessageBox.Show("Ban co chac chan xoa nhung tin nhan nay ?", "Xac Nhan Xoa .", MessageBoxButtons.YesNo) == DialogResult.Yes)
                    {
                        foreach (DataGridViewRow row in selectedNormalMessRows)
                        {
                            bool result = HopThuDenDAO.deleteMesssInbox(row.Cells["clmIdNormalMessInBox"].Value.ToString());
                        }
                        //if (result == true)
                        //{
                        //    MessageBox.Show("Update Thanh Cong");
                        //}
                        //else
                        //{
                        //    MessageBox.Show("Update That Bai");
                        //}
                    }
                    showNormalMessInbox();
                    showNormalMessDeletedInbox();
                }
                else
                {
                    MessageBox.Show("Ban chua chon tin nhan.");
                }
            }
        }

        private void btnReplyMessInbox_Click(object sender, EventArgs e)
        {
            if (tabInbox.SelectedTab == tabNormalMessage)
            {
                DataGridViewSelectedRowCollection selectedNormalMessRows = tblNormalMess.SelectedRows;
                if (selectedNormalMessRows.Count == 1)
                {
                    DataGridViewRow row = selectedNormalMessRows[0];
                    FormCompose frmCompose = new FormCompose();
                    frmCompose.Show();
                    frmCompose.txtPhoneNumber.Text = row.Cells["clmNbPhoneNormalMessInbox"].Value.ToString();
                }
                else if (selectedNormalMessRows.Count > 1)
                {
                    MessageBox.Show("Ban chi duoc chon 1 tin nhan de tra loi .");
                }
                else
                {
                    MessageBox.Show("Ban phai chon tin nhan de tra loi");
                }
            }
            else if (tabInbox.SelectedTab == tabSyntaxMess)
            {
                DataGridViewSelectedRowCollection selectedSyntaxMessRows = tblSyntaxMess.SelectedRows;
                if (selectedSyntaxMessRows.Count == 1)
                {
                    DataGridViewRow row = selectedSyntaxMessRows[0];
                    FormCompose frmCompose = new FormCompose();
                    frmCompose.Show();
                    frmCompose.txtPhoneNumber.Text = row.Cells["clmNbPhoneSyntaxInbox"].Value.ToString();
                }
                else if (selectedSyntaxMessRows.Count > 1)
                {
                    MessageBox.Show("Ban chi duoc chon 1 tin nhan de tra loi .");
                }
                else
                {
                    MessageBox.Show("Ban phai chon tin nhan de tra loi");
                }
            }
            else if (tabDeletedInbox.SelectedTab == tabSyntaxMessDeletedInbox)
            {
                DataGridViewSelectedRowCollection selectedSyntaxMessDeletedRows = tblSyntaxMessDeletedInbox.SelectedRows;
                if (selectedSyntaxMessDeletedRows.Count == 1)
                {
                    DataGridViewRow row = selectedSyntaxMessDeletedRows[0];
                    FormCompose frmCompose = new FormCompose();
                    frmCompose.Show();
                    frmCompose.txtPhoneNumber.Text = row.Cells["clmNbPhoneSyntaxMessDeletedInbox"].Value.ToString();
                }
                else if (selectedSyntaxMessDeletedRows.Count > 1)
                {
                    MessageBox.Show("Ban chi duoc chon 1 tin nhan de tra loi .");
                }
                else
                {
                    MessageBox.Show("Ban phai chon tin nhan de tra loi");
                }
            }
            else if (tabDeletedInbox.SelectedTab == tabNormalMessDeletedInbox)
            {
                DataGridViewSelectedRowCollection selectedNormalMessDeletedRows = tblNormalMessDeletedInbox.SelectedRows;
                if (selectedNormalMessDeletedRows.Count == 1)
                {
                    DataGridViewRow row = selectedNormalMessDeletedRows[0];
                    FormCompose frmCompose = new FormCompose();
                    frmCompose.Show();
                    frmCompose.txtPhoneNumber.Text = row.Cells["clmNbPhoneNormalMessDeletedInbox"].Value.ToString();
                }
                else if (selectedNormalMessDeletedRows.Count > 1)
                {
                    MessageBox.Show("Ban chi duoc chon 1 tin nhan de tra loi .");
                }
                else
                {
                    MessageBox.Show("Ban phai chon tin nhan de tra loi");
                }
            }
        }

        private void btnRemoveMessInbox_Click(object sender, EventArgs e)
        {
            if (tabDeletedInbox.SelectedTab == tabSyntaxMessDeletedInbox)
            {
                DataGridViewSelectedRowCollection selectedSyntaxMessDeletedRows = tblSyntaxMessDeletedInbox.SelectedRows;
                if (selectedSyntaxMessDeletedRows.Count > 0)
                {
                    if (MessageBox.Show("Ban co chac chan xoa vinh vien nhung tin nhan nay ?", "Xac Nhan Xoa .", MessageBoxButtons.YesNo) == DialogResult.Yes)
                    {
                        foreach (DataGridViewRow row in selectedSyntaxMessDeletedRows)
                        {

                            bool result = HopThuDenDAO.removeMesssInbox(row.Cells["clmIdSyntaxMessDeletedInbox"].Value.ToString());

                            //if (result == true)
                            //{
                            //    MessageBox.Show("Update Thanh Cong");
                            //}
                            //else
                            //{
                            //    MessageBox.Show("Update That Bai");
                            //}
                        }
                    }
                    showSyntaxMessDeletedInbox();
                }
                else
                {
                    MessageBox.Show("Ban chua chon tin nhan.");
                }
            }
            else if (tabDeletedInbox.SelectedTab == tabNormalMessDeletedInbox)
            {
                DataGridViewSelectedRowCollection selectedNormalMessDeletedRows = tblNormalMessDeletedInbox.SelectedRows;
                if (selectedNormalMessDeletedRows.Count > 0)
                {
                    if (MessageBox.Show("Ban co chac chan xoa vinh vien nhung tin nhan nay ?", "Xac Nhan Xoa .", MessageBoxButtons.YesNo) == DialogResult.Yes)
                    {
                        foreach (DataGridViewRow row in selectedNormalMessDeletedRows)
                        {
                            bool result = HopThuDenDAO.removeMesssInbox(row.Cells["clmIdNormalMessDeletedInbox"].Value.ToString());
                        }
                        //if (result == true)
                        //{
                        //    MessageBox.Show("Update Thanh Cong");
                        //}
                        //else
                        //{
                        //    MessageBox.Show("Update That Bai");
                        //}
                    }
                    showNormalMessInbox();
                }
                else
                {
                    MessageBox.Show("Ban chua chon tin nhan.");
                }
            }
        }

        private void btnMaskReadMessInbox_Click(object sender, EventArgs e)
        {
            if (tabInbox.SelectedTab == tabSyntaxMess)
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
            else if (tabInbox.SelectedTab == tabNormalMessage)
            {
                DataGridViewSelectedRowCollection selectedNormalMessRows = tblNormalMess.SelectedRows;
                if (selectedNormalMessRows.Count > 0)
                {
                    foreach (DataGridViewRow row in selectedNormalMessRows)
                    {
                        bool result = HopThuDenDAO.updateTinhTrangMessInbox(row.Cells["clmIdNormalMessInBox"].Value.ToString());
                        //if (result == true)
                        //{
                        //    MessageBox.Show("Update Thanh Cong");
                        //}
                        //else
                        //{
                        //    MessageBox.Show("Update That Bai");
                        //}
                    }
                    showNormalMessInbox();
                }
                else
                {
                    MessageBox.Show("Ban chua chon tin nhan.");
                }
            }
        }

        private void tabControls_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tabInbox.SelectedTab == tabMessDeleted)
            {
                this.btnForwardMessInbox.Enabled = false;
                this.btnDeleteMessInbox.Enabled = false;
                this.btnRemoveMessInbox.Enabled = true;
                this.btnMaskReadMessInbox.Enabled = false;
                this.btnReplyMessInbox.Enabled = true;
            }
            if (tabInbox.SelectedTab == tabSyntaxMess)
            {
                this.btnDeleteMessInbox.Enabled = true;
                this.btnRemoveMessInbox.Enabled = false;
                this.btnMaskReadMessInbox.Enabled = true;
                this.btnReplyMessInbox.Enabled = true;
                this.btnForwardMessInbox.Enabled = false;
            }
            if (tabInbox.SelectedTab == tabNormalMessage)
            {
                this.btnDeleteMessInbox.Enabled = true;
                this.btnRemoveMessInbox.Enabled = false;
                this.btnMaskReadMessInbox.Enabled = true;
                this.btnReplyMessInbox.Enabled = true;
                this.btnForwardMessInbox.Enabled = true;
            }
        }


        private void tabDeletedInbox_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            if (tabDeletedInbox.SelectedTab == tabSyntaxMessDeletedInbox)
            {
                this.btnForwardMessInbox.Enabled = false;
            }
            if (tabDeletedInbox.SelectedTab == tabNormalMessDeletedInbox)
            {
                this.btnForwardMessInbox.Enabled = true;
            }
        }

        
    }
}
