using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace DOAN_NQV.App_code
{
    public class SQLXuLyDuLieu
    {
        SqlConnection con;

        public SQLXuLyDuLieu(Page page)
        {
            con = new SqlConnection();
            con.ConnectionString = @"Data Source=DESKTOP-D6PGGJA;Initial Catalog=NQV_DOAN_NEW;Integrated Security=True";
        }

        public void moKetNoi()
        {
            if (this.con.State == ConnectionState.Closed)
            {
                this.con.Open();
            }
        }

        public void dongKetNoi()
        {
            if (this.con.State == ConnectionState.Open)
            {
                this.con.Close();
            }
        }

        public DataTable Bang(String SQL)
        {
            this.moKetNoi();
            DataTable tb = new DataTable();
            SqlDataAdapter ADP = new SqlDataAdapter(SQL, this.con);
            ADP.Fill(tb);
            this.dongKetNoi();
            return tb;
        }

        public void thucthiSQL(String SQL)
        {
            this.moKetNoi();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = SQL;
            cmd.CommandType = CommandType.Text;
            cmd.Connection = this.con;
            cmd.ExecuteNonQuery();
            this.dongKetNoi();
        }
    }
}