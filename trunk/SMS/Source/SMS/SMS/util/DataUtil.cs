using System;
using System.Data.SqlClient;
using System.Data;
using System.Collections;
using System.Configuration;
using log4net;

namespace SMS.util
{
    public class DataUtil
    {
        protected static SqlConnection conn;
        protected static log4net.ILog log = log4net.LogManager.GetLogger(typeof(DataUtil));
        /*
         * 
         * 
         */
        public static Boolean connect()
        {
            string connectionString = ConfigurationManager.AppSettings["ConnectionString"];
            try
            {
                conn = new SqlConnection(connectionString);
                conn.Open();
            }
            catch (Exception ex)
            {
                log.Error(ex.Message, ex);
                Console.WriteLine(ex.Message);
                return false;
            }
            return true;
        }

        /*
         * 
         * 
         */
        public static SqlConnection getConnection()
        {
            if (conn == null)
                connect();
            return conn;
        }

        /*
         * 
         * 
         */
        public static DataTable executeQuery(string sql)
        {
            DataTable dt = null;
            if (connect())
            {
                try
                {
                    dt = new DataTable();
                    SqlDataAdapter adapter = new SqlDataAdapter(sql, conn);
                    adapter.Fill(dt);
                }
                catch (Exception ex)
                {
                    log.Error(ex.Message, ex);
                    Console.WriteLine(ex.Message);
                    return null;
                }
                finally
                {
                    conn.Close();
                }
            }
            return dt;
        }

        /*
        * 
        * 
        */
        public static DataTable executeQuery(SqlCommand cmd)
        {
            DataTable dt = new DataTable();
            if (connect())
            {
                try
                {
                    cmd.Connection = conn;
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    adapter.Fill(dt);
                }
                catch (Exception ex)
                {
                    log.Error(ex.Message, ex);
                    Console.WriteLine(ex.Message);
                    return null;
                }
                finally
                {
                    conn.Close();
                }
            }
            return dt;
        }

        /*
        * 
        * 
        */
        public static Boolean executeNonQuery(string sql)
        {
            if (connect())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    log.Error(ex.Message, ex);
                    Console.WriteLine(ex.Message);
                    return false;
                }
                finally
                {
                    conn.Close();
                }
            }
            return true;
        }

        /*
       * 
       * 
       */
        public static Boolean executeNonQuery(SqlCommand cmd)
        {
            if (connect())
            {
                try
                {
                    cmd.Connection = conn;
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    log.Error(ex.Message, ex);
                    Console.WriteLine(ex.Message);
                    return false;
                }
                finally
                {
                    conn.Close();
                }
            }
            return true;
        }
        /*
         * 
         * 
         */
        public static DataTable executeStore(string spName, SqlParameter[] arrParam)
        {
            DataTable dt = null;
            if (connect())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = conn;
                    cmd.CommandText = spName;
                    cmd.CommandTimeout = 1000;

                    if (arrParam != null)
                    {
                        foreach (SqlParameter param in arrParam)
                        {
                            cmd.Parameters.Add(param);
                        }
                    }

                    dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
                catch (Exception ex)
                {
                    log.Error(ex.Message, ex);
                    Console.WriteLine(ex.Message);
                    return null;
                }
                finally
                {
                    conn.Close();
                }
            }
            return dt;
        }

        /*
        * 
        * 
        */
        public static Boolean executeNonStore(string spName, SqlParameter[] arrParam)
        {
            if (connect())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = conn;
                    cmd.CommandText = spName;
                    cmd.CommandTimeout = 1000;

                    if (arrParam != null)
                    {
                        foreach (SqlParameter param in arrParam)
                        {
                            cmd.Parameters.Add(param);
                        }
                    }

                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    log.Error(ex.Message, ex);
                    Console.WriteLine(ex.Message);
                    return false;
                }
                finally
                {
                    conn.Close();
                }
            }
            return true;
        }
    }
}