using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SMS.model;

using GsmComm.GsmCommunication;
using GsmComm.PduConverter;

namespace SMS.common
{
    static class Constants
    {
        public static MemberModel USER_LOGIN;
        ////public static ArrayList MENU_LIST;
        //public static int menutool = 0;

        // luu tru bien ket noi GSM
        public static GsmCommMain comm;
        public static int comPort;
        public static int baudRate;
        public static int timeOut;
        //lu tru tin nhan 
        //public static DecodedShortMessage[] messages;
        public static int chooseUpdate = 0;
        public static int choose = 0;
        public static String id = "";
        public static String idDetail = "";
        public static string Ma_tai_khoan_SMS = "";
        public static bool dangNhap = false;

        public static string getUnreadMess()
        {
            return HopThuDenDAO.getCountMessUnread();
        }
    }
}
