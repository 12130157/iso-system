using System;
using System.Collections;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace SMS
{
    class SELECT_MESSDAO
    {
        public static ArrayList getAll()
        {
            ArrayList list = new ArrayList();
            String sql = ConfigurationManager.AppSettings["sql.getAllMessTemp"];
            SqlCommand objCommand = new SqlCommand(sql);

            DataTable result = DataUtil.executeQuery(objCommand);

            foreach (DataRow row in result.Rows)
            {
                SELECT_MESSMODEL model = new SELECT_MESSMODEL();

                model.Id = row["ID"].ToString();
                model.So_dien_thoai = row["So_dien_thoai"].ToString();
                model.Cu_phap = row["Ma_cu_phap"].ToString();
                model.Noi_dung_tin_nhan = row["Noi_dung_tin_nhan"].ToString();
                model.Tinh_trang = row["Tinh_trang"].ToString();
                model.Ngay_nhan = row["ngay_nhan"].ToString();

                list.Add(model);
            }
            return list;
        }


        public static DataTable getAllData()
        {
            String sql = ConfigurationManager.AppSettings["sql.getAllMessTemp"];
            SqlCommand objCommand = new SqlCommand(sql);

            DataTable result = DataUtil.executeQuery(objCommand);

            return result;
        }
    }
}
