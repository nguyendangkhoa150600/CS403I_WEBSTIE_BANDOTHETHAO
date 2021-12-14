using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace DOAN_NQV
{
    public class Global : System.Web.HttpApplication
    {


        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            if (Request.Cookies["TenDangNhap"]?.Value != null)
            {
                var dic = new Dictionary<string, string>();
                string constr = @"Data Source=DESKTOP-D6PGGJA;Initial Catalog=NQV_DOAN_NEW;Integrated Security=True";
                string queryString = "SELECT * FROM TAIKHOAN WHERE EMAIL = @MAIL AND MALOAI =1";
                SqlConnection connection = new SqlConnection(constr);
                SqlCommand cmd = new SqlCommand(queryString, connection);

                cmd.Parameters.AddWithValue("@MAIL", Request.Cookies["TenDangNhap"].Value);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                connection.Open();
                int i = cmd.ExecuteNonQuery();
                connection.Close();
                if (dt.Rows.Count > 0)
                {
                    Session["TenDangNhap"] = dt;
                }
            }
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}