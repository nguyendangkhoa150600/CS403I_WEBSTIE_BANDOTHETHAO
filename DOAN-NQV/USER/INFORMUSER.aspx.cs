using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DOAN_NQV.App_code;
using System.Data;
using DOAN_NQV.SHARED;

namespace DOAN_NQV.USER
{
    public partial class INFORMUSER : System.Web.UI.Page
    {
        SQLXuLyDuLieu xuly;
        String SQL;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            txtMATKHAU.ReadOnly = true;
            txtGMAIL.ReadOnly = true;
            var user = Session["TenDangNhap"] as DataTable;
            var maTK = user.Rows[0]["MaTK"].ToString();
            SQL = "SELECT MATK, HOTEN, CASE GIOITINH WHEN 1 THEN 'Nam' ELSE N'Nữ' END AS GT, DIACHI, SDT, EMAIL, MATKHAU, TENLOAI " +
             "FROM TAIKHOAN INNER JOIN LOAITK ON TAIKHOAN.MALOAI = LOAITK.MALOAI " +
             "WHERE MATK = " + maTK;
            xuly = new SQLXuLyDuLieu(this.Page);
            DataTable dt = new DataTable();
            dt = xuly.Bang(SQL);
            Session["Taikhoan"] = dt;
            dt = (DataTable)Session["Taikhoan"];
            if (!IsPostBack)
            {
                loadDataDropDownList();
                if (Session["Taikhoan"] != null)
                {
                    
                   
                    txtHOTEN.Text = dt.Rows[0]["HOTEN"].ToString();
                    txtDIACHI.Text = dt.Rows[0]["DIACHI"].ToString();
                    txtSDT.Text = dt.Rows[0]["SDT"].ToString();
                    txtGMAIL.Text = Encoding.Base64DecodingMethod(dt.Rows[0]["EMAIL"].ToString());
                    txtMATKHAU.Attributes["value"] = Encoding.Base64DecodingMethod(dt.Rows[0]["MATKHAU"].ToString());
                    ddlGIOITINH.SelectedIndex = ddlGIOITINH.Items.IndexOf(ddlGIOITINH.Items.FindByValue(dt.Rows[0]["GT"].ToString()));
                  



                }
            }
        }

        private void loadDataDropDownList()
        {
            ddlGIOITINH.Items.Add("Nam");
            ddlGIOITINH.Items.Add("Nữ");

          
        }
        protected void btnExit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/USER/DSSP.aspx");
        }


        protected void btnDone_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                var user = Session["TenDangNhap"] as DataTable;
                var maTK = user.Rows[0]["MaTK"].ToString();
                int GT = 1;
                string PASS = Encoding.Base64EncodingMethod(txtMATKHAU.Text);
                string MAIL = Encoding.Base64EncodingMethod(txtGMAIL.Text);

                if (ddlGIOITINH.SelectedValue == "Nữ") GT = 0;
                if (Session["Taikhoan"] != null)
                {

                  
                    SQL = "UPDATE TAIKHOAN SET HOTEN = N'" + txtHOTEN.Text + "', GIOITINH = " + GT + ", DIACHI = N'" + txtDIACHI.Text +
                        "', SDT = '" + txtSDT.Text + "'" +
                         " WHERE MATK = " + maTK;
                    xuly.thucthiSQL(SQL);
                }
                else
                {
                  
                }
                user.Rows[0].SetField<string>("HoTen", txtHOTEN.Text);
                (Page.Master as MP).drnameuser.Text = "Xin chào " + txtHOTEN.Text;
                Session["TenDangNhap"] = user;
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "messDone()", true);
            }
        }
    }
}