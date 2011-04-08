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
//using SMS.util;

namespace SMS.dao
{
    class MemberDAO
    {
        public static MemberModel getAdminByUserNameNPass(String username, String password)
        {
            MemberModel memberModel = null;

            String sql = ConfigurationManager.AppSettings["sql.getAdminByUserNameAndPassword"];

            SqlCommand objCommand = new SqlCommand(sql);
            objCommand.Parameters.AddWithValue("@userName", username);
            objCommand.Parameters.AddWithValue("@password", password);

            DataTable kq = DataUtil.executeQuery(objCommand);

            foreach (DataRow row in kq.Rows)
            {
                memberModel = new MemberModel();

                memberModel.Username = row["TenDangNhap"].ToString();
                memberModel.Password = row["MatKhau"].ToString();
            }
            return memberModel;
        }

    }
}
