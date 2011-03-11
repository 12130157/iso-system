using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using SMS.model;

namespace SMS.dao
{
    class LoaiHopThuDAO
    {

        #region thong tin Loai hop thu
        public static ArrayList getAllLoaiHopThu()
        {
            ArrayList listLoaiHopThu = new ArrayList();
            String sql = ConfigurationManager.AppSettings["sql.getAllLoaiHopThu"];
            SqlCommand objCommand = new SqlCommand(sql);

            DataTable result = DataUtil.executeQuery(objCommand);

            foreach (DataRow row in result.Rows)
            {
                LoaiHopThuMODEL loaiHopThuModel = new LoaiHopThuMODEL();

                loaiHopThuModel.Id = row["ID"].ToString();
                loaiHopThuModel.Ten = row["Ten"].ToString();
                loaiHopThuModel.Ghi_Chu = row["Ghi_chu"].ToString();
                loaiHopThuModel.Ngay_Cap_Nhat_Cuoi = row["Ngay_cap_nhat_cuoi"].ToString();
                loaiHopThuModel.User11 = row["User1"].ToString();
                loaiHopThuModel.User21 = row["User2"].ToString();
                loaiHopThuModel.User31 = row["User3"].ToString();
                loaiHopThuModel.User41 = row["User4"].ToString();
                loaiHopThuModel.User51 = row["User5"].ToString();

                listLoaiHopThu.Add(loaiHopThuModel);
            }
            return listLoaiHopThu;
        }
        #endregion

        #region lay ra Loai hop thu theo ID
        public static LoaiHopThuMODEL getLoaiHopThuByID(int id)
        {
            LoaiHopThuMODEL loaiHopThuModel = new LoaiHopThuMODEL();
            String sql = ConfigurationManager.AppSettings["sql.getLoaiHopThuByID"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id", id);

            DataTable result = DataUtil.executeQuery(objCommand);

            foreach (DataRow row in result.Rows)
            {
                loaiHopThuModel.Id = row["ID"].ToString();
                loaiHopThuModel.Ten = row["Ten"].ToString();
                loaiHopThuModel.Ghi_Chu = row["Ghi_chu"].ToString();
                loaiHopThuModel.Ngay_Cap_Nhat_Cuoi = row["Ngay_cap_nhat_cuoi"].ToString();
                loaiHopThuModel.User11 = row["User1"].ToString();
                loaiHopThuModel.User21 = row["User2"].ToString();
                loaiHopThuModel.User31 = row["User3"].ToString();
                loaiHopThuModel.User41 = row["User4"].ToString();
                loaiHopThuModel.User51 = row["User5"].ToString();
            }
            return loaiHopThuModel;
        }
        #endregion

        #region them 1 loai hop thu vao CSDL
        public static bool insertLoaiHopThu(LoaiHopThuMODEL loaiHopThuModel)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[9];
                int i = 0;

                parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
                parameter[i++].Value = loaiHopThuModel.Id;

                parameter[i] = new SqlParameter("Ten", SqlDbType.NVarChar);
                parameter[i++].Value = loaiHopThuModel.Ten;

                parameter[i] = new SqlParameter("Ghi_chu", SqlDbType.NVarChar);
                parameter[i++].Value = loaiHopThuModel.Ghi_Chu;

                parameter[i] = new SqlParameter("Ngay_cap_nhat_cuoi", SqlDbType.NVarChar);
                parameter[i++].Value = loaiHopThuModel.Ngay_Cap_Nhat_Cuoi;

                parameter[i] = new SqlParameter("User1", SqlDbType.VarChar);
                parameter[i++].Value = loaiHopThuModel.User11;

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = loaiHopThuModel.User21;

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value = loaiHopThuModel.User31;

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = loaiHopThuModel.User41;

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = loaiHopThuModel.User51;

                Boolean kq = DataUtil.executeNonStore("sp_SMS_InertLoaiHopThu", parameter);
                return kq;
            }
            catch (Exception)
            {
                throw;
            }
        }

        #endregion

        #region update 1 loai hop thu trong CSDL
        public static Boolean updateLoaiHopThuById(LoaiHopThuMODEL loaiHopThuModel)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[10];
                int i = 0;

                parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
                parameter[i++].Value = loaiHopThuModel.Id;

                parameter[i] = new SqlParameter("Ten", SqlDbType.NVarChar);
                parameter[i++].Value = loaiHopThuModel.Ten;

                parameter[i] = new SqlParameter("Ghi_chu", SqlDbType.NVarChar);
                parameter[i++].Value = loaiHopThuModel.Ghi_Chu;

                parameter[i] = new SqlParameter("Ngay_cap_nhat_cuoi", SqlDbType.NVarChar);
                parameter[i++].Value = loaiHopThuModel.Ngay_Cap_Nhat_Cuoi;

                parameter[i] = new SqlParameter("User1", SqlDbType.VarChar);
                parameter[i++].Value = loaiHopThuModel.User11;

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = loaiHopThuModel.User21;

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value = loaiHopThuModel.User31;

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = loaiHopThuModel.User41;

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = loaiHopThuModel.User51;

                Boolean kq = DataUtil.executeNonStore("sp_SMS_UpdateLoaiHopThuByID", parameter);
                return kq;
            }
            catch (Exception)
            {
                throw;
            }
        }
        #endregion

        #region delete 1 loai hop thu trong CSDL
        public static bool deleteLoaiHopThu(int id)
        {
            String sql = ConfigurationManager.AppSettings["sql.sp_SMS_DeleteLoaiHopThu"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id", id);

            Boolean kq = DataUtil.executeNonQuery(objCommand);
            return kq;
        }
        #endregion


    }
}
