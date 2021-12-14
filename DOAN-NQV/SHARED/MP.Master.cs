using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webBanThietBiMayTinh.App_Code;

namespace DOAN_NQV.SHARED
{

    public partial class MP : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Cart"] == null)
                Session["Cart"] = new Cart();

            if (Session["TenDangNhap"] != null)
            {
                DataTable dt = (DataTable)Session["TenDangNhap"];
                btnDangKy.Visible = false;
                btnDangNhap2.Visible = false;
                dropdn.Visible = true;
                drnameuser.Text = "Xin chào: " + " " + dt.Rows[0]["HOTEN"].ToString();
                btnDangNhap.Text = "Đăng xuất";
                //btnXemDonHang.Visible = true;

            }
        }

        protected void btnDangKy_Click(object sender, EventArgs e)
        {
            if (Session["TenDangNhap"] == null)
                Response.Redirect("~/Login_v2/Signup.aspx");
        }

        protected void btnXemDonHang_Click(object sender, EventArgs e)
        {
            if (Session["TenDangNhap"] == null)
                Response.Redirect("~/Login_v2/Login.aspx");
            else
                Response.Redirect("~/USER/DSDATHANG.aspx");
        }

        protected void btnDangNhap2_Click(object sender, EventArgs e)
        {
            
                    
            Response.Redirect("~/Login_v2/Login.aspx");
           
            
        }
        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            if (Session["TenDangNhap"] != null)
            {
                Session["TenDangNhap"] = null;
                if (Request.Cookies["TenDangNhap"] != null)
                {
                    Response.Cookies["TenDangNhap"].Expires = DateTime.Now.AddDays(-1);
                }

                btnDangKy.Text = "Đăng kí";
                btnDangNhap.Text = "Đăng nhập";
                Response.Redirect("~/Login_v2/Login.aspx");
            }
            else
            {
                Session["TenDangNhap"] = null;
                Response.Redirect("~/Login_v2/Login.aspx");
            }
        }
        protected void btntk_Click(object sender, EventArgs e)
        {
            var keyword = txtSearch.Text;

            if (!string.IsNullOrEmpty(keyword))
            {
                Response.Redirect("/USER/DSSP.aspx?keyword=" + keyword);
            }
        }

        protected void btndmk_Click(object sender, EventArgs e)
        {

        }

        protected void btndmk_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/USER/DMK.aspx");
        }

        protected void btnxtt_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/USER/INFORMUSER.aspx");
        }
    }
}