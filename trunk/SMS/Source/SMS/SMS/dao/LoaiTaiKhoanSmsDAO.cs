using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;
using SMS.model;

namespace SMS.dao
{
    class LoaiTaiKhoanSmsDAO
    {
        #region thong tin loai tai khoan sms
        public  ArrayList getAllLoaiTaiKhoanSMS()
        {
            ArrayList listLoaiTaiKhoanSMS = new ArrayList();
            String sql = ConfigurationManager.AppSettings["sql.getAllLoaiTaiKhoanSMS"];
            SqlCommand objCommand = new SqlCommand(sql);

            DataTable result = DataUtil.executeQuery(objCommand);

            foreach (DataRow row in result.Rows)
            {
                LoaiTaiKhoanSmsMODEL loaiTaiKhoanSMSModel = new LoaiTaiKhoanSmsMODEL();

                //loaiTaiKhoanSMSModel.Id = row["ID"].ToString();
                loaiTaiKhoanSMSModel.Ten = row["Ten"].ToString();
                //loaiTaiKhoanSMSModel.Phi_Dich_Vu = row["Phi_dich_vu"].ToString();
                //loaiTaiKhoanSMSModel.Ghi_Chu = row["Ghi_chu"].ToString();
                //loaiTaiKhoanSMSModel.Ngay_Cap_Nhat_Cuoi = row["Ngay_cap_nhat_cuoi"].ToString();
                //loaiTaiKhoanSMSModel.User11 = row["User1"].ToString();
                //loaiTaiKhoanSMSModel.User21 = row["User2"].ToString();
                //loaiTaiKhoanSMSModel.User31 = row["User3"].ToString();
                //loaiTaiKhoanSMSModel.User41 = row["User4"].ToString();
                //loaiTaiKhoanSMSModel.User51 = row["User5"].ToString();

                listLoaiTaiKhoanSMS.Add(loaiTaiKhoanSMSModel);
            }
            return listLoaiTaiKhoanSMS;
        }
        #endregion

        #region lay ra 1 Loai tai khoan SMS 
        public  LoaiTaiKhoanSmsMODEL getLoaiTaiKhoanSMSByID(int id)
        {
            LoaiTaiKhoanSmsMODEL loaiTaiKhoanSMSModel = new LoaiTaiKhoanSmsMODEL();
            String sql = ConfigurationManager.AppSettings["sql.getLoaiTaiKhoanSMSByID"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id", id);

            DataTable result = DataUtil.executeQuery(objCommand);

            foreach (DataRow row in result.Rows)
            {
                loaiTaiKhoanSMSModel.Id = row["ID"].ToString();
                loaiTaiKhoanSMSModel.Ten = row["Ten"].ToString();
                loaiTaiKhoanSMSModel.Phi_Dich_Vu = row["Phi_dich_vu"].ToString();
                loaiTaiKhoanSMSModel.Ghi_Chu = row["Ghi_chu"].ToString();
                //loaiTaiKhoanSMSModel.Ngay_Cap_Nhat_Cuoi = row["Ngay_cap_nhat_cuoi"].ToString();
                //loaiTaiKhoanSMSModel.User11 = row["User1"].ToString();
                //loaiTaiKhoanSMSModel.User21 = row["User2"].ToString();
                //loaiTaiKhoanSMSModel.User31 = row["User3"].ToString();
                //loaiTaiKhoanSMSModel.User41 = row["User4"].ToString();
                //loaiTaiKhoanSMSModel.User51 = row["User5"].ToString();
            }
            return loaiTaiKhoanSMSModel;
        }
        #endregion

        #region them 1 Loai tai khoan sms vao CSDL
        public static bool insertLoaiTaiKhoanSMS(LoaiTaiKhoanSmsMODEL loaiTaiKhoanSMSModel)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[10];
                int i = 0;

                parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTaiKhoanSMSModel.Id;

                parameter[i] = new SqlParameter("Ten", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTaiKhoanSMSModel.Ten;

                parameter[i] = new SqlParameter("Phi_dich_vu", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTaiKhoanSMSModel.Phi_Dich_Vu;

                parameter[i] = new SqlParameter("Ghi_chu", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTaiKhoanSMSModel.Ghi_Chu;

                parameter[i] = new SqlParameter("Ngay_cap_nhat_cuoi", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTaiKhoanSMSModel.Ngay_Cap_Nhat_Cuoi;

                parameter[i] = new SqlParameter("User1", SqlDbType.VarChar);
                parameter[i++].Value = loaiTaiKhoanSMSModel.User11;

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTaiKhoanSMSModel.User21;

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTaiKhoanSMSModel.User31;

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTaiKhoanSMSModel.User41;

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTaiKhoanSMSModel.User51;

                Boolean kq = DataUtil.executeNonStore("sp_SMS_InertLoaiTaiKhoanSMS", parameter);
                return kq;
            }
            catch (Exception)
            {
                throw;
            }
        }

        #endregion

        #region update 1 Loai tai khoan SMS trong CSDL
        public static Boolean updateLoaiTaiKhoanSMSById(LoaiTaiKhoanSmsMODEL loaiTaiKhoanSMSModel)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[10];
                int i = 0;

                parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTaiKhoanSMSModel.Id;

                parameter[i] = new SqlParameter("Ten", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTaiKhoanSMSModel.Ten;

                parameter[i] = new SqlParameter("Phi_dich_vu", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTaiKhoanSMSModel.Phi_Dich_Vu;

                parameter[i] = new SqlParameter("Ghi_chu", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTaiKhoanSMSModel.Ghi_Chu;

                parameter[i] = new SqlParameter("Ngay_cap_nhat_cuoi", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTaiKhoanSMSModel.Ngay_Cap_Nhat_Cuoi;

                parameter[i] = new SqlParameter("User1", SqlDbType.VarChar);
                parameter[i++].Value = loaiTaiKhoanSMSModel.User11;

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTaiKhoanSMSModel.User21;

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTaiKhoanSMSModel.User31;

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTaiKhoanSMSModel.User41;

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTaiKhoanSMSModel.User51;

                Boolean kq = DataUtil.executeNonStore("sp_SMS_UpdateLoaiTaiKhoanSMSByID", parameter);
                return kq;
            }
            catch (Exception)
            {
                throw;
            }
        }
        #endregion

        #region delete 1 loai tai khoan SMS trong CSDL
        public static bool deleteLoaiTaiKhoanSMS(int id)
        {
            String sql = ConfigurationManager.AppSettings["sql.sp_SMS_DeleteLoaiTaiKhoanSMS"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id", id);

            Boolean kq = DataUtil.executeNonQuery(objCommand);
            return kq;
        }
        #endregion
    }
}
