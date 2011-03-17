using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Collections;

using GsmComm.GsmCommunication;
using GsmComm.PduConverter;
using System.Timers;

namespace SMS
{
    public partial class FormMain : Form
    {
        //ArrayList listform = new ArrayList();

        private System.Timers.Timer autoRecieveMess = new System.Timers.Timer();

        public FormMain()
        {
            
            InitializeComponent();
            if (common.Constants.comm.IsConnected() == true)
            {
                this.lbStatus.Text = "Connected";
                InitializeTimer();
            }
            
           // this.BackgroundImage = new Bitmap("images/bg.jpg");

            
        }

        public void InitializeTimer()
        {
            this.autoRecieveMess.Elapsed += new ElapsedEventHandler(timerRecieveMess);
            this.autoRecieveMess.Interval = 1000;
            this.autoRecieveMess.Enabled = true;
        }

        public void timerRecieveMess(Object source, ElapsedEventArgs e)
        {
            try
            {
                Cursor.Current = Cursors.WaitCursor;


                string storage = GetMessageStorage();

                DecodedShortMessage[] messages = common.Constants.comm.ReadMessages(PhoneMessageStatus.ReceivedUnread, storage);

                //MessageBox.Show(messages.Length.ToString());

                //MessageBox.Show(messages[27].Data.UserDataText.ToString());



                SmsPdu dataMess;
                HopThuDenMODEL model;

                foreach (DecodedShortMessage message in messages)
                {
                    dataMess = message.Data;
                    SmsDeliverPdu data = (SmsDeliverPdu)dataMess;

                    string desMess = data.OriginatingAddress.ToString();
                    string contentMess = data.UserDataText;

                    model = new HopThuDenMODEL();

                    string[] arrContentMess = contentMess.Split(' ');
                    if (arrContentMess.Length <= 1)
                    {
                        model.So_Dien_Thoai = desMess;
                        model.Ma_Cu_Phap = "";
                        model.Noi_Dung_Tin_Nhan = contentMess;
                        model.Tinh_Trang = "0";
                        model.Loai_Hop_Thu = "0";
                    }
                    else
                    {
                        string cumCuPhap = "";

                        for (int i = 0; i <= arrContentMess.Length - 2; i++)
                        {
                            cumCuPhap += arrContentMess[i];
                        }
                        //check cu phap khi nhan tin nhan 
                        CuPhapMODEL cuPhapModel = CuPhapDAO.getCuPhapByCumCuPhap(cumCuPhap);
                        //lay data luu vao model hopthuden 
                        model.So_Dien_Thoai = desMess;
                        model.Noi_Dung_Tin_Nhan = contentMess;
                        model.Tinh_Trang = "0";
                        //loai hop thu = 0 ---> ko theo cu phap 
                        if (cuPhapModel.Id != null)
                        {
                            model.Loai_Hop_Thu = "0";
                            model.Ma_Cu_Phap = cuPhapModel.Id;
                        }
                        //        //loai hop thu = 1 ----> theo cu phap
                        else
                        {
                            model.Ma_Cu_Phap = "";
                            model.Loai_Hop_Thu = "1";
                        }
                    }
                    model.User11 = "";
                    model.User21 = "";
                    model.User31 = "";
                    model.User41 = "";
                    model.User51 = "";

                    bool result = HopThuDenDAO.insertHopThuDen(model);
                    if (result == true)
                    {
                        MessageBox.Show("Insert 1 thu den thanh cong");
                    }
                    else
                    {
                        MessageBox.Show("Insert hop thu den that bai");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("OnTimer(): " + ex.Message);
            }
        }


        
        #region Xem lai
        
        //private void loadMenuFromDatabase()
        //{
        //    String roleID = common.Constants.USER_LOGIN.MaVaiTro;
        //    ArrayList sysRoleMenuModelList = SysRoleMenuDAO.getListMenuByRole(roleID);
        //    Constants.MENU_LIST = new ArrayList();

        //    foreach (SysRoleMenuModel model in sysRoleMenuModelList)
        //    {
        //        MenuModel menuModel = new MenuModel();
        //        menuModel.MenuItem = new ToolStripMenuItem();
        //        //Image img = Image.FromFile(model.MenuImage);
        //        Image img = null;
        //        menuModel.MenuItem.Image = img;
        //        menuModel.MenuItem.Name = model.MenuName;
        //        menuModel.MenuItem.Text = model.MenuName;
        //        menuModel.MenuID = model.MenuID;
        //        menuModel.MenuItem.Size = new System.Drawing.Size(135, 22);
        //        menuModel.MenuImage = model.MenuImage;
        //        menuModel.MenuLink = model.MenuLink;
        //        menuModel.ParentMenuID = model.ParentMenuID;

        //        Constants.MENU_LIST.Add(menuModel);
        //    }

        //    if (Constants.MENU_LIST.Count > 0)
        //    {
        //        MenuStrip menuStrip = new MenuStrip();
        //        menuStrip.Location = new System.Drawing.Point(0, 0);
        //        menuStrip.Name = "menuStrip";
        //        menuStrip.Text = "menuStrip";
        //        menuStrip.Size = new System.Drawing.Size(920, 24);
        //        menuStrip.TabIndex = 0;
        //        foreach (MenuModel obj in Constants.MENU_LIST)
        //        {
        //            if (obj.ParentMenuID.Equals(String.Empty))
        //            {
        //                menuStrip.Items.Add(obj.MenuItem);
        //                foreach (MenuModel subObj in Constants.MENU_LIST)
        //                {
        //                    if (subObj.ParentMenuID.Equals(obj.MenuID))
        //                    {
        //                        obj.MenuItem.DropDownItems.Add(subObj.MenuItem);
        //                        subObj.MenuItem.Click += new EventHandler(menuClickAction);
        //                    }
        //                }
        //            }
        //        }

        //        this.Controls.Add(menuStrip);
        //    }
        //}

        #endregion

        #region xu ly

        private void mnuChangePassword_Click(object sender, EventArgs e)
        {
            FormChangePassword formchangepass = new FormChangePassword();
            formchangepass.MdiParent = this;
            formchangepass.Show();
        }


        //private void menu_SentOk_Click(object sender, EventArgs e)
        //{
        //    new form_SentOk().Show();
        //}
        private void menuOutbox_Click(object sender, EventArgs e)
        {
            FormOutbox formoutbox = new FormOutbox();
            formoutbox.MdiParent = this;
            formoutbox.Show();
        }
       

        private void menuAccount_Click(object sender, EventArgs e)
        {
            FormManageAccount formaccount = new FormManageAccount();
            formaccount.MdiParent = this;
            formaccount.Show();
        }

        private void menuKeyword_Click(object sender, EventArgs e)
        {
            FormManageKeyword formkeyword = new FormManageKeyword();
            formkeyword.MdiParent = this;
            formkeyword.Show();
        }

        private void menuCompose_Click(object sender, EventArgs e)
        {
            FormCompose formcompose = new FormCompose();
            formcompose.MdiParent = this;
            formcompose.Show();
        }


        private void menuAddressBook_Click(object sender, EventArgs e)
        {
            FormAddressBook formaddresbook = new FormAddressBook();
            formaddresbook.MdiParent = this;
            formaddresbook.Show();
        }

        #endregion

        private void menuInbox_Click(object sender, EventArgs e)
        {
            FormInbox forminbox = new FormInbox();
            forminbox.MdiParent = this;
            forminbox.Show();
        }

        private void menuI1Sent_Click(object sender, EventArgs e)
        {
            FormSend formsend = new FormSend();
            formsend.MdiParent = this;
            formsend.Show();
        }

        private void FormMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (common.Constants.comm.IsConnected() == true)
            {
                common.Constants.comm.Close();
            }
            Application.Exit();
        }

        private void btnAutoRecieve_Click(object sender, EventArgs e)
        {
            
        }

        private string GetMessageStorage()
        {
            string storage = "";
            storage = PhoneStorageType.Sim;

            if (storage.Length == 0)
                throw new ApplicationException("Unknown message storage.");
            else
                return storage;
        }
        #region chưa xu ly
        //private void menuClickAction(object sender, EventArgs e)
        //{
        //    ToolStripMenuItem menuItem = (ToolStripMenuItem)sender;
        //    if (menuItem.Name.Equals("Logout"))
        //    {
        //        //Constants.USER_LOGIN = new ThanhVienModel();
        //        FormLogin formDangNhap = new FormLogin();
        //        this.Visible = false;
        //        formDangNhap.ShowDialog();
        //    }
        //    else if (menuItem.Name.Equals("Cancel"))
        //    {
        //        if (MessageBox.Show(this, "Bạn có chắc muốn thoát ?", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
        //        {
        //            Application.Exit();
        //        }

        //    }
        //    else if (menuItem.Name.Equals("Change Password"))
        //    {
        //        foreach (Form f in listform)
        //        {
        //            f.Close();
        //        }
        //        FormChangePassword formChangePassword = new FormChangePassword();
        //        formChangePassword.MdiParent = this;
        //        formChangePassword.Show();
        //        listform.Add(formChangePassword);
        //    }
        //    else if (menuItem.Name.Equals("Compose"))
        //    {
        //        foreach (Form f in listform)
        //        {
        //            f.Close();
        //        }
        //        view.FormCompose formcompose = new view.FormCompose();
        //        formcompose.MdiParent = this;
        //        formcompose.Show();
        //        listform.Add(formcompose);
        //    }
        //    else if (menuItem.Name.Equals("Sent"))
        //    {
        //        foreach (Form f in listform)
        //        {
        //            f.Close();
        //        }
        //        FormSentOk formsent = new FormSentOk();
        //        formsent.MdiParent = this;
        //        formsent.Show();
        //        listform.Add(formsent);
        //    }
        //    else if (menuItem.Name.Equals("Bản Quyền"))
        //    {
        //        //
        //    }
        //    else if (menuItem.Name.Equals("Hướng Dẫn"))
        //    {
        //        //
        //    }
        //    else if (menuItem.Name.Equals("Inbox"))
        //    {
        //        foreach (Form f in listform)
        //        {
        //            f.Close();
        //        }
        //        FormInbox formInbox = new FormInbox();
        //        formInbox.MdiParent = this;
        //        formInbox.Show();
        //        listform.Add(formInbox);
        //    }
        //    else if (menuItem.Name.Equals("OutBox"))
        //    {
        //        foreach (Form f in listform)
        //        {
        //            f.Close();
        //        }
        //        FormOutbox formOutBox = new FormOutbox();
        //        formOutBox.MdiParent = this;
        //        formOutBox.Show();
        //        listform.Add(formOutBox);
        //    }
        //    else if (menuItem.Name.Equals("Address book"))
        //    {
        //        foreach (Form f in listform)
        //        {
        //            f.Close();

        //        }
        //        view.FormAddressBook formAddressBook = new view.FormAddressBook();
        //        formAddressBook.MdiParent = this;
        //        formAddressBook.Show();
        //        listform.Add(formAddressBook);
        //    }
        //}
        #endregion
    } 
}
