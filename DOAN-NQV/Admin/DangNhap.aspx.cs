using DOAN_NQV.App_code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DOAN_NQV.Admin
{
    public partial class DangNhap : System.Web.UI.Page
    {
        SQLXuLyDuLieu xuly;
        String SQL;

        protected void Page_Load(object sender, EventArgs e)
        {
            xuly = new SQLXuLyDuLieu(this.Page);
        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            string email = Encoding.Base64EncodingMethod(txtEMAIL.Text);
            string pass = Encoding.Base64EncodingMethod(txtPASS.Text);
            SQL = "SELECT * FROM TAIKHOAN WHERE EMAIL = '" + email + "' AND MATKHAU = N'" + pass + "' AND MALOAI = 2";
            DataTable dt = xuly.Bang(SQL);
            if (dt.Rows.Count > 0)
            {
                Session["Taikhoan"] = dt;
                Response.Redirect("~/Admin/ThongKe.aspx");
            }
            else ScriptManager.RegisterStartupScript(this, GetType(), "YourUniqueScriptKey", "alert('Email hoặc mật khẩu không chính xác!');", true);
        }
    }
}