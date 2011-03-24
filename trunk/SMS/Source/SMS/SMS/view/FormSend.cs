using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

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
                this.btnForwardMessSent.Enabled = true;
                this.btnDeleteMessSent.Enabled = true;
                this.btnReSentMessSent.Enabled = true;
                this.btnRemoveMessSent.Enabled = false;
            }
            if (tabSent.SelectedTab == tadDeletedMessSent)
            {
                this.btnForwardMessSent.Enabled = true;
                this.btnDeleteMessSent.Enabled = false;
                this.btnReSentMessSent.Enabled = false;
                this.btnRemoveMessSent.Enabled = true;
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
            //if (tabSent.SelectedTab == tabErrorMessSent)
            //{
            //    if (tabMessErrorSent.SelectedTab == tabSyntaxMessErrorSent)
            //    { 
                    
            //    }
            //    if (tabMessErrorSent.SelectedTab == tabNormalMessErrorSent)
            //    { 
                    
            //    }
            //}
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
            }
            else
            {
                MessageBox.Show("Ban chua chon tin nhan.");
            }
        }
    }
}
