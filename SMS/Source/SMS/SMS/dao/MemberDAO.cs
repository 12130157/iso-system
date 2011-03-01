using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Collections;
using System.IO;
using SMS.model;
using SMS.common;
using SMS.util;

namespace SMS.dao
{
    class MemberDAO
    {
        public static MemberModel getMemberByUsernameAndPassword(String username, String password)
        {
            MemberModel memberModel = null;

            String sql = ConfigurationManager.AppSettings["sql.getMemberByUsernameAndPassword"];
            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@TenDN", username);
            objCommand.Parameters.AddWithValue("@MatKhau", password);
            DataTable kq = DataUtil.executeQuery(objCommand);

            foreach (DataRow row in kq.Rows)
            {
                memberModel = new MemberModel();

                memberModel.MemID = row["ID"].ToString();
                memberModel.Username = row["Ten_DN"].ToString();
                memberModel.Password = row["Mat_khau"].ToString();
                memberModel.FullName = row["Ho_ten"].ToString();
                memberModel.RoleID = row["Ma_vai_tro"].ToString();
                memberModel.PartID = row["Ma_bo_phan"].ToString();
                memberModel.CreateDate = row["Ngay_tao"].ToString();
                memberModel.LastLogin = row["Ngay_truy_cap_cuoi"].ToString();
                memberModel.LastUpdate = row["Ngay_cap_nhat_cuoi"].ToString();
                memberModel.RoleName = row["Ten_vai_tro"].ToString();
                memberModel.User1 = row["User1"].ToString();
                memberModel.User2 = row["User2"].ToString();
                memberModel.User3 = row["User3"].ToString();
                memberModel.User4 = row["User4"].ToString();
                memberModel.User5 = row["User5"].ToString();
            }
            return memberModel;
        }

    }
}
