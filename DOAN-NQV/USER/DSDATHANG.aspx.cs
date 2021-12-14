using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webBanThietBiMayTinh.App_Code;

namespace DOAN_NQV.USER
{
    public partial class DSDATHANG : System.Web.UI.Page
    {
        XL _database;
        Cart cart;
        int index;
        protected void Page_Load(object sender, EventArgs e)
        {
            _database = new XL(Page);

            if (!Page.IsPostBack)
            {
                loadData();
               
            }
        }
     
        private void loadData()
        {
            var user = Session["TenDangNhap"] as DataTable;
            var maTK = user.Rows[0]["MaTK"].ToString();
            //var maSP = user.Rows[0]["HINHANH"].ToString();
            string sql = "SELECT HOADON.MaHD,NGAYHD,TENTT," +
                "SUM((1-(DBO.TINHTIEN(SANPHAM.MASP, NGAYHD)/100))*DONGIABAN*CHITIETHD.SOLUONG) AS THANHTIEN " +
                "FROM HOADON,CHITIETHD,TRANGTHAIDH,SANPHAM,CTSANPHAM " +
                "WHERE CHITIETHD.MACTSP=CTSANPHAM.MACTSP AND CTSANPHAM.MASP = SANPHAM.MASP AND HOADON.MAHD=CHITIETHD.MAHD AND TRANGTHAIDH.MATT = HOADON.MATT AND HOADON.MATT=1 AND MATK = " + maTK +
                " GROUP BY HOADON.MaHD,NGAYHD,TENTT";

            //"SELECT HOADON.MaHD,NGAYHD,TENTT,SUM(CHITIETHD.SOLUONG*DONGIABAN) AS THANHTIEN " +
            //"FROM HOADON,CHITIETHD,TRANGTHAIDH,SANPHAM " +
            //"WHERE CHITIETHD.MASP=SANPHAM.MASP AND HOADON.MAHD=CHITIETHD.MAHD AND TRANGTHAIDH.MATT = HOADON.MATT AND MATK = " + maTK +
            //" GROUP BY HOADON.MaHD,NGAYHD,TENTT";

            var dtaHoaDon = _database.bang(sql);
            if(dtaHoaDon.Rows.Count>0)
            {
                grpHoaDon.DataSource = dtaHoaDon;
                grpHoaDon.DataBind();
            }
            else
            {
                lb1.Visible = true;
            }    
            
        }
        protected void btnMuaSam_Click1(object sender, EventArgs e)
        {
            Response.Redirect("DSSP.aspx");
        }

        protected void grpHoaDon_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

            grpHoaDon.Visible = false;

            int MAHD = int.Parse(grpHoaDon.Rows[e.NewSelectedIndex].Cells[0].Text);
            var user = Session["TenDangNhap"] as DataTable;
            var maTK = user.Rows[0]["MaTK"].ToString();
            //var maSP = user.Rows[0]["HINHANH"].ToString();
            //string sql = "SELECT HOADON.MaHD,TENSP,CHITIETHD.SOLUONG,TENSP,(1-(DBO.TINHTIEN(SANPHAM.MASP, NGAYHD)/100))*DONGIABAN AS DONGIA,HINHANH,NGAYHD,SODIENTHOAI,DIACHI,TENTT,(1-(DBO.TINHTIEN(SANPHAM.MASP, NGAYHD)/100))*DONGIABAN*CHITIETHD.SOLUONG AS THANHTIEN " +
            //    "FROM HOADON,SANPHAM,CHITIETHD,TRANGTHAIDH " +
            //    "WHERE CHITIETHD.MACTSP=CTSANPHAM.MACTSP AND CTSANPHAM.MASP = SANPHAM.MASP AND HOADON.MAHD=CHITIETHD.MAHD AND TRANGTHAIDH.MATT = HOADON.MATT AND MATK = " + maTK
            //   + " AND CHITIETHD.MAHD = " + MAHD;

            string sql = @"SELECT T1.*, SIZE.TENSIZE, MAUSAC.TENMAU FROM 
                (SELECT HOADON.MaHD,TENSP,CHITIETHD.SOLUONG, (1-(DBO.TINHTIEN(SANPHAM.MASP, NGAYHD)/100))* CTSANPHAM.DONGIABAN AS DONGIA,HINHANH,NGAYHD,SODIENTHOAI,DIACHI,TENTT,(1-(DBO.TINHTIEN(SANPHAM.MASP, NGAYHD)/100))* CTSANPHAM.DONGIABAN*CHITIETHD.SOLUONG AS THANHTIEN, CTSANPHAM.MASIZE, CTSANPHAM.MAMAU FROM HOADON,SANPHAM,CHITIETHD,TRANGTHAIDH, CTSANPHAM WHERE CHITIETHD.MACTSP=CTSANPHAM.MACTSP AND CTSANPHAM.MASP = SANPHAM.MASP AND HOADON.MAHD=CHITIETHD.MAHD AND TRANGTHAIDH.MATT = HOADON.MATT AND MATK = " + maTK + " AND CHITIETHD.MAHD = " + MAHD + @") T1
                 LEFT JOIN SIZE
                ON T1.MASIZE = SIZE.MASIZE
                 LEFT JOIN MAUSAC
                ON T1.MAMAU = MAUSAC.MAMAU";

            var dtaHoaDon = _database.bang(sql);
            grxdh.DataSource = dtaHoaDon;
            grxdh.DataBind();

        }

        protected void grpHoaDon_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string sql;
            int MAHD = int.Parse(grpHoaDon.Rows[e.RowIndex].Cells[0].Text);
            sql = "SELECT MACTSP, SOLUONG FROM CHITIETHD WHERE MAHD = " + MAHD;
            foreach (DataRow r in _database.bang(sql).Rows)
            {
                string sqlMASP = string.Format("UPDATE CTSANPHAM SET SOLUONG = SOLUONG + {0} WHERE MACTSP = {1}",
                                    r.Field<int>("SOLUONG"),
                                    r.Field<int>("MACTSP")
                                );
                _database.ExecuteNonQuery(sqlMASP);
            }

            sql = "UPDATE HOADON SET MATT = 6 WHERE MATT = 1 AND MAHD = " + MAHD;
            var dtaHoaDon = _database.bang(sql);
            grpHoaDon.DataSource = dtaHoaDon;
            grpHoaDon.DataBind();
            loadData();
        }


        //private void setStatusEmptyGridview(bool status)
        //{
        //    if (status)
        //    {
        //        lb1.Visible = true;
            
        //    }
        //    else
        //    {
        //        lb1.Visible = false;
              
        //    }
        //}
    }
}