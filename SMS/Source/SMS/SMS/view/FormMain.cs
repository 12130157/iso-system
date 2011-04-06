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
            }
        }
        bool ena = false;

        private void btnEnableMess_Click(object sender, EventArgs e)
        {
            if (common.Constants.comm.IsConnected() == true)
            {
                if (ena == false)
                {
                    ena = true;
                    InitializeTimer(ena);
                    btnEnableMess.Text = "Disable for Recieve Message";
                    return;
                }
                if (ena == true)
                {
                    ena = false;
                    InitializeTimer(ena);
                    btnEnableMess.Text = "Enable for Recieve Message";
                    return;
                }
            }
            else
            {
                MessageBox.Show("No Phone Connected");
            }
        }

        public void InitializeTimer(bool en)
        {
            this.autoRecieveMess.Elapsed += new ElapsedEventHandler(OnTimer);
            this.autoRecieveMess.Interval = 1000;
            this.autoRecieveMess.Enabled = en;
        }

        public void OnTimer(Object source, ElapsedEventArgs e)
        {
            recieveMessAuto();
        }

        private void recieveMessAuto()
        {
            Cursor.Current = Cursors.WaitCursor;

            string returnMessNotSyntax = "Tin nhan cua ban khong theo cu phap ,ban hay thu lai mot lan nua.";

            try
            {
                string storage = GetMessageStorage();

                if (common.Constants.comm.IsConnected() == true)
                {
                    DecodedShortMessage[] messages = common.Constants.comm.ReadMessages(PhoneMessageStatus.ReceivedUnread, storage);

                    if (messages.Length != 0)
                    {
                        MessageBox.Show("Đã nhận " + messages.Length.ToString() + " tin nhắn");
                    }
                    //else
                    //{
                    //    MessageBox.Show("Chua co tin nhan nao");
                    //}
                
                
                //bien luu tin nhan den
                SmsPdu messageDen;
                HopThuDenMODEL modelDen;

                //bien luu tin nhan di
                HopThuDiMODEL modelDi;

                foreach (DecodedShortMessage message in messages)
                {
                    modelDen = new HopThuDenMODEL();
                    modelDi = new HopThuDiMODEL();

                    messageDen = message.Data;
                    //convert SmsPdu = SmsDeliverPdu
                    SmsDeliverPdu data = (SmsDeliverPdu)messageDen;

                    string phoneNbMessDen = data.OriginatingAddress.ToString();
                    string contentMessDen = data.UserDataText;

                    //danh dau tinh trang gui (0 = chua gui duoc ,1 = gui duoc)
                    int j = 0;

                    //gan so dien thoai va noi dung tin nhan vao model hop thu den
                    modelDen.So_Dien_Thoai = phoneNbMessDen;
                    modelDen.Noi_Dung_Tin_Nhan = contentMessDen;
                    // tinh trang hop thu den = 0 (chua doc tin nhan) = 1 (da doc tin nhan)
                    modelDen.Tinh_Trang = "0";

                    //gan so dien thoai vao model hop thu di
                    modelDi.So_Dien_Thoai = phoneNbMessDen;

                    //cat tung cum tu trong noi dung tin nhan den luu vao moi phan tu cua mang
                    string[] arrContentMess = contentMessDen.Split(' ');

                    //mang noi dung tin nhan < = 1 phan tu ==> tin nhan ko theo cu phap ==> normal message
                    if (arrContentMess.Length <= 1)
                    {
                        modelDen.Ma_Cu_Phap = "";
                        
                        //loai hop thu = 2 ==> hop thu luu tin nhan binh thuong (normal message)
                        modelDen.Loai_Hop_Thu = "2";

                        try
                        {
                            sendOneMessage(returnMessNotSyntax, phoneNbMessDen);
                            //MessageBox.Show(returnMessNotSyntax);
                            j = 1;
                            modelDi.Loai_Hop_Thu = "6";
                        }
                        catch (Exception)
                        {
                            j = 0;
                            modelDi.Loai_Hop_Thu = "6";
                        }
                        //gan noi dung tin nhan va tinh trang gui vao model hop thu di 
                        modelDi.Noi_Dung_Tin_Nhan = contentMessDen;
                        modelDi.Tinh_Trang = j.ToString();
                        
                    }
                    //mang noi dung tin nhan > 1 phan tu
                    else
                    {
                        if (arrContentMess.Length == 2)
                        {
                            arrContentMess[2] = "-1";
                        }
                        string cumCuPhap = "";
                        //lay ra ma cu phap trong tin nhan den
                        for (int i = 0; i <= ((arrContentMess.Length) - 3); i++)
                        {
                            cumCuPhap += arrContentMess[i];
                        }
                        //kiem tra vum cu phap  do co trong db ko
                        CuPhapMODEL cuPhapModel = new CuPhapMODEL();
                        cuPhapModel = null;
                        cuPhapModel =  CuPhapDAO.getCuPhapByCumCuPhap(cumCuPhap);
                        
                        //co cu phap trong danh sach 
                        if (cuPhapModel.Id != null)
                        {
                            modelDen.Ma_Cu_Phap = cuPhapModel.Id;
                            //loai_hop_thu = 0 --> hop thu cu phap 
                            modelDen.Loai_Hop_Thu = "0";
                            int lengtOfContentMessDen = arrContentMess.Length;
                            string result ="";
                            string test = cuPhapModel.Cum_Tu_1+cuPhapModel.Cum_Tu_2+cuPhapModel.Cum_Tu_3+cuPhapModel.Cum_Tu_4+cuPhapModel.Cum_Tu_5+cuPhapModel.Cum_Tu_6+cuPhapModel.Cum_Tu_7+cuPhapModel.Cum_Tu_8+cuPhapModel.Cum_Tu_9+cuPhapModel.Cum_Tu_10;
                            if (test.Equals("DIEM"))
                            {
                                result = getStringDiemByIDNMonHoc(arrContentMess[lengtOfContentMessDen - 2], arrContentMess[lengtOfContentMessDen - 1]);
                            }
                            else if (test.Equals("TKB"))
                            {
                                result = getStringTKBByIDNMonHoc(arrContentMess[lengtOfContentMessDen - 2], arrContentMess[lengtOfContentMessDen - 1]);
                            }
                            else if (test.Equals("MON"))
                            {

                            }
                            else
                            {
                                result = returnMessNotSyntax;
                            }

                            MessageBox.Show(result);

                            int startIndex = 0;
                            int lenghtFinal = 0;
                            int i = result.Length / 150;

                            if (i >= 1)
                            {
                                while (true)
                                {
                                    if (startIndex > result.Length)
                                    {
                                        break;
                                    }

                                    if (startIndex + 150 > result.Length)
                                    {
                                        // lay ra chieu dai chuoi cuoi cung
                                        lenghtFinal = result.Length - startIndex;
                                        string subString = result.Substring(startIndex, lenghtFinal);
                                        sendOneMessage(subString, phoneNbMessDen);
                                    }
                                    else
                                    {
                                        string subString = result.Substring(startIndex, 150);
                                        sendOneMessage(subString, phoneNbMessDen);
                                    }
                                    startIndex += 150;
                                }
                            }
                            else
                            {
                                try
                                {
                                    sendOneMessage(result, phoneNbMessDen);
                                    //MessageBox.Show(result);
                                    j = 1;
                                    modelDi.Loai_Hop_Thu = "4";
                                }
                                catch (Exception)
                                {
                                    j = 0;
                                    modelDi.Loai_Hop_Thu = "4";
                                    throw;
                                }
                            }
                            modelDi.Noi_Dung_Tin_Nhan = result;
                            modelDi.Tinh_Trang = j.ToString();
                            
                        }
                        
                        else
                        {
                            modelDen.Ma_Cu_Phap = "";
                            //loai_hop_thu = 2 --> hop thu thuong 
                            modelDen.Loai_Hop_Thu = "2";

                            try
                            {
                                sendOneMessage(returnMessNotSyntax, phoneNbMessDen);
                                //MessageBox.Show(returnMessNotSyntax);
                                j = 1;
                                modelDi.Loai_Hop_Thu = "6";
                            }
                            catch (Exception)
                            {
                                j = 0;
                                modelDi.Loai_Hop_Thu = "6";
                                throw;
                            }
                            modelDi.Noi_Dung_Tin_Nhan = returnMessNotSyntax;
                            modelDi.Tinh_Trang = j.ToString();
                            
                        }
                    }

                    modelDen.User11 = "";
                    modelDen.User21 = "";
                    modelDen.User31 = "";
                    modelDen.User41 = "";
                    modelDen.User51 = "";

                    modelDi.User11 = "";
                    modelDi.User21 = "";
                    modelDi.User31 = "";
                    modelDi.User41 = "";
                    modelDi.User51 = "";

                    bool resultDi = HopThuDiDAO.insertHopThuDi(modelDi);

                    modelDen.Ma_Tin_Nhan_Tra_Loi = getMaxIDHopThuDi();

                    bool resultDen = HopThuDenDAO.insertHopThuDen(modelDen);
                }
                }else
                {
                    MessageBox.Show("No phone connnected");
                }
            }
            catch (NullReferenceException ex)
            {
                MessageBox.Show(ex.Message);
            }
            Cursor.Current = Cursors.Default;
            MemoryStatus memnoryStatus = common.Constants.comm.GetMessageMemoryStatus(PhoneStorageType.Sim);
            int memUesd = memnoryStatus.Used;
            if (memUesd > 30)
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
            Sent frmSend = new Sent();
            frmSend.MdiParent = this;
            frmSend.Show();
        }

        private string getMaxIDHopThuDi()
        {
            DataTable result = HopThuDiDAO.getMaxId();
            DataRow row = result.Rows[0];

            return row[0].ToString();
        }

        private void sendOneMessage(string contentMess, string des)
        {
            SmsSubmitPdu pdu = new SmsSubmitPdu(contentMess, des, "");
            common.Constants.comm.SendMessage(pdu);
        }

        private void menuKeyword_Click(object sender, EventArgs e)
        {
            FormManageKeyword fr = new FormManageKeyword();
            fr.MdiParent = this;
            fr.Show();
        }

        private void menuAccount_Click(object sender, EventArgs e)
        {
            FormManageAccount fr = new FormManageAccount();
            fr.MdiParent = this;
            fr.Show();
        }

        private string getStringDiemByIDNMonHoc(string idSinhVien, string idMonHoc)
        {
            string result = "";
            DataTable tbl = CuPhapDAO.getDiemByIDHocVienNIDMonHoc(idSinhVien, idMonHoc);
            foreach (DataRow row in tbl.Rows)
            {
                result += row["Ten Mon Hoc"] + " / " + row["Ten vs Hinh Thuc KT"] + " / " + row["Diem"] + "\n";
            }
            return result;
        }

        private string getStringTKBByIDNMonHoc(string idSinhVien, string idMonHoc)
        {
            string result = "";
            DataTable tbl = CuPhapDAO.getTKBByIDHocVienNIDMonHoc(idSinhVien, idMonHoc);

            foreach (DataRow row in tbl.Rows)
            {
                result += row["Ngay hoc"] + " " + row["Buoi"] + " " + row["Ten Phong"] + "\n";
            }
            return result;
        }
    } 
}
