using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DOAN_NQV.App_code;

namespace DOAN_NQV.Admin
{
    public partial class DonHang : System.Web.UI.Page
    {
        SQLXuLyDuLieu xuly;
        String SQL;

        protected void Page_Load(object sender, EventArgs e)
        {
            xuly = new SQLXuLyDuLieu(this.Page);
            if (!IsPostBack)
            {
                loadData();
            }
        }

        private void loadData()
        {
            //SQL = "SELECT MAHD, NGAYHD, HOTEN, TENTT, SODIENTHOAI " +
            //    "FROM HOADON, TAIKHOAN, TRANGTHAIDH " +
            //    "WHERE HOADON.MATK = TAIKHOAN.MATK AND HOADON.MATT = TRANGTHAIDH.MATT AND";
            String SQL1 = "SELECT MAHD, NGAYHD, HOTEN, TENTT, SODIENTHOAI " +
                 "FROM HOADON, TAIKHOAN, TRANGTHAIDH " +
                 "WHERE HOADON.MATK = TAIKHOAN.MATK AND HOADON.MATT = TRANGTHAIDH.MATT AND HOADON.MATT = 1";
            GridView1.DataSource = xuly.Bang(SQL1);
            GridView1.DataBind();

            String SQL2 = "SELECT MAHD, NGAYHD, HOTEN, TENTT, SODIENTHOAI " +
             "FROM HOADON, TAIKHOAN, TRANGTHAIDH " +
             "WHERE HOADON.MATK = TAIKHOAN.MATK AND HOADON.MATT = TRANGTHAIDH.MATT AND HOADON.MATT = 2";
            GridView2.DataSource = xuly.Bang(SQL2);
            GridView2.DataBind();


            String SQL3 = "SELECT MAHD, NGAYHD, HOTEN, TENTT, SODIENTHOAI " +
             "FROM HOADON, TAIKHOAN, TRANGTHAIDH " +
             "WHERE HOADON.MATK = TAIKHOAN.MATK AND HOADON.MATT = TRANGTHAIDH.MATT AND HOADON.MATT = 3";
            GridView3.DataSource = xuly.Bang(SQL3);
            GridView3.DataBind();


            String SQL4 = "SELECT MAHD, NGAYHD, HOTEN, TENTT, SODIENTHOAI " +
             "FROM HOADON, TAIKHOAN, TRANGTHAIDH " +
             "WHERE HOADON.MATK = TAIKHOAN.MATK AND HOADON.MATT = TRANGTHAIDH.MATT AND HOADON.MATT = 4";
            GridView4.DataSource = xuly.Bang(SQL4);
            GridView4.DataBind();


            String SQL5 = "SELECT MAHD, NGAYHD, HOTEN, TENTT, SODIENTHOAI " +
             "FROM HOADON, TAIKHOAN, TRANGTHAIDH " +
             "WHERE HOADON.MATK = TAIKHOAN.MATK AND HOADON.MATT = TRANGTHAIDH.MATT AND HOADON.MATT = 6";
            GridView5.DataSource = xuly.Bang(SQL5);
            GridView5.DataBind();
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int MAHD = (int)Convert.ToInt32(GridView1.DataKeys[e.NewSelectedIndex].Value);

            SQL = "SELECT * FROM HOADON WHERE MAHD = " + MAHD;
            DataTable dt = new DataTable();
            dt = xuly.Bang(SQL);
            Session["Hoadon"] = dt;
            Response.Redirect("~/Admin/ChiTietDonHang.aspx");
        }
        protected void GridView2_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int MAHD = (int)Convert.ToInt32(GridView2.DataKeys[e.NewSelectedIndex].Value);

            SQL = "SELECT * FROM HOADON WHERE MAHD = " + MAHD;
            DataTable dt = new DataTable();
            dt = xuly.Bang(SQL);
            Session["Hoadon"] = dt;
            Response.Redirect("~/Admin/ChiTietDonHang.aspx");
        }
        protected void GridView3_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int MAHD = (int)Convert.ToInt32(GridView3.DataKeys[e.NewSelectedIndex].Value);

            SQL = "SELECT * FROM HOADON WHERE MAHD = " + MAHD;
            DataTable dt = new DataTable();
            dt = xuly.Bang(SQL);
            Session["Hoadon"] = dt;
            Response.Redirect("~/Admin/ChiTietDonHang.aspx");
        }
        protected void GridView4_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int MAHD = (int)Convert.ToInt32(GridView4.DataKeys[e.NewSelectedIndex].Value);

            SQL = "SELECT * FROM HOADON WHERE MAHD = " + MAHD;
            DataTable dt = new DataTable();
            dt = xuly.Bang(SQL);
            Session["Hoadon"] = dt;
            Response.Redirect("~/Admin/ChiTietDonHang.aspx");
        }
        protected void GridView5_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int MAHD = (int)Convert.ToInt32(GridView5.DataKeys[e.NewSelectedIndex].Value);

            SQL = "SELECT * FROM HOADON WHERE MAHD = " + MAHD;
            DataTable dt = new DataTable();
            dt = xuly.Bang(SQL);
            Session["Hoadon"] = dt;
            Response.Redirect("~/Admin/ChiTietDonHang.aspx");
        }
    }
}