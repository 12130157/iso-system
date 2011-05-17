using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Collections;
using System.Threading;
using SMS.view;
using SMS.common;

using GsmComm.GsmCommunication;
using GsmComm.PduConverter;
using System.Timers;

namespace SMS
{
    public partial class FormMain : Form
    {
        #region Declare Global Variables

        ArrayList listModelDen;
        ArrayList listModelDi;
        string returnMessNotSyntax = "Tin nhan cua ban khong theo cu phap ,ban hay thu lai mot lan nua.";
        private System.Timers.Timer autoRecieveMess = new System.Timers.Timer();
        bool ena = false;
        SmsSubmitPdu pdu;
        int newMess = 0;

        #endregion

        public FormMain()
        {
            Cursor.Current = Cursors.WaitCursor;
            InitializeComponent();

            if (common.Constants.comm.IsConnected() == true)
            {
                this.lbStatus.Text = "Connected";
            }

            if (!common.Constants.getUnreadMess().Equals("0"))
            {
                menuMessage.BackColor = Color.Yellow;
            }

            messRecieveNphoneConnected();
            Cursor.Current = Cursors.Default;
        }

        #region Khởi tạo hệ thống tin nhắn

        private delegate void ConnectedHandler(bool connected);

        private void OnPhoneConnectionChange(bool connected)
        {

        }

        private void messRecieveNphoneConnected()
        {
            common.Constants.comm.PhoneConnected += new EventHandler(comm_PhoneConnected);
            common.Constants.comm.MessageReceived += new MessageReceivedEventHandler(comm_MessageReceived);
        }

        public void comm_MessageReceived(object sender, GsmComm.GsmCommunication.MessageReceivedEventArgs e)
        {
            MessageReceived();
        }

        private void comm_PhoneConnected(object sender, EventArgs e)
        {
            try
            {
                this.Invoke(new ConnectedHandler(OnPhoneConnectionChange), new object[] { true });
            }
            catch (Exception k)
            {
                txtLog.AppendText( k.Message + " (comm_PhoneConnected)\n");
            }
        }

        private void MessageReceived()
        {
            Cursor.Current = Cursors.WaitCursor;

            string storage = GetMessageStorage();

            try
            {
                DecodedShortMessage[] messages = common.Constants.comm.ReadMessages(PhoneMessageStatus.ReceivedUnread, storage);
            }
            catch (Exception e)
            {
                txtLog.AppendText(e.Message + " (MessageReceived)\n");
            }
        }

        #endregion

        #region Timer

        public void InitializeTimer(bool en)
        {
            this.autoRecieveMess.Elapsed += new ElapsedEventHandler(OnTimer);
            this.autoRecieveMess.Interval = 5000;
            this.autoRecieveMess.Enabled = en;
        }

        public void OnTimer(Object source, ElapsedEventArgs e)
        {
            Thread t = new Thread(doMessAuto);
            t.Start();
            t.Join();
            //doMessAuto();
        }

        #endregion 

        #region Xử lý tin nhắn đến

        private void deleteMess()
        {
            MemoryStatus memnoryStatus = common.Constants.comm.GetMessageMemoryStatus(PhoneStorageType.Sim);
            int memUesd = memnoryStatus.Used;
            if (memUesd >= 35)
            {
                common.Constants.comm.DeleteMessages(DeleteScope.All, PhoneStorageType.Sim);
            }
        }

        private string GetMessageStorage()
        {
            try
            {
                string storage = "";
                storage = PhoneStorageType.Sim;
                return storage;
            }
            catch (Exception e)
            {
                txtLog.Invoke(new errorCatchMessDelegate(errorCatchMess), e, "GetMessageStorage");
                return null;
            }
        }

        private DecodedShortMessage[] readMessages(string storage)
        {
            try
            {
                DecodedShortMessage[] messagesFn = common.Constants.comm.ReadMessages(PhoneMessageStatus.ReceivedUnread, storage);
                return messagesFn;
            }
            catch (Exception e)
            {
                txtLog.Invoke(new errorCatchMessDelegate(errorCatchMess), e, "readMessages");
                return null;
            }

            
        }

        private SmsDeliverPdu covertMessRead(DecodedShortMessage message)
        {
            SmsPdu messageDenFn = message.Data;
            SmsDeliverPdu dataMessageDenFn = (SmsDeliverPdu)messageDenFn;
            return dataMessageDenFn;
        }

        private string checkSyntax(string contentMess)
        {
            CuPhapMODEL cuPhapModelFn;
            string idCuPhapFn = "";
            string cumCuPhapFn = "";

            try
            {
                string[] arrContentMessFn = contentMess.Split(' ');
                int lenghtOfMessFn = arrContentMessFn.Length;

                if (lenghtOfMessFn >= 3)
                {
                    cumCuPhapFn = arrContentMessFn[0] + arrContentMessFn[1];
                    if (lenghtOfMessFn == 3)
                    {
                        cuPhapModelFn = CuPhapDAO.getCuPhapByCumCuPhap(cumCuPhapFn);

                        if (cuPhapModelFn != null)
                        {
                            idCuPhapFn = "0";
                        }
                        else
                        {
                            idCuPhapFn = "";
                        }
                    }
                    else if (lenghtOfMessFn == 4)
                    {
                        cuPhapModelFn = CuPhapDAO.getCuPhapByCumCuPhap(cumCuPhapFn);                        
                        if (cuPhapModelFn != null)
                        {
                            if (cuPhapModelFn.Id.Equals("1") || cuPhapModelFn.Id.Equals("2") || cuPhapModelFn.Id.Equals("3"))
                            {
                                if (Validattion.isSemester(arrContentMessFn[3]) == true)
                                {
                                    idCuPhapFn = "3";
                                }
                                else if (Validattion.isSubject(arrContentMessFn[3]) == true)
                                {
                                    idCuPhapFn = "1";
                                }
                                else if (Validattion.isYear(arrContentMessFn[3]) == true)
                                {
                                    idCuPhapFn = "2";
                                }
                                else
                                {
                                    idCuPhapFn = "";
                                }
                            }
                            else if (cuPhapModelFn.Id.Equals("4") || cuPhapModelFn.Id.Equals("5"))
                            {
                                if (Validattion.isYear(arrContentMessFn[3]) == true)
                                {
                                    idCuPhapFn = "4";
                                }
                                else if (Validattion.isSemester(arrContentMessFn[3]) == true)
                                {
                                    idCuPhapFn = "5";
                                }
                                else
                                {
                                    idCuPhapFn = "";
                                }
                            }
                            else if (cuPhapModelFn.Id.Equals("6") || cuPhapModelFn.Id.Equals("7"))
                            {
                                if (Validattion.isDDMMYYYY(arrContentMessFn[3]) == true)
                                {
                                    idCuPhapFn = "6";
                                }
                                else if (Validattion.isMMYYYY(arrContentMessFn[3]) == true)
                                {
                                    idCuPhapFn = "7";
                                }
                            }
                        }
                        else
                        {
                            idCuPhapFn = "";
                        }
                    }
                    else
                    {
                        idCuPhapFn = "";
                    }
                }
                else
                {
                    cumCuPhapFn = "";
                    idCuPhapFn = "";
                }
            }
            catch (Exception e)
            {
                txtLog.Invoke(new errorCatchMessDelegate(errorCatchMess), e, "checkSyntax");
            }
            //MessageBox.Show(idCuPhapFn);
            return idCuPhapFn;
        }

        private string[] splitContentMess(string contentMess)
        {
            string[] arrContentMessFn = contentMess.Split(' ');
            return arrContentMessFn;
        }

        private ArrayList getMessDen(DecodedShortMessage[] messages)
        {
            try
            {

                HopThuDenMODEL modelDenFn;
                SmsDeliverPdu dataMessageDenFn;
                ArrayList listModelDenFn = new ArrayList();

                foreach (DecodedShortMessage message in messages)
                {
                    modelDenFn = new HopThuDenMODEL();
                    dataMessageDenFn = new SmsDeliverPdu();

                    dataMessageDenFn = covertMessRead(message);

                    modelDenFn.So_Dien_Thoai = dataMessageDenFn.OriginatingAddress;
                    modelDenFn.Noi_Dung_Tin_Nhan = dataMessageDenFn.UserDataText;
                    modelDenFn.Ma_Cu_Phap = checkSyntax(dataMessageDenFn.UserDataText);
                    if (modelDenFn.Ma_Cu_Phap.Equals(""))
                    {
                        modelDenFn.Loai_Hop_Thu = "2";
                    }
                    else
                    {
                        modelDenFn.Loai_Hop_Thu = "0";
                    }
                    modelDenFn.Tinh_Trang = "0";

                    string[] arrContentMessFn = splitContentMess(dataMessageDenFn.UserDataText);
                    if (modelDenFn.Ma_Cu_Phap.Equals("0"))
                    {
                        modelDenFn.User11 = arrContentMessFn[2];
                        modelDenFn.User21 = "";
                        modelDenFn.User31 = getStringDiemByMaSinhVien(arrContentMessFn[2]);
                    }
                    else if (modelDenFn.Ma_Cu_Phap.Equals("1"))
                    {
                        modelDenFn.User11 = arrContentMessFn[2];
                        modelDenFn.User21 = arrContentMessFn[3];
                        modelDenFn.User31 = getStringDiemByMaSinhVienNTenMonHoc(arrContentMessFn[2], arrContentMessFn[3]);
                    }
                    else if (modelDenFn.Ma_Cu_Phap.Equals("2"))
                    {
                        modelDenFn.User11 = arrContentMessFn[2];
                        modelDenFn.User21 = arrContentMessFn[3];
                        modelDenFn.User31 = getStringDiemByMaSinhVienNNamHoc(arrContentMessFn[2], arrContentMessFn[3]);

                    }
                    else if (modelDenFn.Ma_Cu_Phap.Equals("3"))
                    {
                        modelDenFn.User11 = arrContentMessFn[2];
                        modelDenFn.User21 = arrContentMessFn[3];
                        modelDenFn.User31 = getStringDiemByMaSinhVienNHocKi(arrContentMessFn[2], arrContentMessFn[3]);
                    }
                    else if (modelDenFn.Ma_Cu_Phap.Equals("4"))
                    {
                        modelDenFn.User11 = arrContentMessFn[2];
                        modelDenFn.User21 = arrContentMessFn[3];
                        modelDenFn.User31 = getStringTKBByMaSinhVienNNamHoc(arrContentMessFn[2], arrContentMessFn[3]);
                    }
                    else if (modelDenFn.Ma_Cu_Phap.Equals("5"))
                    {
                        modelDenFn.User11 = arrContentMessFn[2];
                        modelDenFn.User21 = arrContentMessFn[3];
                        modelDenFn.User31 = getStringTKBByMaSinhVienNHocKi(arrContentMessFn[2], arrContentMessFn[3]);
                    }
                    else if (modelDenFn.Ma_Cu_Phap.Equals("6"))
                    {
                        modelDenFn.User11 = arrContentMessFn[2];
                        modelDenFn.User21 = arrContentMessFn[3];
                        modelDenFn.User31 = getStringDDByMaSinhVienNddmmyyy(arrContentMessFn[2], arrContentMessFn[3]);
                    }
                    else if (modelDenFn.Ma_Cu_Phap.Equals("7"))
                    {
                        modelDenFn.User11 = arrContentMessFn[2];
                        modelDenFn.User21 = arrContentMessFn[3];
                        modelDenFn.User31 = getStringDDByMaSinhVienNmmyyy(arrContentMessFn[2], arrContentMessFn[3]);
                    }
                    else
                    {
                        modelDenFn.User11 = "";
                        modelDenFn.User21 = "";
                        modelDenFn.User31 = returnMessNotSyntax;
                    }

                    listModelDenFn.Add(modelDenFn);
                }
                return listModelDenFn;
            }
            catch (Exception e)
            {
                txtLog.Invoke(new errorCatchMessDelegate(errorCatchMess), e, "getMessDen");
                return null;
            }
        }

        private ArrayList getMessDi(ArrayList listModelDen)
        {
            HopThuDiMODEL modelDiFn;
            ArrayList listModelDiFn = new ArrayList();

            try
            {
                foreach (HopThuDenMODEL model in listModelDen)
                {
                    modelDiFn = new HopThuDiMODEL();

                    modelDiFn.So_Dien_Thoai = model.So_Dien_Thoai;
                    if (!model.User31.Equals(""))
                    {
                        modelDiFn.Noi_Dung_Tin_Nhan = model.User31;
                        model.User31 = "";
                    }

                    if (model.Loai_Hop_Thu.Equals("0"))
                    {
                        modelDiFn.Loai_Hop_Thu = "4";
                    }
                    if (model.Loai_Hop_Thu.Equals("2"))
                    {
                        modelDiFn.Loai_Hop_Thu = "6";
                    }

                    listModelDiFn.Add(modelDiFn);
                }
            }
            catch (Exception e)
            {
                txtLog.Invoke(new errorCatchMessDelegate(errorCatchMess), e, "getMessDi");
            }
            return listModelDiFn;
        }

        private void sendOneMessage(string contentMess, string des)
        {
            try
            {
                //dcs = DataCodingScheme.NoClass_16Bit;
                pdu = new SmsSubmitPdu(contentMess, des, "");
                common.Constants.comm.SendMessage(pdu);
            }
            catch (Exception e)
            {
                txtLog.Invoke(new errorCatchMessDelegate(errorCatchMess), e, "sendOneMessage");
            }
        }

        private string getMaxIDHopThuDi()
        {
            DataTable result = HopThuDiDAO.getMaxId();
            DataRow row = result.Rows[0];

            return row[0].ToString();
        }

        private void sendNinsertMessDi(ArrayList listModelDi,ArrayList listModelDen)
        {
            try
            {
                string maTinNhanTraLoi = "";
                int i = 0;
                HopThuDenMODEL modelDenFn;

                foreach (HopThuDiMODEL model in listModelDi)
                {
                    int startIndex = 0;
                    int lenghtFinal = 0;
                    int j = (model.Noi_Dung_Tin_Nhan).Length / 160;

                    if (j >= 1)
                    {
                        while (true)
                        {
                            if (startIndex > (model.Noi_Dung_Tin_Nhan).Length)
                            {
                                break;
                            }

                            if (startIndex + 160 > (model.Noi_Dung_Tin_Nhan).Length)
                            {
                                // lay ra chieu dai chuoi cuoi cung
                                lenghtFinal = model.Noi_Dung_Tin_Nhan.Length - startIndex;
                                
                                string subString = (model.Noi_Dung_Tin_Nhan).Substring(startIndex, lenghtFinal);
                                try
                                {
                                    sendOneMessage(subString, model.So_Dien_Thoai);
                                    model.Tinh_Trang = "1";
                                }
                                catch (Exception e)
                                {
                                    model.Tinh_Trang = "0";
                                    txtLog.Invoke(new errorCatchMessDelegate(errorCatchMess), e, "sendOneSubMessageFinal");
                                    break;
                                }
                            }
                            else
                            {
                                string subString = (model.Noi_Dung_Tin_Nhan).Substring(startIndex, 160);
                                
                                try
                                {
                                    sendOneMessage(subString, model.So_Dien_Thoai);
                                    model.Tinh_Trang = "1";
                                }
                                catch (Exception e)
                                {
                                    model.Tinh_Trang = "0";
                                    txtLog.Invoke(new errorCatchMessDelegate(errorCatchMess), e, "sendOneSubMessage");
                                    break;
                                }
                            }
                            startIndex += 160;
                        }
                    }
                    else
                    {
                        try
                        {
                            sendOneMessage(model.Noi_Dung_Tin_Nhan, model.So_Dien_Thoai);
                            model.Tinh_Trang = "1";
                        }
                        catch (Exception e)
                        {
                            txtLog.Invoke(new errorCatchMessDelegate(errorCatchMess), e, "sendMessage");
                            model.Tinh_Trang = "0";
                        }
                    }
                    model.User11 = "";
                    model.User21 = "";
                    model.User31 = "";
                    model.User41 = "";
                    model.User51 = "";

                    bool resultDi = HopThuDiDAO.insertHopThuDi(model);
                    
                    maTinNhanTraLoi = getMaxIDHopThuDi();

                    modelDenFn = (HopThuDenMODEL)listModelDen[i];
                    modelDenFn.Ma_Tin_Nhan_Tra_Loi = maTinNhanTraLoi;
                    modelDenFn.User41 = "";
                    modelDenFn.User51 = "";

                    bool resultDen = HopThuDenDAO.insertHopThuDen(modelDenFn);

                    i++;
                }
            }
            catch (Exception e)
            {
                txtLog.Invoke(new errorCatchMessDelegate(errorCatchMess), e, "sendNinsertMess");
            }
        }

        #endregion

        #region delegate

        private delegate void soMessNhanInTxtDeledate(int n);
        private void soMessNhanInTxt(int messLength)
        {
            txtLog.AppendText("Nhận được " + messLength.ToString() + " tin nhắn.\n");
        }

        private delegate void updateNewMessDelegate(int n);
        private void updateNewMess(int messLength)
        {
            newMess = newMess + messLength;
            btnNewMess.Text = "New Message (" + newMess.ToString() + ")";
            btnNewMess.BackColor = Color.Yellow;
            btnNewMess.ForeColor = Color.Red;
        }

        private delegate void errorCatchMessDelegate(Exception e, string txt);
        private void errorCatchMess(Exception e, string txt)
        {
            txtLog.AppendText(e.Message + " (" + txt + ")\n");
        }

        #endregion

        private void doMessAuto()
        {
            Cursor.Current = Cursors.WaitCursor;
            deleteMess();
            string storage = GetMessageStorage();

            DecodedShortMessage[] messages = readMessages(storage);

            listModelDen = new ArrayList();
            listModelDen = getMessDen(messages);
            
            listModelDi = new ArrayList();
            listModelDi = getMessDi(listModelDen);

            sendNinsertMessDi(listModelDi, listModelDen);
            if (messages.Length > 0)
            {
                btnNewMess.Invoke(new updateNewMessDelegate(updateNewMess), messages.Length);
                txtLog.Invoke(new soMessNhanInTxtDeledate(soMessNhanInTxt), messages.Length);
            }
            Cursor.Current = Cursors.Default;
        }

        #region Xem lai

        ////bien luu tin nhan den
                
                //HopThuDenMODEL modelDen;

                ////bien luu tin nhan di
                //HopThuDiMODEL modelDi;

                //foreach (DecodedShortMessage message in messages)
                //{
                //    modelDen = new HopThuDenMODEL();
                //    modelDi = new HopThuDiMODEL();

                //    messageDen = message.Data;
                //    //convert SmsPdu = SmsDeliverPdu
                //    SmsDeliverPdu data = (SmsDeliverPdu)messageDen;

                //    string phoneNbMessDen = data.OriginatingAddress.ToString();
                //    string contentMessDen = data.UserDataText;

                //    //danh dau tinh trang gui (0 = chua gui duoc ,1 = gui duoc)
                //    int j = 0;

                //    //gan so dien thoai va noi dung tin nhan vao model hop thu den
                //    modelDen.So_Dien_Thoai = phoneNbMessDen;
                //    modelDen.Noi_Dung_Tin_Nhan = contentMessDen;
                //    // tinh trang hop thu den = 0 (chua doc tin nhan) = 1 (da doc tin nhan)
                //    modelDen.Tinh_Trang = "0";

                //    //gan so dien thoai vao model hop thu di
                //    modelDi.So_Dien_Thoai = phoneNbMessDen;

                //    //cat tung cum tu trong noi dung tin nhan den luu vao moi phan tu cua mang
                //    string[] arrContentMess = contentMessDen.Split(' ');

                //    //mang noi dung tin nhan < = 1 phan tu ==> tin nhan ko theo cu phap ==> normal message
                //    if (arrContentMess.Length <= 1)
                //    {
                //        modelDen.Ma_Cu_Phap = "";

                //        //loai hop thu = 2 ==> hop thu luu tin nhan binh thuong (normal message)
                //        modelDen.Loai_Hop_Thu = "2";

                //        try
                //        {
                //            sendOneMessage(returnMessNotSyntax, phoneNbMessDen);
                //            //MessageBox.Show(returnMessNotSyntax);
                //            j = 1;
                //            modelDi.Loai_Hop_Thu = "6";
                //        }
                //        catch (Exception)
                //        {
                //            j = 0;
                //            modelDi.Loai_Hop_Thu = "6";
                //        }
                //        //gan noi dung tin nhan va tinh trang gui vao model hop thu di 
                //        modelDi.Noi_Dung_Tin_Nhan = contentMessDen;
                //        modelDi.Tinh_Trang = j.ToString();

                //    }
                //    //mang noi dung tin nhan > 1 phan tu
                //    else
                //    {
                //        //if (arrContentMess.Length == 2)
                //        //{
                            
                //        //    arrContentMess[2] = "-1";
                //        //}
                //        string cumCuPhap = "";
                //        //lay ra ma cu phap trong tin nhan den
                //        for (int i = 0; i <= ((arrContentMess.Length) - 3); i++)
                //        {
                //            cumCuPhap += arrContentMess[i];
                //        }
                //        //kiem tra vum cu phap  do co trong db ko
                //        CuPhapMODEL cuPhapModel = new CuPhapMODEL();
                //        cuPhapModel = null;
                //        cuPhapModel = CuPhapDAO.getCuPhapByCumCuPhap(cumCuPhap);

                //        //co cu phap trong danh sach 
                //        if (cuPhapModel.Id != null)
                //        {
                //            modelDen.Ma_Cu_Phap = cuPhapModel.Id;
                //            //loai_hop_thu = 0 --> hop thu cu phap 
                //            modelDen.Loai_Hop_Thu = "0";
                //            int lengtOfContentMessDen = arrContentMess.Length;
                //            string result = "";
                //            string test = cuPhapModel.Cum_Tu_1 + cuPhapModel.Cum_Tu_2 + cuPhapModel.Cum_Tu_3 + cuPhapModel.Cum_Tu_4 + cuPhapModel.Cum_Tu_5 + cuPhapModel.Cum_Tu_6 + cuPhapModel.Cum_Tu_7 + cuPhapModel.Cum_Tu_8 + cuPhapModel.Cum_Tu_9 + cuPhapModel.Cum_Tu_10;
                //            if (test.Equals("DIEM"))
                //            {
                //                result = getStringDiemByIDNMonHoc(arrContentMess[lengtOfContentMessDen - 2], arrContentMess[lengtOfContentMessDen - 1]);
                //            }
                //            else if (test.Equals("TKB"))
                //            {
                //                result = getStringTKBByIDNMonHoc(arrContentMess[lengtOfContentMessDen - 2], arrContentMess[lengtOfContentMessDen - 1]);
                //            }
                //            else if (test.Equals("MON"))
                //            {

                //            }
                //            else
                //            {
                //                result = returnMessNotSyntax;
                //            }

                //            MessageBox.Show(result);

                //            int startIndex = 0;
                //            int lenghtFinal = 0;
                //            int i = result.Length / 150;

                //            
                //            else
                //            {
                //                try
                //                {
                //                    sendOneMessage(result, phoneNbMessDen);
                //                    //MessageBox.Show(result);
                //                    j = 1;
                //                    modelDi.Loai_Hop_Thu = "4";
                //                }
                //                catch (Exception)
                //                {
                //                    j = 0;
                //                    modelDi.Loai_Hop_Thu = "4";
                //                    throw;
                //                }
                //            }
                //            modelDi.Noi_Dung_Tin_Nhan = result;
                //            modelDi.Tinh_Trang = j.ToString();

                //        }

                //        else
                //        {
                //            modelDen.Ma_Cu_Phap = "";
                //            //loai_hop_thu = 2 --> hop thu thuong 
                //            modelDen.Loai_Hop_Thu = "2";

                //            try
                //            {
                //                sendOneMessage(returnMessNotSyntax, phoneNbMessDen);
                //                //MessageBox.Show(returnMessNotSyntax);
                //                j = 1;
                //                modelDi.Loai_Hop_Thu = "6";
                //            }
                //            catch (Exception)
                //            {
                //                j = 0;
                //                modelDi.Loai_Hop_Thu = "6";
                //                throw;
                //            }
                //            modelDi.Noi_Dung_Tin_Nhan = returnMessNotSyntax;
                //            modelDi.Tinh_Trang = j.ToString();

                //        }
                //    }

                //    modelDen.User11 = "";
                //    modelDen.User21 = "";
                //    modelDen.User31 = "";
                //    modelDen.User41 = "";
                //    modelDen.User51 = "";

                //    modelDi.User11 = "";
                //    modelDi.User21 = "";
                //    modelDi.User31 = "";
                //    modelDi.User41 = "";
                //    modelDi.User51 = "";

                //    bool resultDi = HopThuDiDAO.insertHopThuDi(modelDi);

                //    modelDen.Ma_Tin_Nhan_Tra_Loi = getMaxIDHopThuDi();

                //    bool resultDen = HopThuDenDAO.insertHopThuDen(modelDen);
                //}
            //Cursor.Current = Cursors.Default;

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

        #region Lay Noi Dung Tin Nhan Tra Loi

        private string getStringDiemByMaSinhVien(string maSinhVien)
        {
            string result = "";
            DataTable tbl = CuPhapDAO.getDiemByMaSinhVien(maSinhVien);
            if (tbl != null)
            {
                foreach (DataRow row in tbl.Rows)
                {
                    result += row["Ten_Mon_Hoc"] + "-" + row["Ten vs Hinh Thuc KT"] + "-" + row["Diem"] + "d-HK" + row["Hoc_Ki"] + "\n";
                }
            }
            else
            {
                result = returnMessNotSyntax;
            }
            return result;
        }

        private string getStringDiemByMaSinhVienNTenMonHoc(string maSinhVien, string tenMonHoc)
        {
            string result = "";
            DataTable tbl = CuPhapDAO.getDiemByMaSinhVienNTenMonHoc(maSinhVien, tenMonHoc);
            if (tbl != null)
            {
                result += tbl.Rows[0].ItemArray[0] + ":\n";
                foreach (DataRow row in tbl.Rows)
                {
                    string diem;
                    if (row["Diem"].ToString().Equals(""))
                    {
                         diem = "chua co ";
                    }
                    else
                    {
                        diem = row["Diem"].ToString();
                    }
                    result += row["Ten Bai KT"] + "/" + diem + "d/HK" + row["Hoc_Ki"] + "\n";
                }
                result += "TB Mon : " + tbl.Rows[0].ItemArray[4];
            }
            else
            {
                result = returnMessNotSyntax;
            }
            return result;            
        }

        private string getStringDiemByMaSinhVienNNamHoc(string maSinhVien, string namHoc)
        {
            string result = "";
            DataTable tbl = CuPhapDAO.getDiemByMaSinhVienNNamHoc(maSinhVien, namHoc);
            if (tbl != null)
            {
                foreach (DataRow row in tbl.Rows)
                {
                    result += row["Ten_Mon_Hoc"] + "-" + row["Ten vs Hinh Thuc KT"] + "-" + row["Diem"] + "d-HK" + row["Hoc_Ki"] + "\n";
                }
            }
            else
            {
                result = returnMessNotSyntax;
            }
            return result;
        }

        private string getStringDiemByMaSinhVienNHocKi(string maSinhVien, string hocKi)
        {
            string result = "";
            DataTable tbl = CuPhapDAO.getDiemByMaSinhVienNHocKi(maSinhVien, hocKi);
            if (tbl != null)
            {
                ArrayList listDSMonHoc;
                ArrayList listMonHoc;
                MonHoc monHoc;
                string tenMonHocTruoc = "";
                foreach (DataRow row in tbl.Rows)
                {
                    if (tenMonHocTruoc != row["Ten_Mon_Hoc"].ToString())
                    {
                        listMonHoc = new ArrayList();

                        monHoc = new MonHoc();

                        monHoc.TenMonHoc = row["Ten_Mon_Hoc"].ToString();
                        monHoc.TenBaiKT = row["Ten Bai KT"].ToString();
                        monHoc.Diem = row["Diem"].ToString();
                        monHoc.HocKi = row["Hoc_Ki"].ToString();
                        monHoc.DiemTB = row["Diem_Trung_Binh"].ToString();

                        listMonHoc.Add(monHoc);
                    }
                    else
                    {
                        
                        
                    }
                    tenMonHocTruoc = row["Ten Mon Hoc"].ToString();
                    //result += row["Ten_Mon_Hoc"] + "-" + row["Ten vs Hinh Thuc KT"] + "-" + row["Diem"] + "d-HK" + row["Hoc_Ki"] + "\n";
                }
            }
            else
            {
                result = returnMessNotSyntax;
            }
            return result;
        }

        private string getStringTKBByMaSinhVienNNamHoc(string maSinhVien, string namHoc)
        {
            string result = "";
            DataTable tbl = CuPhapDAO.getTKBByMaSinhVienNNamHoc(maSinhVien, namHoc);
            if (tbl != null)
            {
                foreach (DataRow row in tbl.Rows)
                {
                    result += row["Buoi"] + "-" + row["Ngay_Hoc"] + "-HK " + row["Hoc_Ki"] + "-" + row["Ki_Hieu_Phong"] + "-" + row["Ten_Mon_Hoc"] + "-" + row["Hinh_Thuc_Day"] + "-" + row["Giao Vien"] + "\n";
                }
            }
            else
            {
                result = returnMessNotSyntax;
            }
            return result;
        }

        private string getStringTKBByMaSinhVienNHocKi(string maSinhVien, string hocKi)
        {
            string result = "";
            DataTable tbl = CuPhapDAO.getTKBByMaSinhVienNHocKi(maSinhVien, hocKi);
            if (tbl != null)
            {
                foreach (DataRow row in tbl.Rows)
                {
                    result += row["Buoi"] + "-" + row["Ngay_Hoc"] + "-HK " + row["Hoc_Ki"] + "-" + row["Ki_Hieu_Phong"] + "-" + row["Ten_Mon_Hoc"] + "-" + row["Hinh_Thuc_Day"] + "-" + row["Giao Vien"] + "\n";
                }
            }
            else
            {
                result = returnMessNotSyntax;
            }
            return result;
        }

        private string getStringDDByMaSinhVienNddmmyyy(string maSinhVien, string ddmmyyyy)
        {
            string result = "";
            return result;
        }

        private string getStringDDByMaSinhVienNmmyyy(string maSinhVien, string mmyyyy)
        {
            string result = "";
            return result;
        }

        #endregion

        #region Events

        private void menuAddressBook_Click(object sender, EventArgs e)
        {
            FormAddressBook fr = new FormAddressBook();
            fr.MdiParent = this;
            fr.Show();
        }

        private void typeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormInboxMessageType fr = new FormInboxMessageType();
            fr.MdiParent = this;
            fr.Show();
        }

        private void menuLogout_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Ban co chac chan thoat khoi ung dung ?", "Xac Nhan Thoat .", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                Application.Exit();
                Environment.Exit(0);
            }
        }

        private void btnEnableMess_Click(object sender, EventArgs e)
        {
            try
            {
                if (common.Constants.comm.IsConnected() == true)
                {
                    if (ena == false)
                    {
                        ena = true;
                        InitializeTimer(ena);
                        btnEnableMess.Text = "Disable for Recieve Message";
                        txtLog.AppendText("Bắt đầu nhận tin nhắn \n");
                        return;
                    }
                    if (ena == true)
                    {
                        ena = false;
                        InitializeTimer(ena);
                        btnEnableMess.Text = "Enable for Recieve Message";
                        txtLog.AppendText("Kết thúc nhận tin nhắn \n");
                        return;
                    }
                }
                else
                {
                    txtLog.AppendText("No Phone Connected\n");
                }
            }
            catch (Exception k)
            {
                txtLog.AppendText(k.Message + " (btnEnableMess_Click)\n");
            }
        }

        private void menuKeyword_Click(object sender, EventArgs e)
        {
            FormManageKeyword fr = new FormManageKeyword();
            fr.MdiParent = this;
            fr.Show();
        }


        private void FormMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (common.Constants.comm.IsConnected() == true)
            {
                common.Constants.comm.Close();
            }
            Application.Exit();
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

        private void menu_ManageTypeAccount_Click(object sender, EventArgs e)
        {
            
        }

        private void btnNewMess_Click(object sender, EventArgs e)
        {
            if (newMess != 0)
            {
                FormNewMessage frm = new FormNewMessage(newMess);
                frm.MdiParent = this;
                frm.Show();
                newMess = 0;
                if (newMess == 0)
                {
                    btnNewMess.Text = "New Message";
                }
                btnNewMess.ForeColor = Color.Black;
                btnNewMess.BackColor = Color.White;
            }
        }

        private void menuMessage_MouseMove(object sender, MouseEventArgs e)
        {
            if (common.Constants.getUnreadMess().Equals(""))
            {
                menuInbox.Text = "Hộp Thư Đến (Chưa đọc : " + 0 + " tin nhắn)";
            }
            else
            {
                menuInbox.Text = "Hộp Thư Đến (Chưa đọc : " + common.Constants.getUnreadMess() + " tin nhắn)";
            }
        }

        private void FormMain_MdiChildActivate(object sender, EventArgs e)
        {
            if (!common.Constants.getUnreadMess().Equals("0"))
            {
                menuMessage.BackColor = Color.Yellow;
            }
            else
            {
                menuMessage.BackColor = SystemColors.Control;
            }
        }


        private void taiKhoanToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormManageAccount fr = new FormManageAccount();
            fr.MdiParent = this;
            fr.Show();
        }


        private void loaiTaiKhoanToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormAddTypeSMS fr = new FormAddTypeSMS();
            fr.MdiParent = this;
            fr.Show();
        }

        private void FormMain_FormClosing_1(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
            Environment.Exit(0);
        }


        # endregion

        #region TrayIcon

        private void FormMain_Resize(object sender, EventArgs e)
        {
            if (FormWindowState.Minimized == WindowState)
            {
                Hide();
            }
        }

        private void systemTrayIcon_DoubleClick(object sender, EventArgs e)
        {
            Show();
            WindowState = FormWindowState.Maximized;
        }

        private void toolTripMenuRestore_Click(object sender, EventArgs e)
        {
            Show();
            WindowState = FormWindowState.Maximized;
        }

        private void toolsTripMenuExit_Click(object sender, EventArgs e)
        {
            systemTrayIcon.Dispose();
            Application.Exit();
        }

        #endregion
    }
    class MonHoc
    {
        string tenMonHoc;

        public string TenMonHoc
        {
          get { return tenMonHoc; }
          set { tenMonHoc = value; }
        }

        string tenBaiKT;

        public string TenBaiKT
        {
            get { return tenBaiKT; }
            set { tenBaiKT = value; }
        }

        string diem;

        public string Diem
        {
            get { return diem; }
            set { diem = value; }
        }
        string hocKi;

        public string HocKi
        {
            get { return hocKi; }
            set { hocKi = value; }
        }

        string diemTB;

        public string DiemTB
        {
            get { return diemTB; }
            set { diemTB = value; }
        }
    }
}
