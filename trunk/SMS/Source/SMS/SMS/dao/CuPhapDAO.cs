using System;
using System.Collections;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data;
using SMS.model;
using System.Data.SqlClient;

namespace SMS
{
    class CuPhapDAO
    {

    #region lay ra tat ca cac cu phap trong CSDL
        public static ArrayList getAllCuPhap()
        {
            ArrayList listCuPhap = new ArrayList();
            String sql = ConfigurationManager.AppSettings["sql.getAllCuPhap"];
            SqlCommand objCommand = new SqlCommand(sql);

            DataTable result = DataUtil.executeQuery(objCommand);

            foreach (DataRow row in result.Rows)
            {
                CuPhapMODEL cuPhapModel = new CuPhapMODEL();

                cuPhapModel.Id = row["ID"].ToString();
                cuPhapModel.Ten = row["Ten"].ToString();
                cuPhapModel.Cum_Tu_1 = row["Cum_tu_1"].ToString();
                cuPhapModel.Cum_Tu_2 = row["Cum_tu_2"].ToString();
                cuPhapModel.Cum_Tu_3 = row["Cum_tu_3"].ToString();
                cuPhapModel.Cum_Tu_4 = row["Cum_tu_4"].ToString();
                cuPhapModel.Cum_Tu_5 = row["Cum_tu_5"].ToString();
                cuPhapModel.Cum_Tu_6 = row["Cum_tu_6"].ToString();
                cuPhapModel.Cum_Tu_7 = row["Cum_tu_7"].ToString();
                cuPhapModel.Cum_Tu_8 = row["Cum_tu_8"].ToString();
                cuPhapModel.Cum_Tu_9 = row["Cum_tu_9"].ToString();
                cuPhapModel.Cum_Tu_10 = row["Cum_tu_10"].ToString();
                cuPhapModel.Ghi_Chu = row["Ghi_chu"].ToString();
                cuPhapModel.Ngay_Cap_Nhat_Cuoi = row["Ngay_cap_nhat_cuoi"].ToString();
                cuPhapModel.User11 = row["User1"].ToString();
                cuPhapModel.User21 = row["User2"].ToString();
                cuPhapModel.User31 = row["User3"].ToString();
                cuPhapModel.User41 = row["User4"].ToString();
                cuPhapModel.User51 = row["User5"].ToString();

                listCuPhap.Add(cuPhapModel);
            }
            return listCuPhap;
        }
    #endregion

    #region lay ra cu phap theo ID
        public static CuPhapMODEL getCuPhapByID(int id)
        {
            CuPhapMODEL cuPhapModel = new CuPhapMODEL();
            String sql = ConfigurationManager.AppSettings["sql.getCuPhapByID"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id",id);

            DataTable result = DataUtil.executeQuery(objCommand);

            foreach (DataRow row in result.Rows)
            {
                cuPhapModel.Id = row["ID"].ToString();
                cuPhapModel.Ten = row["Ten"].ToString();
                cuPhapModel.Cum_Tu_1 = row["Cum_tu_1"].ToString();
                cuPhapModel.Cum_Tu_2 = row["Cum_tu_2"].ToString();
                cuPhapModel.Cum_Tu_3 = row["Cum_tu_3"].ToString();
                cuPhapModel.Cum_Tu_4 = row["Cum_tu_4"].ToString();
                cuPhapModel.Cum_Tu_5 = row["Cum_tu_5"].ToString();
                cuPhapModel.Cum_Tu_6 = row["Cum_tu_6"].ToString();
                cuPhapModel.Cum_Tu_7 = row["Cum_tu_7"].ToString();
                cuPhapModel.Cum_Tu_8 = row["Cum_tu_8"].ToString();
                cuPhapModel.Cum_Tu_9 = row["Cum_tu_9"].ToString();
                cuPhapModel.Cum_Tu_10 = row["Cum_tu_10"].ToString();
                cuPhapModel.Ghi_Chu = row["Ghi_chu"].ToString();
                cuPhapModel.Ngay_Cap_Nhat_Cuoi = row["Ngay_cap_nhat_cuoi"].ToString();
                cuPhapModel.User11 = row["User1"].ToString();
                cuPhapModel.User21 = row["User2"].ToString();
                cuPhapModel.User31 = row["User3"].ToString();
                cuPhapModel.User41 = row["User4"].ToString();
                cuPhapModel.User51 = row["User5"].ToString();
            }
            return cuPhapModel;
        }
        #endregion

    #region them 1 cu phap vao CSDL
        public static bool insertCuPhap(CuPhapMODEL cuPhapModel)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[19];
                int i = 0;

                parameter[i] = new SqlParameter("ID", SqlDbType.Int);
                parameter[i++].Value = cuPhapModel.Id;

                parameter[i] = new SqlParameter("Ten", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.Ten;

                parameter[i] = new SqlParameter("Cum_tu_1", SqlDbType.VarChar);
                parameter[i++].Value = cuPhapModel.Cum_Tu_1;

                parameter[i] = new SqlParameter("Cum_tu_2", SqlDbType.VarChar);
                parameter[i++].Value = cuPhapModel.Cum_Tu_2;

                parameter[i] = new SqlParameter("Cum_tu_3", SqlDbType.VarChar);
                parameter[i++].Value = cuPhapModel.Cum_Tu_3;

                parameter[i] = new SqlParameter("Cum_tu_4", SqlDbType.VarChar);
                parameter[i++].Value = cuPhapModel.Cum_Tu_4;

                parameter[i] = new SqlParameter("Cum_tu_5", SqlDbType.VarChar);
                parameter[i++].Value = cuPhapModel.Cum_Tu_5;

                parameter[i] = new SqlParameter("Cum_tu_6", SqlDbType.VarChar);
                parameter[i++].Value = cuPhapModel.Cum_Tu_6;

                parameter[i] = new SqlParameter("Cum_tu_7", SqlDbType.VarChar);
                parameter[i++].Value = cuPhapModel.Cum_Tu_7;

                parameter[i] = new SqlParameter("Cum_tu_8", SqlDbType.VarChar);
                parameter[i++].Value = cuPhapModel.Cum_Tu_8;

                parameter[i] = new SqlParameter("Cum_tu_9", SqlDbType.VarChar);
                parameter[i++].Value = cuPhapModel.Cum_Tu_9;

                parameter[i] = new SqlParameter("Cum_tu_10", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.Cum_Tu_10;

                parameter[i] = new SqlParameter("Ghi_chu", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.Ghi_Chu;

                parameter[i] = new SqlParameter("Ngay_cap_nhat_cuoi", SqlDbType.NVarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User1", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.User11;

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.User21;

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.User31;

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.User41;

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.User51;

                Boolean kq = DataUtil.executeNonStore("sp_SMS_InertCuPhap", parameter);
                return kq;
            }
            catch (Exception)
            {                
                throw;
            }
        }

    #endregion

    #region update 1 cu phap trong CSDL
        public static Boolean updateCuPhap(CuPhapMODEL cuPhapModel)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[19];
                int i = 0;

                parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.Id;

                parameter[i] = new SqlParameter("Ten", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.Ten;

                parameter[i] = new SqlParameter("Cum_tu_1", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.Cum_Tu_1;

                parameter[i] = new SqlParameter("Cum_tu_2", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.Cum_Tu_2;

                parameter[i] = new SqlParameter("Cum_tu_3", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.Cum_Tu_3;

                parameter[i] = new SqlParameter("Cum_tu_4", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.Cum_Tu_4;

                parameter[i] = new SqlParameter("Cum_tu_5", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.Cum_Tu_5;

                parameter[i] = new SqlParameter("Cum_tu_6", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.Cum_Tu_6;

                parameter[i] = new SqlParameter("Cum_tu_7", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.Cum_Tu_7;

                parameter[i] = new SqlParameter("Cum_tu_8", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.Cum_Tu_8;

                parameter[i] = new SqlParameter("Cum_tu_9", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.Cum_Tu_9;

                parameter[i] = new SqlParameter("Cum_tu_10", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.Cum_Tu_10;

                parameter[i] = new SqlParameter("Ghi_chu", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.Ghi_Chu;

                parameter[i] = new SqlParameter("Ngay_cap_nhat_cuoi", SqlDbType.NVarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User1", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.User11;

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.User21;

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.User31;

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.User41;

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = cuPhapModel.User51;

                Boolean kq = DataUtil.executeNonStore("sp_SMS_UpdateCuPhapByID", parameter);
                return kq;
            }
            catch (Exception)
            {
                throw;
            }
        }
    #endregion

    #region delete 1 cu phap trong CSDL
        public static bool deleteCuPhap(int id)
        {
            String sql = ConfigurationManager.AppSettings["sql.DeleteCuPhapByID"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id", id);

            Boolean kq = DataUtil.executeNonQuery(objCommand);
            return kq;
        }
    #endregion


        public static CuPhapMODEL getCuPhapByCumCuPhap(string cumCuPhap)
        {
            CuPhapMODEL cuPhapModel = new CuPhapMODEL();
            String sql = ConfigurationManager.AppSettings["sql.getCumCuPhap"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@cumCuPhap", cumCuPhap);

            DataTable result = DataUtil.executeQuery(objCommand);

            foreach (DataRow row in result.Rows)
            {
                cuPhapModel.Id = row["ID"].ToString();
                cuPhapModel.Ten = row["Ten"].ToString();
                cuPhapModel.Cum_Tu_1 = row["Cum_tu_1"].ToString();
                cuPhapModel.Cum_Tu_2 = row["Cum_tu_2"].ToString();
                cuPhapModel.Cum_Tu_3 = row["Cum_tu_3"].ToString();
                cuPhapModel.Cum_Tu_4 = row["Cum_tu_4"].ToString();
                cuPhapModel.Cum_Tu_5 = row["Cum_tu_5"].ToString();
                cuPhapModel.Cum_Tu_6 = row["Cum_tu_6"].ToString();
                cuPhapModel.Cum_Tu_7 = row["Cum_tu_7"].ToString();
                cuPhapModel.Cum_Tu_8 = row["Cum_tu_8"].ToString();
                cuPhapModel.Cum_Tu_9 = row["Cum_tu_9"].ToString();
                cuPhapModel.Cum_Tu_10 = row["Cum_tu_10"].ToString();
                cuPhapModel.Ghi_Chu = row["Ghi_chu"].ToString();
                cuPhapModel.Ngay_Cap_Nhat_Cuoi = row["Ngay_cap_nhat_cuoi"].ToString();
                cuPhapModel.User11 = row["User1"].ToString();
                cuPhapModel.User21 = row["User2"].ToString();
                cuPhapModel.User31 = row["User3"].ToString();
                cuPhapModel.User41 = row["User4"].ToString();
                cuPhapModel.User51 = row["User5"].ToString();
            }
            return cuPhapModel;
        }
    }
}
