using DOAN_NQV.App_code;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DOAN_NQV.Admin
{
    public partial class ThemSanPham : System.Web.UI.Page
    {
        SQLXuLyDuLieu xuly;
        String SQL;
        DataTable dt = null;
        String fName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            lbAnh1.Visible = false;
            xuly = new SQLXuLyDuLieu(this.Page);
            if (!IsPostBack)
            {
                loadDataDropDownList();
                if (Session["Sanpham"] != null)
                {
                    dt = (DataTable)Session["Sanpham"];
                    txtTENSP.Text = dt.Rows[0]["TENSP"].ToString();
                    txtCHITIETSP.Text = dt.Rows[0]["CHITIETSP"].ToString();
                    ddlNCC.SelectedIndex = ddlNCC.Items.IndexOf(ddlNCC.Items.FindByValue(dt.Rows[0]["TENNCC"].ToString()));
                    ddlDM.SelectedIndex = ddlDM.Items.IndexOf(ddlDM.Items.FindByValue(dt.Rows[0]["TENDM"].ToString()));
                    Image1.ImageUrl = "~/images/" + dt.Rows[0]["HINHANH"].ToString();
                }
                loadData();
            }
        }

        private void loadData()
        {
            dt = (DataTable)Session["Sanpham"];
            if (dt != null)
            {
                SQL = "SELECT MACTSP, TENSIZE, TENMAU, SOLUONG, DONGIANHAP, DONGIABAN " +
                    "FROM CTSANPHAM, SIZE, MAUSAC WHERE CTSANPHAM.MAMAU = MAUSAC.MAMAU AND CTSANPHAM.MASIZE = SIZE.MASIZE AND MASP = " + dt.Rows[0]["MASP"];
                GridView1.DataSource = xuly.Bang(SQL);
                GridView1.DataBind();
            }
        }

        private void loadDataDropDownList()
        {
            createDropDownList(ddlDM, "DANHMUC", "TENDM");
            createDropDownList(ddlNCC, "NHACUNGCAP", "TENNCC");
            createDropDownList(ddlSize, "SIZE", "TENSIZE");
            createDropDownList(ddlMauSac, "MAUSAC", "TENMAU");
        }

        private void createDropDownList(DropDownList ddl, string table, string str)
        {
            SQL = "SELECT * FROM " + table;
            ddl.DataSource = xuly.Bang(SQL);
            ddl.DataBind();
            ddl.DataTextField = str;
            ddl.DataValueField = str;
            ddl.DataBind();
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (Session["Sanpham"] != null) Edit();
                else Add();
                loadData();
            }
        }

        private void Edit()
        {
            dt = (DataTable)Session["Sanpham"];
            String MASP = dt.Rows[0]["MASP"].ToString();
            String fileImage = dt.Rows[0]["HINHANH"].ToString();
            if (FileUpload1.FileName != "" || Session["HINHANH"] != null)
            {
                fName = (String)Session["HINHANH"];
                Random ran = new Random();
                lbAnh1.Visible = false;
                String linkFile = Server.MapPath("~/images/") + ran.Next(0, 1000);
                if (FileUpload1.FileName != "")
                {
                    linkFile += Path.GetFileName(FileUpload1.FileName);
                    fName = FileUpload1.FileName;
                }
                else linkFile += Path.GetFileName(fName);
                FileUpload1.SaveAs(linkFile);
                fileImage = fName;
            }

            SQL = "UPDATE SANPHAM SET TENSP = N'" + txtTENSP.Text + "', CHITIETSP = N'" + txtCHITIETSP.Text + "', HINHANH = N'" + fileImage +
                "', MANCC = (SELECT MANCC FROM NHACUNGCAP WHERE TENNCC LIKE N'" + ddlNCC.SelectedValue.Trim() + "')" +
                ", MADM = (SELECT MADM FROM DANHMUC WHERE TENDM LIKE N'" + ddlDM.SelectedValue.Trim() + "')" +
                "WHERE MASP = " + MASP;
            xuly.thucthiSQL(SQL);

            addDetail();
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "messDone()", true);
        }

        private void addDetail()
        {
            if (txtSOLUONG.Text != "" && txtDONGIANHAP.Text != "" && txtDONGIABAN.Text != "")
            {
                if (Session["mactsp"] != null)
                {
                    SQL = "UPDATE CTSANPHAM SET DONGIANHAP = " + txtDONGIANHAP.Text.Trim() + ", DONGIABAN = " + txtDONGIABAN.Text.Trim() + ", SOLUONG = " + txtSOLUONG.Text.Trim() +
                        ", MAMAU = (SELECT MAMAU FROM MAUSAC WHERE TENMAU LIKE N'" + ddlMauSac.SelectedValue.Trim() + "')" +
                        ", MASIZE = (SELECT MASIZE FROM SIZE WHERE TENSIZE LIKE N'" + ddlSize.SelectedValue.Trim() + "') " +
                        "WHERE MACTSP = " + (int)Session["mactsp"];
                    Session["mactsp"] = null;
                }
                else
                {
                    dt = (DataTable)Session["Sanpham"];
                    SQL = "INSERT INTO CTSANPHAM (MAMAU, MASIZE, SOLUONG, DONGIANHAP, DONGIABAN, MASP) " +
                        "VALUES((SELECT MAMAU FROM MAUSAC WHERE TENMAU LIKE N'" + ddlMauSac.SelectedValue.Trim() + "'), " +
                        "(SELECT MASIZE FROM SIZE WHERE TENSIZE LIKE N'" + ddlSize.SelectedValue.Trim() + "'), " +
                        txtSOLUONG.Text.Trim() + ", " + txtDONGIANHAP.Text.Trim() + ", " + txtDONGIABAN.Text.Trim() + ", " + dt.Rows[0]["MASP"].ToString() + ")";
                }
                xuly.thucthiSQL(SQL);                
            }
        }

        private void Add()
        {
            if (FileUpload1.FileName != "" || Session["HINHANH"] != null)
            {
                fName = (String)Session["HINHANH"];
                Random ran = new Random();
                lbAnh1.Visible = false;
                String linkFile = Server.MapPath("~/images/") + ran.Next(0, 1000);
                if (FileUpload1.FileName != "")
                {
                    linkFile += Path.GetFileName(FileUpload1.FileName);
                    fName = FileUpload1.FileName;
                }
                else linkFile += Path.GetFileName(fName);
                FileUpload1.SaveAs(linkFile);
                SQL = "INSERT INTO SANPHAM (TENSP, CHITIETSP, HINHANH, MANCC, MADM)" +
                    "VALUES(N'" + txtTENSP.Text + "',N'" + txtCHITIETSP.Text + "',N'" +
                    fName + "'," +
                    "(SELECT MANCC FROM NHACUNGCAP WHERE TENNCC LIKE N'" + ddlNCC.SelectedValue.Trim() + "')," +
                    "(SELECT MADM FROM DANHMUC WHERE TENDM LIKE N'" + ddlDM.SelectedValue.Trim() + "'))";
                xuly.thucthiSQL(SQL);
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "messDone()", true);

                SQL = "SELECT MAX(MASP) AS MASP FROM SANPHAM";
                DataTable tb = new DataTable();
                tb = xuly.Bang(SQL);

                SQL = "SELECT MASP, HINHANH, TENSP, CHITIETSP, TENNCC, TENDM " +
               "FROM SANPHAM, DANHMUC, NHACUNGCAP WHERE SANPHAM.MADM = DANHMUC.MADM AND SANPHAM.MANCC = NHACUNGCAP.MANCC AND MASP = " + tb.Rows[0]["MASP"].ToString();
                tb = new DataTable();
                tb = xuly.Bang(SQL);
                Session["Sanpham"] = tb;

                addDetail();
            }
            else lbAnh1.Visible = true;
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/SanPham.aspx");
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            if (FileUpload1.FileName != "")
            {
                fName = FileUpload1.FileName;
                Session["HINHANH"] = fName;
                HttpPostedFile myFile = FileUpload1.PostedFile;
                myFile.SaveAs(MapPath(System.IO.Path.GetFileName(myFile.FileName).ToLower().ToString()));
                Image1.ImageUrl = System.IO.Path.GetFileName(myFile.FileName).ToLower().ToString();
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            loadData();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int MACTSP = (int)Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            SQL = "DELETE FROM CTSANPHAM WHERE MACTSP = " + MACTSP;
            xuly.thucthiSQL(SQL);
            loadData();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int MACTSP = (int)Convert.ToInt32(GridView1.DataKeys[e.NewEditIndex].Value);

            SQL = "SELECT MACTSP, TENSIZE, TENMAU, SOLUONG, DONGIANHAP, DONGIABAN " +
                  "FROM CTSANPHAM, SIZE, MAUSAC WHERE CTSANPHAM.MAMAU = MAUSAC.MAMAU AND CTSANPHAM.MASIZE = SIZE.MASIZE AND MACTSP = " + MACTSP;
            DataTable tb = xuly.Bang(SQL);
            txtDONGIABAN.Text = tb.Rows[0]["DONGIABAN"].ToString();
            txtDONGIANHAP.Text = tb.Rows[0]["DONGIANHAP"].ToString();
            txtSOLUONG.Text = tb.Rows[0]["SOLUONG"].ToString();
            if (tb.Rows[0]["TENMAU"].ToString() != "")
                ddlMauSac.SelectedIndex = ddlMauSac.Items.IndexOf(ddlMauSac.Items.FindByValue(tb.Rows[0]["TENMAU"].ToString()));
            if (tb.Rows[0]["TENSIZE"].ToString() != "")
                ddlSize.SelectedIndex = ddlSize.Items.IndexOf(ddlSize.Items.FindByValue(tb.Rows[0]["TENSIZE"].ToString()));
            Session["mactsp"] = MACTSP;
        }
    }
}