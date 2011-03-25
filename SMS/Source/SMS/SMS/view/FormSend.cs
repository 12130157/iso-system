using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using GsmComm.PduConverter;

namespace SMS
{
    public partial class Sent : Form
    {
        public Sent()
        {
            InitializeComponent();
            showAllSyntaxMessSent();
            showAllNormalMessSent();
            showAllSyntaxMessErrorSent();
            showAllNormalMessErrorSent();
            showAllSyntaxMessDeletedSent();
            showAllNormalMessDeletedSent();
            this.btnForwardMessSent.Enabled = false;
            this.btnDeleteMessSent.Enabled = true;
            this.btnReSentMessSent.Enabled = false;
            this.btnRemoveMessSent.Enabled = false;
        }

        public void showAllSyntaxMessSent()
        {
            DataTable tableSyntaxMessSent = HopThuDiDAO.getAllSyntaxMessSent();
            tblSyntaxMessSent.DataSource = tableSyntaxMessSent;
        }

        public void showAllNormalMessSent()
        {
            DataTable tableNormalMessSent = HopThuDiDAO.getAllNormalMessSent();
            tblNormalMessSent.DataSource = tableNormalMessSent;
        }

        public void showAllSyntaxMessErrorSent()
        {
            DataTable tableSyntaxMessErrorSent = HopThuDiDAO.getAllSyntaxMessErrorSent();
            tblSyntaxMessErrorSent.DataSource = tableSyntaxMessErrorSent;
        }

        public void showAllNormalMessErrorSent()
        {
            DataTable tableNormalMessErrorSent = HopThuDiDAO.getAllNormalMessErrorSent();
            tblNormalMessErrorSent.DataSource = tableNormalMessErrorSent;
        }

        public void showAllSyntaxMessDeletedSent()
        {
            DataTable tableSyntaxMessDeletedSent = HopThuDiDAO.getAllSyntaxMessDeletedSent();
            tblSyntaxMessDeletedSent.DataSource = tableSyntaxMessDeletedSent;
        }

        public void showAllNormalMessDeletedSent()
        {
            DataTable tableNormalMessDeletedSent = HopThuDiDAO.getAllNormalMessDeletedSent();
            tblNormalMessDeletedSent.DataSource = tableNormalMessDeletedSent;
        }

        private void tabSent_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tabSent.SelectedTab == tabSyntaxMessSent)
            {
                this.btnForwardMessSent.Enabled = false;
                this.btnDeleteMessSent.Enabled = true;
                this.btnReSentMessSent.Enabled = false;
                this.btnRemoveMessSent.Enabled = false;
            }
            if (tabSent.SelectedTab == tabNormalMessSent)
            {
                this.btnForwardMessSent.Enabled = true;
                this.btnDeleteMessSent.Enabled = true;
                this.btnReSentMessSent.Enabled = false;
                this.btnRemoveMessSent.Enabled = false;
            }
            if (tabSent.SelectedTab == tabErrorMessSent)
            {
                this.btnForwardMessSent.Enabled = false;
                this.btnDeleteMessSent.Enabled = true;
                this.btnReSentMessSent.Enabled = true;
                this.btnRemoveMessSent.Enabled = false;
            }
            if (tabSent.SelectedTab == tadDeletedMessSent)
            {
                this.btnForwardMessSent.Enabled = false;
                this.btnDeleteMessSent.Enabled = false;
                this.btnReSentMessSent.Enabled = false;
                this.btnRemoveMessSent.Enabled = true;
            }
        }

        private void tabMessErrorSent_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tabMessErrorSent.SelectedTab == tabSyntaxMessErrorSent)
            {
                btnForwardMessSent.Enabled = false;
            }
            if (tabMessErrorSent.SelectedTab == tabNormalMessErrorSent)
            {
                btnForwardMessSent.Enabled = true;
            }

        }

        private void tabMessDeletedSent_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tabMessDeletedSent.SelectedTab == tabSyntaxMessDeletedSent)
            {
                btnForwardMessSent.Enabled = false;
            }
            if (tabMessDeletedSent.SelectedTab == tabNormalMessDeletedSent)
            {
                btnForwardMessSent.Enabled = true;
            }
        }

        private void btnForwardMessSent_Click(object sender, EventArgs e)
        {
            if (tabSent.SelectedTab == tabNormalMessSent)
            {
                forwardMessSent(tblNormalMessSent, "clmContentNormalMessSent");
            }
            else if (tabMessErrorSent.SelectedTab == tabNormalMessErrorSent)
            {
                forwardMessSent(tblNormalMessErrorSent, "clmContentNormalMessErrorSent");
            }
            else if (tabMessDeletedSent.SelectedTab == tabNormalMessDeletedSent)
            {
                forwardMessSent(tblNormalMessDeletedSent, "clmContentNormalMessDeletedSent");
            }
        }

        private void btnDeleteMessSent_Click(object sender, EventArgs e)
        {
            if (tabSent.SelectedTab == tabSyntaxMessSent)
            {
                deleteMessSent(tblSyntaxMessSent, "clmIdSyntaxMessSent");
                showAllSyntaxMessSent();
                showAllSyntaxMessDeletedSent();
            }
            if (tabSent.SelectedTab == tabNormalMessSent)
            {
                deleteMessSent(tblNormalMessSent,"clmIdNormalMessSent");
                showAllNormalMessSent();
                showAllNormalMessDeletedSent();
            }
            if (tabSent.SelectedTab == tabErrorMessSent)
            {
                if (tabMessErrorSent.SelectedTab == tabSyntaxMessErrorSent)
                {
                    removeMessSent(tblSyntaxMessErrorSent, "clmIdSyntaxMessError");
                    showAllSyntaxMessErrorSent();
                }
                if (tabMessErrorSent.SelectedTab == tabNormalMessErrorSent)
                {
                    removeMessSent(tblNormalMessErrorSent, "clmIdNormalMessErrorSent");
                    showAllNormalMessErrorSent();
                }
            }
        }

        private void btnRemoveMessSent_Click(object sender, EventArgs e)
        {
            if (tabMessDeletedSent.SelectedTab == tabSyntaxMessDeletedSent)
            {
                removeMessSent(tblSyntaxMessDeletedSent, "clmIdSyntaxMessDeletedSent");
                showAllSyntaxMessDeletedSent();
            }
            if (tabMessDeletedSent.SelectedTab == tabNormalMessDeletedSent)
            {
                removeMessSent(tblNormalMessDeletedSent, "clmIdNormalMessDeletedSent");
                showAllNormalMessDeletedSent();
            }
        }

        private void deleteMessSent(DataGridView tbl, string clmName)
        {
            DataGridViewSelectedRowCollection selectedRows = tbl.SelectedRows;
            if (selectedRows.Count > 0)
            {
                if (MessageBox.Show("Ban co chac chan xoa nhung tin nhan nay ?", "Xac Nhan Xoa .", MessageBoxButtons.YesNo) == DialogResult.Yes)
                {
                    foreach (DataGridViewRow row in selectedRows)
                    {
                        bool result = HopThuDiDAO.deleteMessSent(row.Cells[clmName].Value.ToString());
                    }
                }
            }
            else
            {
                MessageBox.Show("Ban chua chon tin nhan.");
            }
        }

        private void removeMessSent(DataGridView tbl, string clmName)
        {
            DataGridViewSelectedRowCollection selectedRows = tbl.SelectedRows;
            if (selectedRows.Count > 0)
            {
                if (MessageBox.Show("Ban co chac chan xoa vinh vien nhung tin nhan nay ?", "Xac Nhan Xoa .", MessageBoxButtons.YesNo) == DialogResult.Yes)
                {
                    foreach (DataGridViewRow row in selectedRows)
                    {
                        bool result = HopThuDiDAO.removeIdMessSentInHopThuDen(row.Cells[clmName].Value.ToString());
                        bool result1 = HopThuDiDAO.removeMessSent(row.Cells[clmName].Value.ToString());
                    }
                }
            }
            else
            {
                MessageBox.Show("Ban chua chon tin nhan.");
            }  
        }

        private void forwardMessSent(DataGridView tbl, string clmContentMess)
        {
            DataGridViewSelectedRowCollection selectedRows = tbl.SelectedRows;
            if (selectedRows.Count == 1)
            {
                DataGridViewRow row = selectedRows[0];
                FormCompose frmCompose = new FormCompose();
                frmCompose.Show();
                frmCompose.txtMessage.Text = row.Cells[clmContentMess].Value.ToString();
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

        private void btnReSentMessSent_Click(object sender, EventArgs e)
        {
            if (tabMessErrorSent.SelectedTab == tabSyntaxMessErrorSent)
            {
                reSendMess(tblSyntaxMessErrorSent, "clmIdSyntaxMessError", "clmContentSyntaxMessErrorSent", "clmNbPhoneSyntaxMessErrorSent", "4");
                showAllSyntaxMessSent();
                showAllSyntaxMessErrorSent();
            }
            else if (tabMessErrorSent.SelectedTab == tabNormalMessErrorSent)
            {
                reSendMess(tblNormalMessErrorSent, "clmIdNormalMessErrorSent", "clmContentNormalMessErrorSent", "clmNbPhoneNormalMessErrorSent", "6");
                showAllNormalMessSent();
                showAllNormalMessErrorSent();
            }
        }

        private void reSendMess(DataGridView tbl,string clmName, string clmConTentMess,string clmNbPhone,string loaihopthu)
        {
            DataGridViewSelectedRowCollection selectedRows = tbl.SelectedRows;
            if (selectedRows.Count == 1)
            {
                DataGridViewRow row = selectedRows[0];
                // danh dau tinh trang 
                int j = 0;
                string hopthu = "";
                try
                {
                    SmsSubmitPdu pdu = new SmsSubmitPdu(row.Cells[clmConTentMess].Value.ToString(), row.Cells[clmNbPhone].Value.ToString(), "");
                    j = 1;
                    hopthu = loaihopthu;
                    common.Constants.comm.SendMessage(pdu);
                }
                catch (Exception)
                {
                    j = 0;
                    hopthu = "";
                    MessageBox.Show("Send Message Failed");
                }

                bool result = HopThuDiDAO.updateStatusReSentMess(j, hopthu, row.Cells[clmName].Value.ToString());
            }
            else if (selectedRows.Count > 1)
            {
                MessageBox.Show("Ban chi duoc chon 1 tin nhan de gui lai .");
            }
            else
            {
                MessageBox.Show("Ban phai chon tin nhan de gui lai");
            }
        }
    }
}
