using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using SMS.util;
using SMS.model;
using System.Configuration;
using System.Collections;

namespace SMS.dao
{
    class ChiTietTinNhanTuDongDAO
    {
        #region took out all the details of your account
        public static ArrayList getAllChiTietTinNhanTuDong()
        {
            ArrayList listChiTietTinNhanTuDong = new ArrayList();
            String sql = ConfigurationManager.AppSettings["sql.getAllChiTietTinNhanTuDong"];
            SqlCommand objCommand = new SqlCommand(sql);

            DataTable result = DataUtil.executeQuery(objCommand);

            foreach (DataRow row in result.Rows)
            {
                ChiTietTinNhanTuDongMODEL chiTietTinNhanTuDongModel = new ChiTietTinNhanTuDongMODEL();

                chiTietTinNhanTuDongModel.Id = row["ID"].ToString();
                chiTietTinNhanTuDongModel.Ma_Tai_Khoan_Sms = row["Ma_tai_khoan_SMS"].ToString();
                chiTietTinNhanTuDongModel.Ma_Lich_Tin_Nhan = row["Ma_lich_tin_nhan"].ToString();
                chiTietTinNhanTuDongModel.Noi_Dung = row["Noi_dung"].ToString();
                chiTietTinNhanTuDongModel.Tinh_Trang = row["Tinh_trang"].ToString();
                chiTietTinNhanTuDongModel.Ngay_Cap_Nhat_Cuoi = row["Ngay_cap_nhat_cuoi"].ToString();
                chiTietTinNhanTuDongModel.User11 = row["User1"].ToString();
                chiTietTinNhanTuDongModel.User21 = row["User2"].ToString();
                chiTietTinNhanTuDongModel.User31 = row["User3"].ToString();
                chiTietTinNhanTuDongModel.User41 = row["User4"].ToString();
                chiTietTinNhanTuDongModel.User51 = row["User5"].ToString();

                listChiTietTinNhanTuDong.Add(chiTietTinNhanTuDongModel);
            }
            return listChiTietTinNhanTuDong;
        }
        #endregion

        #region lay ra chi tiet tin nhan tu dong theo ID
        public static ChiTietTinNhanTuDongMODEL getChiTietTinNhanTuDongByID(int id)
        {
            ChiTietTinNhanTuDongMODEL chiTietTinNhanTuDongModel = new ChiTietTinNhanTuDongMODEL();
            String sql = ConfigurationManager.AppSettings["sql.getChiTietTinNhanTuDongByID"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id", id);

            DataTable result = DataUtil.executeQuery(objCommand);

            foreach (DataRow row in result.Rows)
            {
                 chiTietTinNhanTuDongModel.Id = row["ID"].ToString();
                chiTietTinNhanTuDongModel.Ma_Tai_Khoan_Sms = row["Ma_tai_khoan_SMS"].ToString();
                chiTietTinNhanTuDongModel.Ma_Lich_Tin_Nhan = row["Ma_lich_tin_nhan"].ToString();
                chiTietTinNhanTuDongModel.Noi_Dung = row["Noi_dung"].ToString();
                chiTietTinNhanTuDongModel.Tinh_Trang = row["Tinh_trang"].ToString();
                chiTietTinNhanTuDongModel.Ngay_Cap_Nhat_Cuoi = row["Ngay_cap_nhat_cuoi"].ToString();
                chiTietTinNhanTuDongModel.User11 = row["User1"].ToString();
                chiTietTinNhanTuDongModel.User21 = row["User2"].ToString();
                chiTietTinNhanTuDongModel.User31 = row["User3"].ToString();
                chiTietTinNhanTuDongModel.User41 = row["User4"].ToString();
                chiTietTinNhanTuDongModel.User51 = row["User5"].ToString();
            }
            return chiTietTinNhanTuDongModel;
        }
        #endregion

        #region them 1 Chi tiet tin nhan tu dong vao CSDL
        public static bool insertChiTietTinNhanTuDong(ChiTietTinNhanTuDongMODEL ChiTietTinNhanTuDongModel)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[11];
                int i = 0;

                parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
                parameter[i++].Value = ChiTietTinNhanTuDongModel.Id;

                parameter[i] = new SqlParameter("Ma_tai_khoan_SMS", SqlDbType.NVarChar);
                parameter[i++].Value = ChiTietTinNhanTuDongModel.Ma_Tai_Khoan_Sms;

                parameter[i] = new SqlParameter("Ma_lich_tin_nhan", SqlDbType.NVarChar);
                parameter[i++].Value = ChiTietTinNhanTuDongModel.Ma_Lich_Tin_Nhan;

                parameter[i] = new SqlParameter("Noi_dung", SqlDbType.NVarChar);
                parameter[i++].Value = ChiTietTinNhanTuDongModel.Noi_Dung;

                parameter[i] = new SqlParameter("Tinh_trang", SqlDbType.NVarChar);
                parameter[i++].Value = ChiTietTinNhanTuDongModel.Tinh_Trang;

                parameter[i] = new SqlParameter("Ngay_cap_nhat_cuoi", SqlDbType.NVarChar);
                parameter[i++].Value = ChiTietTinNhanTuDongModel.Ngay_Cap_Nhat_Cuoi;

                parameter[i] = new SqlParameter("User1", SqlDbType.VarChar);
                parameter[i++].Value = ChiTietTinNhanTuDongModel.User11;

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = ChiTietTinNhanTuDongModel.User21;

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value = ChiTietTinNhanTuDongModel.User31;

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = ChiTietTinNhanTuDongModel.User41;

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = ChiTietTinNhanTuDongModel.User51;

                Boolean kq = DataUtil.executeNonStore("sp_SMS_InertChiTietTinNhanTuDong", parameter);
                return kq;
            }
            catch (Exception)
            {
                throw;
            }
        }

        #endregion

        #region update 1 chi tiet tin nhan tu dong trong CSDL
        public static Boolean updateChiTietTinNhanTuDong(ChiTietTinNhanTuDongMODEL chiTietTinNhanTuDongModel)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[11];
                int i = 0;

                parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTinNhanTuDongModel.Id;

                parameter[i] = new SqlParameter("Ma_tai_khoan_sms", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTinNhanTuDongModel.Ma_Tai_Khoan_Sms;

                parameter[i] = new SqlParameter("Ma_lich_tin_nhan", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTinNhanTuDongModel.Ma_Lich_Tin_Nhan;

                parameter[i] = new SqlParameter("Noi_dung", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTinNhanTuDongModel.Noi_Dung;

                parameter[i] = new SqlParameter("Tinh_trang", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTinNhanTuDongModel.Tinh_Trang;

                parameter[i] = new SqlParameter("Ngay_cap_nhat_cuoi", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTinNhanTuDongModel.Ngay_Cap_Nhat_Cuoi;

                parameter[i] = new SqlParameter("User1", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTinNhanTuDongModel.User11;

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTinNhanTuDongModel.User21;

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTinNhanTuDongModel.User31;

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTinNhanTuDongModel.User41;

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTinNhanTuDongModel.User51;

                Boolean kq = DataUtil.executeNonStore("sp_SMS_UpdateChiTietTinNhanTuDongByID", parameter);
                return kq;
            }
            catch (Exception)
            {
                throw;
            }
        }
        #endregion

        #region delete 1 chi tiet tin nhan tu dong trong CSDL
        public static bool deleteChiTietTinNhanTuDong(int id)
        {
            String sql = ConfigurationManager.AppSettings["sql.DeleteChiTietTinNhanTuDongByID"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id", id);

            Boolean kq = DataUtil.executeNonQuery(objCommand);
            return kq;
        }
        #endregion
    }
}
