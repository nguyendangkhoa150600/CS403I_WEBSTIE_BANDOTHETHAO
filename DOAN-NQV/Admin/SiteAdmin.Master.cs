using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DOAN_NQV.Admin
{
    public partial class SiteAdmin : System.Web.UI.MasterPage
    {
        
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TenDangNhap"] != null)
            {
                DataTable dt = (DataTable)Session["TenDangNhap"];

                //lbname.Text =  dt.Rows[0]["HOTEN"].ToString();
                lbName.Text = dt.Rows[0]["HOTEN"].ToString();
            }
        }


        protected void btnlogout_Click(object sender, EventArgs e)
        {
            if (Session["TenDangNhap"] != null)
            {
                Session["TenDangNhap"] = null;
                if (Request.Cookies["TenDangNhap"] != null)
                {
                    Response.Cookies["TenDangNhap"].Expires = DateTime.Now.AddDays(-1);
                }

                
                Response.Redirect("~/Login_v2/Login.aspx");
            }
            else
            {
                Session["TenDangNhap"] = null;
                Response.Redirect("~/Login_v2/Login.aspx");
            }
        }
    }
}