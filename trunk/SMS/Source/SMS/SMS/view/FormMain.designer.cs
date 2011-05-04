using System.Timers;
using GsmComm.GsmCommunication;
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormMain));
            this.menuTool = new System.Windows.Forms.MenuStrip();
            this.menuFile = new System.Windows.Forms.ToolStripMenuItem();
            this.menuChangePassword = new System.Windows.Forms.ToolStripMenuItem();
            this.menuSystemConfig = new System.Windows.Forms.ToolStripMenuItem();
            this.menuLogout = new System.Windows.Forms.ToolStripMenuItem();
            this.loginToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuMessage = new System.Windows.Forms.ToolStripMenuItem();
            this.menuCompose = new System.Windows.Forms.ToolStripMenuItem();
            this.menuInbox = new System.Windows.Forms.ToolStripMenuItem();
            this.menuI1Sent = new System.Windows.Forms.ToolStripMenuItem();
            this.menuSystem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuKeyword = new System.Windows.Forms.ToolStripMenuItem();
            this.menuAccount = new System.Windows.Forms.ToolStripMenuItem();
            this.menuAddressBook = new System.Windows.Forms.ToolStripMenuItem();
            this.typeToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuHelp = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem2 = new System.Windows.Forms.ToolStripMenuItem();
            this.lbStatus = new System.Windows.Forms.Label();
            this.btnEnableMess = new System.Windows.Forms.Button();
            this.menuTool.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuTool
            // 
            this.menuTool.Enabled = false;
            this.menuTool.Font = new System.Drawing.Font("Tahoma", 8.25F, System.Drawing.FontStyle.Bold);
            this.menuTool.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuFile,
            this.menuMessage,
            this.menuSystem,
            this.menuHelp});
            this.menuTool.Location = new System.Drawing.Point(0, 0);
            this.menuTool.Name = "menuTool";
            this.menuTool.Size = new System.Drawing.Size(911, 24);
            this.menuTool.TabIndex = 0;
            this.menuTool.Text = "menuTool";
            // 
            // menuFile
            // 
            this.menuFile.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuChangePassword,
            this.menuSystemConfig,
            this.menuLogout,
            this.loginToolStripMenuItem});
            this.menuFile.Name = "menuFile";
            this.menuFile.Size = new System.Drawing.Size(38, 20);
            this.menuFile.Text = "File";
            // 
            // menuChangePassword
            // 
            this.menuChangePassword.Name = "menuChangePassword";
            this.menuChangePassword.Size = new System.Drawing.Size(184, 22);
            this.menuChangePassword.Text = "Change Password";
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
            this.menuLogout.Click += new System.EventHandler(this.menuLogout_Click);
            // 
            // loginToolStripMenuItem
            // 
            this.loginToolStripMenuItem.Name = "loginToolStripMenuItem";
            this.loginToolStripMenuItem.Size = new System.Drawing.Size(184, 22);
            this.loginToolStripMenuItem.Text = "Login";
            // 
            // menuMessage
            // 
            this.menuMessage.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuCompose,
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
            this.menuAddressBook,
            this.typeToolStripMenuItem});
            this.menuSystem.Name = "menuSystem";
            this.menuSystem.Size = new System.Drawing.Size(62, 20);
            this.menuSystem.Text = "System";
            // 
            // menuKeyword
            // 
            this.menuKeyword.Name = "menuKeyword";
            this.menuKeyword.Size = new System.Drawing.Size(182, 22);
            this.menuKeyword.Text = "Manage Keyword";
            this.menuKeyword.Click += new System.EventHandler(this.menuKeyword_Click);
            // 
            // menuAccount
            // 
            this.menuAccount.Name = "menuAccount";
            this.menuAccount.Size = new System.Drawing.Size(182, 22);
            this.menuAccount.Text = "Manage Account";
            this.menuAccount.Click += new System.EventHandler(this.menuAccount_Click);
            // 
            // menuAddressBook
            // 
            this.menuAddressBook.Name = "menuAddressBook";
            this.menuAddressBook.Size = new System.Drawing.Size(182, 22);
            this.menuAddressBook.Text = "Contacts";
            this.menuAddressBook.Click += new System.EventHandler(this.menuAddressBook_Click);
            // 
            // typeToolStripMenuItem
            // 
            this.typeToolStripMenuItem.Name = "typeToolStripMenuItem";
            this.typeToolStripMenuItem.Size = new System.Drawing.Size(182, 22);
            this.typeToolStripMenuItem.Text = "Inbox Type";
            this.typeToolStripMenuItem.Click += new System.EventHandler(this.typeToolStripMenuItem_Click);
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
            // lbStatus
            // 
            this.lbStatus.AutoSize = true;
            this.lbStatus.BackColor = System.Drawing.SystemColors.Window;
            this.lbStatus.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbStatus.ForeColor = System.Drawing.Color.Red;
            this.lbStatus.Location = new System.Drawing.Point(501, 0);
            this.lbStatus.Name = "lbStatus";
            this.lbStatus.Size = new System.Drawing.Size(140, 24);
            this.lbStatus.TabIndex = 4;
            this.lbStatus.Text = "Not Conectted";
            // 
            // btnEnableMess
            // 
            this.btnEnableMess.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnEnableMess.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnEnableMess.Location = new System.Drawing.Point(231, 0);
            this.btnEnableMess.Name = "btnEnableMess";
            this.btnEnableMess.Size = new System.Drawing.Size(264, 25);
            this.btnEnableMess.TabIndex = 6;
            this.btnEnableMess.Text = "Enable for Recieve Message";
            this.btnEnableMess.UseVisualStyleBackColor = true;
            this.btnEnableMess.Click += new System.EventHandler(this.btnEnableMess_Click);
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 14F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(911, 444);
            this.Controls.Add(this.btnEnableMess);
            this.Controls.Add(this.lbStatus);
            this.Controls.Add(this.menuTool);
            this.Font = new System.Drawing.Font("Times New Roman", 8.25F);
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.menuTool;
            this.Name = "FormMain";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "GSM System";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FormMain_Load);
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
        private System.Windows.Forms.ToolStripMenuItem menuAddressBook;
        private System.Windows.Forms.ToolStripMenuItem menuHelp;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem2;
        private System.Windows.Forms.Label lbStatus;
        private System.Windows.Forms.Button btnEnableMess;
        private System.Windows.Forms.ToolStripMenuItem typeToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem loginToolStripMenuItem;
    }
}