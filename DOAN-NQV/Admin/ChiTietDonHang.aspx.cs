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
    public partial class ChiTietDonHang : System.Web.UI.Page
    {
        SQLXuLyDuLieu xuly;
        String SQL;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            xuly = new SQLXuLyDuLieu(this.Page);
            if (!IsPostBack)
            {
                loadData();
                setButton();
            }
        }

        private void loadData()
        {
            if (Session["Hoadon"] != null)
            {
                dt = (DataTable)Session["Hoadon"];

                int MAHD = int.Parse(dt.Rows[0]["MAHD"].ToString());
                int MATK = int.Parse(dt.Rows[0]["MATK"].ToString());
                SQL = "SELECT * FROM TAIKHOAN WHERE MATK = " + MATK;
                DataTable dttemp = xuly.Bang(SQL);
                lbHOTEN.Text = dttemp.Rows[0]["HOTEN"].ToString();
                lbGMAIL.Text += Encoding.Base64DecodingMethod(dttemp.Rows[0]["EMAIL"].ToString());

                SQL = "SELECT * FROM HOADON WHERE MAHD = " + MAHD;
                dttemp = xuly.Bang(SQL);
                lbDIACHI.Text += dttemp.Rows[0]["DIACHI"].ToString();
                lbSDT.Text += dttemp.Rows[0]["SODIENTHOAI"].ToString();

                SQL = "SELECT MACT, MAHD, TENSP, CHITIETHD.SOLUONG, CHITIETHD.MACTSP, DONGIABAN, DONGIABAN * CHITIETHD.SOLUONG AS THANHTIEN " +
                    "FROM CHITIETHD, CTSANPHAM, SANPHAM WHERE CTSANPHAM.MASP = SANPHAM.MASP AND CTSANPHAM.MACTSP = CHITIETHD.MACTSP AND MAHD = " + MAHD;
                GridView1.DataSource = xuly.Bang(SQL);
                GridView1.DataBind();
                GridView1.FooterRow.Cells[3].Text = "Tổng tiền";

                SQL = "SELECT MAHD, SUM(DONGIABAN * CHITIETHD.SOLUONG) AS TONGTIEN " +
                    "FROM CHITIETHD, CTSANPHAM, SANPHAM WHERE CTSANPHAM.MASP = SANPHAM.MASP AND CTSANPHAM.MACTSP = CHITIETHD.MACTSP AND MAHD = " + MAHD + " " +
                    "GROUP BY MAHD";
                dttemp = xuly.Bang(SQL);
                GridView1.FooterRow.Cells[4].Text = dttemp.Rows[0]["TONGTIEN"].ToString();
            }

        }

        private void setButton()
        {
            if (Session["Hoadon"] != null)
            {
                dt = (DataTable)Session["Hoadon"];

                int MATT = int.Parse(dt.Rows[0]["MATT"].ToString());

                btnOptions.Text = getTrangThai(MATT);
                if (btnOptions.Text == "") btnOptions.Visible = false;
            }
        }

        private string getTrangThai(int MATT)
        {
            if (MATT == 1) return "Duyệt";
            if (MATT == 2) return "Vận chuyển";
            if (MATT == 3) return "Đã thanh toán";
            return "";
        }

        protected void btnOptions_Click(object sender, EventArgs e)
        {
            int MATT = 1;
            if (btnOptions.Text == "Duyệt") MATT = 2;
            else if (btnOptions.Text == "Vận chuyển") MATT = 3;
            else if (btnOptions.Text == "Đã thanh toán") MATT = 4;

            dt = (DataTable)Session["Hoadon"];
            int MAHD = int.Parse(dt.Rows[0]["MAHD"].ToString());
            SQL = "UPDATE HOADON SET MATT = " + MATT + " WHERE MAHD = " + MAHD;
            xuly.thucthiSQL(SQL);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage",
                   "alert('Successfully'); window.location='DonHang.aspx';", true);

        }       
    }
}