using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SMS.Form_Menu
{
    public partial class form_Main : Form
    {
        public form_Main()
        {
            InitializeComponent();
        }

        private void menu_changePassword_Click(object sender, EventArgs e)
        {
            new form_ChangePassword().Show();
        }
        private void menu_Inbox_Click(object sender, EventArgs e)
        {
            new form_Inbox().Show();
        }

        private void menu_InboxDeleted_Click(object sender, EventArgs e)
        {
            new form_InboxDeleted().Show();
        }

        private void menu_SentOk_Click(object sender, EventArgs e)
        {
            new form_SentOk().Show();
        }

        private void menu_Outbox_Click(object sender, EventArgs e)
        {
            new form_Outbox().Show();
        }

        private void menu_SentError_Click(object sender, EventArgs e)
        {
            new form_SentError().Show();
        }

        private void menu_Invalidmessage_Click(object sender, EventArgs e)
        {
            new form_InvalidMessage().Show();
        }

        private void menu_SentDeleted_Click(object sender, EventArgs e)
        {
            new form_SentDeleted().Show();
        }

        private void menu_Keyword_Click(object sender, EventArgs e)
        {
            new form_ManageKeyword().Show();
        }

        private void menu_Account_Click(object sender, EventArgs e)
        {
            new form_ManageAccount().Show();
        }
        private void menu_InboxMessageType_Click(object sender, EventArgs e)
        {
            new form_Inbox_MessageType().Show();
        }

        private void menu_Draft_Click(object sender, EventArgs e)
        {
            new form_Draft().Show();
        }

        private void systemConToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void systemToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void menuI1Sent_Click(object sender, EventArgs e)
        {

        }

        private void form_Main_Load(object sender, EventArgs e)
        {

        }
    }
}
