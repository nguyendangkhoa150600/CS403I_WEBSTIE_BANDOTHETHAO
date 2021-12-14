using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
namespace DOAN_NQV
{
    public class XL
    {
        SqlConnection conn;
        string dc = @"Data Source=DESKTOP-D6PGGJA;Initial Catalog=NQV_DOAN_NEW;Integrated Security=True";    
        public XL(Page page)
        {
            conn = new SqlConnection(dc);
            
        }
        public void mkn()
        {
            if (this.conn.State == ConnectionState.Closed)
            {
                this.conn.Open();
            }
        }
        public void dkn()
        {
            if (this.conn.State == ConnectionState.Open)
            {
                this.conn.Close();
            }
        }
        public DataTable bang(String sql)
        {
            this.mkn();
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(sql, this.conn);
            
            adp.Fill(dt);
            this.dkn();
            return dt;
        }


        public int ExecuteNonQuery(string sql)
        {
            SqlCommand command = CreateCommand(sql);

            int rows = command.ExecuteNonQuery();
            command.Connection.Close();

            return rows;
        }


        public object ExecuteScalar(string sql)
        {
            SqlCommand command = CreateCommand(sql);
            object value = command.ExecuteScalar();
            command.Connection.Close();
            return value;
        }

        private SqlCommand CreateCommand(string sql)
        {
            if (conn.State != ConnectionState.Open)
                conn.Open();

            SqlCommand command = new SqlCommand(sql, conn);
            return command;
        }


    }
}