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
        }

        public void InitializeTimer()
        {
            this.autoRecieveMess.Elapsed += new ElapsedEventHandler(OnTimer);
            this.autoRecieveMess.Interval = 1000;
            this.autoRecieveMess.Enabled = true;
        }

        public void OnTimer(Object source, ElapsedEventArgs e)
        {
            recieveMessAuto();
        }

        private void recieveMessAuto()
        {
            Cursor.Current = Cursors.WaitCursor;


            string storage = GetMessageStorage();

            try
            {

                DecodedShortMessage[] messages = common.Constants.comm.ReadMessages(PhoneMessageStatus.ReceivedUnread, storage);

                if (messages.Length != 0)
                {
                    MessageBox.Show(messages.Length.ToString());
                }
                SmsPdu dataMess;
                HopThuDenMODEL model;

                SmsSubmitPdu pdu;
                HopThuDiMODEL modelDi;

                foreach (DecodedShortMessage message in messages)
                {

                    dataMess = message.Data;
                    SmsDeliverPdu data = (SmsDeliverPdu)dataMess;

                    string desMess = data.OriginatingAddress.ToString();
                    string contentMess = data.UserDataText;

                    string outputMess = "Tin nhan cua ban khong theo cu phap ,ban hay thu lai mot lan nua.";

                    model = new HopThuDenMODEL();
                    modelDi = new HopThuDiMODEL();
                    //danh dau tinh trang gui 
                    int j = 0;

                    model.So_Dien_Thoai = desMess;
                    model.Noi_Dung_Tin_Nhan = contentMess;

                    modelDi.So_Dien_Thoai = desMess;

                    string[] arrContentMess = contentMess.Split(' ');
                    //tin nhan khong theo cu phap
                    if (arrContentMess.Length <= 1)
                    {
                        model.Ma_Cu_Phap = "";
                        model.Tinh_Trang = "0";
                        model.Loai_Hop_Thu = "2";

                        try
                        {
                            pdu = new SmsSubmitPdu(outputMess, desMess, "");
                            common.Constants.comm.SendMessage(pdu);
                            j = 1;
                        }
                        catch (Exception)
                        {
                            j = 0;
                            throw;
                        }
                        modelDi.Noi_Dung_Tin_Nhan = outputMess;
                        modelDi.Tinh_Trang = j.ToString();
                        modelDi.Loai_Hop_Thu = "6";
                    }
                    //tin nhan theo cu phap
                    else
                    {
                        string cumCuPhap = "";
                        //kiem tra cu phap xem co trong danh sach ko
                        for (int i = 0; i <= arrContentMess.Length - 2; i++)
                        {
                            cumCuPhap += arrContentMess[i];
                        }
                        //check cu phap khi nhan tin nhan 
                        CuPhapMODEL cuPhapModel = CuPhapDAO.getCuPhapByCumCuPhap(cumCuPhap);
                        //lay data luu vao model hopthuden 
                        
                        //tinh_trang = 0 -->chua doc tin nhan
                        model.Tinh_Trang = "0";
                        //co cu phap trong danh sach 
                        if (cuPhapModel.Id != null)
                        {
                            model.Ma_Cu_Phap = cuPhapModel.Id;
                            //loai_hop_thu = 0 --> hop thu cu phap 
                            model.Loai_Hop_Thu = "0";

                            //tra loi tin nhan
                            

                            string diemSV = "QTM : 8d \n PTS : 9d \n SQL : 5d \n Java : 7d";
                            try
                            {
                                pdu = new SmsSubmitPdu(diemSV, desMess, "");
                                common.Constants.comm.SendMessage(pdu);
                                j = 1; 
                            }
                            catch (Exception)
                            {
                                j = 0;
                                throw;
                            }
                            modelDi.Noi_Dung_Tin_Nhan = diemSV;
                            modelDi.Tinh_Trang = j.ToString();
                            modelDi.Loai_Hop_Thu = "4";
                        }
                        
                        else
                        {
                            model.Ma_Cu_Phap = "";
                            //loai_hop_thu = 1 --> hop thu thuong 
                            model.Loai_Hop_Thu = "2";

                            try
                            {
                                pdu = new SmsSubmitPdu(outputMess, desMess, "");
                                common.Constants.comm.SendMessage(pdu);
                                j = 1; 
                            }
                            catch (Exception)
                            {
                                j = 0;
                                throw;
                            }
                            modelDi.Noi_Dung_Tin_Nhan = outputMess;
                            modelDi.Tinh_Trang = j.ToString();
                            modelDi.Loai_Hop_Thu = "6";
                        }
                    }

                    model.User11 = "";
                    model.User21 = "";
                    model.User31 = "";
                    model.User41 = "";
                    model.User51 = "";

                    modelDi.User11 = "";
                    modelDi.User21 = "";
                    modelDi.User31 = "";
                    modelDi.User41 = "";
                    modelDi.User51 = "";

                    bool resultDen = HopThuDenDAO.insertHopThuDen(model);
                    if (resultDen == true)
                    {
                        MessageBox.Show("Insert 1 thu den thanh cong");
                    }
                    else
                    {
                        MessageBox.Show("Insert hop thu den that bai");
                    }

                    bool resultDi = HopThuDiDAO.insertHopThuDi(modelDi);
                    if (resultDi == true)
                    {
                        MessageBox.Show("Insert 1 thu di thanh cong");
                    }
                    else
                    {
                        MessageBox.Show("Insert hop thu den that bai");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            Cursor.Current = Cursors.Default;
            MemoryStatus memnoryStatus = common.Constants.comm.GetMessageMemoryStatus(PhoneStorageType.Sim);
            int memUesd = memnoryStatus.Used;
            if (memUesd != 0)
            {
                common.Constants.comm.DeleteMessages(DeleteScope.All, PhoneStorageType.Sim);
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


        private void FormMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (common.Constants.comm.IsConnected() == true)
            {
                common.Constants.comm.Close();
            }
            Application.Exit();
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

        private void menuCompose_Click(object sender, EventArgs e)
        {
            FormCompose frmCompose = new FormCompose();
            frmCompose.MdiParent = this;
            frmCompose.Show();
        }

        private void menuInbox_Click(object sender, EventArgs e)
        {
            FormInbox frmInbox = new FormInbox();
            frmInbox.MdiParent = this;
            frmInbox.Show();
        }

        private void menuI1Sent_Click(object sender, EventArgs e)
        {
            FormSend frmSend = new FormSend();
            frmSend.MdiParent = this;
            frmSend.Show();
        }
    } 
}
