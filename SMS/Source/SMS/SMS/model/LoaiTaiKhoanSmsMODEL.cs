using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SMS.model
{
    class LoaiTaiKhoanSmsMODEL
    {
        private string id;
        private string ten;
        private string phi_Dich_Vu;
        private string ghi_Chu;
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

        public string Ghi_Chu
        {
            get { return ghi_Chu; }
            set { ghi_Chu = value; }
        }

        public string Phi_Dich_Vu
        {
            get { return phi_Dich_Vu; }
            set { phi_Dich_Vu = value; }
        }

        public string Ten
        {
            get { return ten; }
            set { ten = value; }
        }

        public string Id
        {
            get { return id; }
            set { id = value; }
        }
    }
}
