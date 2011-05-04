using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using SMS.model;

namespace SMS.dao
{
    class TaiKhoanSmsDAO
    {
        #region thong tin tai khoan SMS

        public static DataTable getAllDRVTaiKhoanSMS()
        {
            //String sql = ConfigurationManager.AppSettings["sql.getAllDRVTaiKhoanSMS"];
            //SqlCommand objCommand = new SqlCommand(sql);
            //return DataUtil.executeQuery(objCommand);

            return DataUtil.executeStore("sp_getAllDRVTaiKhoanSMS", null);
        }

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
        public TaiKhoanSmsMODEL getTaiKhoanSMSByID(int Ma_tai_khoan_SMS)
        {
            TaiKhoanSmsMODEL taiKhoanSMSModel = new TaiKhoanSmsMODEL();
            //String sql = ConfigurationManager.AppSettings["sql.getTaiKhoanSMSByID"];
            //SqlCommand objCommand = new SqlCommand(sql);
            //objCommand.Parameters.AddWithValue("@Ma_tai_khoan_SMS", Ma_tai_khoan_SMS);

            //DataTable result = DataUtil.executeQuery(objCommand);

            SqlParameter[] parameter = new SqlParameter[1];
            int i = 0;

            parameter[i] = new SqlParameter("Ma_tai_khoan_SMS", SqlDbType.NVarChar);
            parameter[i++].Value = Ma_tai_khoan_SMS;

            DataTable result = DataUtil.executeStore("sp_getTaiKhoanSMSByID", parameter);
            foreach (DataRow row in result.Rows)
            {
                taiKhoanSMSModel.Id = row["ID"].ToString();
                taiKhoanSMSModel.So_Dien_Thoai = row["So_dien_thoai"].ToString();
                taiKhoanSMSModel.Ma_Sinh_Vien = row["Ma_sinh_vien"].ToString();
                taiKhoanSMSModel.Loai_Tai_Khoan = row["Loai_tai_khoan"].ToString();
                taiKhoanSMSModel.Ngay_Dang_Ki = row["Ngay_dang_kY"].ToString();
                taiKhoanSMSModel.Ngay_Cap_Nhat_Cuoi = row["Ngay_cap_nhat_cuoi"].ToString();
                taiKhoanSMSModel.User11 = row["User1"].ToString();
                taiKhoanSMSModel.User21 = row["User2"].ToString();
                taiKhoanSMSModel.User31 = row["User3"].ToString();
                taiKhoanSMSModel.User41 = row["User4"].ToString();
                taiKhoanSMSModel.User51 = row["User5"].ToString();
            }
            return taiKhoanSMSModel;
        }

        public TaiKhoanSmsMODEL getTaiKhoanSMSBySDT_MSV(string so_Dien_Thoai, string ma_SV)
        {
            TaiKhoanSmsMODEL taiKhoanSMSModel = new TaiKhoanSmsMODEL();
            //String sql = ConfigurationManager.AppSettings["sql.getTaiKhoanSMSBySDT_MSV"];
            //SqlCommand objCommand = new SqlCommand(sql);
            //objCommand.Parameters.AddWithValue("@so_Dien_Thoai", so_Dien_Thoai);
            //objCommand.Parameters.AddWithValue("@ma_SV", ma_SV);

            //DataTable result = DataUtil.executeQuery(objCommand);
            SqlParameter[] parameter = new SqlParameter[2];
            int i = 0;

            parameter[i] = new SqlParameter("So_dien_thoai", SqlDbType.NVarChar);
            parameter[i++].Value = so_Dien_Thoai;
            parameter[i] = new SqlParameter("Ma_sinh_vien", SqlDbType.NVarChar);
            parameter[i++].Value = ma_SV;

            DataTable result = DataUtil.executeStore("sp_getTaiKhoanSMSBySDT_MSV", parameter);

            foreach (DataRow row in result.Rows)
            {
                taiKhoanSMSModel.Id = row["ID"].ToString();
                taiKhoanSMSModel.So_Dien_Thoai = row["So_dien_thoai"].ToString();
                taiKhoanSMSModel.Ma_Sinh_Vien = row["Ma_sinh_vien"].ToString();
                taiKhoanSMSModel.Loai_Tai_Khoan = row["Loai_tai_khoan"].ToString();
                taiKhoanSMSModel.Ngay_Dang_Ki = row["Ngay_dang_ky"].ToString();
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
        public bool insertTaiKhoanSMS(TaiKhoanSmsMODEL taiKhoanSMSModel)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[10];
                int i = 0;

                //parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
                //parameter[i++].Value = taiKhoanSMSModel.Id;

                parameter[i] = new SqlParameter("So_dien_thoai", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.So_Dien_Thoai;

                parameter[i] = new SqlParameter("Ma_sinh_vien", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.Ma_Sinh_Vien;

                parameter[i] = new SqlParameter("Loai_tai_khoan", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.Loai_Tai_Khoan;

                parameter[i] = new SqlParameter("Ngay_dang_ky", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.Ngay_Dang_Ki;

                parameter[i] = new SqlParameter("Ngay_cap_nhat_cuoi", SqlDbType.NVarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User1", SqlDbType.VarChar);
                parameter[i++].Value = taiKhoanSMSModel.User11;

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.User21;

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = "";

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
        public Boolean updateTaiKhoanSMSById(TaiKhoanSmsMODEL taiKhoanSMSModel)
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

                parameter[i] = new SqlParameter("Ngay_dang_ky", SqlDbType.NVarChar);
                parameter[i++].Value = taiKhoanSMSModel.Ngay_Dang_Ki;

                parameter[i] = new SqlParameter("Ngay_cap_nhat_cuoi", SqlDbType.NVarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User1", SqlDbType.VarChar);
                parameter[i++].Value ="";

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value ="";

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = "";

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
        public  bool deleteTaiKhoanSMS(int id)
        {
        //    String sql = ConfigurationManager.AppSettings["sql.sp_SMS_DeleteTaiKhoanSMS"];
        //    SqlCommand objCommand = new SqlCommand(sql);
        //    objCommand.Parameters.AddWithValue("@id", id);

        //    Boolean kq = DataUtil.executeNonQuery(objCommand);
        //    return kq;

            SqlParameter[] parameter = new SqlParameter[1];
            int i = 0;

            parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
            parameter[i++].Value = id;

            Boolean kq = DataUtil.executeNonStore("sp_SMS_DeleteTaiKhoanSMS", parameter);
            return kq;
        }
        #endregion

        public DataTable getPhoneIDAllDRVTaiKhoanSMS(String phone, String id)
        {
            SqlParameter[] parameter = new SqlParameter[2];
            int i = 0;

            parameter[i] = new SqlParameter("So_dien_thoai", SqlDbType.NVarChar);
            parameter[i++].Value = phone;

            parameter[i] = new SqlParameter("Ma_sinh_vien", SqlDbType.NVarChar);
            parameter[i++].Value = id;
            return DataUtil.executeStore("sp_Search_Account", parameter);
        }
    }
}
