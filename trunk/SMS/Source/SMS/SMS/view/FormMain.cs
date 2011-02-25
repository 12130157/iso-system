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
    public partial class FormMain : Form
    {
        public FormMain()
        {
            InitializeComponent();
        }

        private void mnuChangePassword_Click(object sender, EventArgs e)
        {
            new FormChangePassword().Show();
        }

    
        //private void menu_SentOk_Click(object sender, EventArgs e)
        //{
        //    new form_SentOk().Show();
        //}
        private void menuOutbox_Click(object sender, EventArgs e)
        {
            new FormOutbox().Show();
        }

        private void menuI2Inbox_Click(object sender, EventArgs e)
        {
            new FormInbox().ShowDialog();
        }

        private void menuInboxDeleted_Click(object sender, EventArgs e)
        {
            new FormInboxDeleted().ShowDialog();
        }

        private void menuDraft_Click(object sender, EventArgs e)
        {
            new FormDraft().ShowDialog();
        }

        private void menuSentDeleted_Click(object sender, EventArgs e)
        {
            new FormSentDeleted().ShowDialog();
        }

        private void menuSentOk_Click(object sender, EventArgs e)
        {
            new FormSentOk().ShowDialog();
        }

        private void menuSentError_Click(object sender, EventArgs e)
        {
            new FormSentError().ShowDialog();
        }

        private void menuInvalidMessage_Click(object sender, EventArgs e)
        {
            new FormInvalidMessage().ShowDialog();
        }

        private void menuAccount_Click(object sender, EventArgs e)
        {
            new FormManageAccount().ShowDialog();
        }

        private void menuKeyword_Click(object sender, EventArgs e)
        {
            new FormManageKeyword().ShowDialog();
        }

        private void menuCompose_Click(object sender, EventArgs e)
        {
            new view.FormCompose().ShowDialog();
        }

        private void calendarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            new view.ManageCalendar().ShowDialog();
        }

        private void menuAddressBook_Click(object sender, EventArgs e)
        {
            new view.FormAddressBook().Show();
        }
        
        

     
     
    }
}
