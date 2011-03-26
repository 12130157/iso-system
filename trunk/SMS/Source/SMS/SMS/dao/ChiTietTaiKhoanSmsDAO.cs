using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using SMS.model;


namespace SMS.dao
{
    class ChiTietTaiKhoanSmsDAO
    {
        #region lay tat ca thong tin chi tiet tai khoan SMS
        //public static ArrayList getAllChiTietTaiKhoanSms()
        //{
        //    ArrayList listChiTietTaiKhoan = new ArrayList();
        //    String sql = ConfigurationManager.AppSettings["sql.getAllChiTietTaiKhoanSMS"];
        //    SqlCommand objCommand = new SqlCommand(sql);

        //    DataTable result = DataUtil.executeQuery(objCommand);

        //    foreach (DataRow row in result.Rows)
        //    {
        //        ChiTietTaiKhoanSmsMODEL chiTietTaiKhoanModel = new ChiTietTaiKhoanSmsMODEL();

        //        chiTietTaiKhoanModel.Id = row["ID"].ToString();
        //        chiTietTaiKhoanModel.Ma_Tai_Khoan_Sms = row["Ma_tai_khoan_SMS"].ToString();
        //        chiTietTaiKhoanModel.Dang_Ki_Thang = row["Dang_ki_thang"].ToString();
        //        chiTietTaiKhoanModel.Dang_Ki_Nam = row["Dang_ki_nam"].ToString();
        //        chiTietTaiKhoanModel.Ngay_Cap_Nhat_Cuoi = row["Ngay_cap_nhat_cuoi"].ToString();
        //        chiTietTaiKhoanModel.User11 = row["User1"].ToString();
        //        chiTietTaiKhoanModel.User21 = row["User2"].ToString();
        //        chiTietTaiKhoanModel.User31 = row["User3"].ToString();
        //        chiTietTaiKhoanModel.User41 = row["User4"].ToString();
        //        chiTietTaiKhoanModel.User51 = row["User5"].ToString();

        //        listChiTietTaiKhoan.Add(chiTietTaiKhoanModel);
        //    }
        //    return listChiTietTaiKhoan;
        //}

        public DataTable getAllChiTietTaiKhoanSms(int Ma_tai_khoan_SMS)
        {
            String sql = ConfigurationManager.AppSettings["sql.getAllChiTietTaiKhoanSms"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id", Ma_tai_khoan_SMS);
            return DataUtil.executeQuery(objCommand);
        }
        #endregion

        #region lay ra chi tiet tai khoan SMS theo ID
        public ChiTietTaiKhoanSmsMODEL getChiTietTaiKhoanSMSByID(int id)
        {
            ChiTietTaiKhoanSmsMODEL chiTietTaiKhoanModel = new ChiTietTaiKhoanSmsMODEL();
            String sql = ConfigurationManager.AppSettings["sql.getChiTietTaiKhoanSMSByID"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id", id);

            DataTable result = DataUtil.executeQuery(objCommand);

            foreach (DataRow row in result.Rows)
            {
                chiTietTaiKhoanModel.Id = row["ID"].ToString();
                chiTietTaiKhoanModel.Ma_Tai_Khoan_Sms = row["Ma_tai_khoan_SMS"].ToString();
                chiTietTaiKhoanModel.Dang_Ki_Thang = row["Dang_ky_thang"].ToString();
                chiTietTaiKhoanModel.Dang_Ki_Nam = row["Dang_ky_nam"].ToString();
                chiTietTaiKhoanModel.Ngay_Cap_Nhat_Cuoi = row["Ngay_cap_nhat_cuoi"].ToString();
                chiTietTaiKhoanModel.User11 = row["User1"].ToString();
                chiTietTaiKhoanModel.User21 = row["User2"].ToString();
                chiTietTaiKhoanModel.User31 = row["User3"].ToString();
                chiTietTaiKhoanModel.User41 = row["User4"].ToString();
                chiTietTaiKhoanModel.User51 = row["User5"].ToString();
            }
            return chiTietTaiKhoanModel;
        }
        #endregion

        #region them 1 chi tiet tai khoan SMS vao CSDL
        public static bool insertChiTietTaiKhoan(ChiTietTaiKhoanSmsMODEL chiTietTaiKhoanModel)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[10];
                int i = 0;

                parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTaiKhoanModel.Id;

                parameter[i] = new SqlParameter("Ma_tai_khoan_SMS", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTaiKhoanModel.Ma_Tai_Khoan_Sms;

                parameter[i] = new SqlParameter("Dang_ky_thang", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTaiKhoanModel.Dang_Ki_Thang;

                parameter[i] = new SqlParameter("Dang_ky_nam", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTaiKhoanModel.Dang_Ki_Nam;

                parameter[i] = new SqlParameter("Ngay_cap_nhat_cuoi", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTaiKhoanModel.Ngay_Cap_Nhat_Cuoi;

                parameter[i] = new SqlParameter("User1", SqlDbType.VarChar);
                parameter[i++].Value = chiTietTaiKhoanModel.User11;

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTaiKhoanModel.User21;

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTaiKhoanModel.User31;

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTaiKhoanModel.User41;

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTaiKhoanModel.User51;

                Boolean kq = DataUtil.executeNonStore("sp_SMS_InertChiTietTaiKhoan", parameter);
                return kq;
            }
            catch (Exception)
            {
                throw;
            }
        }

        #endregion

        #region update 1 chi tiet ti khoan SMS trong CSDL
        public static Boolean updateChiTietTaiKhoanSMS(ChiTietTaiKhoanSmsMODEL chiTietTaiKhoanSMSModel)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[10];
                int i = 0;

                parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTaiKhoanSMSModel.Id;

                parameter[i] = new SqlParameter("Ma_tai_khoan_sms", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTaiKhoanSMSModel.Ma_Tai_Khoan_Sms;

                parameter[i] = new SqlParameter("Cum_tu_1", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTaiKhoanSMSModel.Dang_Ki_Thang;

                parameter[i] = new SqlParameter("Cum_tu_2", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTaiKhoanSMSModel.Dang_Ki_Nam;

                parameter[i] = new SqlParameter("Ngay_cap_nhat_cuoi", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTaiKhoanSMSModel.Ngay_Cap_Nhat_Cuoi;

                parameter[i] = new SqlParameter("User1", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTaiKhoanSMSModel.User11;

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTaiKhoanSMSModel.User21;

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTaiKhoanSMSModel.User31;

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTaiKhoanSMSModel.User41;

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = chiTietTaiKhoanSMSModel.User51;

                Boolean kq = DataUtil.executeNonStore("sp_SMS_UpdateChiTietTaiKhoanByID", parameter);
                return kq;
            }
            catch (Exception)
            {
                throw;
            }
        }
        #endregion

        #region delete 1 chi tiet tai khoan SMS trong CSDL
        public bool deletechiTietTaiKhoanSMS(int id)
        {
            String sql = ConfigurationManager.AppSettings["sql.sp_SMS_DeleteChiTietTaiKhoanSMS"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id", id);

            Boolean kq = DataUtil.executeNonQuery(objCommand);
            return kq;
        }
        #endregion
    }
}
