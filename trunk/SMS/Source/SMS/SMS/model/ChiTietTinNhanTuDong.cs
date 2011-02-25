using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SMS.model
{
    class ChiTietTinNhanTuDong
    {
        private string id;
        private string ma_Tai_Khoan_Sms;
        private string ma_Lich_Tin_Nhan;
        private string noi_Dung;
        private string tinh_Trang;
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

        public string Tinh_Trang
        {
            get { return tinh_Trang; }
            set { tinh_Trang = value; }
        }

        public string Noi_Dung
        {
            get { return noi_Dung; }
            set { noi_Dung = value; }
        }

        public string Ma_Lich_Tin_Nhan
        {
            get { return ma_Lich_Tin_Nhan; }
            set { ma_Lich_Tin_Nhan = value; }
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
