using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using SMS.model;
using System.Configuration;
using System.Collections;

namespace SMS
{
    class HopThuDenDAO
    {   

        public static bool insertHopThuDen(HopThuDenMODEL hopThuDenMODEL)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[10];
                int i = 0;


                parameter[i] = new SqlParameter("So_dien_thoai", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDenMODEL.So_Dien_Thoai;

                parameter[i] = new SqlParameter("Ma_cu_phap", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDenMODEL.Ma_Cu_Phap;


                parameter[i] = new SqlParameter("Noi_dung_tin_nhan", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDenMODEL.Noi_Dung_Tin_Nhan;


                parameter[i] = new SqlParameter("Tinh_trang", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDenMODEL.Tinh_Trang;

                parameter[i] = new SqlParameter("Loai_hop_thu", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDenMODEL.Loai_Hop_Thu;

                parameter[i] = new SqlParameter("User1", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDenMODEL.User11;

                parameter[i] = new SqlParameter("User2", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDenMODEL.User21;

                parameter[i] = new SqlParameter("User3", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDenMODEL.User31;

                parameter[i] = new SqlParameter("User4", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDenMODEL.User41;

                parameter[i] = new SqlParameter("User5", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDenMODEL.User51;

                Boolean kq = DataUtil.executeNonStore("sp_SMS_InertHopThuDen", parameter);
                return kq;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static Boolean updateHopTuDen(HopThuDenMODEL hopThuDenModel)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[13];
                int i = 0;

                parameter[i] = new SqlParameter("ID", SqlDbType.NVarChar);
                parameter[i++].Value = hopThuDenModel.Id;

                parameter[i] = new SqlParameter("So_dien_thoai", SqlDbType.NVarChar);
                parameter[i++].Value = hopThuDenModel.So_Dien_Thoai;

                parameter[i] = new SqlParameter("Ma_cu_phap", SqlDbType.NVarChar);
                parameter[i++].Value = hopThuDenModel.Ma_Cu_Phap;
                ;

                parameter[i] = new SqlParameter("Noi_dung_tin_nhan", SqlDbType.NVarChar);
                parameter[i++].Value = hopThuDenModel.Noi_Dung_Tin_Nhan;

                parameter[i] = new SqlParameter("Tinh_trang", SqlDbType.NVarChar);
                parameter[i++].Value = hopThuDenModel.Tinh_Trang;

                parameter[i] = new SqlParameter("Ngay_cap_nhat_cuoi", SqlDbType.NVarChar);
                parameter[i++].Value = hopThuDenModel.Ngay_Cap_Nhat_Cuoi;

                parameter[i] = new SqlParameter("User1", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDenModel.User11;

                parameter[i] = new SqlParameter("User2", SqlDbType.NVarChar);
                parameter[i++].Value = hopThuDenModel.User21;

                parameter[i] = new SqlParameter("User3", SqlDbType.NVarChar);
                parameter[i++].Value = hopThuDenModel.User31;

                parameter[i] = new SqlParameter("User4", SqlDbType.NVarChar);
                parameter[i++].Value = hopThuDenModel.User41;

                parameter[i] = new SqlParameter("User5", SqlDbType.NVarChar);
                parameter[i++].Value = hopThuDenModel.User51;

                Boolean kq = DataUtil.executeNonStore("sp_SMS_UpdateHopThuDenByID", parameter);
                return kq;
            }
            catch (Exception)
            {
                throw;
            }
        }
        
        public static bool deleteHopThuDen(int id)
        {
            String sql = ConfigurationManager.AppSettings["sql.sp_SMS_DeleteHopThuDen"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id", id);

            Boolean kq = DataUtil.executeNonQuery(objCommand);
            return kq;
        }

        public static DataTable getAllSyntaxMessInbox()
        {

            String sql = ConfigurationManager.AppSettings["sql.getAllSyntaxMessInbox"];
            SqlCommand objCommand = new SqlCommand(sql);

            DataTable result = DataUtil.executeQuery(objCommand);
            return result;
        }

        public static DataTable getAllNormalMessInbox()
        {

            String sql = ConfigurationManager.AppSettings["sql.getAllNormalMessInbox"];
            SqlCommand objCommand = new SqlCommand(sql);

            DataTable result = DataUtil.executeQuery(objCommand);
            return result;
        }

        public static DataTable getAllSyntaxMessDeletedInbox()
        {

            String sql = ConfigurationManager.AppSettings["sql.getAllSyntaxMessDeletedInbox"];
            SqlCommand objCommand = new SqlCommand(sql);

            DataTable result = DataUtil.executeQuery(objCommand);
            return result;
        }

        public static DataTable getAllNormalMessDeletedInbox()
        {

            String sql = ConfigurationManager.AppSettings["sql.getAllNormalMessDeletedInbox"];
            SqlCommand objCommand = new SqlCommand(sql);

            DataTable result = DataUtil.executeQuery(objCommand);
            return result;
        }

        public static bool updateTinhTrangMessInbox(string id)
        {
            String sql = ConfigurationManager.AppSettings["sql.UpdateTinhTrangMessInbox"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id", id);

            bool kq = DataUtil.executeNonQuery(objCommand);
            return kq;
        }

        public static bool deleteMesssInbox(string id)
        {
            String sql = ConfigurationManager.AppSettings["sql.DeleteMessInbox"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id", id);

            bool kq = DataUtil.executeNonQuery(objCommand);
            return kq;
        }

        public static bool removeMesssInbox(string id)
        {
            String sql = ConfigurationManager.AppSettings["sql.ReMoveMessInbox"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@id", id);

            bool kq = DataUtil.executeNonQuery(objCommand);
            return kq;
        }
    }
}
