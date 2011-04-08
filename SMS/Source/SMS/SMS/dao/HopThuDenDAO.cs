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
        
        public static bool deleteHopThuDen(int id)
        {
            SqlParameter[] parameter = new SqlParameter[1];

            parameter[0] = new SqlParameter("@id", SqlDbType.Int);
            parameter[0].Value = id;

            Boolean kq = DataUtil.executeNonStore("sp_SMS_deleteMessInbox", parameter);
            return kq;
        }

        public static DataTable getAllSyntaxMessInbox()
        {
            DataTable result = DataUtil.executeStore("sp_SMS_getAllSyntaxMessInbox",null);
            return result;
        }

        public static DataTable getAllNormalMessInbox()
        {
            DataTable result = DataUtil.executeStore("sp_SMS_getAllNormalMessInbox", null);
            return result;
        }

        public static DataTable getAllSyntaxMessDeletedInbox()
        {
            DataTable result = DataUtil.executeStore("sp_SMS_getAllSyntaxMessDeletedInbox", null);
            return result;
        }

        public static DataTable getAllNormalMessDeletedInbox()
        {
            DataTable result = DataUtil.executeStore("sp_SMS_getAllNormalMessDeletedInbox", null);
            return result;
        }

        public static bool updateTinhTrangMessInbox(string id)
        {
            SqlParameter[] parameter = new SqlParameter[1];

            parameter[0] = new SqlParameter("@id", SqlDbType.Int);
            parameter[0].Value = id;

            Boolean kq = DataUtil.executeNonStore("sp_SMS_updateStatusMessInbox", parameter);
            return kq;
        }

        public static bool deleteMesssInbox(string id)
        {
            SqlParameter[] parameter = new SqlParameter[1];

            parameter[0] = new SqlParameter("@id", SqlDbType.Int);
            parameter[0].Value = id;

            Boolean kq = DataUtil.executeNonStore("sp_SMS_deleteMessInbox", parameter);
            return kq;
        }

        public static bool removeMesssInbox(string id)
        {
            SqlParameter[] parameter = new SqlParameter[1];

            parameter[0] = new SqlParameter("@id", SqlDbType.Int);
            parameter[0].Value = id;

            Boolean kq = DataUtil.executeNonStore("sp_SMS_removeMessInbox", parameter);
            return kq;
        }
    }
}
