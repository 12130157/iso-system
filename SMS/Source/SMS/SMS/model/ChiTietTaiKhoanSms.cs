using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SMS.model
{
    class ChiTietTaiKhoanSms
    {
        private string id;
        private string ma_Tai_Khoan_Sms;
        private string dang_Ki_Thang;
        private string dang_Ki_Nam;
        private string ngay_Cap_Nhat_Cuoi;
        private string User1;
        private string User2;
        private string User3;
        private string User4;
        private string User5;

        public string User11
        {
            get { return User1; }
            set { User1 = value; }
        }

        public string User21
        {
            get { return User2; }
            set { User2 = value; }
        }

        public string User31
        {
            get { return User3; }
            set { User3 = value; }
        }

        public string User41
        {
            get { return User4; }
            set { User4 = value; }
        }

        public string User51
        {
            get { return User5; }
            set { User5 = value; }
        }

        public string Ngay_Cap_Nhat_Cuoi
        {
            get { return ngay_Cap_Nhat_Cuoi; }
            set { ngay_Cap_Nhat_Cuoi = value; }
        }

        public string Dang_Ki_Nam
        {
            get { return dang_Ki_Nam; }
            set { dang_Ki_Nam = value; }
        }

        public string Dang_Ki_Thang
        {
            get { return dang_Ki_Thang; }
            set { dang_Ki_Thang = value; }
        }

        public string Ma_Tai_Khoan_Sms
        {
            get { return ma_Tai_Khoan_Sms; }
            set { ma_Tai_Khoan_Sms = value; }
        }

        public string Id
        {
            get { return id; }
            set { id = value; }
        }
    }
}
