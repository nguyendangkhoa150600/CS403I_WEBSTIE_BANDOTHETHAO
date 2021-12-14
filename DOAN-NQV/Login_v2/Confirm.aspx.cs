using DOAN_NQV.App_code;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Login_v2
{
    public partial class Confirm : System.Web.UI.Page
    {
      

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            //if (txt.Text == SignUp.Maxt)
            //{
                string constr = @"Data Source=DESKTOP-D6PGGJA;Initial Catalog=NQV_DOAN_NEW;Integrated Security=True"; 
                using (SqlConnection conn = new SqlConnection(constr))
                {
                    String sql = "INSERT INTO TAIKHOAN( MATKHAU, HOTEN, GIOITINH, SDT,EMAIL, DIACHI, MALOAI)" +
                        " VALUES( @MATKHAU, @HOTEN, @GIOITINH,@SDT, @EMAIL, @DIACHI, @MALOAI)";
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        int gt ;
                        cmd.Parameters.AddWithValue("@MATKHAU", Encoding.Base64EncodingMethod(SignUp.Matkhau));
                        cmd.Parameters.AddWithValue("@HOTEN", SignUp.Hoten);
                        if(SignUp.GioiTinh=="NAM")
                        {
                            gt = 1;
                        } else
                        {
                            gt = 0;
                        }
                        cmd.Parameters.AddWithValue("@GIOITINH", gt);
                        cmd.Parameters.AddWithValue("@SDT", SignUp.Sdt);
                        cmd.Parameters.AddWithValue("@EMAIL", Encoding.Base64EncodingMethod(SignUp.Gmail));
                        cmd.Parameters.AddWithValue("@DIACHI", SignUp.Diachi);
                        cmd.Parameters.AddWithValue("@MALOAI", "1");
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                        Response.Redirect("Login.aspx");
                    }
                }
            //}    
            //else
            //{
            //    tbns.Visible = true;
            //}    
        }
    }
}