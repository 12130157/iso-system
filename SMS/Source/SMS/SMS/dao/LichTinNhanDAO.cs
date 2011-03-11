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
    class LichTinNhanDAO
    {
        #region thong tin Lich Tin Nhan 
        public static ArrayList getAllLichTinNhan()
        {
            ArrayList listLichTinNhan = new ArrayList();
            String sql = ConfigurationManager.AppSettings["sql.getAllLichTinNhan"];
            SqlCommand objCommand = new SqlCommand(sql);

            DataTable result = DataUtil.executeQuery(objCommand);

            foreach (DataRow row in result.Rows)
            {
               LichTinNhanMODEL lichTinNhanModel = new LichTinNhanMODEL();

               lichTinNhanModel.Id = row["ID"].ToString();
               lichTinNhanModel.Loai_Tai_Khoan_Sms = row["Loai_tai_khoan_SMS"].ToString();
               lichTinNhanModel.Lich_Bieu = row["Lich_bieu"].ToString();
               lichTinNhanModel.Ma_Cu_Phap = row["Ma_cu_phap"].ToString();
               lichTinNhanModel.Thoi_Gian = row["Thoi_gian"].ToString();
               lichTinNhanModel.Ngay_Cap_Nhat_Cuoi = row["Ngay_cap_nhat_cuoi"].ToString();
               lichTinNhanModel.User11 = row["User1"].ToString();
               lichTinNhanModel.User21 = row["User2"].ToString();
               lichTinNhanModel.User31 = row["User3"].ToString();
               lichTinNhanModel.User41 = row["User4"].ToString();
               lichTinNhanModel.User51 = row["User5"].ToString();

               listLichTinNhan.Add(lichTinNhanModel);
            }
            return listLichTinNhan;
        }
        #endregion

        #region lay ra lich tin nhan theo ID
        public static LichTinNhanMODEL getLichTinNhanByID(int id)
        {
            LichTinNhanMODEL lichTinNhanModel = new LichTinNhanMODEL();
            String sql = ConfigurationManager.AppSettings["sql.getLichTinNhanByID"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id", id);

            DataTable result = DataUtil.executeQuery(objCommand);

            foreach (DataRow row in result.Rows)
            {
                lichTinNhanModel.Id = row["ID"].ToString();
                lichTinNhanModel.Loai_Tai_Khoan_Sms = row["Loai_tai_khoan_SMS"].ToString();
                lichTinNhanModel.Lich_Bieu = row["Lich_bieu"].ToString();
                lichTinNhanModel.Ma_Cu_Phap = row["Ma_cu_phap"].ToString();
                lichTinNhanModel.Thoi_Gian = row["Thoi_gian"].ToString();
                lichTinNhanModel.Ngay_Cap_Nhat_Cuoi = row["Ngay_cap_nhat_cuoi"].ToString();
                lichTinNhanModel.User11 = row["User1"].ToString();
                lichTinNhanModel.User21 = row["User2"].ToString();
                lichTinNhanModel.User31 = row["User3"].ToString();
                lichTinNhanModel.User41 = row["User4"].ToString();
                lichTinNhanModel.User51 = row["User5"].ToString();
            }
            return lichTinNhanModel;
        }
        #endregion

        #region them 1 lich tin nhan vao CSDL
        public static bool insertLichTinNhan(LichTinNhanMODEL lichTinNhanModel)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[11];
                int i = 0;

                parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
                parameter[i++].Value = lichTinNhanModel.Id;

                parameter[i] = new SqlParameter("Loai_tai_khoan_SMS", SqlDbType.NVarChar);
                parameter[i++].Value = lichTinNhanModel.Loai_Tai_Khoan_Sms;

                parameter[i] = new SqlParameter("Lich_bieu", SqlDbType.NVarChar);
                parameter[i++].Value = lichTinNhanModel.Lich_Bieu;

                parameter[i] = new SqlParameter("Ma_cu_phap", SqlDbType.NVarChar);
                parameter[i++].Value = lichTinNhanModel.Ma_Cu_Phap;

                parameter[i] = new SqlParameter("Thoi_gian", SqlDbType.NVarChar);
                parameter[i++].Value = lichTinNhanModel.Thoi_Gian;

                parameter[i] = new SqlParameter("Ngay_cap_nhat_cuoi", SqlDbType.NVarChar);
                parameter[i++].Value = lichTinNhanModel.Ngay_Cap_Nhat_Cuoi;

                parameter[i] = new SqlParameter("User1", SqlDbType.VarChar);
                parameter[i++].Value = lichTinNhanModel.User11;

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = lichTinNhanModel.User21;

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value = lichTinNhanModel.User31;

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = lichTinNhanModel.User41;

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = lichTinNhanModel.User51;

                Boolean kq = DataUtil.executeNonStore("sp_SMS_InertLichTinNhan", parameter);
                return kq;
            }
            catch (Exception)
            {
                throw;
            }
        }

        #endregion

        #region update 1 lich tin nhan trong CSDL
        public static Boolean updateLichTinNhan(LichTinNhanMODEL lichTinNhanModel)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[11];
                int i = 0;

                parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
                parameter[i++].Value = lichTinNhanModel.Id;

                parameter[i] = new SqlParameter("Loai_tai_khoan_SMS", SqlDbType.NVarChar);
                parameter[i++].Value = lichTinNhanModel.Loai_Tai_Khoan_Sms;

                parameter[i] = new SqlParameter("Lich_bieu", SqlDbType.NVarChar);
                parameter[i++].Value = lichTinNhanModel.Lich_Bieu;

                parameter[i] = new SqlParameter("Ma_cu_phap", SqlDbType.NVarChar);
                parameter[i++].Value = lichTinNhanModel.Ma_Cu_Phap;

                parameter[i] = new SqlParameter("Thoi_gian", SqlDbType.NVarChar);
                parameter[i++].Value = lichTinNhanModel.Thoi_Gian;

                parameter[i] = new SqlParameter("Ngay_cap_nhat_cuoi", SqlDbType.NVarChar);
                parameter[i++].Value = lichTinNhanModel.Ngay_Cap_Nhat_Cuoi;

                parameter[i] = new SqlParameter("User1", SqlDbType.VarChar);
                parameter[i++].Value = lichTinNhanModel.User11;

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = lichTinNhanModel.User21;

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value = lichTinNhanModel.User31;

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = lichTinNhanModel.User41;

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = lichTinNhanModel.User51;

                Boolean kq = DataUtil.executeNonStore("sp_SMS_UpdateLichTinNhanByID", parameter);
                return kq;
            }
            catch (Exception)
            {
                throw;
            }
        }
        #endregion

        #region delete 1 lich tin nhan trong CSDL
        public static bool deleteLichTinNhan(int id)
        {
            String sql = ConfigurationManager.AppSettings["sql.sp_SMS_DeleteLichTinNhan"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id", id);

            Boolean kq = DataUtil.executeNonQuery(objCommand);
            return kq;
        }
        #endregion
    }
}
