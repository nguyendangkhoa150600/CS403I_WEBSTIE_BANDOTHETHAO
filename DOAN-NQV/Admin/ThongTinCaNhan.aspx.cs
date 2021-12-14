using DOAN_NQV.App_code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DOAN_NQV.Admin
{
    public partial class ThongTinCaNhan : System.Web.UI.Page
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
            }
        }

        private void loadData()
        {
            var user = Session["TenDangNhap"] as DataTable;
            var maTK = user.Rows[0]["MaTK"].ToString();
            SQL = "SELECT MATK, HOTEN, CASE GIOITINH WHEN 1 THEN 'Nam' ELSE N'Nữ' END AS GT, DIACHI, SDT, EMAIL, MATKHAU, TENLOAI " +
             "FROM TAIKHOAN INNER JOIN LOAITK ON TAIKHOAN.MALOAI = LOAITK.MALOAI " +
             "WHERE MATK = " + maTK;
            xuly = new SQLXuLyDuLieu(this.Page);
            DataTable dt = new DataTable();
            dt = xuly.Bang(SQL);
            Session["Taikhoan"] = dt;
            
            if (Session["Taikhoan"] != null)
            {
                dt = (DataTable)Session["Taikhoan"];
                txtHOTEN.Text = dt.Rows[0]["HOTEN"].ToString();
                txtDIACHI.Text = dt.Rows[0]["DIACHI"].ToString();
                txtSDT.Text = dt.Rows[0]["SDT"].ToString();
                txtGMAIL.Text = Encoding.Base64DecodingMethod(dt.Rows[0]["EMAIL"].ToString());
                txtMATKHAU.Attributes["value"] = Encoding.Base64DecodingMethod(dt.Rows[0]["MATKHAU"].ToString());
                txtXACNHAN.Attributes["value"] = Encoding.Base64DecodingMethod(dt.Rows[0]["MATKHAU"].ToString());
                ddlGIOITINH.SelectedIndex = ddlGIOITINH.Items.IndexOf(ddlGIOITINH.Items.FindByValue(dt.Rows[0]["GT"].ToString()));
            }
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            if (txtMATKHAU.Text != txtXACNHAN.Text)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "YourUniqueScriptKey", "alert('Xác nhận mật khẩu chưa đúng!');", true);
            }
            else
            {
                string pass = Encoding.Base64EncodingMethod(txtMATKHAU.Text);
                string email = Encoding.Base64EncodingMethod(txtGMAIL.Text);
                dt = (DataTable)Session["Taikhoan"];
                SQL = "UPDATE TAIKHOAN SET HOTEN = N'" + txtHOTEN.Text + "', GIOITINH = " + ddlGIOITINH.SelectedValue + ", DIACHI = N'" + txtDIACHI.Text +
                               "', SDT = '" + txtSDT.Text + "', EMAIL = N'" + email + "', MATKHAU = N'" + pass +
                               "' WHERE MATK = " + dt.Rows[0]["MATK"].ToString();
                xuly.thucthiSQL(SQL);
                SQL = "SELECT * FROM TAIKHOAN WHERE MATK = " + dt.Rows[0]["MATK"].ToString();
                Session["Taikhoan"] = xuly.Bang(SQL);
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "messDone()", true);
            }
        }
    }
}