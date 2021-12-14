using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace DOAN_NQV.USER
{
    public partial class DSSP : System.Web.UI.Page
    {
        XL xl;
        protected void Page_Load(object sender, EventArgs e)
        {
            xl = new XL(this.Page);

            if (!Page.IsPostBack)
            {
                var search = string.Empty;

                string keyword = Request.QueryString.Get("keyword");
                if (!string.IsNullOrEmpty(keyword))
                    search = keyword;

                string sql = @"SELECT SANPHAM.MASP, TENSP, DBO.GETPRICE(SANPHAM.MASP), HINHANH, CASE WHEN  DBO.KTKM(SANPHAM.MASP) > 0 
                                THEN cast(DBO.GETPRICE(SANPHAM.MASP) as nvarchar(15))+N' đ ' ELSE '' END AS DONGIA, 
                                CASE WHEN  DBO.KTKM(SANPHAM.MASP) > 0 
                                THEN '-'+cast(DBO.KTKM(SANPHAM.MASP) as nvarchar(15))+'%'  ELSE '' END AS TYLE, 
                                CASE WHEN  DBO.KTKM(SANPHAM.MASP) > 0 
                                THEN (1-(DBO.KTKM(SANPHAM.MASP)/100))*DBO.GETPRICE(SANPHAM.MASP)  ELSE DBO.GETPRICE(SANPHAM.MASP) END AS THANHTIEN 
                                FROM SANPHAM, DANHMUC
                                WHERE DANHMUC.MADM = SANPHAM.MADM
                                AND SANPHAM.MADM = ";

                //String sql = "select * from SANPHAM,DANHMUC WHERE SANPHAM.MADM = DANHMUC.MADM AND SANPHAM.MADM=1";
                //String sql = "SELECT SANPHAM.MASP, TENSP, DBO.GETPRICE(MASP), HINHANH, " +
                //              "CASE WHEN  DBO.KTKM(SANPHAM.MASP) > 0 " +
                //              "THEN cast(DBO.GETPRICE(MASP) as nvarchar(15))+N' đ ' ELSE '' END AS DONGIA, " +
                //              "CASE WHEN  DBO.KTKM(SANPHAM.MASP) > 0 " +
                //              "THEN '-'+cast(DBO.KTKM(SANPHAM.MASP) as nvarchar(15))+'%'  ELSE '' END AS TYLE, " +
                //              "CASE WHEN  DBO.KTKM(SANPHAM.MASP) > 0 " +
                //              "THEN (1-(DBO.KTKM(SANPHAM.MASP)/100))*DBO.GETPRICE(MASP)  ELSE DBO.GETPRICE(MASP) END AS THANHTIEN " +
                //              "FROM SANPHAM, DANHMUC  " +
                //              "WHERE DANHMUC.MADM = SANPHAM.MADM  AND SANPHAM.MADM = ";
                String sql1 = sql + "1";
                if (!string.IsNullOrEmpty(search))
                    sql1 = sql1 + " and TENSP like '%" + search + "%' ";

                String sql2 = sql + "2";
                if (!string.IsNullOrEmpty(search))
                    sql2 = sql2 + " and TENSP like '%" + search + "%' ";

                String sql3 = sql + "3";

                if (!string.IsNullOrEmpty(search))
                    sql3 = sql3 + " and TENSP like '%" + search + "%' ";

                String sql4 = sql + "4";

                if (!string.IsNullOrEmpty(search))
                    sql4 = sql4 + " and TENSP like '%" + search + "%'";

                this.dssp1.DataSource = xl.bang(sql1);
                this.dssp1.DataBind();
                this.dssp2.DataSource = xl.bang(sql2);
                this.dssp2.DataBind();
                this.dssp3.DataSource = xl.bang(sql3);
                this.dssp3.DataBind();
                this.dssp4.DataSource = xl.bang(sql4);
                this.dssp4.DataBind();




                String sql01, sql02, sql03, sql04;
                sql01 = "select DISTINCT TENDM FROM DANHMUC WHERE MADM=1";
                sql02 = "select DISTINCT TENDM FROM DANHMUC WHERE MADM=2";
                sql03 = "select DISTINCT TENDM FROM DANHMUC WHERE MADM=3";
                sql04 = "select DISTINCT TENDM FROM DANHMUC WHERE MADM=4";

                if (xl.bang(sql1).Rows.Count > 0)
                {

                    DataTable dt1 = xl.bang(sql01);
                    this.td1.DataSource = dt1;
                    this.td1.DataBind();
                }


                if (xl.bang(sql2).Rows.Count > 0)
                {

                    DataTable dt2 = xl.bang(sql02);
                    this.td2.DataSource = dt2;
                    this.td2.DataBind();
                }


                if (xl.bang(sql3).Rows.Count > 0)
                {

                    DataTable dt3 = xl.bang(sql03);
                    this.td3.DataSource = dt3;
                    this.td3.DataBind();
                }


                if (xl.bang(sql4).Rows.Count > 0)
                {

                    DataTable dt4 = xl.bang(sql04);
                    this.td4.DataSource = dt4;
                    this.td4.DataBind();
                }
            }

        }

        protected void dssp1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dssp2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}