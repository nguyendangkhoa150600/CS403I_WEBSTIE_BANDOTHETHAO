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
    public partial class TaiKhoan : System.Web.UI.Page
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
            SQL = "SELECT MATK, HOTEN, CASE GIOITINH WHEN 1 THEN 'Nam' ELSE N'Nữ' END AS GT, DIACHI, SDT, EMAIL, MATKHAU, TENLOAI, TRANGTHAI " +
                "FROM TAIKHOAN, LOAITK WHERE TAIKHOAN.MALOAI = LOAITK.MALOAI AND TAIKHOAN.MALOAI = 1";
            GridView1.DataSource = xuly.Bang(SQL);
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            loadData();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int MATK = (int)Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            SQL = "UPDATE TAIKHOAN SET TRANGTHAI = 1 WHERE MATK = " + MATK;
            xuly.thucthiSQL(SQL);
            loadData();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int MATK = (int)Convert.ToInt32(GridView1.DataKeys[e.NewEditIndex].Value);

            SQL = "UPDATE TAIKHOAN SET TRANGTHAI = 0 WHERE MATK = " + MATK;
            xuly.thucthiSQL(SQL);
            loadData();
        }
    }
}