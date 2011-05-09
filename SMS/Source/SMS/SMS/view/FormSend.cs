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
            this.txtFilterMessSent.Enabled = false;
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
            cboFilterMessSent.Text = "Choose...";
            if (cboFilterMessSent.Text.Equals("Choose..."))
            {
                txtFilterMessSent.Text = "";
                txtFilterMessSent.Enabled = false;
            }
            if (tabSent.SelectedTab == tabSyntaxMessSent)
            {
                this.btnForwardMessSent.Enabled = false;
                this.btnDeleteMessSent.Enabled = true;
                this.btnReSentMessSent.Enabled = false;
                this.btnRemoveMessSent.Enabled = false;
                showAllSyntaxMessSent();
            }
            if (tabSent.SelectedTab == tabNormalMessSent)
            {
                this.btnForwardMessSent.Enabled = true;
                this.btnDeleteMessSent.Enabled = true;
                this.btnReSentMessSent.Enabled = false;
                this.btnRemoveMessSent.Enabled = false;
                showAllNormalMessSent();
            }
            if (tabSent.SelectedTab == tabErrorMessSent)
            {
                if (tabMessErrorSent.SelectedTab == tabSyntaxMessErrorSent)
                {
                    showAllSyntaxMessErrorSent();
                    this.btnForwardMessSent.Enabled = false;
                    this.btnDeleteMessSent.Enabled = true;
                    this.btnReSentMessSent.Enabled = true;
                    this.btnRemoveMessSent.Enabled = false;
                }
                if (tabMessErrorSent.SelectedTab == tabNormalMessErrorSent)
                {
                    showAllNormalMessErrorSent();
                    this.btnForwardMessSent.Enabled = true;
                    this.btnDeleteMessSent.Enabled = true;
                    this.btnReSentMessSent.Enabled = true;
                    this.btnRemoveMessSent.Enabled = false;      
                }
            }
            if (tabSent.SelectedTab == tabDeletedMessSent)
            {
                if (tabMessDeletedSent.SelectedTab == tabSyntaxMessDeletedSent)
                {
                    showAllSyntaxMessDeletedSent();
                    this.btnForwardMessSent.Enabled = false;
                    this.btnDeleteMessSent.Enabled = false;
                    this.btnReSentMessSent.Enabled = false;
                    this.btnRemoveMessSent.Enabled = true;
                }
                if (tabMessDeletedSent.SelectedTab == tabNormalMessDeletedSent)
                {
                    showAllNormalMessDeletedSent();
                    this.btnForwardMessSent.Enabled = true;
                    this.btnDeleteMessSent.Enabled = false;
                    this.btnReSentMessSent.Enabled = false;
                    this.btnRemoveMessSent.Enabled = true;
                }
            }
        }

        private void tabMessErrorSent_SelectedIndexChanged(object sender, EventArgs e)
        {
            cboFilterMessSent.Text = "Choose...";
            if (cboFilterMessSent.Text.Equals("Choose..."))
            {
                txtFilterMessSent.Text = "";
                txtFilterMessSent.Enabled = false;
            }
            if (tabMessErrorSent.SelectedTab == tabSyntaxMessErrorSent)
            {
                showAllSyntaxMessErrorSent();
                btnForwardMessSent.Enabled = false;
            }
            if (tabMessErrorSent.SelectedTab == tabNormalMessErrorSent)
            {
                showAllNormalMessErrorSent();
                btnForwardMessSent.Enabled = true;
            }

        }

        private void tabMessDeletedSent_SelectedIndexChanged(object sender, EventArgs e)
        {
            cboFilterMessSent.Text = "Choose...";
            if (cboFilterMessSent.Text.Equals("Choose..."))
            {
                txtFilterMessSent.Text = "";
                txtFilterMessSent.Enabled = false;
            }
            if (tabMessDeletedSent.SelectedTab == tabSyntaxMessDeletedSent)
            {
                btnForwardMessSent.Enabled = false;
                showAllSyntaxMessDeletedSent();
            }
            if (tabMessDeletedSent.SelectedTab == tabNormalMessDeletedSent)
            {
                btnForwardMessSent.Enabled = true;
                showAllNormalMessDeletedSent();
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
                        bool result = HopThuDiDAO.updateMaTinNhanTraLoiInbox(row.Cells[clmName].Value.ToString());
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

        private void tblSyntaxMessSent_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewSelectedRowCollection selectedRows = tblSyntaxMessSent.SelectedRows;
            if (selectedRows.Count == 1)
            {
                DataGridViewRow row = selectedRows[0];

                txtNbPhoneDe.Text = row.Cells["clmNbPhoneSyntaxMessSent"].Value.ToString();
                txtSyntaxDe.Text = row.Cells["clmSyntaxMessSent"].Value.ToString();
                txtDateTimeDe.Text = row.Cells["clmDateTimeSyntaxMessSent"].Value.ToString();
                txtContentMessDe.Text = row.Cells["clmContentMessSent"].Value.ToString();
            }
        }

        private void tblNormalMessSent_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewSelectedRowCollection selectedRows = tblNormalMessSent.SelectedRows;
            if (selectedRows.Count == 1)
            {
                DataGridViewRow row = selectedRows[0];

                txtNbPhoneDe.Text = row.Cells["clmNbPhoneNormalMessSent"].Value.ToString();
                txtSyntaxDe.Text = null;
                txtDateTimeDe.Text = row.Cells["clmDateTimeNormalMessSent"].Value.ToString();
                txtContentMessDe.Text = row.Cells["clmContentNormalMessSent"].Value.ToString();
            }
        }

        private void tblSyntaxMessErrorSent_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewSelectedRowCollection selectedRows = tblSyntaxMessErrorSent.SelectedRows;
            if (selectedRows.Count == 1)
            {
                DataGridViewRow row = selectedRows[0];

                txtNbPhoneDe.Text = row.Cells["clmNbPhoneSyntaxMessErrorSent"].Value.ToString();
                txtSyntaxDe.Text = row.Cells["clmSyntaxErrorMessSent"].Value.ToString();
                txtDateTimeDe.Text = row.Cells["clmDateTimeSyntaxMessErrorSent"].Value.ToString();
                txtContentMessDe.Text = row.Cells["clmContentSyntaxMessErrorSent"].Value.ToString();
            }
        }

        private void tblNormalMessErrorSent_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewSelectedRowCollection selectedRows = tblNormalMessErrorSent.SelectedRows;
            if (selectedRows.Count == 1)
            {
                DataGridViewRow row = selectedRows[0];

                txtNbPhoneDe.Text = row.Cells["clmNbPhoneNormalMessErrorSent"].Value.ToString();
                txtSyntaxDe.Text = null;
                txtDateTimeDe.Text = row.Cells["clmDateTimeNormalMessErrorSent"].Value.ToString();
                txtContentMessDe.Text = row.Cells["clmContentNormalMessErrorSent"].Value.ToString();
            }
        }

        private void tblSyntaxMessDeletedSent_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewSelectedRowCollection selectedRows = tblSyntaxMessDeletedSent.SelectedRows;
            if (selectedRows.Count == 1)
            {
                DataGridViewRow row = selectedRows[0];

                txtNbPhoneDe.Text = row.Cells["clmNbPhoneSyntaxMessDeletedSent"].Value.ToString();
                txtSyntaxDe.Text = row.Cells["clmSyntaxMessDeletedSent"].Value.ToString();
                txtDateTimeDe.Text = row.Cells["clmDateTimeSyntaxMessDeletedSent"].Value.ToString();
                txtContentMessDe.Text = row.Cells["clmContentSyntaxMessDeletedSent"].Value.ToString();
            }
        }

        private void tblNormalMessDeletedSent_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewSelectedRowCollection selectedRows = tblNormalMessDeletedSent.SelectedRows;
            if (selectedRows.Count == 1)
            {
                DataGridViewRow row = selectedRows[0];

                txtNbPhoneDe.Text = row.Cells["clmNbPhoneNormalMessDeletedSent"].Value.ToString();
                txtSyntaxDe.Text = null;
                txtDateTimeDe.Text = row.Cells["clmDateTimeNormalMessDeletedSent"].Value.ToString();
                txtContentMessDe.Text = row.Cells["clmContentNormalMessDeletedSent"].Value.ToString();
            }
        }

        private void cboFilterMessSent_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtFilterMessSent.Enabled = true;
            if (tabSent.SelectedTab == tabSyntaxMessSent)
            {
                showAllSyntaxMessSent();
            }
            if (tabSent.SelectedTab == tabNormalMessSent)
            {
                showAllNormalMessSent();
                if (cboFilterMessSent.SelectedItem == cboFilterMessSent.Items[2])
                {
                    txtFilterMessSent.Enabled = false;
                }
            }
            if (tabSent.SelectedTab == tabErrorMessSent)
            {
                if (tabMessErrorSent.SelectedTab == tabSyntaxMessErrorSent)
                {
                    showAllSyntaxMessErrorSent();
                }
                if (tabMessErrorSent.SelectedTab == tabNormalMessErrorSent)
                {
                    showAllNormalMessErrorSent();
                    if (cboFilterMessSent.SelectedItem == cboFilterMessSent.Items[2])
                    {
                        txtFilterMessSent.Enabled = false;
                    }
                }
            }
            if (tabSent.SelectedTab == tabDeletedMessSent)
            {
                if (tabMessDeletedSent.SelectedTab == tabSyntaxMessDeletedSent)
                {
                    showAllSyntaxMessDeletedSent();
                }
                if (tabMessDeletedSent.SelectedTab == tabNormalMessDeletedSent)
                {
                    showAllNormalMessDeletedSent();
                    if (cboFilterMessSent.SelectedItem == cboFilterMessSent.Items[2])
                    {
                        txtFilterMessSent.Enabled = false;
                    }
                }
            }
        }

        private void txtFilterMessSent_TextChanged(object sender, EventArgs e)
        {
            if (tabSent.SelectedTab == tabSyntaxMessSent)
            {
                if (cboFilterMessSent.SelectedItem == cboFilterMessSent.Items[0])
                {
                    showSearchSytaxMessSentBySoDienThoai(txtFilterMessSent.Text);   
                }
                else if (cboFilterMessSent.SelectedItem == cboFilterMessSent.Items[1])
                {
                    showSearchSytaxMessSentByNoiDungTinNhan(txtFilterMessSent.Text);
                }
                else if (cboFilterMessSent.SelectedItem == cboFilterMessSent.Items[2])
                {
                    showSearchSytaxMessSentByCuPhap(txtFilterMessSent.Text);
                }
            }
            else if (tabSent.SelectedTab == tabNormalMessSent)
            {
                if (cboFilterMessSent.SelectedItem == cboFilterMessSent.Items[0])
                {
                    showSearchNormalMessSentBySoDienThoai(txtFilterMessSent.Text);
                }
                else if (cboFilterMessSent.SelectedItem == cboFilterMessSent.Items[1])
                {
                    showSearchNormalMessSentByNoiDungTinNhan(txtFilterMessSent.Text);
                }
            }
            else if (tabSent.SelectedTab == tabErrorMessSent)
            {
                if (tabMessErrorSent.SelectedTab == tabSyntaxMessErrorSent)
                {
                    if (cboFilterMessSent.SelectedItem == cboFilterMessSent.Items[0])
                    {
                        showSearchSytaxMessErrorSentBySoDienThoai(txtFilterMessSent.Text);
                    }
                    else if (cboFilterMessSent.SelectedItem == cboFilterMessSent.Items[1])
                    {
                        showSearchSytaxMessErrorSentByNoiDungTinNhan(txtFilterMessSent.Text);
                    }
                    else if (cboFilterMessSent.SelectedItem == cboFilterMessSent.Items[2])
                    {
                        showSearchSytaxMessErrorSentByCuPhap(txtFilterMessSent.Text);
                    }
                }
                else if (tabMessErrorSent.SelectedTab == tabNormalMessErrorSent)
                {
                    if (cboFilterMessSent.SelectedItem == cboFilterMessSent.Items[0])
                    {
                        showSearchNormalMessErrorSentBySoDienThoai(txtFilterMessSent.Text);
                    }
                    else if (cboFilterMessSent.SelectedItem == cboFilterMessSent.Items[1])
                    {
                        showSearchNormalMessErrorSentByNoiDungTinNhan(txtFilterMessSent.Text);
                    }
                }
            }
            else if (tabSent.SelectedTab == tabDeletedMessSent)
            {
                if (tabMessDeletedSent.SelectedTab == tabSyntaxMessDeletedSent)
                {
                    if (cboFilterMessSent.SelectedItem == cboFilterMessSent.Items[0])
                    {
                        showSearchSytaxMessDeletedSentBySoDienThoai(txtFilterMessSent.Text);
                    }
                    else if (cboFilterMessSent.SelectedItem == cboFilterMessSent.Items[1])
                    {
                        showSearchSytaxMessDeletedSentByNoiDungTinNhan(txtFilterMessSent.Text);
                    }
                    else if (cboFilterMessSent.SelectedItem == cboFilterMessSent.Items[2])
                    {
                        showSearchSytaxMessDeletedSentByCuPhap(txtFilterMessSent.Text);
                    }
                }
                else if (tabMessDeletedSent.SelectedTab == tabNormalMessDeletedSent)
                {
                    if (cboFilterMessSent.SelectedItem == cboFilterMessSent.Items[0])
                    {
                        showSearchNormalMessDeletedSentBySoDienThoai(txtFilterMessSent.Text);
                    }
                    else if (cboFilterMessSent.SelectedItem == cboFilterMessSent.Items[1])
                    {
                        showSearchNormalMessDeletedSentByNoiDungTinNhan(txtFilterMessSent.Text);
                    }
                }
            }
        }

        private void showSearchSytaxMessSentBySoDienThoai(string nbPhone)
        {
            DataTable tbl = HopThuDiDAO.getSyntaxMessSentByNbPhone(nbPhone);
            tblSyntaxMessSent.DataSource = tbl;
        }

        private void showSearchSytaxMessSentByNoiDungTinNhan(string noiDungMess)
        {
            DataTable tbl = HopThuDiDAO.getSyntaxMessSentByNoiDungTinNhan(noiDungMess);
            tblSyntaxMessSent.DataSource = tbl;
        }

        private void showSearchSytaxMessSentByCuPhap(string cuPhap)
        {
            DataTable tbl = HopThuDiDAO.getSyntaxMessSentByCuPhap(cuPhap);
            tblSyntaxMessSent.DataSource = tbl;
        }

        private void showSearchNormalMessSentBySoDienThoai(string nbPhone)
        {
            DataTable tbl = HopThuDiDAO.getNormalMessSentByNbPhone(nbPhone);
            tblNormalMessSent.DataSource = tbl;
        }

        private void showSearchNormalMessSentByNoiDungTinNhan(string noiDungMess)
        {
            DataTable tbl = HopThuDiDAO.getNormalMessSentByNoiDungTinNhan(noiDungMess);
            tblNormalMessSent.DataSource = tbl;
        }

        private void showSearchSytaxMessErrorSentBySoDienThoai(string nbPhone)
        {
            DataTable tbl = HopThuDiDAO.getSyntaxMessErrorSentByNbPhone(nbPhone);
            tblSyntaxMessErrorSent.DataSource = tbl;
        }

        private void showSearchSytaxMessErrorSentByNoiDungTinNhan(string noiDungMess)
        {
            DataTable tbl = HopThuDiDAO.getSyntaxMessErrorSentByNoiDungTinNhan(noiDungMess);
            tblSyntaxMessErrorSent.DataSource = tbl;
        }

        private void showSearchSytaxMessErrorSentByCuPhap(string cuPhap)
        {
            DataTable tbl = HopThuDiDAO.getSyntaxMessErrorSentByCuPhap(cuPhap);
            tblSyntaxMessErrorSent.DataSource = tbl;
        }

        private void showSearchNormalMessErrorSentBySoDienThoai(string nbPhone)
        {
            DataTable tbl = HopThuDiDAO.getNormalMessErrorSentByNbPhone(nbPhone);
            tblNormalMessErrorSent.DataSource = tbl;
        }

        private void showSearchNormalMessErrorSentByNoiDungTinNhan(string noiDungMess)
        {
            DataTable tbl = HopThuDiDAO.getNormalMessErrorSentByNoiDungTinNhan(noiDungMess);
            tblNormalMessErrorSent.DataSource = tbl;
        }

        private void showSearchSytaxMessDeletedSentBySoDienThoai(string nbPhone)
        {
            DataTable tbl = HopThuDiDAO.getSyntaxMessDeletedSentByNbPhone(nbPhone);
            tblSyntaxMessDeletedSent.DataSource = tbl;
        }

        private void showSearchSytaxMessDeletedSentByNoiDungTinNhan(string noiDungMess)
        {
            DataTable tbl = HopThuDiDAO.getSyntaxMessDeletedSentByNoiDungTinNhan(noiDungMess);
            tblSyntaxMessDeletedSent.DataSource = tbl;
        }

        private void showSearchSytaxMessDeletedSentByCuPhap(string cuPhap)
        {
            DataTable tbl = HopThuDiDAO.getSyntaxMessDeletedSentByCuPhap(cuPhap);
            tblSyntaxMessDeletedSent.DataSource = tbl;
        }

        private void showSearchNormalMessDeletedSentBySoDienThoai(string nbPhone)
        {
            DataTable tbl = HopThuDiDAO.getNormalMessDeletedSentByNbPhone(nbPhone);
            tblNormalMessDeletedSent.DataSource = tbl;
        }

        private void showSearchNormalMessDeletedSentByNoiDungTinNhan(string noiDungMess)
        {
            DataTable tbl = HopThuDiDAO.getNormalMessDeletedSentByNoiDungTinNhan(noiDungMess);
            tblNormalMessDeletedSent.DataSource = tbl;
        }
    }
}
