using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using webBanThietBiMayTinh.App_Code;

namespace DOAN_NQV.USER
{

    public partial class CTSP : System.Web.UI.Page
    {
        XL xl;
        DataTable dt;
        String sql;

        public string HinhAnh { get; set; }
        public string TenSP { get; set; }
        public string DonGia { get; set; }
        public string ThanhTien { get; set; }
        public string Tyle { get; set; }
        public string ChiTietSP { get; set; }
        public string MaCTSP { get; set; }
        public string MaSP { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            xl = new XL(this.Page);
            tbDangNhap.Visible = false;
            Session["Cart1"] = null;
            String sqlCarerory = @"SELECT * FROM SANPHAM WHERE MADM = 3 OR MADM=4";
            DataTable dtCaterory = xl.bang(sqlCarerory);
            String MASP = Request.QueryString.Get("MASP");
            if (MASP != null)
            {
                if (dtCaterory.Rows.Count > 0)
                {
                    sql = @"SELECT SANPHAM.MASP, TENSP, CHITIETSP, DBO.GETPRICE(SANPHAM.MASP), HINHANH, CASE WHEN  DBO.KTKM(SANPHAM.MASP) > 0
                    THEN cast(DBO.GETPRICE(SANPHAM.MASP) as nvarchar(15))+N' đ ' ELSE '' END AS DONGIA, 
                    CASE WHEN  DBO.KTKM(SANPHAM.MASP) > 0
                    THEN '-' + cast(DBO.KTKM(SANPHAM.MASP) as nvarchar(15)) + '%'  ELSE '' END AS TYLE, 
                    CASE WHEN  DBO.KTKM(SANPHAM.MASP) > 0
                    THEN(1 - (DBO.KTKM(SANPHAM.MASP) / 100)) * DBO.GETPRICE(SANPHAM.MASP)  ELSE DBO.GETPRICE(SANPHAM.MASP) END AS THANHTIEN,
                    CTSANPHAM.MACTSP, CTSANPHAM.MACTSP, CTSANPHAM.MASIZE, SIZE.TENSIZE, CTSANPHAM.MAMAU, MAUSAC.TENMAU, CTSANPHAM.SOLUONG, CTSANPHAM.DONGIANHAP, CTSANPHAM.DONGIABAN
                    FROM SANPHAM LEFT JOIN DANHMUC
					ON DANHMUC.MADM = SANPHAM.MADM
					LEFT JOIN CTSANPHAM
					ON SANPHAM.MASP = CTSANPHAM.MASP
					LEFT JOIN SIZE
					ON CTSANPHAM.MASIZE = SIZE.MASIZE
					LEFT JOIN MAUSAC
					ON CTSANPHAM.MAMAU = MAUSAC.MAMAU
					WHERE CTSANPHAM.MASP =" + MASP;
                    //"select MASP, TENSP, CHITIETSP, DONGIABAN, SOLUONG, DONGIABAN*SOLUONG as THANHTIEN, HINHANH from SANPHAM WHERE MASP=" + MASP;
                    dt = xl.bang(sql);
                    this.rpChiTiet.DataSource = dt;
                    this.rpChiTiet.DataBind();
                    DataRow row = dt.Rows[0];
                    Image1.ImageUrl = "/images/" + row["HinhAnh"].ToString();
                    TenSP = row["TENSP"].ToString();
                    DonGia = row["DONGIA"].ToString();
                    ThanhTien = row["THANHTIEN"].ToString();
                    Tyle = row["Tyle"].ToString();
                    ChiTietSP = row["CHITIETSP"].ToString();
                    MaCTSP = row["MACTSP"].ToString();
                    MaSP = row["MASP"].ToString();

                    if (!IsPostBack)
                    {
                        List<ProductColor> colors = new List<ProductColor>();
                        List<ProductSize> sizes = new List<ProductSize>();
                        foreach (DataRow r in dt.Rows)
                        {
                            if (!colors.Any(x => x.MaMau == r.Field<int?>("MaMau")))
                            {
                                colors.Add(new ProductColor()
                                {
                                    MaMau = r.Field<int?>("MaMau") ?? -1,
                                    TenMau = r.Field<string>("TenMau") ?? ""
                                });
                            }

                            if (!sizes.Any(x => x.MaSize == r.Field<int?>("MaSize")))
                            {
                                sizes.Add(new ProductSize()
                                {
                                    MaSize = r.Field<int?>("MaSize") ?? -1,
                                    TenSize = r.Field<string>("TenSize") ?? ""
                                });
                            }


                        }

                        listSize.DataSource = sizes;
                        listSize.DataBind();
                        listMau.DataSource = colors;
                        listMau.DataBind();

                        int soLuong = Convert.ToInt32(dt.Rows[0]["SOLUONG"].ToString());

                        for (int i = 1; i <= soLuong; i++)
                        {
                            ddlSoLuong.Items.Add(i.ToString());
                        }
                    }

                    //String sql100 = "SELECT CTSANPHAM.MASIZE, MACTSP, MASP, CTSANPHAM.MAMAU, CTSANPHAM.MASIZE, TENMAU, TENSIZE FROM CTSANPHAM, MAUSAC, SIZE " +
                    //               "WHERE CTSANPHAM.MAMAU = MAUSAC.MAMAU AND CTSANPHAM.MASIZE = SIZE.MASIZE " +
                    //               "AND MASP  =  " + MASP;
                    //DataTable dt2 = xl.bang(sql100);

                    //if (!IsPostBack)
                    //{
                    //int sizeNum = Convert.ToInt32(dt2.Rows[0]["MASIZE"].ToString());
                    //listSize.Items.Add("")
                    //String size = dt2.Rows[0]["TENSIZE"].ToString();
                    //for (int j = 1; j <= sizeNum; j++)
                    //{
                    //    listSize.Items.Add(size.ToString());
                    //}
                    //}
                }
                //this.rpsize.DataSource = dt2;
                //this.rpsize.DataBind();
                //this.rpcolor.DataSource = dt2;
                //this.rpcolor.DataBind();
            }
        }

        protected void gioHang_Click(object sender, EventArgs e)
        {
            if (Session["TenDangNhap"] != null)
            {
                Cart cart;
                int soLuongTon = Convert.ToInt32(dt.Rows[0]["SOLUONG"].ToString());

                if (Session["Cart"] != null)
                {
                    cart = (Cart)Session["Cart"];
                }
                else
                {
                    cart = new Cart();
                }
                int maMau = Convert.ToInt32(listMau.SelectedValue);
                int maSize = Convert.ToInt32(listSize.SelectedValue);

                String MASP = Request.QueryString.Get("MASP");
                sql = @"SELECT CTSANPHAM.MACTSP, TENSP, 
                    CASE WHEN  DBO.KTKM(SANPHAM.MASP) > 0 
                    THEN (1-(DBO.KTKM(SANPHAM.MASP)/100))*DONGIABAN  ELSE DONGIABAN END AS DONGIA, 
                    SOLUONG, 
                    CASE WHEN  DBO.KTKM(SANPHAM.MASP) > 0 
                    THEN (1-(DBO.KTKM(SANPHAM.MASP)/100))*DONGIABAN*SOLUONG  ELSE DONGIABAN*SOLUONG END AS THANHTIEN, 
                    HINHANH, SANPHAM.MASP, CTSANPHAM.MASIZE, SIZE.TENSIZE, CTSANPHAM.MAMAU, MAUSAC.TENMAU
                    FROM SANPHAM LEFT JOIN DANHMUC
					ON DANHMUC.MADM = SANPHAM.MADM
					LEFT JOIN CTSANPHAM
					ON SANPHAM.MASP = CTSANPHAM.MASP
					LEFT JOIN SIZE
					ON CTSANPHAM.MASIZE = SIZE.MASIZE
					LEFT JOIN MAUSAC
					ON CTSANPHAM.MAMAU = MAUSAC.MAMAU
                    WHERE SANPHAM.MASP = " + MASP;
                if (maSize >= 0 && maMau >= 0)
                    sql = sql + " AND CTSANPHAM.MASIZE = " + maSize + " AND CTSANPHAM.MAMAU = " + maMau;
                //"select MASP, TENSP, DONGIABAN, SOLUONG, DONGIABAN*SOLUONG as THANHTIEN, HINHANH from SANPHAM WHERE MASP=" + MASP;
                dt = xl.bang(sql);
                dt.Rows[0]["SOLUONG"] = ddlSoLuong.SelectedValue;

                cart.Add(dt.Rows[0], soLuongTon);

                Session["Cart"] = cart;
                Response.Redirect("GIOHANG.aspx");
            }
            else
                Response.Redirect("/Login_v2/Login.aspx");
        }

        protected void muaNgay_Click(object sender, EventArgs e)
        {
            if (Session["TenDangNhap"] != null)
            {
                Cart cart1 = new Cart();
                int soLuongTon = Convert.ToInt32(dt.Rows[0]["SOLUONG"].ToString());

                if (Session["Cart1"] != null)
                {
                    cart1 = (Cart)Session["Cart1"];
                }
                int maMau = Convert.ToInt32(listMau.SelectedValue);
                int maSize = Convert.ToInt32(listSize.SelectedValue);

                String MASP = Request.QueryString.Get("MASP");
                sql = @"SELECT SANPHAM.MASP, TENSP, 
                    CASE WHEN  DBO.KTKM(SANPHAM.MASP) > 0 
                    THEN (1-(DBO.KTKM(SANPHAM.MASP)/100))*DONGIABAN  ELSE DONGIABAN END AS DONGIA, 
                    SOLUONG, 
                    CASE WHEN  DBO.KTKM(SANPHAM.MASP) > 0 
                    THEN (1-(DBO.KTKM(SANPHAM.MASP)/100))*DONGIABAN*SOLUONG  ELSE DONGIABAN*SOLUONG END AS THANHTIEN, 
                    HINHANH, CTSANPHAM.MACTSP, CTSANPHAM.MASIZE, SIZE.TENSIZE, CTSANPHAM.MAMAU, MAUSAC.TENMAU
                    FROM SANPHAM LEFT JOIN DANHMUC
					ON DANHMUC.MADM = SANPHAM.MADM
					LEFT JOIN CTSANPHAM
					ON SANPHAM.MASP = CTSANPHAM.MASP
					LEFT JOIN SIZE
					ON CTSANPHAM.MASIZE = SIZE.MASIZE
					LEFT JOIN MAUSAC
					ON CTSANPHAM.MAMAU = MAUSAC.MAMAU
                    WHERE SANPHAM.MASP = " + MASP;
                if (maSize >= 0 && maMau >= 0)
                    sql = sql + " AND CTSANPHAM.MASIZE = " + maSize + " AND CTSANPHAM.MAMAU = " + maMau;
                //"select MASP, TENSP, DONGIABAN, SOLUONG, DONGIABAN*SOLUONG as THANHTIEN, HINHANH from SANPHAM WHERE MASP=" + MASP;
                dt = xl.bang(sql);
                dt.Rows[0]["SOLUONG"] = ddlSoLuong.SelectedValue;

                cart1.Add(dt.Rows[0], soLuongTon);
                Session["Cart1"] = cart1;

                Response.Redirect("MUANGAY.aspx");
            }
            ////else tbDangNhap.Visible = true;
            else
                Response.Redirect("/Login_v2/Login.aspx");
        }

        private void LoadSoLuong()
        {
            if (string.IsNullOrEmpty(MaCTSP))
                return;

            if (!string.IsNullOrEmpty(listSize.SelectedValue.ToString()) && !string.IsNullOrEmpty(listMau.SelectedValue.ToString()))
            {
                string query = string.Format("SELECT SOLUONG FROM CTSANPHAM WHERE MASP = {0} AND MASIZE = {1} AND MAMAU = {2}", MaSP, listSize.SelectedValue.ToString(), listMau.SelectedValue.ToString()); ;
                var dt = xl.bang(query);
                int soLuong = dt.Rows[0].Field<int?>("SOLUONG") ?? 0;
                ddlSoLuong.Items.Clear();
                for (int i = 1; i <= soLuong; i++)
                {
                    ddlSoLuong.Items.Add(i.ToString());
                }
            }
        }

        protected void listSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            
                LoadSoLuong();
        }

        protected void listMau_SelectedIndexChanged(object sender, EventArgs e)
        {
            
                LoadSoLuong();
        }
    }
}