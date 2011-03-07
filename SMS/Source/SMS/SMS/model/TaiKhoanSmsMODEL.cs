using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SMS.model
{
    class TaiKhoanSmsMODEL
    {
        private string id;
        private string so_Dien_Thoai;
        private string ma_Sinh_Vien;
        private string loai_Tai_Khoan;
        private string ngay_Dang_Ki;
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

        public string Ngay_Dang_Ki
        {
            get { return ngay_Dang_Ki; }
            set { ngay_Dang_Ki = value; }
        }

        public string Loai_Tai_Khoan
        {
            get { return loai_Tai_Khoan; }
            set { loai_Tai_Khoan = value; }
        }

        public string Ma_Sinh_Vien
        {
            get { return ma_Sinh_Vien; }
            set { ma_Sinh_Vien = value; }
        }

        public string So_Dien_Thoai
        {
            get { return so_Dien_Thoai; }
            set { so_Dien_Thoai = value; }
        }

        public string Id
        {
            get { return id; }
            set { id = value; }
        }
    }
}
