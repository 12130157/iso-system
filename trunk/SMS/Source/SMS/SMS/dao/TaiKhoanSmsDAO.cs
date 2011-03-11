using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using SMS.util;
using SMS.model;

namespace SMS.dao
{
    class TaiKhoanSmsDAO
    {
        #region thong tin tai khoan SMS
        public static ArrayList getAllTaiKhoanSMS()
        {
            ArrayList listTaiKhoanSMS = new ArrayList();
            String sql = ConfigurationManager.AppSettings["sql.getAllTaiKhoanSMS"];
            SqlCommand objCommand = new SqlCommand(sql);

            DataTable result = DataUtil.executeQuery(objCommand);

            foreach (DataRow row in result.Rows)
            {
                TaiKhoanSmsMODEL taiKhoanSMSModel = new TaiKhoanSmsMODEL();

                taiKhoanSMSModel.Id = row["ID"].ToString();
                taiKhoanSMSModel.So_Dien_Thoai = row["So_dien_thoai"].ToString();
                taiKhoanSMSModel.Ma_Sinh_Vien = row["Ma_sinh_vien"].ToString();
                taiKhoanSMSModel.Loai_Tai_Khoan = row["Loai_tai_khoan"].ToString();
                taiKhoanSMSModel.Ngay_Dang_Ki = row["Ngay_dang_ki"].ToString();
                taiKhoanSMSModel.Ngay_Cap_Nhat_Cuoi = row["Ngay_cap_nhat_cuoi"].ToString();
                taiKhoanSMSModel.User11 = row["User1"].ToString();
                taiKhoanSMSModel.User21 = row["User2"].ToString();
                taiKhoanSMSModel.User31 = row["User3"].ToString();
                taiKhoanSMSModel.User41 = row["User4"].ToString();
                taiKhoanSMSModel.User51 = row["User5"].ToString();

                listTaiKhoanSMS.Add(taiKhoanSMSModel);
            }
            return listTaiKhoanSMS;
        }
        #endregion

        #region lay ra 1 tai khoan SMS theo ID
        public static TaiKhoanSmsMODEL getTaiKhoanSMSByID(int id)
        {
            TaiKhoanSmsMODEL taiKhoanSMSModel = new TaiKhoanSmsMODEL();
            String sql = ConfigurationManager.AppSettings["sql.getHopThuDiByID"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id", id);

            DataTable result = DataUtil.executeQuery(objCommand);

            foreach (DataRow row in result.Rows)
            {
                taiKhoanSMSModel.Id = row["ID"].ToString();
                taiKhoanSMSModel.So_Dien_Thoai = row["So_dien_thoai"].ToString();
                taiKhoanSMSModel.Ma_Sinh_Vien = row["Ma_sinh_vien"].ToString();
                taiKhoanSMSModel.Loai_Tai_Khoan = row["Loai_tai_khoan"].ToString();
                taiKhoanSMSModel.Ngay_Dang_Ki = row["Ngay_dang_ki"].ToString();
                taiKhoanSMSModel.Ngay_Cap_Nhat_Cuoi = row["Ngay_cap_nhat_cuoi"].ToString();
                taiKhoanSMSModel.User11 = row["User1"].ToString();
                taiKhoanSMSModel.User21 = row["User2"].ToString();
                taiKhoanSMSModel.User31 = row["User3"].ToString();
                taiKhoanSMSModel.User41 = row["User4"].ToString();
                taiKhoanSMSModel.User51 = row["User5"].ToString();
            }
            return taiKhoanSMSModel;
        }
        #endregion

        #region them 1 tai khon sms vao CSDL
        public static bool insertTaiKhoanSMS(TaiKhoanSmsMODEL taiKhoanSMSModel)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[11];
                int i = 0;

                parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.Id;

                parameter[i] = new SqlParameter("So_dien_thoai", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.So_Dien_Thoai;

                parameter[i] = new SqlParameter("Ma_sinh_vien", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.Ma_Sinh_Vien;

                parameter[i] = new SqlParameter("Loai_tai_khoan", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.Loai_Tai_Khoan;

                parameter[i] = new SqlParameter("Ngay_dang_ki", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.Ngay_Dang_Ki;

                parameter[i] = new SqlParameter("Ngay_cap_nhat_cuoi", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.Ngay_Cap_Nhat_Cuoi;

                parameter[i] = new SqlParameter("User1", SqlDbType.VarChar);
                parameter[i++].Value = taiKhoanSMSModel.User11;

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.User21;

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.User31;

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.User41;

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.User51;

                Boolean kq = DataUtil.executeNonStore("sp_SMS_InertTaiKhoanSMS", parameter);
                return kq;
            }
            catch (Exception)
            {
                throw;
            }
        }

        #endregion

        #region update 1 tai khoan sms trong CSDL
        public static Boolean updateTaiKhoanSMSById(TaiKhoanSmsMODEL taiKhoanSMSModel)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[11];
                int i = 0;

                parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.Id;

                parameter[i] = new SqlParameter("So_dien_thoai", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.So_Dien_Thoai;

                parameter[i] = new SqlParameter("Ma_sinh_vien", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.Ma_Sinh_Vien;

                parameter[i] = new SqlParameter("Loai_tai_khoan", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.Loai_Tai_Khoan;

                parameter[i] = new SqlParameter("Ngay_dang_ki", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.Ngay_Dang_Ki;

                parameter[i] = new SqlParameter("Ngay_cap_nhat_cuoi", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.Ngay_Cap_Nhat_Cuoi;

                parameter[i] = new SqlParameter("User1", SqlDbType.VarChar);
                parameter[i++].Value = taiKhoanSMSModel.User11;

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.User21;

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.User31;

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.User41;

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.User51;

                Boolean kq = DataUtil.executeNonStore("sp_SMS_UpdateTaiKhoanSMSByID", parameter);
                return kq;
            }
            catch (Exception)
            {
                throw;
            }
        }
        #endregion

        #region delete 1 tai khoan SMS trong CSDL
        public static bool deleteTaiKhoanSMS(int id)
        {
            String sql = ConfigurationManager.AppSettings["sql.sp_SMS_DeleteTaiKhoanSMS"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id", id);

            Boolean kq = DataUtil.executeNonQuery(objCommand);
            return kq;
        }
        #endregion
    }
}
