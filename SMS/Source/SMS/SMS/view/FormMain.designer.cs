namespace SMS
{
    partial class FormMain
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
            this.menuTool = new System.Windows.Forms.MenuStrip();
            this.menuFile = new System.Windows.Forms.ToolStripMenuItem();
            this.menuChangePassword = new System.Windows.Forms.ToolStripMenuItem();
            this.menuSystemConfig = new System.Windows.Forms.ToolStripMenuItem();
            this.menuLogout = new System.Windows.Forms.ToolStripMenuItem();
            this.menuMessage = new System.Windows.Forms.ToolStripMenuItem();
            this.menuCompose = new System.Windows.Forms.ToolStripMenuItem();
            this.menuOutbox = new System.Windows.Forms.ToolStripMenuItem();
            this.menuInbox = new System.Windows.Forms.ToolStripMenuItem();
            this.menuI1Sent = new System.Windows.Forms.ToolStripMenuItem();
            this.menuSystem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuKeyword = new System.Windows.Forms.ToolStripMenuItem();
            this.menuAccount = new System.Windows.Forms.ToolStripMenuItem();
            this.menuAddressBook = new System.Windows.Forms.ToolStripMenuItem();
            this.menuHelp = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem2 = new System.Windows.Forms.ToolStripMenuItem();
            this.menuTool.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuTool
            // 
            this.menuTool.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Bold);
            this.menuTool.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuFile,
            this.menuMessage,
            this.menuSystem,
            this.menuHelp});
            this.menuTool.Location = new System.Drawing.Point(0, 0);
            this.menuTool.Name = "menuTool";
            this.menuTool.Size = new System.Drawing.Size(854, 24);
            this.menuTool.TabIndex = 0;
            this.menuTool.Text = "menuTool";
            // 
            // menuFile
            // 
            this.menuFile.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuChangePassword,
            this.menuSystemConfig,
            this.menuLogout});
            this.menuFile.Name = "menuFile";
            this.menuFile.Size = new System.Drawing.Size(38, 20);
            this.menuFile.Text = "File";
            // 
            // menuChangePassword
            // 
            this.menuChangePassword.Name = "menuChangePassword";
            this.menuChangePassword.Size = new System.Drawing.Size(184, 22);
            this.menuChangePassword.Text = "Change Password";
            this.menuChangePassword.Click += new System.EventHandler(this.mnuChangePassword_Click);
            // 
            // menuSystemConfig
            // 
            this.menuSystemConfig.Name = "menuSystemConfig";
            this.menuSystemConfig.Size = new System.Drawing.Size(184, 22);
            this.menuSystemConfig.Text = "System Config";
            // 
            // menuLogout
            // 
            this.menuLogout.Name = "menuLogout";
            this.menuLogout.Size = new System.Drawing.Size(184, 22);
            this.menuLogout.Text = "Logout";
            // 
            // menuMessage
            // 
            this.menuMessage.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuCompose,
            this.menuOutbox,
            this.menuInbox,
            this.menuI1Sent});
            this.menuMessage.Name = "menuMessage";
            this.menuMessage.Size = new System.Drawing.Size(69, 20);
            this.menuMessage.Text = "Message";
            // 
            // menuCompose
            // 
            this.menuCompose.Name = "menuCompose";
            this.menuCompose.Size = new System.Drawing.Size(137, 22);
            this.menuCompose.Text = "Compose";
            this.menuCompose.Click += new System.EventHandler(this.menuCompose_Click);
            // 
            // menuOutbox
            // 
            this.menuOutbox.Name = "menuOutbox";
            this.menuOutbox.Size = new System.Drawing.Size(137, 22);
            this.menuOutbox.Text = "Outbox";
            this.menuOutbox.Click += new System.EventHandler(this.menuOutbox_Click);
            // 
            // menuInbox
            // 
            this.menuInbox.Name = "menuInbox";
            this.menuInbox.Size = new System.Drawing.Size(137, 22);
            this.menuInbox.Text = "Inbox";
            this.menuInbox.Click += new System.EventHandler(this.menuInbox_Click);
            // 
            // menuI1Sent
            // 
            this.menuI1Sent.Name = "menuI1Sent";
            this.menuI1Sent.Size = new System.Drawing.Size(137, 22);
            this.menuI1Sent.Text = "Sent";
            this.menuI1Sent.Click += new System.EventHandler(this.menuI1Sent_Click);
            // 
            // menuSystem
            // 
            this.menuSystem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuKeyword,
            this.menuAccount,
            this.menuAddressBook});
            this.menuSystem.Name = "menuSystem";
            this.menuSystem.Size = new System.Drawing.Size(62, 20);
            this.menuSystem.Text = "System";
            // 
            // menuKeyword
            // 
            this.menuKeyword.Name = "menuKeyword";
            this.menuKeyword.Size = new System.Drawing.Size(179, 22);
            this.menuKeyword.Text = "Mnage Keyword";
            this.menuKeyword.Click += new System.EventHandler(this.menuKeyword_Click);
            // 
            // menuAccount
            // 
            this.menuAccount.Name = "menuAccount";
            this.menuAccount.Size = new System.Drawing.Size(179, 22);
            this.menuAccount.Text = "Manage Account";
            this.menuAccount.Click += new System.EventHandler(this.menuAccount_Click);
            // 
            // menuAddressBook
            // 
            this.menuAddressBook.Name = "menuAddressBook";
            this.menuAddressBook.Size = new System.Drawing.Size(179, 22);
            this.menuAddressBook.Text = "Address Book";
            this.menuAddressBook.Click += new System.EventHandler(this.menuAddressBook_Click);
            // 
            // menuHelp
            // 
            this.menuHelp.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripMenuItem1,
            this.toolStripMenuItem2});
            this.menuHelp.Name = "menuHelp";
            this.menuHelp.Size = new System.Drawing.Size(44, 20);
            this.menuHelp.Text = "Help";
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(122, 22);
            this.toolStripMenuItem1.Text = "About ";
            // 
            // toolStripMenuItem2
            // 
            this.toolStripMenuItem2.Name = "toolStripMenuItem2";
            this.toolStripMenuItem2.Size = new System.Drawing.Size(122, 22);
            this.toolStripMenuItem2.Text = "Help";
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(854, 661);
            this.Controls.Add(this.menuTool);
            this.Font = new System.Drawing.Font("Times New Roman", 8.25F);
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.menuTool;
            this.Name = "FormMain";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.menuTool.ResumeLayout(false);
            this.menuTool.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuTool;
        private System.Windows.Forms.ToolStripMenuItem menuFile;
        private System.Windows.Forms.ToolStripMenuItem menuLogout;
        private System.Windows.Forms.ToolStripMenuItem menuChangePassword;
        private System.Windows.Forms.ToolStripMenuItem menuMessage;
        private System.Windows.Forms.ToolStripMenuItem menuInbox;
        private System.Windows.Forms.ToolStripMenuItem menuI1Sent;
        private System.Windows.Forms.ToolStripMenuItem menuSystem;
        private System.Windows.Forms.ToolStripMenuItem menuKeyword;
        private System.Windows.Forms.ToolStripMenuItem menuAccount;
        private System.Windows.Forms.ToolStripMenuItem menuSystemConfig;
        private System.Windows.Forms.ToolStripMenuItem menuCompose;
        private System.Windows.Forms.ToolStripMenuItem menuOutbox;
        private System.Windows.Forms.ToolStripMenuItem menuAddressBook;
        private System.Windows.Forms.ToolStripMenuItem menuHelp;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem2;
    }
}