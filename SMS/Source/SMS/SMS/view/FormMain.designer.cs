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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormMain));
            this.menuTool = new System.Windows.Forms.MenuStrip();
            this.menuFile = new System.Windows.Forms.ToolStripMenuItem();
            this.menuChangePassword = new System.Windows.Forms.ToolStripMenuItem();
            this.menuSystemConfig = new System.Windows.Forms.ToolStripMenuItem();
            this.menuLogout = new System.Windows.Forms.ToolStripMenuItem();
            this.menuMessage = new System.Windows.Forms.ToolStripMenuItem();
            this.menuCompose = new System.Windows.Forms.ToolStripMenuItem();
            this.menuInbox = new System.Windows.Forms.ToolStripMenuItem();
            this.menuI1Sent = new System.Windows.Forms.ToolStripMenuItem();
            this.menuSystem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuKeyword = new System.Windows.Forms.ToolStripMenuItem();
            this.menuAccount = new System.Windows.Forms.ToolStripMenuItem();
            this.menuAddressBook = new System.Windows.Forms.ToolStripMenuItem();
            this.typeToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menu_ManageTypeAccount = new System.Windows.Forms.ToolStripMenuItem();
            this.menuHelp = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem2 = new System.Windows.Forms.ToolStripMenuItem();
            this.lbStatus = new System.Windows.Forms.Label();
            this.btnEnableMess = new System.Windows.Forms.Button();
            this.systemTrayIcon = new System.Windows.Forms.NotifyIcon(this.components);
            this.rightClickTrayIcon = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.toolsTripMenuRestore = new System.Windows.Forms.ToolStripMenuItem();
            this.toolsTripMenuExit = new System.Windows.Forms.ToolStripMenuItem();
            this.btnNewMess = new System.Windows.Forms.Button();
            this.txtLog = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.menuTool.SuspendLayout();
            this.rightClickTrayIcon.SuspendLayout();
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
            this.menuTool.Size = new System.Drawing.Size(911, 24);
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
            this.menuFile.Size = new System.Drawing.Size(60, 20);
            this.menuFile.Text = "Tập Tin";
            // 
            // menuChangePassword
            // 
            this.menuChangePassword.Name = "menuChangePassword";
            this.menuChangePassword.Size = new System.Drawing.Size(190, 22);
            this.menuChangePassword.Text = "Đội Mật Khẩu";
            // 
            // menuSystemConfig
            // 
            this.menuSystemConfig.Name = "menuSystemConfig";
            this.menuSystemConfig.Size = new System.Drawing.Size(190, 22);
            this.menuSystemConfig.Text = "Cấu Hình Hệ Thống";
            // 
            // menuLogout
            // 
            this.menuLogout.Name = "menuLogout";
            this.menuLogout.Size = new System.Drawing.Size(190, 22);
            this.menuLogout.Text = "Đăng Xuất";
            this.menuLogout.Click += new System.EventHandler(this.menuLogout_Click);
            // 
            // menuMessage
            // 
            this.menuMessage.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuCompose,
            this.menuInbox,
            this.menuI1Sent});
            this.menuMessage.Name = "menuMessage";
            this.menuMessage.Size = new System.Drawing.Size(67, 20);
            this.menuMessage.Text = "Tin Nhắn";
            this.menuMessage.MouseMove += new System.Windows.Forms.MouseEventHandler(this.menuMessage_MouseMove);
            // 
            // menuCompose
            // 
            this.menuCompose.Name = "menuCompose";
            this.menuCompose.Size = new System.Drawing.Size(158, 22);
            this.menuCompose.Text = "Gửi Tin Nhắn";
            this.menuCompose.Click += new System.EventHandler(this.menuCompose_Click);
            // 
            // menuInbox
            // 
            this.menuInbox.Name = "menuInbox";
            this.menuInbox.Size = new System.Drawing.Size(158, 22);
            this.menuInbox.Text = "Hộp Thư Đến";
            this.menuInbox.Click += new System.EventHandler(this.menuInbox_Click);
            // 
            // menuI1Sent
            // 
            this.menuI1Sent.Name = "menuI1Sent";
            this.menuI1Sent.Size = new System.Drawing.Size(158, 22);
            this.menuI1Sent.Text = "Hộp Thư Đi";
            this.menuI1Sent.Click += new System.EventHandler(this.menuI1Sent_Click);
            // 
            // menuSystem
            // 
            this.menuSystem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuKeyword,
            this.menuAccount,
            this.menuAddressBook,
            this.typeToolStripMenuItem,
            this.menu_ManageTypeAccount});
            this.menuSystem.Name = "menuSystem";
            this.menuSystem.Size = new System.Drawing.Size(70, 20);
            this.menuSystem.Text = "Hệ thống";
            // 
            // menuKeyword
            // 
            this.menuKeyword.Name = "menuKeyword";
            this.menuKeyword.Size = new System.Drawing.Size(210, 22);
            this.menuKeyword.Text = "Quản lý cú pháp";
            this.menuKeyword.Click += new System.EventHandler(this.menuKeyword_Click);
            // 
            // menuAccount
            // 
            this.menuAccount.Name = "menuAccount";
            this.menuAccount.Size = new System.Drawing.Size(210, 22);
            this.menuAccount.Text = "Quản lý tài khoản SMS";
            this.menuAccount.Click += new System.EventHandler(this.menuAccount_Click);
            // 
            // menuAddressBook
            // 
            this.menuAddressBook.Name = "menuAddressBook";
            this.menuAddressBook.Size = new System.Drawing.Size(210, 22);
            this.menuAddressBook.Text = "Danh bạ";
            this.menuAddressBook.Click += new System.EventHandler(this.menuAddressBook_Click);
            // 
            // typeToolStripMenuItem
            // 
            this.typeToolStripMenuItem.Name = "typeToolStripMenuItem";
            this.typeToolStripMenuItem.Size = new System.Drawing.Size(210, 22);
            this.typeToolStripMenuItem.Text = "Loại hộp thư";
            this.typeToolStripMenuItem.Click += new System.EventHandler(this.typeToolStripMenuItem_Click);
            // 
            // menu_ManageTypeAccount
            // 
            this.menu_ManageTypeAccount.Name = "menu_ManageTypeAccount";
            this.menu_ManageTypeAccount.Size = new System.Drawing.Size(210, 22);
            this.menu_ManageTypeAccount.Text = "Quản lý loại tài khoàn";
            this.menu_ManageTypeAccount.Click += new System.EventHandler(this.menu_ManageTypeAccount_Click);
            // 
            // menuHelp
            // 
            this.menuHelp.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripMenuItem1,
            this.toolStripMenuItem2});
            this.menuHelp.Name = "menuHelp";
            this.menuHelp.Size = new System.Drawing.Size(54, 20);
            this.menuHelp.Text = "Hỗ trợ";
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(141, 22);
            this.toolStripMenuItem1.Text = "Giới thiệu ";
            // 
            // toolStripMenuItem2
            // 
            this.toolStripMenuItem2.Name = "toolStripMenuItem2";
            this.toolStripMenuItem2.Size = new System.Drawing.Size(141, 22);
            this.toolStripMenuItem2.Text = "Giúp đỡ";
            // 
            // lbStatus
            // 
            this.lbStatus.AutoSize = true;
            this.lbStatus.BackColor = System.Drawing.SystemColors.Window;
            this.lbStatus.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbStatus.ForeColor = System.Drawing.Color.Red;
            this.lbStatus.Location = new System.Drawing.Point(524, 0);
            this.lbStatus.Name = "lbStatus";
            this.lbStatus.Size = new System.Drawing.Size(140, 24);
            this.lbStatus.TabIndex = 4;
            this.lbStatus.Text = "Not Conectted";
            // 
            // btnEnableMess
            // 
            this.btnEnableMess.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnEnableMess.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnEnableMess.Location = new System.Drawing.Point(258, 0);
            this.btnEnableMess.Name = "btnEnableMess";
            this.btnEnableMess.Size = new System.Drawing.Size(264, 25);
            this.btnEnableMess.TabIndex = 6;
            this.btnEnableMess.Text = "Enable for Recieve Message";
            this.btnEnableMess.UseVisualStyleBackColor = true;
            this.btnEnableMess.Click += new System.EventHandler(this.btnEnableMess_Click);
            // 
            // systemTrayIcon
            // 
            this.systemTrayIcon.ContextMenuStrip = this.rightClickTrayIcon;
            this.systemTrayIcon.Icon = ((System.Drawing.Icon)(resources.GetObject("systemTrayIcon.Icon")));
            this.systemTrayIcon.Text = "GSM System";
            this.systemTrayIcon.Visible = true;
            this.systemTrayIcon.DoubleClick += new System.EventHandler(this.systemTrayIcon_DoubleClick);
            // 
            // rightClickTrayIcon
            // 
            this.rightClickTrayIcon.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolsTripMenuRestore,
            this.toolsTripMenuExit});
            this.rightClickTrayIcon.Name = "rightClickTrayIcon";
            this.rightClickTrayIcon.Size = new System.Drawing.Size(124, 48);
            // 
            // toolsTripMenuRestore
            // 
            this.toolsTripMenuRestore.Name = "toolsTripMenuRestore";
            this.toolsTripMenuRestore.Size = new System.Drawing.Size(123, 22);
            this.toolsTripMenuRestore.Text = "Restore";
            this.toolsTripMenuRestore.Click += new System.EventHandler(this.toolTripMenuRestore_Click);
            // 
            // toolsTripMenuExit
            // 
            this.toolsTripMenuExit.Name = "toolsTripMenuExit";
            this.toolsTripMenuExit.Size = new System.Drawing.Size(123, 22);
            this.toolsTripMenuExit.Text = "Exit";
            this.toolsTripMenuExit.Click += new System.EventHandler(this.toolsTripMenuExit_Click);
            // 
            // btnNewMess
            // 
            this.btnNewMess.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnNewMess.BackColor = System.Drawing.Color.White;
            this.btnNewMess.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnNewMess.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.btnNewMess.Image = ((System.Drawing.Image)(resources.GetObject("btnNewMess.Image")));
            this.btnNewMess.Location = new System.Drawing.Point(776, 325);
            this.btnNewMess.Name = "btnNewMess";
            this.btnNewMess.Size = new System.Drawing.Size(134, 117);
            this.btnNewMess.TabIndex = 8;
            this.btnNewMess.Text = "New Message";
            this.btnNewMess.TextAlign = System.Drawing.ContentAlignment.BottomLeft;
            this.btnNewMess.UseVisualStyleBackColor = false;
            this.btnNewMess.Click += new System.EventHandler(this.btnNewMess_Click);
            // 
            // txtLog
            // 
            this.txtLog.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txtLog.Location = new System.Drawing.Point(0, 325);
            this.txtLog.Multiline = true;
            this.txtLog.Name = "txtLog";
            this.txtLog.ReadOnly = true;
            this.txtLog.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtLog.Size = new System.Drawing.Size(776, 117);
            this.txtLog.TabIndex = 10;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(369, 96);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 12;
            this.button1.Text = "button1";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // FormMain
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Inherit;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(911, 444);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.txtLog);
            this.Controls.Add(this.btnEnableMess);
            this.Controls.Add(this.lbStatus);
            this.Controls.Add(this.btnNewMess);
            this.Controls.Add(this.menuTool);
            this.Font = new System.Drawing.Font("Times New Roman", 8.25F);
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.menuTool;
            this.Name = "FormMain";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "GSM System";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.MdiChildActivate += new System.EventHandler(this.FormMain_MdiChildActivate);
            this.Resize += new System.EventHandler(this.FormMain_Resize);
            this.menuTool.ResumeLayout(false);
            this.menuTool.PerformLayout();
            this.rightClickTrayIcon.ResumeLayout(false);
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
        private System.Windows.Forms.NotifyIcon systemTrayIcon;
        private System.Windows.Forms.ContextMenuStrip rightClickTrayIcon;
        private System.Windows.Forms.ToolStripMenuItem toolsTripMenuRestore;
        private System.Windows.Forms.ToolStripMenuItem toolsTripMenuExit;
        private System.Windows.Forms.Button btnNewMess;
        private System.Windows.Forms.ToolStripMenuItem menu_ManageTypeAccount;
        private System.Windows.Forms.TextBox txtLog;
        private System.Windows.Forms.Button button1;

    }
}