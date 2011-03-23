using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
//using SMS.util;
using SMS.model;

namespace SMS.dao
{
    class LoaiTinNhanDAO
    {
        #region thong tin Loai tin nhan
        public static ArrayList getAllLoaiTinNhan()
        {
            ArrayList listLoaiTinNhan = new ArrayList();
            String sql = ConfigurationManager.AppSettings["sql.getAllLoaiTinNhan"];
            SqlCommand objCommand = new SqlCommand(sql);

            DataTable result = DataUtil.executeQuery(objCommand);

            foreach (DataRow row in result.Rows)
            {
                LoaiTinNhanMODEL loaiTinNhanModel = new LoaiTinNhanMODEL();

                loaiTinNhanModel.Id = row["ID"].ToString();
                loaiTinNhanModel.Ten = row["Ten"].ToString();
                loaiTinNhanModel.Ngay_cap_nhat_cuoi = row["Ngay_cap_nhat_cuoi"].ToString();
                loaiTinNhanModel.User11 = row["User1"].ToString();
                loaiTinNhanModel.User21 = row["User2"].ToString();
                loaiTinNhanModel.User31 = row["User3"].ToString();
                loaiTinNhanModel.User41 = row["User4"].ToString();
                loaiTinNhanModel.User51 = row["User5"].ToString();

                listLoaiTinNhan.Add(loaiTinNhanModel);
            }
            return listLoaiTinNhan;
        }
        #endregion

        #region lay ra 1 loai tin nhan
        public static LoaiTinNhanMODEL getLoaiTinNhanByID(int id)
        {
            LoaiTinNhanMODEL loaiTinNhanModel = new LoaiTinNhanMODEL();
            String sql = ConfigurationManager.AppSettings["sql.getLoaiTinNhanByID"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id", id);

            DataTable result = DataUtil.executeQuery(objCommand);

            foreach (DataRow row in result.Rows)
            {
                loaiTinNhanModel.Id = row["ID"].ToString();
                loaiTinNhanModel.Ten = row["Ten"].ToString();
                loaiTinNhanModel.Ngay_cap_nhat_cuoi = row["Ngay_cap_nhat_cuoi"].ToString();
                loaiTinNhanModel.User11 = row["User1"].ToString();
                loaiTinNhanModel.User21 = row["User2"].ToString();
                loaiTinNhanModel.User31 = row["User3"].ToString();
                loaiTinNhanModel.User41 = row["User4"].ToString();
                loaiTinNhanModel.User51 = row["User5"].ToString();
            }
            return loaiTinNhanModel;
        }
        #endregion

        #region them 1 loai tin nhan vao CSDL
        public static bool insertLoaiTinNhan(LoaiTinNhanMODEL loaiTinNhanModel)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[8];
                int i = 0;

                parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTinNhanModel.Id;

                parameter[i] = new SqlParameter("Ten", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTinNhanModel.Ten;

                parameter[i] = new SqlParameter("Ngay_cap_nhat_cuoi", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTinNhanModel.Ngay_cap_nhat_cuoi;

                parameter[i] = new SqlParameter("User1", SqlDbType.VarChar);
                parameter[i++].Value = loaiTinNhanModel.User11;

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTinNhanModel.User21;

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTinNhanModel.User31;

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTinNhanModel.User41;

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTinNhanModel.User51;

                Boolean kq = DataUtil.executeNonStore("sp_SMS_InertLoaiTinNhan", parameter);
                return kq;
            }
            catch (Exception)
            {
                throw;
            }
        }

        #endregion

        #region update 1 loai tin nhan trong CSDL
        public static Boolean updateLoaiTinNhanById(LoaiTinNhanMODEL loaiTinNhanModel)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[8];
                int i = 0;

                parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTinNhanModel.Id;

                parameter[i] = new SqlParameter("Ten", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTinNhanModel.Ten;

                parameter[i] = new SqlParameter("Ngay_cap_nhat_cuoi", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTinNhanModel.Ngay_cap_nhat_cuoi;

                parameter[i] = new SqlParameter("User1", SqlDbType.VarChar);
                parameter[i++].Value = loaiTinNhanModel.User11;

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTinNhanModel.User21;

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTinNhanModel.User31;

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTinNhanModel.User41;

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = loaiTinNhanModel.User51;

                Boolean kq = DataUtil.executeNonStore("sp_SMS_UpdateLoaiTinNhanByID", parameter);
                return kq;
            }
            catch (Exception)
            {
                throw;
            }
        }
        #endregion

        #region delete 1 loai tin nhan trong CSDL
        public static bool deleteLoaiTinNhan(int id)
        {
            String sql = ConfigurationManager.AppSettings["sql.sp_SMS_DeleteLoaiTinNhan"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id", id);

            Boolean kq = DataUtil.executeNonQuery(objCommand);
            return kq;
        }
        #endregion
    }
}
