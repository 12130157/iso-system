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
        FormLogin login = new FormLogin();
        public FormMain()
        {
            InitializeComponent();
            //menuTool.Enabled = false;

        }
        public void menu()
        {
            if (!common.Constants.menutool.Equals(0))
            {
                menuTool.Enabled = true;
            }
            else
            {
                
                login.MdiParent = this;
                login.Show();
            } 
        
        }

        private void mnuChangePassword_Click(object sender, EventArgs e)
        {
            FormChangePassword change = new FormChangePassword();
            change.MdiParent = this;
            change.Show();
        }

        private void menuOutbox_Click(object sender, EventArgs e)
        {
            FormOutbox outbox = new FormOutbox();
            outbox.MdiParent = this;
            outbox.Show();
        }

        private void menuI2Inbox_Click(object sender, EventArgs e)
        {
            FormInbox inbox = new FormInbox();
            inbox.MdiParent = this;
            inbox.Show();
        }

        private void menuInboxDeleted_Click(object sender, EventArgs e)
        {
            FormInboxDeleted inboxdelete = new FormInboxDeleted();
            inboxdelete.MdiParent = this;
            inboxdelete.Show();
        }
        //
        private void menuDraft_Click(object sender, EventArgs e)
        {
            FormDraft draft = new FormDraft();
            draft.MdiParent = this;
            draft.Show();
        }

        private void menuSentDeleted_Click(object sender, EventArgs e)
        {
            FormSentDeleted sentdelete = new FormSentDeleted();
            sentdelete.MdiParent = this;
            sentdelete.Show();
        }

        private void menuSentOk_Click(object sender, EventArgs e)
        {
            new FormSentOk().ShowDialog();
        }

        private void menuSentError_Click(object sender, EventArgs e)
        {
            FormSentError sentError = new FormSentError();
            sentError.MdiParent = this;
            sentError.Show();
        }

        private void menuInvalidMessage_Click(object sender, EventArgs e)
        {
            FormInvalidMessage invalidMessge = new FormInvalidMessage();
            invalidMessge.MdiParent = this;
            invalidMessge.Show();
        }

        private void menuAccount_Click(object sender, EventArgs e)
        {
            FormManageAccount account = new FormManageAccount();
            account.MdiParent = this;
            account.Show();
        }

        private void menuKeyword_Click(object sender, EventArgs e)
        {
           FormManageKeyword keyword= new FormManageKeyword();
            keyword.MdiParent=this;
            keyword.Show();
        }

        private void menuCompose_Click(object sender, EventArgs e)
        {
            view.FormCompose compose = new view.FormCompose();
            compose.MdiParent = this;
            compose.Show();
        }

        private void menuAddressBook_Click(object sender, EventArgs e)
        {
            view.FormAddressBook addressBook = new view.FormAddressBook();
            addressBook.MdiParent = this;
            addressBook.Show();
        }
        
        

     
     
    }
}
