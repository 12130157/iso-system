namespace SMS.Form_Menu
{
    partial class form_Main
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(form_Main));
            this.menuTool = new System.Windows.Forms.MenuStrip();
            this.menuFile = new System.Windows.Forms.ToolStripMenuItem();
            this.menuI1ChangePassword = new System.Windows.Forms.ToolStripMenuItem();
            this.menuI1Logout = new System.Windows.Forms.ToolStripMenuItem();
            this.menuMessage = new System.Windows.Forms.ToolStripMenuItem();
            this.menuI1Inbox = new System.Windows.Forms.ToolStripMenuItem();
            this.menuI2Inbox = new System.Windows.Forms.ToolStripMenuItem();
            this.menuI2InboxDeleted = new System.Windows.Forms.ToolStripMenuItem();
            this.menuI1Sent = new System.Windows.Forms.ToolStripMenuItem();
            this.menuI2SentOk = new System.Windows.Forms.ToolStripMenuItem();
            this.menuI2SentError = new System.Windows.Forms.ToolStripMenuItem();
            this.menuI2InvalidMessage = new System.Windows.Forms.ToolStripMenuItem();
            this.menuI2SentDeleted = new System.Windows.Forms.ToolStripMenuItem();
            this.menuSystem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuI1Keyword = new System.Windows.Forms.ToolStripMenuItem();
            this.menuI1Account = new System.Windows.Forms.ToolStripMenuItem();
            this.menuI1Help = new System.Windows.Forms.ToolStripMenuItem();
            this.menuI1About = new System.Windows.Forms.ToolStripMenuItem();
            this.menuI1SystemConfig = new System.Windows.Forms.ToolStripMenuItem();
            this.menuI1Compose = new System.Windows.Forms.ToolStripMenuItem();
            this.menuI2Draft = new System.Windows.Forms.ToolStripMenuItem();
            this.menuI1Outbox = new System.Windows.Forms.ToolStripMenuItem();
            this.menuI1AddressBook = new System.Windows.Forms.ToolStripMenuItem();
            this.menuTool.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuTool
            // 
            this.menuTool.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Bold);
            this.menuTool.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuFile,
            this.menuMessage,
            this.menuSystem});
            this.menuTool.Location = new System.Drawing.Point(0, 0);
            this.menuTool.Name = "menuTool";
            this.menuTool.Size = new System.Drawing.Size(854, 24);
            this.menuTool.TabIndex = 0;
            this.menuTool.Text = "menuTool";
            // 
            // menuFile
            // 
            this.menuFile.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuI1ChangePassword,
            this.menuI1Help,
            this.menuI1About,
            this.menuI1SystemConfig,
            this.menuI1Logout});
            this.menuFile.Image = ((System.Drawing.Image)(resources.GetObject("menuFile.Image")));
            this.menuFile.Name = "menuFile";
            this.menuFile.Size = new System.Drawing.Size(54, 20);
            this.menuFile.Text = "File";
            // 
            // menuI1ChangePassword
            // 
            this.menuI1ChangePassword.Image = ((System.Drawing.Image)(resources.GetObject("menuI1ChangePassword.Image")));
            this.menuI1ChangePassword.Name = "menuI1ChangePassword";
            this.menuI1ChangePassword.Size = new System.Drawing.Size(173, 22);
            this.menuI1ChangePassword.Text = "Change Password";
            this.menuI1ChangePassword.Click += new System.EventHandler(this.menu_changePassword_Click);
            // 
            // menuI1Logout
            // 
            this.menuI1Logout.Image = ((System.Drawing.Image)(resources.GetObject("menuI1Logout.Image")));
            this.menuI1Logout.Name = "menuI1Logout";
            this.menuI1Logout.Size = new System.Drawing.Size(173, 22);
            this.menuI1Logout.Text = "Logout";
            // 
            // menuMessage
            // 
            this.menuMessage.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuI1Compose,
            this.menuI1Outbox,
            this.menuI1Inbox,
            this.menuI1Sent});
            this.menuMessage.Image = ((System.Drawing.Image)(resources.GetObject("menuMessage.Image")));
            this.menuMessage.Name = "menuMessage";
            this.menuMessage.Size = new System.Drawing.Size(85, 20);
            this.menuMessage.Text = "Message";
            this.menuMessage.Click += new System.EventHandler(this.systemToolStripMenuItem_Click);
            // 
            // menuI1Inbox
            // 
            this.menuI1Inbox.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuI2Inbox,
            this.menuI2InboxDeleted,
            this.menuI2Draft});
            this.menuI1Inbox.Image = ((System.Drawing.Image)(resources.GetObject("menuI1Inbox.Image")));
            this.menuI1Inbox.Name = "menuI1Inbox";
            this.menuI1Inbox.Size = new System.Drawing.Size(152, 22);
            this.menuI1Inbox.Text = "Inbox";
            // 
            // menuI2Inbox
            // 
            this.menuI2Inbox.Image = ((System.Drawing.Image)(resources.GetObject("menuI2Inbox.Image")));
            this.menuI2Inbox.Name = "menuI2Inbox";
            this.menuI2Inbox.Size = new System.Drawing.Size(154, 22);
            this.menuI2Inbox.Text = "Inbox";
            this.menuI2Inbox.Click += new System.EventHandler(this.menu_Inbox_Click);
            // 
            // menuI2InboxDeleted
            // 
            this.menuI2InboxDeleted.Image = ((System.Drawing.Image)(resources.GetObject("menuI2InboxDeleted.Image")));
            this.menuI2InboxDeleted.Name = "menuI2InboxDeleted";
            this.menuI2InboxDeleted.Size = new System.Drawing.Size(154, 22);
            this.menuI2InboxDeleted.Text = "Inbox Deleted";
            this.menuI2InboxDeleted.Click += new System.EventHandler(this.menu_InboxDeleted_Click);
            // 
            // menuI1Sent
            // 
            this.menuI1Sent.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuI2SentOk,
            this.menuI2SentError,
            this.menuI2InvalidMessage,
            this.menuI2SentDeleted});
            this.menuI1Sent.Image = ((System.Drawing.Image)(resources.GetObject("menuI1Sent.Image")));
            this.menuI1Sent.Name = "menuI1Sent";
            this.menuI1Sent.Size = new System.Drawing.Size(152, 22);
            this.menuI1Sent.Text = "Sent";
            this.menuI1Sent.Click += new System.EventHandler(this.menuI1Sent_Click);
            // 
            // menuI2SentOk
            // 
            this.menuI2SentOk.Image = ((System.Drawing.Image)(resources.GetObject("menuI2SentOk.Image")));
            this.menuI2SentOk.Name = "menuI2SentOk";
            this.menuI2SentOk.Size = new System.Drawing.Size(166, 22);
            this.menuI2SentOk.Text = "Sent Ok";
            this.menuI2SentOk.Click += new System.EventHandler(this.menu_SentOk_Click);
            // 
            // menuI2SentError
            // 
            this.menuI2SentError.Image = ((System.Drawing.Image)(resources.GetObject("menuI2SentError.Image")));
            this.menuI2SentError.Name = "menuI2SentError";
            this.menuI2SentError.Size = new System.Drawing.Size(166, 22);
            this.menuI2SentError.Text = "Sent Error";
            this.menuI2SentError.Click += new System.EventHandler(this.menu_SentError_Click);
            // 
            // menuI2InvalidMessage
            // 
            this.menuI2InvalidMessage.Image = ((System.Drawing.Image)(resources.GetObject("menuI2InvalidMessage.Image")));
            this.menuI2InvalidMessage.Name = "menuI2InvalidMessage";
            this.menuI2InvalidMessage.Size = new System.Drawing.Size(166, 22);
            this.menuI2InvalidMessage.Text = "Invalid Message";
            this.menuI2InvalidMessage.Click += new System.EventHandler(this.menu_Invalidmessage_Click);
            // 
            // menuI2SentDeleted
            // 
            this.menuI2SentDeleted.Image = ((System.Drawing.Image)(resources.GetObject("menuI2SentDeleted.Image")));
            this.menuI2SentDeleted.Name = "menuI2SentDeleted";
            this.menuI2SentDeleted.Size = new System.Drawing.Size(166, 22);
            this.menuI2SentDeleted.Text = "Sent Deleted";
            this.menuI2SentDeleted.Click += new System.EventHandler(this.menu_SentDeleted_Click);
            // 
            // menuSystem
            // 
            this.menuSystem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuI1Keyword,
            this.menuI1Account,
            this.menuI1AddressBook});
            this.menuSystem.Image = ((System.Drawing.Image)(resources.GetObject("menuSystem.Image")));
            this.menuSystem.Name = "menuSystem";
            this.menuSystem.Size = new System.Drawing.Size(78, 20);
            this.menuSystem.Text = "System";
            // 
            // menuI1Keyword
            // 
            this.menuI1Keyword.Image = ((System.Drawing.Image)(resources.GetObject("menuI1Keyword.Image")));
            this.menuI1Keyword.Name = "menuI1Keyword";
            this.menuI1Keyword.Size = new System.Drawing.Size(152, 22);
            this.menuI1Keyword.Text = "Keyword";
            this.menuI1Keyword.Click += new System.EventHandler(this.menu_Keyword_Click);
            // 
            // menuI1Account
            // 
            this.menuI1Account.Image = ((System.Drawing.Image)(resources.GetObject("menuI1Account.Image")));
            this.menuI1Account.Name = "menuI1Account";
            this.menuI1Account.Size = new System.Drawing.Size(152, 22);
            this.menuI1Account.Text = "Account";
            this.menuI1Account.Click += new System.EventHandler(this.menu_Account_Click);
            // 
            // menuI1Help
            // 
            this.menuI1Help.Image = ((System.Drawing.Image)(resources.GetObject("menuI1Help.Image")));
            this.menuI1Help.Name = "menuI1Help";
            this.menuI1Help.Size = new System.Drawing.Size(173, 22);
            this.menuI1Help.Text = "Help";
            // 
            // menuI1About
            // 
            this.menuI1About.Image = ((System.Drawing.Image)(resources.GetObject("menuI1About.Image")));
            this.menuI1About.Name = "menuI1About";
            this.menuI1About.Size = new System.Drawing.Size(173, 22);
            this.menuI1About.Text = "About ";
            // 
            // menuI1SystemConfig
            // 
            this.menuI1SystemConfig.Image = ((System.Drawing.Image)(resources.GetObject("menuI1SystemConfig.Image")));
            this.menuI1SystemConfig.Name = "menuI1SystemConfig";
            this.menuI1SystemConfig.Size = new System.Drawing.Size(173, 22);
            this.menuI1SystemConfig.Text = "System Config";
            this.menuI1SystemConfig.Click += new System.EventHandler(this.systemConToolStripMenuItem_Click);
            // 
            // menuI1Compose
            // 
            this.menuI1Compose.Image = ((System.Drawing.Image)(resources.GetObject("menuI1Compose.Image")));
            this.menuI1Compose.Name = "menuI1Compose";
            this.menuI1Compose.Size = new System.Drawing.Size(152, 22);
            this.menuI1Compose.Text = "Compose";
            // 
            // menuI2Draft
            // 
            this.menuI2Draft.Image = ((System.Drawing.Image)(resources.GetObject("menuI2Draft.Image")));
            this.menuI2Draft.Name = "menuI2Draft";
            this.menuI2Draft.Size = new System.Drawing.Size(154, 22);
            this.menuI2Draft.Text = "Draft";
            this.menuI2Draft.Click += new System.EventHandler(this.menu_Draft_Click);
            // 
            // menuI1Outbox
            // 
            this.menuI1Outbox.Image = ((System.Drawing.Image)(resources.GetObject("menuI1Outbox.Image")));
            this.menuI1Outbox.Name = "menuI1Outbox";
            this.menuI1Outbox.Size = new System.Drawing.Size(152, 22);
            this.menuI1Outbox.Text = "Outbox";
            this.menuI1Outbox.Click += new System.EventHandler(this.menu_Outbox_Click);
            // 
            // menuI1AddressBook
            // 
            this.menuI1AddressBook.Image = ((System.Drawing.Image)(resources.GetObject("menuI1AddressBook.Image")));
            this.menuI1AddressBook.Name = "menuI1AddressBook";
            this.menuI1AddressBook.Size = new System.Drawing.Size(152, 22);
            this.menuI1AddressBook.Text = "Address Book";
            // 
            // form_Main
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(854, 614);
            this.Controls.Add(this.menuTool);
            this.MainMenuStrip = this.menuTool;
            this.Name = "form_Main";
            this.Text = "SMS Service";
            this.Load += new System.EventHandler(this.form_Main_Load);
            this.menuTool.ResumeLayout(false);
            this.menuTool.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuTool;
        private System.Windows.Forms.ToolStripMenuItem menuFile;
        private System.Windows.Forms.ToolStripMenuItem menuI1Logout;
        private System.Windows.Forms.ToolStripMenuItem menuI1ChangePassword;
        private System.Windows.Forms.ToolStripMenuItem menuMessage;
        private System.Windows.Forms.ToolStripMenuItem menuI1Inbox;
        private System.Windows.Forms.ToolStripMenuItem menuI2Inbox;
        private System.Windows.Forms.ToolStripMenuItem menuI1Sent;
        private System.Windows.Forms.ToolStripMenuItem menuSystem;
        private System.Windows.Forms.ToolStripMenuItem menuI1Keyword;
        private System.Windows.Forms.ToolStripMenuItem menuI2InboxDeleted;
        private System.Windows.Forms.ToolStripMenuItem menuI2SentOk;
        private System.Windows.Forms.ToolStripMenuItem menuI2SentError;
        private System.Windows.Forms.ToolStripMenuItem menuI2SentDeleted;
        private System.Windows.Forms.ToolStripMenuItem menuI1Account;
        private System.Windows.Forms.ToolStripMenuItem menuI1Help;
        private System.Windows.Forms.ToolStripMenuItem menuI1About;
        private System.Windows.Forms.ToolStripMenuItem menuI1SystemConfig;
        private System.Windows.Forms.ToolStripMenuItem menuI1Compose;
        private System.Windows.Forms.ToolStripMenuItem menuI1Outbox;
        private System.Windows.Forms.ToolStripMenuItem menuI2Draft;
        private System.Windows.Forms.ToolStripMenuItem menuI1AddressBook;
        public System.Windows.Forms.ToolStripMenuItem menuI2InvalidMessage;
    }
}