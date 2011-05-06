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

        private void deleteMessInbox(DataGridView tbl, string clmName)
        {
            DataGridViewSelectedRowCollection selectedRows = tbl.SelectedRows;
            if (selectedRows.Count > 0)
            {
                if (MessageBox.Show("Ban co chac chan xoa nhung tin nhan nay ?", "Xac Nhan Xoa .", MessageBoxButtons.YesNo) == DialogResult.Yes)
                {
                    foreach (DataGridViewRow row in selectedRows)
                    {
                        bool result = HopThuDenDAO.deleteMesssInbox(row.Cells[clmName].Value.ToString());
                    }
                }
            }
            else
            {
                MessageBox.Show("Ban chua chon tin nhan.");
            }
        }

        private void forwardMessInbox(DataGridView tbl, string clmName)
        {
            DataGridViewSelectedRowCollection selectedRows = tbl.SelectedRows;
            if (selectedRows.Count == 1)
            {
                DataGridViewRow row = selectedRows[0];
                FormCompose frmCompose = new FormCompose();
                frmCompose.Show();
                frmCompose.txtMessage.Text = row.Cells[clmName].Value.ToString();
            }
            else if (selectedRows.Count > 1)
            {
                MessageBox.Show("Ban chi duoc chon 1 tin nhan de chuyen tiep .");
            }
            else
            {
                MessageBox.Show("Ban phai chon tin nhan de chuyen tiep");
            }
        }

        private void removeMessInbox(DataGridView tbl, string clmName)
        {
            DataGridViewSelectedRowCollection selectedRows = tbl.SelectedRows;
            if (selectedRows.Count > 0)
            {
                if (MessageBox.Show("Ban co chac chan xoa vinh vien nhung tin nhan nay ?", "Xac Nhan Xoa .", MessageBoxButtons.YesNo) == DialogResult.Yes)
                {
                    foreach (DataGridViewRow row in selectedRows)
                    {
                        bool result = HopThuDenDAO.removeMesssInbox(row.Cells[clmName].Value.ToString());
                    }
                }
            }
            else
            {
                MessageBox.Show("Ban chua chon tin nhan.");
            }
        }

        private void replyMessInbox(DataGridView tbl, string clmName)
        {
            DataGridViewSelectedRowCollection selectedRows = tbl.SelectedRows;
            if (selectedRows.Count == 1)
            {
                DataGridViewRow row = selectedRows[0];
                FormCompose frmCompose = new FormCompose();
                frmCompose.Show();
                frmCompose.txtPhoneNumber.Text = row.Cells[clmName].Value.ToString();
            }
            else if (selectedRows.Count > 1)
            {
                MessageBox.Show("Ban chi duoc chon 1 tin nhan de tra loi .");
            }
            else
            {
                MessageBox.Show("Ban phai chon tin nhan de tra loi");
            }
        }

        private void maskReadMessInbox(DataGridView tbl, string clmName)
        {
            DataGridViewSelectedRowCollection selectedRows = tbl.SelectedRows;
            if (selectedRows.Count > 0)
            {
                foreach (DataGridViewRow row in selectedRows)
                {
                    bool result = HopThuDenDAO.updateTinhTrangMessInbox(row.Cells[clmName].Value.ToString());
                }
            }
            else
            {
                MessageBox.Show("Ban chua chon tin nhan.");
            }
        }

        private void btnDeleteMessInbox_Click(object sender, EventArgs e)
        {
            if (tabInbox.SelectedTab == tabSyntaxMess)
            {
                deleteMessInbox(tblSyntaxMess,"clmIdSyntaxMessInbox");
            
                showSyntaxMessInbox();
                showSyntaxMessDeletedInbox();
            }
            else if (tabInbox.SelectedTab == tabNormalMessage)
            {
                deleteMessInbox(tblNormalMess, "clmIdNormalMessInBox");

                showNormalMessInbox();
                showNormalMessDeletedInbox();
            }
        }

        private void btnReplyMessInbox_Click(object sender, EventArgs e)
        {
            if (tabInbox.SelectedTab == tabNormalMessage)
            {
                replyMessInbox(tblNormalMess, "clmNbPhoneNormalMessInbox");
            }
            else if (tabInbox.SelectedTab == tabSyntaxMess)
            {
                replyMessInbox(tblSyntaxMess, "clmNbPhoneSyntaxInbox");
            }
            else if (tabDeletedInbox.SelectedTab == tabSyntaxMessDeletedInbox)
            {
                replyMessInbox(tblSyntaxMessDeletedInbox, "clmNbPhoneSyntaxMessDeletedInbox");
            }
            else if (tabDeletedInbox.SelectedTab == tabNormalMessDeletedInbox)
            {
                replyMessInbox(tblNormalMessDeletedInbox, "clmNbPhoneNormalMessDeletedInbox");
            }
        }

        private void btnRemoveMessInbox_Click(object sender, EventArgs e)
        {
            if (tabDeletedInbox.SelectedTab == tabSyntaxMessDeletedInbox)
            {
                removeMessInbox(tblSyntaxMessDeletedInbox, "clmIdSyntaxMessDeletedInbox");
                showSyntaxMessDeletedInbox();
            }
            else if (tabDeletedInbox.SelectedTab == tabNormalMessDeletedInbox)
            {
                removeMessInbox(tblNormalMessDeletedInbox, "clmIdNormalMessDeletedInbox");
                showNormalMessDeletedInbox();
            }
        }

        private void btnMaskReadMessInbox_Click(object sender, EventArgs e)
        {
            if (tabInbox.SelectedTab == tabSyntaxMess)
            {
                maskReadMessInbox(tblSyntaxMess, "clmIdSyntaxMessInbox");
                showSyntaxMessInbox();
            }
            else if (tabInbox.SelectedTab == tabNormalMessage)
            {
                maskReadMessInbox(tblNormalMess, "clmIdNormalMessInBox");
                showNormalMessInbox();
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

        private void btnForwardMessInbox_Click(object sender, EventArgs e)
        {
            if (tabInbox.SelectedTab == tabNormalMessage)
            {
                forwardMessInbox(tblNormalMess,"clmContentNormalMessInbox");          
            }
            else if (tabDeletedInbox.SelectedTab == tabNormalMessDeletedInbox)
            {
                forwardMessInbox(tblNormalMessDeletedInbox, "clmContentNormalMessDeletedInbox");       
            }
        }

        private void tblSyntaxMess_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewSelectedRowCollection selectedRows = tblSyntaxMess.SelectedRows;
            if (selectedRows.Count == 1)
            {
                DataGridViewRow row = selectedRows[0];

                txtNbPhoneDe.Text = row.Cells["clmNbPhoneSyntaxInbox"].Value.ToString();
                txtSyntaxDe.Text = row.Cells["clmSyntaxMessInbox"].Value.ToString();
                txtDateTimeDe.Text = row.Cells["clmDateTimeSyntaxMessInbox"].Value.ToString();
                txtContentMessDe.Text = row.Cells["clmContentSyntaxMessInbox"].Value.ToString();
            }
        }

        private void tblNormalMess_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewSelectedRowCollection selectedRows = tblNormalMess.SelectedRows;
            if (selectedRows.Count == 1)
            {
                DataGridViewRow row = selectedRows[0];

                txtNbPhoneDe.Text = row.Cells["clmNbPhoneNormalMessInbox"].Value.ToString();
                txtSyntaxDe.Text = null;
                txtDateTimeDe.Text = row.Cells["clmDataTimeNormalMessInbox"].Value.ToString();
                txtContentMessDe.Text = row.Cells["clmContentNormalMessInbox"].Value.ToString();
            }
        }

        private void tblSyntaxMessDeletedInbox_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewSelectedRowCollection selectedRows = tblSyntaxMessDeletedInbox.SelectedRows;
            if (selectedRows.Count == 1)
            {
                DataGridViewRow row = selectedRows[0];

                txtNbPhoneDe.Text = row.Cells["clmNbPhoneSyntaxMessDeletedInbox"].Value.ToString();
                txtSyntaxDe.Text = row.Cells["clmSyntaxMessDeletedInbox"].Value.ToString();
                txtDateTimeDe.Text = row.Cells["clmDateTimeSyntaxMessDeletedInbox"].Value.ToString();
                txtContentMessDe.Text = row.Cells["clmContentSyntaxMessDeletedInbox"].Value.ToString();
            }
        }

        private void tblNormalMessDeletedInbox_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewSelectedRowCollection selectedRows = tblNormalMessDeletedInbox.SelectedRows;
            if (selectedRows.Count == 1)
            {
                DataGridViewRow row = selectedRows[0];

                txtNbPhoneDe.Text = row.Cells["clmNbPhoneNormalMessDeletedInbox"].Value.ToString();
                txtSyntaxDe.Text = null;
                txtDateTimeDe.Text = row.Cells["clmDateTimeNormalMessDeletedInbox"].Value.ToString();
                txtContentMessDe.Text = row.Cells["clmContentNormalMessDeletedInbox"].Value.ToString();
            }
        }

    }
}
