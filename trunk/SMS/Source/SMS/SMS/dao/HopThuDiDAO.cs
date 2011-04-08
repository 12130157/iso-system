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
    class HopThuDiDAO
    {
        public static bool insertHopThuDi(HopThuDiMODEL hopThuDiModel)
        {
            try
            {
                SqlParameter[] parameter = new SqlParameter[9];
                int i = 0;

                parameter[i] = new SqlParameter("So_dien_thoai", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDiModel.So_Dien_Thoai;

                parameter[i] = new SqlParameter("Noi_dung_tin_nhan", SqlDbType.NVarChar);
                parameter[i++].Value = hopThuDiModel.Noi_Dung_Tin_Nhan;

                parameter[i] = new SqlParameter("Tinh_trang", SqlDbType.Int);
                parameter[i++].Value = hopThuDiModel.Tinh_Trang;

                parameter[i] = new SqlParameter("Loai_hop_thu", SqlDbType.Int);
                parameter[i++].Value = hopThuDiModel.Loai_Hop_Thu;

                parameter[i] = new SqlParameter("User1", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDiModel.User11;

                parameter[i] = new SqlParameter("User2", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDiModel.User21;

                parameter[i] = new SqlParameter("User3", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDiModel.User31;

                parameter[i] = new SqlParameter("User4", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDiModel.User41;

                parameter[i] = new SqlParameter("User5", SqlDbType.VarChar);
                parameter[i++].Value = hopThuDiModel.User51;

                Boolean kq = DataUtil.executeNonStore("sp_SMS_InertHopThuDi", parameter);
                return kq;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static DataTable getAllSyntaxMessSent()
        {
            DataTable result = DataUtil.executeStore("sp_SMS_getAllSyntaxMessSent", null);
            return result;
        }

        public static DataTable getAllNormalMessSent()
        {
            DataTable result = DataUtil.executeStore("sp_SMS_getAllNormalMessSent", null);
            return result;
        }

        public static DataTable getAllSyntaxMessErrorSent()
        {
            DataTable result = DataUtil.executeStore("sp_SMS_getAllSyntaxMessErrorSent", null);
            return result;
        }
        
        public static DataTable getAllNormalMessErrorSent()
        {
            DataTable result = DataUtil.executeStore("sp_SMS_getAllNormalMessErrorSent", null);
            return result;
        }

        public static DataTable getAllSyntaxMessDeletedSent()
        {
            DataTable result = DataUtil.executeStore("sp_SMS_getAllSyntaxMessDeletedSent", null);
            return result;
        }

        public static DataTable getAllNormalMessDeletedSent()
        {
            DataTable result = DataUtil.executeStore("sp_SMS_getAllNormalMessDeletedSent", null);
            return result;
        }

        public static DataTable getMaxId()
        {
            String sql = ConfigurationManager.AppSettings["sql.getMaxId"];
            SqlCommand objCommand = new SqlCommand(sql);

            DataTable result = DataUtil.executeQuery(objCommand);
            return result;
        }

        public static bool deleteMessSent(string id)
        {
            SqlParameter[] parameter = new SqlParameter[1];

            parameter[0] = new SqlParameter("@id", SqlDbType.Int);
            parameter[0].Value = id;

            Boolean kq = DataUtil.executeNonStore("sp_SMS_deleteMessSent", parameter);
            return kq;
        }

        public static bool updateMaTinNhanTraLoiInbox(string maTinNhanTraLoi)
        {
            SqlParameter[] parameter = new SqlParameter[1];

            parameter[0] = new SqlParameter("@ma_tin_nhan_tra_loi", SqlDbType.Int);
            parameter[0].Value = maTinNhanTraLoi;

            Boolean kq = DataUtil.executeNonStore("sp_SMS_updateMaTinNhanTraLoiInbox", parameter);
            return kq;
        }

        public static bool removeMessSent(string id)
        {
            SqlParameter[] parameter = new SqlParameter[1];

            parameter[0] = new SqlParameter("@id", SqlDbType.Int);
            parameter[0].Value = id;

            Boolean kq = DataUtil.executeNonStore("sp_SMS_removeMessSent", parameter);
            return kq;
        }

        public static bool updateStatusReSentMess(int tinhTrang,string loaiHopThu,string id)
        {
            SqlParameter[] parameter = new SqlParameter[3];

            parameter[0] = new SqlParameter("@tinh_trang", SqlDbType.Int);
            parameter[0].Value = tinhTrang;

            parameter[1] = new SqlParameter("@loai_hop_thu", SqlDbType.Int);
            parameter[1].Value = loaiHopThu;

            parameter[2] = new SqlParameter("@id", SqlDbType.Int);
            parameter[2].Value = id;

            Boolean kq = DataUtil.executeNonStore("sp_SMS_updateStatusResentMess", parameter);
            return kq;
        } 

    }
}
