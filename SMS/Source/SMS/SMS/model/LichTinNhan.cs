﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SMS.model
{
    class LichTinNhan
    {
        private string id;
        private string loai_Tai_Khoan_Sms;
        private string lich_Bieu;
        private string ma_Cu_Phap;
        private string thoi_Gian;
        private string ngay_Cap_Nhat_Cuoi;
        private string User1;
        private string User2;
        private string User3;
        private string User4;
        private string User5;

        public string User51
        {
            get { return User5; }
            set { User5 = value; }
        }

        public string User41
        {
            get { return User4; }
            set { User4 = value; }
        }

        public string User31
        {
            get { return User3; }
            set { User3 = value; }
        }

        public string User21
        {
            get { return User2; }
            set { User2 = value; }
        }

        public string User11
        {
            get { return User1; }
            set { User1 = value; }
        }

        public string Ngay_Cap_Nhat_Cuoi
        {
            get { return ngay_Cap_Nhat_Cuoi; }
            set { ngay_Cap_Nhat_Cuoi = value; }
        }

        public string Thoi_Gian
        {
            get { return thoi_Gian; }
            set { thoi_Gian = value; }
        }

        public string Ma_Cu_Phap
        {
            get { return ma_Cu_Phap; }
            set { ma_Cu_Phap = value; }
        }

        public string Lich_Bieu
        {
            get { return lich_Bieu; }
            set { lich_Bieu = value; }
        }

        public string Loai_Tai_Khoan_Sms
        {
            get { return loai_Tai_Khoan_Sms; }
            set { loai_Tai_Khoan_Sms = value; }
        }

        public string Id
        {
            get { return id; }
            set { id = value; }
        }
    }
}