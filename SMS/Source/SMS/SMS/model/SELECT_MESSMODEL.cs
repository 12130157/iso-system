using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SMS
{
    class SELECT_MESSMODEL
    {
        private string id;

        public string Id
        {
            get { return id; }
            set { id = value; }
        }
        private string so_dien_thoai;

        public string So_dien_thoai
        {
            get { return so_dien_thoai; }
            set { so_dien_thoai = value; }
        }
        private string cu_phap;

        public string Cu_phap
        {
            get { return cu_phap; }
            set { cu_phap = value; }
        }
        private string noi_dung_tin_nhan;

        public string Noi_dung_tin_nhan
        {
            get { return noi_dung_tin_nhan; }
            set { noi_dung_tin_nhan = value; }
        }
        private string tinh_trang;

        public string Tinh_trang
        {
            get { return tinh_trang; }
            set { tinh_trang = value; }
        }
        private string ngay_nhan;

        public string Ngay_nhan
        {
            get { return ngay_nhan; }
            set { ngay_nhan = value; }
        }
    }
}
