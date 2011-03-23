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

        private void tabSent_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tabSent.SelectedTab == tabSyntaxSent)
            {
                this.btnForwardMessSent.Enabled = false;
                this.btnDeleteMessSent.Enabled = true;
                this.btnReSentMessSent.Enabled = false;
                this.btnRemoveMessSent.Enabled = false;
            }
            if (tabSent.SelectedTab == tabNormalSent)
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
            if (tabSent.SelectedTab == tabSentDeleted)
            {
                this.btnForwardMessSent.Enabled = true;
                this.btnDeleteMessSent.Enabled = false;
                this.btnReSentMessSent.Enabled = false;
                this.btnRemoveMessSent.Enabled = true;
            }
        }
    }
}
