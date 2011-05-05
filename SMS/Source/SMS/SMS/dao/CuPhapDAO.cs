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
        //public  ArrayList getAllCuPhap()
        //{
        //    ArrayList listCuPhap = new ArrayList();
        //    String sql = ConfigurationManager.AppSettings["sql.getAllCuPhap"];
        //    SqlCommand objCommand = new SqlCommand(sql);

        //    DataTable result = DataUtil.executeQuery(objCommand);

        //    foreach (DataRow row in result.Rows)
        //    {
        //        CuPhapMODEL cuPhapModel = new CuPhapMODEL();

        //        cuPhapModel.Id = row["ID"].ToString();
        //        cuPhapModel.Ten = row["Ten"].ToString();
        //        cuPhapModel.Cum_Tu_1 = row["Cum_tu_1"].ToString();
        //        cuPhapModel.Cum_Tu_2 = row["Cum_tu_2"].ToString();
        //        cuPhapModel.Cum_Tu_3 = row["Cum_tu_3"].ToString();
        //        cuPhapModel.Cum_Tu_4 = row["Cum_tu_4"].ToString();
        //        cuPhapModel.Cum_Tu_5 = row["Cum_tu_5"].ToString();
        //        cuPhapModel.Cum_Tu_6 = row["Cum_tu_6"].ToString();
        //        cuPhapModel.Cum_Tu_7 = row["Cum_tu_7"].ToString();
        //        cuPhapModel.Cum_Tu_8 = row["Cum_tu_8"].ToString();
        //        cuPhapModel.Cum_Tu_9 = row["Cum_tu_9"].ToString();
        //        cuPhapModel.Cum_Tu_10 = row["Cum_tu_10"].ToString();
        //        cuPhapModel.Ghi_Chu = row["Ghi_chu"].ToString();
        //        cuPhapModel.Ngay_Cap_Nhat_Cuoi = row["Ngay_cap_nhat_cuoi"].ToString();
        //        cuPhapModel.User11 = row["User1"].ToString();
        //        cuPhapModel.User21 = row["User2"].ToString();
        //        cuPhapModel.User31 = row["User3"].ToString();
        //        cuPhapModel.User41 = row["User4"].ToString();
        //        cuPhapModel.User51 = row["User5"].ToString();

        //        listCuPhap.Add(cuPhapModel);
        //    }
        //    return listCuPhap;
        //}

        //public static DataTable getAllCuPhapINTODataTable()
        //{

        //    String sql = ConfigurationManager.AppSettings["sql.getAllCuPhap"];
        //    SqlCommand objCommand = new SqlCommand(sql);

        //    return DataUtil.executeQuery(objCommand);
        //}

        public ArrayList getAllTenKeywordCuPhap()
        {
            ArrayList listCuPhap = new ArrayList();
            //String sql = ConfigurationManager.AppSettings["sql.getAllTenCuPhap"];
            //SqlCommand objCommand = new SqlCommand(sql);

            //DataTable result = DataUtil.executeQuery(objCommand);
             DataTable result = DataUtil.executeStore("sp_getAllTenCuPhap", null);
            
            foreach (DataRow row in result.Rows)
            {
                CuPhapMODEL cuPhapModel = new CuPhapMODEL();

                cuPhapModel.Ten = row["Ten"].ToString();

                listCuPhap.Add(cuPhapModel);
            }
            return listCuPhap;
        }

        public ArrayList getAllKeyword1CuPhap(String ten)
        {
  
                ArrayList listCuPhap = new ArrayList();
                //String sql = ConfigurationManager.AppSettings["sql.getAllKeyword1CuPhap"];
                //SqlCommand objCommand = new SqlCommand(sql);
                //objCommand.Parameters.AddWithValue("@ten", ten);

                //DataTable result = DataUtil.executeQuery(objCommand);
                SqlParameter[] parameter = new SqlParameter[1];
                int i = 0;

                parameter[i] = new SqlParameter("Ten", SqlDbType.NVarChar);
                parameter[i++].Value = ten;

                DataTable result = DataUtil.executeStore("sp_getAllKeyword1CuPhap", parameter);
                if (result == null)
                {
                    return listCuPhap;
                }
                else{
                    foreach (DataRow row in result.Rows)
                    {
                        CuPhapMODEL cuPhapModel = new CuPhapMODEL();

                        cuPhapModel.Cum_Tu_1 = row["Cum_tu_1"].ToString();

                        listCuPhap.Add(cuPhapModel);
                    }
                return listCuPhap;
                }
        }
    #endregion

    #region lay ra cu phap theo ID
        public CuPhapMODEL getCuPhapByID(int id)
        {
            //String sql = ConfigurationManager.AppSettings["sql.getCuPhapByID"];
            //SqlCommand objCommand = new SqlCommand(sql);
            //CuPhapMODEL cuPhapModel = new CuPhapMODEL();
            //objCommand.Parameters.AddWithValue("@id",id);
            //DataTable result = DataUtil.executeQuery(objCommand);

            try
            {
                CuPhapMODEL cuPhapModel = new CuPhapMODEL();
                SqlParameter[] parameter = new SqlParameter[1];
                int i = 0;

                parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
                parameter[i++].Value = id;

                DataTable result = DataUtil.executeStore("sp_getCuPhapByID", parameter);

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
                    ////cuPhapModel.Ngay_Cap_Nhat_Cuoi = row["Ngay_cap_nhat_cuoi"].ToString();
                    //cuPhapModel.User11 = row["User1"].ToString();
                    //cuPhapModel.User21 = row["User2"].ToString();
                    //cuPhapModel.User31 = row["User3"].ToString();
                    //cuPhapModel.User41 = row["User4"].ToString();
                    //cuPhapModel.User51 = row["User5"].ToString();
                }

                return cuPhapModel;
            }
            catch (Exception)
            {

                throw;
            }

        }
        #endregion

    #region them 1 cu phap vao CSDL
        public bool insertCuPhap(CuPhapMODEL cuPhapModel)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[18];
                int i = 0;

                //parameter[i] = new SqlParameter("ID", SqlDbType.Int);
                //parameter[i++].Value = cuPhapModel.Id;

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
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = "";

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
        public Boolean updateCuPhap(CuPhapMODEL cuPhapModel)
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
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value ="";

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = "";

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = "";

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
        public Boolean deleteCuPhap(int id)
        {
            //String sql = ConfigurationManager.AppSettings["sql.DeleteCuPhapByID"];
            //SqlCommand objCommand = new SqlCommand(sql);
            //objCommand.Parameters.AddWithValue("@id", id);

            //Boolean kq = DataUtil.executeNonQuery(objCommand);
            //return kq;


            SqlParameter[] parameter = new SqlParameter[1];
            int i = 0;

            parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
            parameter[i++].Value = id;

            Boolean kq = DataUtil.executeNonStore("sp_SMS_DeleteCuPhap", parameter);
            return kq;
            
        }
    #endregion


        public static CuPhapMODEL getCuPhapByCumCuPhap(string cumCuPhap)
        {
            SqlParameter[] parameter = new SqlParameter[1];

            parameter[0] = new SqlParameter("@cumCuPhap", SqlDbType.VarChar);
            parameter[0].Value = cumCuPhap;

            CuPhapMODEL cuPhapModel = new CuPhapMODEL();

            DataTable result = DataUtil.executeStore("sp_SMS_getCumCuPhap", parameter);

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

        public static DataTable getAllDRVCuPhap()
        {
            //String sql = ConfigurationManager.AppSettings["sql.getAllDRVCuPhap"];
            //SqlCommand objCommand = new SqlCommand(sql);

            //return DataUtil.executeQuery(objCommand);


            return DataUtil.executeStore("sp_getAllDRVCuPhap", null);
        }

        public static DataTable getTenDRVCuPhapByID(String ten,String keyword1)
        {
            //String sql = ConfigurationManager.AppSettings["sql.getTenDRVCuPhapByID"];
            //SqlCommand objCommand = new SqlCommand(sql);

            //objCommand.Parameters.AddWithValue("@ten", ten);
            //objCommand.Parameters.AddWithValue("@keyword1", keyword1);

            //return DataUtil.executeQuery(objCommand);

            SqlParameter[] parameter = new SqlParameter[2];
            int i = 0;

            parameter[i] = new SqlParameter("Ten", SqlDbType.NVarChar);
            parameter[i++].Value = ten;

            parameter[i] = new SqlParameter("Cum_tu_1", SqlDbType.NVarChar);
            parameter[i++].Value = keyword1;
            return DataUtil.executeStore("sp_Search_KeyworkName", parameter);
              
        }
        

        public static DataTable getDiemByMaSinhVien(string maSinhVien)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[1];
                //int i = 0;

                parameter[0] = new SqlParameter("MaSinhVien", SqlDbType.VarChar);
                parameter[0].Value = maSinhVien;

                DataTable tbl = DataUtil.executeStore("sp_ISO_SMS_getDiemTatCaMonHocTrongHocKiHienTaiByMaSinhVien", parameter);
                return tbl;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static DataTable getDiemByMaSinhVienNTenMonHoc(string maSinhVien, string tenMonHoc)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[2];
                int i = 0;

                parameter[i] = new SqlParameter("MaSinhVien", SqlDbType.VarChar);
                parameter[i++].Value = maSinhVien;

                parameter[i] = new SqlParameter("IDMonHoc", SqlDbType.Int);
                parameter[i++].Value = tenMonHoc;

                DataTable tbl = DataUtil.executeStore("sp_ISO_SMS_getDiemByMaSinhVienNTenMonHoc", parameter);
                return tbl;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static DataTable getDiemByMaSinhVienNNamHoc(string maSinhVien, string namHoc)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[2];
                int i = 0;

                parameter[i] = new SqlParameter("MaSinhVien", SqlDbType.VarChar);
                parameter[i++].Value = maSinhVien;

                parameter[i] = new SqlParameter("NamHoc", SqlDbType.VarChar);
                parameter[i++].Value = namHoc;

                DataTable tbl = DataUtil.executeStore("sp_ISO_SMS_getDiemByMaSinhVienNNamHoc", parameter);
                return tbl;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static DataTable getDiemByMaSinhVienNHocKi(string maSinhVien, string hocKi)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[2];
                int i = 0;

                parameter[i] = new SqlParameter("MaSinhVien", SqlDbType.VarChar);
                parameter[i++].Value = maSinhVien;

                parameter[i] = new SqlParameter("HocKi", SqlDbType.VarChar);
                parameter[i++].Value = hocKi;

                DataTable tbl = DataUtil.executeStore("sp_ISO_SMS_getDiemByMaSinhVienNNamHoc", parameter);
                return tbl;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static DataTable getTKBByMaSinhVienNNamHoc(string maSinhVien, string namHoc)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[2];
                int i = 0;

                parameter[i] = new SqlParameter("MaSinhVien", SqlDbType.VarChar);
                parameter[i++].Value = maSinhVien;

                parameter[i] = new SqlParameter("NamHoc", SqlDbType.VarChar);
                parameter[i++].Value = namHoc;

                DataTable tbl = DataUtil.executeStore("sp_ISO_SMS_getTKBByMaSinhVienNNamHoc", parameter);
                return tbl;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static DataTable getTKBByMaSinhVienNHocKi(string maSinhVien, string hocKi)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[2];
                int i = 0;

                parameter[i] = new SqlParameter("MaSinhVien", SqlDbType.VarChar);
                parameter[i++].Value = maSinhVien;

                parameter[i] = new SqlParameter("HocKi", SqlDbType.VarChar);
                parameter[i++].Value = hocKi;

                DataTable tbl = DataUtil.executeStore("sp_ISO_SMS_getTKBByMaSinhVienNHocKi", parameter);
                return tbl;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
