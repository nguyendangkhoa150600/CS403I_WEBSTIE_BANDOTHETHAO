using DOAN_NQV.App_code;
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
    public partial class MUANGAY : System.Web.UI.Page
    {
        Cart cart;

        private void loadGioHang(Cart cart)
        {
            if (Session["TenDangNhap"] != null)
            {
                DataTable dt = (DataTable)Session["TenDangNhap"];

                this.grdGioHang.DataSource = cart.displayData();
                this.grdGioHang.DataBind();
                this.grdGioHang.FooterRow.Cells[6].Text = "Tổng tiền";
                this.grdGioHang.FooterRow.Cells[7].Text = cart.Total().ToString();

                tennd.Text = dt.Rows[0]["HOTEN"].ToString();
                txtDiaChi.Text = dt.Rows[0]["DIACHI"].ToString();
                txtSoDienThoai.Text = dt.Rows[0]["SDT"].ToString();
                gmail.Text = Encoding.Base64DecodingMethod(dt.Rows[0]["EMAIL"].ToString());
                tamtinh.Text = cart.Total().ToString();
                phigh.Text = "0";
                tongcong.Text = (cart.Total() + int.Parse(phigh.Text)).ToString();
            }
        }

        XL _database;
        protected void Page_Load(object sender, EventArgs e)
        {
            _database = new XL(this.Page);

            if (Session["Cart1"] != null)
            {
                cart = (Cart)Session["Cart1"];
                if (!IsPostBack)
                {
                    loadGioHang(cart);
                }
            }
        }

        protected void btnMua_Click(object sender, EventArgs e)
        {
            var cart = Session["Cart1"] as Cart;

            if (cart != null)
            {
                var diaChi = txtDiaChi.Text;
                var soDienThoai = txtSoDienThoai.Text;

                var user = Session["TenDangNhap"] as DataTable;

                if (user != null)
                {
                    var userId = user.Rows[0]["MATK"].ToString();

                    string sqlTaoHoaDon = string.Format("INSERT INTO HOADON(NGAYHD, MATK, MATT, DIACHI, SODIENTHOAI) VALUES(N'{0}', {1} , {2} , N'{3}', N'{4}')",
                       DateTime.Now.ToString("yyyy-MM-dd"),
                       userId,
                       1,
                       diaChi,
                       soDienThoai);

                    _database.ExecuteNonQuery(sqlTaoHoaDon);

                    String sqlLayMaHoaDon = "SELECT MAX(MaHD) FROM HOADON";
                    int maHD = (int)_database.ExecuteScalar(sqlLayMaHoaDon);

                    Cart c = Session["Cart1"] as Cart;

                    if (c != null)
                    {
                        foreach (var r in c.ListItem)
                        {
                            var msCT = r.Value["MACTSP"].ToString();
                            var maSP = r.Value["MASP"].ToString();
                            var soLuong = r.Value["SOLUONG"].ToString();
                            //var donGia = r.Value["DONGIABAN"].ToString();
                            string sqlChiTietDonHang = string.Format("INSERT INTO CHITIETHD(MAHD, MACTSP, SOLUONG) VALUES({0},{1},{2})",
                                    maHD,
                                    msCT,
                                    soLuong

                                );

                            _database.ExecuteNonQuery(sqlChiTietDonHang);

                            sqlChiTietDonHang = "SELECT SOLUONG FROM CTSANPHAM WHERE MACTSP = " + msCT;
                            int SL = int.Parse(_database.bang(sqlChiTietDonHang).Rows[0][0].ToString());

                            sqlChiTietDonHang = string.Format("UPDATE CTSANPHAM SET SOLUONG = {0} WHERE MACTSP = {1}",
                                    SL - int.Parse(soLuong),
                                    msCT
                                );
                            _database.ExecuteNonQuery(sqlChiTietDonHang);
                        }

                    }
                }
                else
                {
                    Response.Redirect("~/Login_v2/Login.aspx");
                }
            }

            Response.Redirect("~/USER/HTTHANHTOAN.aspx");
        }
    }
}