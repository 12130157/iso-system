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
        public DataTable getAllLoaiHopThu()
        {
        //    String sql = ConfigurationManager.AppSettings["sql.getAllLoaiHopThu"];
        //    SqlCommand objCommand = new SqlCommand(sql);

        //    return DataUtil.executeQuery(objCommand);
            return DataUtil.executeStore("sp_getAllLoaiHopThu", null);
            
        }
        #endregion

        #region lay ra Loai hop thu theo ID
        public static LoaiHopThuMODEL getLoaiHopThuByID(int id)
        {
            LoaiHopThuMODEL loaiHopThuModel = new LoaiHopThuMODEL();
            //String sql = ConfigurationManager.AppSettings["sql.getLoaiHopThuByID"];
            //SqlCommand objCommand = new SqlCommand(sql);
            //objCommand.Parameters.AddWithValue("@id", id);

            //DataTable result = DataUtil.executeQuery(objCommand);

            SqlParameter[] parameter = new SqlParameter[1];
            int i = 0;

            parameter[i] = new SqlParameter("ID", SqlDbType.VarChar);
            parameter[i++].Value = id;

            DataTable result = DataUtil.executeStore("sp_getLoaiHopThuByID", parameter);
          

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
                SqlParameter[] parameter = new SqlParameter[8];
                int i = 0;

                //parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
                //parameter[i++].Value = loaiHopThuModel.Id;

                parameter[i] = new SqlParameter("Ten", SqlDbType.NVarChar);
                parameter[i++].Value = loaiHopThuModel.Ten;

                parameter[i] = new SqlParameter("Ghi_chu", SqlDbType.NVarChar);
                parameter[i++].Value = loaiHopThuModel.Ghi_Chu;

                parameter[i] = new SqlParameter("Ngay_cap_nhat_cuoi", SqlDbType.NVarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User1", SqlDbType.VarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = "";

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
                SqlParameter[] parameter = new SqlParameter[9];
                int i = 0;

                parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
                parameter[i++].Value = loaiHopThuModel.Id;

                parameter[i] = new SqlParameter("Ten", SqlDbType.NVarChar);
                parameter[i++].Value = loaiHopThuModel.Ten;

                parameter[i] = new SqlParameter("Ghi_chu", SqlDbType.NVarChar);
                parameter[i++].Value = loaiHopThuModel.Ghi_Chu;

                parameter[i] = new SqlParameter("Ngay_cap_nhat_cuoi", SqlDbType.NVarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User1", SqlDbType.VarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = "";

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
            try
            {
                SqlParameter[] parameter = new SqlParameter[1];
                int i = 0;

                parameter[i] = new SqlParameter("ID", SqlDbType.VarChar);
                parameter[i++].Value = id;

                return DataUtil.executeNonStore("sp_SMS_DeleteLoaiHopThu", parameter);
            }
            catch (Exception)
            {
                
                throw;
            }
        }
        #endregion

        public static DataTable getTenLoaiHopThu(string name)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[1];
                int i = 0;

                parameter[i] = new SqlParameter("Ten", SqlDbType.VarChar);
                parameter[i++].Value = name;

                DataTable tbl = DataUtil.executeStore("sp_SearchNane_LoaiHopThu", parameter);
                return tbl;
            }
            catch (Exception)
            {
                throw;
            }
        }


    }
}
