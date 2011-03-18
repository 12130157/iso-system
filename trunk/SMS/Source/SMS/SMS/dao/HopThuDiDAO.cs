using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using SMS.model;
using System.Configuration;
using System.Collections;

namespace SMS
{
    class HopThuDiDAO
    {
        public static ArrayList getAllHopThuDi()
        {
            ArrayList listHopThuDi = new ArrayList();
            String sql = ConfigurationManager.AppSettings["sql.getAllHopThuDi"];
            SqlCommand objCommand = new SqlCommand(sql);

            DataTable result = DataUtil.executeQuery(objCommand);

            foreach (DataRow row in result.Rows)
            {
                HopThuDiMODEL hopThuDiModel = new HopThuDiMODEL();

                hopThuDiModel.Id = row["ID"].ToString();
                hopThuDiModel.So_Dien_Thoai = row["So_dien_thoai"].ToString();
                hopThuDiModel.Noi_Dung_Tin_Nhan = row["Noi_dung_tin_nhan"].ToString();
                hopThuDiModel.Tinh_Trang = row["Tinh_trang"].ToString();
                hopThuDiModel.Ngay_Cap_Nhat_Cuoi = row["Ngay_cap_nhat_cuoi"].ToString();
                hopThuDiModel.User11 = row["User1"].ToString();
                hopThuDiModel.User21 = row["User2"].ToString();
                hopThuDiModel.User31 = row["User3"].ToString();
                hopThuDiModel.User41 = row["User4"].ToString();
                hopThuDiModel.User51 = row["User5"].ToString();

                listHopThuDi.Add(hopThuDiModel);
            }
            return listHopThuDi;
        }

        public static HopThuDiMODEL getHopThuDiByID(int id)
        {
            HopThuDiMODEL hopThuDiModel = new HopThuDiMODEL();
            String sql = ConfigurationManager.AppSettings["sql.getHopThuDiByID"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id", id);

            DataTable result = DataUtil.executeQuery(objCommand);

            foreach (DataRow row in result.Rows)
            {
                hopThuDiModel.Id = row["ID"].ToString();
                hopThuDiModel.So_Dien_Thoai = row["So_dien_thoai"].ToString();
                hopThuDiModel.Noi_Dung_Tin_Nhan = row["Noi_dung_tin_nhan"].ToString();
                hopThuDiModel.Tinh_Trang = row["Tinh_trang"].ToString();
                hopThuDiModel.Ngay_Cap_Nhat_Cuoi = row["Ngay_cap_nhat_cuoi"].ToString();
                hopThuDiModel.User11 = row["User1"].ToString();
                hopThuDiModel.User21 = row["User2"].ToString();
                hopThuDiModel.User31 = row["User3"].ToString();
                hopThuDiModel.User41 = row["User4"].ToString();
                hopThuDiModel.User51 = row["User5"].ToString();
            }
            return hopThuDiModel;
        }

        public static bool insertHopThuDi(HopThuDiMODEL hopThuDiModel)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[9];
                int i = 0;

                parameter[i] = new SqlParameter("So_dien_thoai", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDiModel.So_Dien_Thoai;

                parameter[i] = new SqlParameter("Noi_dung_tin_nhan", SqlDbType.NVarChar);
                parameter[i++].Value = hopThuDiModel.Noi_Dung_Tin_Nhan;

                parameter[i] = new SqlParameter("Tinh_trang", SqlDbType.Int);
                parameter[i++].Value = hopThuDiModel.Tinh_Trang;

                parameter[i] = new SqlParameter("Loai_hop_thu", SqlDbType.Int);
                parameter[i++].Value = hopThuDiModel.Loai_Hop_Thu;

                parameter[i] = new SqlParameter("User1", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDiModel.User11;

                parameter[i] = new SqlParameter("User2", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDiModel.User21;

                parameter[i] = new SqlParameter("User3", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDiModel.User31;

                parameter[i] = new SqlParameter("User4", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDiModel.User41;

                parameter[i] = new SqlParameter("User5", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDiModel.User51;

                Boolean kq = DataUtil.executeNonStore("sp_SMS_InertHopThuDi", parameter);
                return kq;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static Boolean updateHopTuDiById(HopThuDiMODEL hopThuDiModel)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[10];
                int i = 0;

                parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
                parameter[i++].Value = hopThuDiModel.Id;

                parameter[i] = new SqlParameter("So_dien_thoai", SqlDbType.NVarChar);
                parameter[i++].Value = hopThuDiModel.So_Dien_Thoai;

                parameter[i] = new SqlParameter("Noi_dung_tin_nhan", SqlDbType.NVarChar);
                parameter[i++].Value = hopThuDiModel.Noi_Dung_Tin_Nhan;

                parameter[i] = new SqlParameter("Tinh_trang", SqlDbType.NVarChar);
                parameter[i++].Value = hopThuDiModel.Tinh_Trang;

                parameter[i] = new SqlParameter("Ngay_cap_nhat_cuoi", SqlDbType.NVarChar);
                parameter[i++].Value = hopThuDiModel.Ngay_Cap_Nhat_Cuoi;

                parameter[i] = new SqlParameter("User1", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDiModel.User11;

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = hopThuDiModel.User21;

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value = hopThuDiModel.User31;

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = hopThuDiModel.User41;

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = hopThuDiModel.User51;

                Boolean kq = DataUtil.executeNonStore("sp_SMS_UpdateHopThuDiByID", parameter);
                return kq;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static bool deleteHopThuDi(int id)
        {
            String sql = ConfigurationManager.AppSettings["sql.sp_SMS_DeleteHopThuDi"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id", id);

            Boolean kq = DataUtil.executeNonQuery(objCommand);
            return kq;
        }

        public static DataTable getAllSyntaxMessSent()
        {
            String sql = ConfigurationManager.AppSettings["sql.getAllSyntaxMessSent"];
            SqlCommand objCommand = new SqlCommand(sql);

            DataTable result = DataUtil.executeQuery(objCommand);
            return result;
        }
        public static DataTable getAllNormalMessSent()
        {
            String sql = ConfigurationManager.AppSettings["sql.getAllNormalMessSent"];
            SqlCommand objCommand = new SqlCommand(sql);

            DataTable result = DataUtil.executeQuery(objCommand);
            return result;
        }

    }
}
