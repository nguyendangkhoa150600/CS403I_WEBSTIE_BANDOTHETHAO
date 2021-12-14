using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;
using DOAN_NQV.App_code;

namespace DOAN_NQV.Admin
{
    public partial class ThongKe : System.Web.UI.Page
    {
        SQLXuLyDuLieu xuly;
        String SQL;
        DateTime dateTime;

        protected void Page_Load(object sender, EventArgs e)
        {
            xuly = new SQLXuLyDuLieu(this.Page);
            if (!IsPostBack)
            {
                RadioButtonList1.SelectedIndex = 1;
                setValueTG();
                loadData();
                setValueColTT();
                loadChart();

                getKhachHang();
                getTonKho();
                getDoanhSo();
                getDoanhThu();
            }
        }

        private void getDoanhThu()
        {
            SQL = "SELECT SUM(CHITIETHD.SOLUONG * DONGIABAN) - SUM(CHITIETHD.SOLUONG * DONGIANHAP) AS THANHTIEN " +
               "FROM DANHMUC, SANPHAM, CHITIETHD, HOADON, CTSANPHAM " +
               "WHERE DANHMUC.MADM = SANPHAM.MADM AND SANPHAM.MASP = CTSANPHAM.MASP AND CHITIETHD.MACTSP = CTSANPHAM.MACTSP AND HOADON.MAHD = CHITIETHD.MAHD " +
               "AND NGAYHD >= '" + DateTime.Parse(txtNGAYBD.Text).ToString("MM/dd/yyyy") +
               "' AND NGAYHD <= '" + DateTime.Parse(txtNGAYKT.Text).ToString("MM/dd/yyyy") + "' " +
               " AND HOADON.MATT = 4 UNION " +
               "SELECT SUM(CHITIETHD.SOLUONG * DONGIANHAP) AS THANHTIEN " +
               "FROM DANHMUC, SANPHAM, CHITIETHD, HOADON, CTSANPHAM " +
               "WHERE DANHMUC.MADM = SANPHAM.MADM AND SANPHAM.MASP = CTSANPHAM.MASP AND CHITIETHD.MACTSP = CTSANPHAM.MACTSP AND HOADON.MAHD = CHITIETHD.MAHD " +
               "AND NGAYHD >= '" + DateTime.Parse(txtNGAYBD.Text).ToString("MM/dd/yyyy") +
               "' AND NGAYHD <= '" + DateTime.Parse(txtNGAYKT.Text).ToString("MM/dd/yyyy") + "' " +
               " AND HOADON.MATT = 4";
            DataTable tb = xuly.Bang(SQL);
            if (tb.Rows.Count > 0)
            {
                string thanhtien = tb.Rows[0]["THANHTIEN"].ToString();
                if (thanhtien != "")
                    lbDoanhThu.Text = thanhtien;
                else lbDoanhThu.Text = "0";
            }
        }

        private void getDoanhSo()
        {
            SQL = "SELECT SUM(CHITIETHD.SOLUONG) AS SOLUONG FROM SANPHAM, CHITIETHD, HOADON, CTSANPHAM " +
                "WHERE SANPHAM.MASP = CTSANPHAM.MASP AND CHITIETHD.MACTSP = CTSANPHAM.MACTSP AND HOADON.MAHD = CHITIETHD.MAHD " +
                "AND NGAYHD >= '" + DateTime.Parse(txtNGAYBD.Text).ToString("MM/dd/yyyy") +
                "' AND NGAYHD <= '" + DateTime.Parse(txtNGAYKT.Text).ToString("MM/dd/yyyy") + "' " +
                " AND HOADON.MATT = 4 ";
            DataTable tb = xuly.Bang(SQL);
            if (tb.Rows.Count > 0)
            {
                string thanhtien = tb.Rows[0]["SOLUONG"].ToString();
                if (thanhtien != "")
                    lbDoanhSo.Text = thanhtien;
                else lbDoanhSo.Text = "0";
            }
        }

        private void getTonKho()
        {
            SQL = "SELECT SUM(SOLUONG) FROM CTSANPHAM ";
            DataTable tb = xuly.Bang(SQL);
            if (tb.Rows.Count > 0)
                lbTonKho.Text = tb.Rows[0][0].ToString();
        }

        private void getKhachHang()
        {
            SQL = "SELECT COUNT(MATK) FROM TAIKHOAN " +
               "WHERE MALOAI = 1";
            DataTable tb = xuly.Bang(SQL);
            if (tb.Rows.Count > 0)
                lbKhachHang.Text = tb.Rows[0][0].ToString();
        }

        private void loadData()
        {
            SQL = "SELECT MAHD, NGAYHD, MATK, TENTT, HOADON.MATT FROM HOADON, TRANGTHAIDH " +
                   "WHERE HOADON.MATT = TRANGTHAIDH.MATT " +
                   "AND HOADON.MATT = 4 AND NGAYHD >= '" + DateTime.Parse(txtNGAYBD.Text).ToString("MM/dd/yyyy") +
                   "' AND NGAYHD <= '" + DateTime.Parse(txtNGAYKT.Text).ToString("MM/dd/yyyy") + "'";
            GridView1.DataSource = xuly.Bang(SQL);
            GridView1.DataBind();
        }

        private void loadChart()
        {
            DataTable dt = new DataTable();
            SQL = "SELECT TENDM, SUM(CHITIETHD.SOLUONG) AS SOLUONG FROM DANHMUC, SANPHAM, CHITIETHD, HOADON, CTSANPHAM " +
                "WHERE DANHMUC.MADM = SANPHAM.MADM AND SANPHAM.MASP = CTSANPHAM.MASP AND CHITIETHD.MACTSP = CTSANPHAM.MACTSP AND HOADON.MAHD = CHITIETHD.MAHD " +
                "AND NGAYHD >= '" + DateTime.Parse(txtNGAYBD.Text).ToString("MM/dd/yyyy") +
                "' AND NGAYHD <= '" + DateTime.Parse(txtNGAYKT.Text).ToString("MM/dd/yyyy") + "' " +
                " AND HOADON.MATT = 4 " +
                "GROUP BY TENDM";
            dt = xuly.Bang(SQL);
            if (dt.Rows.Count > 0)
            {
                string[] x = new string[dt.Rows.Count];
                int[] y = new int[dt.Rows.Count];

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    x[i] = dt.Rows[i][0].ToString();
                    y[i] = Convert.ToInt32(dt.Rows[i][1]);
                }

                ctl00.Series[0].Points.DataBindXY(x, y);
                ctl00.Series[0].IsValueShownAsLabel = true;
                if (RadioButtonList1.SelectedIndex == 0)
                {

                    ctl00.Series[0].ChartType = SeriesChartType.Column;
                }
                else
                {
                    ctl00.Series[0].ChartType = SeriesChartType.Pie;

                }
            }

            SQL = "SELECT SUM(CHITIETHD.SOLUONG * DONGIABAN) AS THANHTIEN " +
                "FROM DANHMUC, SANPHAM, CHITIETHD, HOADON, CTSANPHAM " +
                "WHERE DANHMUC.MADM = SANPHAM.MADM AND SANPHAM.MASP = CTSANPHAM.MASP AND CHITIETHD.MACTSP = CTSANPHAM.MACTSP AND HOADON.MAHD = CHITIETHD.MAHD " +
                "AND NGAYHD >= '" + DateTime.Parse(txtNGAYBD.Text).ToString("MM/dd/yyyy") +
                "' AND NGAYHD <= '" + DateTime.Parse(txtNGAYKT.Text).ToString("MM/dd/yyyy") + "' " +
                " AND HOADON.MATT = 4 UNION " +
                "SELECT SUM(CHITIETHD.SOLUONG * DONGIANHAP) AS THANHTIEN " +
                "FROM DANHMUC, SANPHAM, CHITIETHD, HOADON, CTSANPHAM " +
                "WHERE DANHMUC.MADM = SANPHAM.MADM AND SANPHAM.MASP = CTSANPHAM.MASP AND CHITIETHD.MACTSP = CTSANPHAM.MACTSP AND HOADON.MAHD = CHITIETHD.MAHD " +
                "AND NGAYHD >= '" + DateTime.Parse(txtNGAYBD.Text).ToString("MM/dd/yyyy") +
                "' AND NGAYHD <= '" + DateTime.Parse(txtNGAYKT.Text).ToString("MM/dd/yyyy") + "' " +
                " AND HOADON.MATT = 4";
            dt = xuly.Bang(SQL);
            if (dt.Rows.Count > 1)
            {
                string[] x = new string[dt.Rows.Count];
                int[] y = new int[dt.Rows.Count];

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (i == 0)
                        x[i] = "Chi";
                    else x[i] = "Thu";
                    y[i] = Convert.ToInt32(dt.Rows[i][0]);
                }

                ctl01.Series[0].Points.DataBindXY(x, y);
                ctl01.Series[0].IsValueShownAsLabel = true;
                if (RadioButtonList1.SelectedIndex == 0)
                {

                    ctl01.Series[0].ChartType = SeriesChartType.Column;
                }
                else
                {
                    ctl01.Series[0].ChartType = SeriesChartType.Pie;

                }
            }
        }

        private void setValueTG()
        {
            string year = DateTime.Now.Year.ToString();
            dateTime = DateTime.UtcNow.Date;
            txtNGAYBD.Text = DateTime.Parse(year + "-01-01").ToString("yyyy-MM-dd");
            txtNGAYKT.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }

        private void setValueColTT()
        {
            double tongTien = 0;
            foreach (GridViewRow item in this.GridView1.Rows)
            {
                int MAHD = Convert.ToInt32(GridView1.DataKeys[item.RowIndex].Value);
                SQL = "SELECT MAHD, SUM(DONGIABAN * CHITIETHD.SOLUONG) AS TONGTIEN " +
                      "FROM CHITIETHD, SANPHAM, CTSANPHAM WHERE SANPHAM.MASP = CTSANPHAM.MASP AND CHITIETHD.MACTSP = CTSANPHAM.MACTSP AND MAHD = " + MAHD +
                      " GROUP BY MAHD";
                DataTable dttemp = xuly.Bang(SQL);
                if (dttemp.Rows.Count > 0)
                {
                    tongTien += double.Parse(dttemp.Rows[0]["TONGTIEN"].ToString());
                    item.Cells[3].Text = dttemp.Rows[0]["TONGTIEN"].ToString();
                }
            }
            if (GridView1.Rows.Count > 0)
            {
                GridView1.FooterRow.Cells[2].Text = "Tổng tiền";
                GridView1.FooterRow.Cells[3].Text = tongTien.ToString();
            }
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

        protected void btnDone_Click(object sender, EventArgs e)
        {
            if (DateTime.Parse(txtNGAYBD.Text) <= DateTime.Parse(txtNGAYKT.Text))
            {
                lbMess.Visible = false;
                SQL = "SELECT MAHD, NGAYHD, MATK, TENTT, HOADON.MATT FROM HOADON, TRANGTHAIDH " +
                    "WHERE HOADON.MATT = TRANGTHAIDH.MATT " +
                    "AND HOADON.MATT = 4 AND NGAYHD >= '" + DateTime.Parse(txtNGAYBD.Text).ToString("MM/dd/yyyy") +
                    "' AND NGAYHD <= '" + DateTime.Parse(txtNGAYKT.Text).ToString("MM/dd/yyyy") + "'";
                GridView1.DataSource = xuly.Bang(SQL);
                GridView1.DataBind();
                setValueColTT();
                loadChart();

                getKhachHang();
                getTonKho();
                getDoanhSo();
                getDoanhThu();
            }
            else lbMess.Visible = true;
        }
    }
}