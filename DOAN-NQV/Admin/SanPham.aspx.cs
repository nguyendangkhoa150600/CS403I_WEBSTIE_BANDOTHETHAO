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
    public partial class SanPham : System.Web.UI.Page
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
            SQL = "SELECT MASP, HINHANH, CONCAT(SUBSTRING(TENSP, 1, 20), '...') AS TENSP, CONCAT(SUBSTRING(CHITIETSP, 1, 50), '...') AS CHITIETSP, TENNCC, TENDM " +
                "FROM SANPHAM, DANHMUC, NHACUNGCAP WHERE SANPHAM.MADM = DANHMUC.MADM AND SANPHAM.MANCC = NHACUNGCAP.MANCC";
            GridView1.DataSource = xuly.Bang(SQL);
            GridView1.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Session["Sanpham"] != null) Session["Sanpham"] = null;
            Response.Redirect("~/Admin/ThemSanPham.aspx");
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            loadData();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int MASP = (int)Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            SQL = "DELETE FROM SANPHAM WHERE MASP = " + MASP;
            xuly.thucthiSQL(SQL);
            loadData();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int MASP = (int)Convert.ToInt32(GridView1.DataKeys[e.NewEditIndex].Value);

            SQL = "SELECT MASP, HINHANH, TENSP, CHITIETSP, TENNCC, TENDM " +
                "FROM SANPHAM, DANHMUC, NHACUNGCAP WHERE SANPHAM.MADM = DANHMUC.MADM AND SANPHAM.MANCC = NHACUNGCAP.MANCC AND MASP = " + MASP;
            DataTable dt = new DataTable();
            dt = xuly.Bang(SQL);
            Session["Sanpham"] = dt;
            Response.Redirect("~/Admin/ThemSanPham.aspx");
        }
    }
}