using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WebApplication1.Login_v2;
using System.Data.SqlClient;
using DOAN_NQV.App_code;

namespace DOAN_NQV.Login_v2
{
    //Tran Van Son
    public partial class DMKLOGIN : System.Web.UI.Page
    {
        XL xl;
        DataTable dt;
        Dictionary<string, string> dic;
        protected void Page_Load(object sender, EventArgs e)
        {
            xl = new XL(this.Page);
        }

        protected void btnfconfirm_Click(object sender, EventArgs e)
        {
            string mkm1 = Encoding.Base64EncodingMethod(txtmkm.Text.ToString());
            string mkm12 = Encoding.Base64EncodingMethod( txtmkm2.Text.ToString());
           
            string queryString = "SELECT * FROM TAIKHOAN WHERE EMAIL = '" + Encoding.Base64EncodingMethod(SignUp.Gmail) + "'";

            dt = xl.bang(queryString);

            if (mkm1 == mkm12)
            {
                if (dt.Rows.Count > 0)
                {

                    string sql = "UPDATE TAIKHOAN SET MATKHAU = '" + mkm1 + "' WHERE EMAIL = '" + Encoding.Base64EncodingMethod(SignUp.Gmail) + "'";
                    xl.ExecuteNonQuery(sql);
                    lbtb.Visible = true;
                    //lbtb.Text = "THAY ĐỔI THÀNH CÔNG ";
                    Response.Redirect("/Login_v2/Login.aspx");
                }
                else
                {
                    lbtb.Visible = true;
                    lbtb.Text = "Không tồn tại tài khoản này";
                }
            }           
            else
            {
                lbtb.Visible = true;
                lbtb.Text = "Hai mật khẩu không giống nhau ";
            }
        }
    }
}

//var mkm1 = txtmkm.Text;
//var mkm12 = txtmkm2.Text;

//dic = new Dictionary<string, string>();
//string constr = @"Data Source=.;Initial Catalog=NQV_DOAN_NEW;Integrated Security=True";
//string queryString = "SELECT * FROM TAIKHOAN WHERE EMAIL = " + SignUp.Gmail;
//SqlConnection connection = new SqlConnection(constr);
//SqlCommand cmd = new SqlCommand(queryString, connection);

//cmd.Parameters.AddWithValue("@MAIL", SignUp.Gmail);

//SqlDataAdapter sda = new SqlDataAdapter(cmd);
//DataTable dt = new DataTable();
//sda.Fill(dt);
//connection.Open();
//int i = cmd.ExecuteNonQuery();
//connection.Close();

//if (mkm1 == mkm12)
//{
//    if (dt.Rows.Count > 0)
//    {

//        string sql = "UPDATE TAIKHOAN SET MATKHAU = " + mkm1 + "WHERE EMAIL = @MAIL ";
//        xl.ExecuteNonQuery(sql);
//        lbtb.Visible = true;
//        lbtb.Text = "THAY ĐỔI THÀNH CÔNG ";
//    }
//    else
//    {
//        lbtb.Visible = true;
//        lbtb.Text = "Không tồn tại tài khoản này";
//    }
//}
//else
//{
//    lbtb.Visible = true;
//    lbtb.Text = "Hai mật khẩu không giống nhau ";
//}