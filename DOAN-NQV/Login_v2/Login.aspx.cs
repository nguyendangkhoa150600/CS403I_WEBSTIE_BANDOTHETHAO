using DOAN_NQV.App_code;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    //Tran Van Son
    public partial class fLogin : System.Web.UI.Page
    {
        Dictionary<string, string> dic;

        protected void Page_Load(object sender, EventArgs e)
        {
            string text = (Guid.NewGuid().ToString().Substring(0, 5));
            Response.Cookies["capcha"]["value"] = text;
            imcap.ImageUrl = "capcha.aspx";
            Label1.Visible = false;
        }
        protected void lpca_Click(object sender, EventArgs e)
        {
            Response.Cookies["capcha"]["value"] = (Guid.NewGuid().ToString().Substring(0, 5));
            imcap.ImageUrl = "capcha.aspx";
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            dic = new Dictionary<string, string>();
            string constr = @"Data Source=DESKTOP-D6PGGJA;Initial Catalog=NQV_DOAN_NEW;Integrated Security=True";
            string queryString = "SELECT * FROM TAIKHOAN WHERE EMAIL = @MAIL AND MATKHAU = @MT";
            SqlConnection connection = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand(queryString, connection);

            cmd.Parameters.AddWithValue("@MAIL", Encoding.Base64EncodingMethod(gmail.Value));
            cmd.Parameters.AddWithValue("@MT", Encoding.Base64EncodingMethod(pass.Value));
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            connection.Open();
            int i = cmd.ExecuteNonQuery();
            connection.Close();

            if (dt.Rows.Count > 0 && txtcap.Text.ToString() == Request.Cookies["capcha"]["value"])
            {

                Session["TenDangNhap"] = dt;
                Response.Cookies["TenDangNhap"].Value =dt.Rows[0]["EMAIL"].ToString();
                Response.Cookies["TenDangNhap"].Expires = DateTime.Now.AddDays(1);
                if (dt.Rows[0]["MALOAI"].ToString() == "2")
                {
                    //Response.Redirect("~/Management/THONGKE.aspx");
                    Response.Redirect("~/Admin/ThongKe.aspx");
                }
                else Response.Redirect("~/USER/DSSP.aspx");

            }
            else
            {
                if (txtcap.Text.ToString() == Request.Cookies["capcha"]["value"])
                {
                    Label1.Text = "Tài khoản hoặc mật khẩu không chính xác";
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Visible = true;
                    lbc.Visible = false;
                }
                else
                {
                    lbc.Text = "Sai mã Captcha";
                    lbc.Visible = true;
                    Label1.Visible = false;
                }
            }
        }
    }
}