using System;
using System.Collections;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data;
using SMS.util;
using SMS.model;

namespace SMS.dao
{
    class CuPhapDAO
    {
        public static ArrayList getAllCuPhap()
        {
            ArrayList listCuPhap = new ArrayList();
            String sql = ConfigurationManager.AppSettings["sql.getAllCuPhap"];
            SqlCommand objCommand = new SqlCommand(sql);

            DataTable kq = DataUtil.executeQuery(objCommand);

            foreach (DataRow row in kq.Rows)
            {
                BaoCaoGSMTModel model = new BaoCaoGSMTModel();

                model.Id = row["ID"].ToString();
                model.KiHieu = row["Ki_hieu"].ToString();
                model.Ten = row["Ten"].ToString();
                model.TinhTrang = row["Tinh_trang_thuc_hien"].ToString();
                model.MaNguoiLap = row["Ma_nguoi_lap"].ToString();
                model.NgayLap = row["Ngay_lap"].ToString();
                model.TenFile = row["Ten_tap_tin"].ToString();
                model.DuongDan = row["Duong_dan"].ToString();
                model.MaChiNhanh = row["Ma_chi_nhanh"].ToString();
                listBaoCaoGSMT.Add(model);
            }
            return listBaoCaoGSMT;
        }
    }
}
