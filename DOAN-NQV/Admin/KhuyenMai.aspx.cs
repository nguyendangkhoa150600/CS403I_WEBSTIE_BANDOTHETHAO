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
    public partial class KhuyenMai : System.Web.UI.Page
    {
        SQLXuLyDuLieu xuly;
        String SQL;
        DateTime dateTime;

        protected void Page_Load(object sender, EventArgs e)
        {
            xuly = new SQLXuLyDuLieu(this.Page);
            if (!IsPostBack)
            {
                setTrangThaiKM();
                setValueTGBD();
                loadData();
            }
        }

        private void loadData()
        {
            SQL = "SELECT MAKM, TENKM, NGAYBD, NGAYKT, TENTT, KHUYENMAI.MATT " +
                "FROM KHUYENMAI, TRANGTHAIKM " +
                "WHERE KHUYENMAI.MATT = TRANGTHAIKM.MATT";
            GridView1.DataSource = xuly.Bang(SQL);
            GridView1.DataBind();
        }

        private void setTrangThaiKM()
        {
            SQL = "UPDATE KHUYENMAI SET MATT = 1 WHERE GETDATE() < NGAYBD";
            xuly.thucthiSQL(SQL);
            SQL = "UPDATE KHUYENMAI SET MATT = 2 WHERE NGAYBD <= GETDATE() AND GETDATE() <= NGAYKT";
            xuly.thucthiSQL(SQL);
            SQL = "UPDATE KHUYENMAI SET MATT = 3 WHERE GETDATE() > NGAYKT";
            xuly.thucthiSQL(SQL);
            GridView1.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (DateTime.Parse(txtNGAYBD.Text + " " + txtTDBD.Text) < DateTime.Parse(txtNGAYKT.Text + " " + txtTDKT.Text))
                {
                    Label6.Visible = false;
                    if (Session["makm"] == null)
                    {
                        SQL = "INSERT INTO KHUYENMAI (TENKM, NGAYBD, NGAYKT, MATT, MAAD)" +
                        "VALUES(N'" + txtTENKM.Text + "','" + txtNGAYBD.Text + " " + txtTDBD.Text + "','" + txtNGAYKT.Text + " " + txtTDKT.Text + "', 1, 1)";
                    }
                    else
                    {
                        SQL = "UPDATE KHUYENMAI SET TENKM = N'" + txtTENKM.Text + "', NGAYBD = '" + txtNGAYBD.Text + " " + txtTDBD.Text + "'," +
                            " NGAYKT = '" + txtNGAYKT.Text + " " + txtTDKT.Text + "' WHERE MAKM = " + int.Parse(Session["makm"].ToString());
                        Session["makm"] = null;
                    }
                    xuly.thucthiSQL(SQL);
                    GridView1.DataBind();
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "messDone()", true);
                    loadData();
                }
                else Label6.Visible = true;
            }
        }

        private void setValueTGBD()
        {
            dateTime = DateTime.UtcNow.Date;
            txtNGAYBD.Text = DateTime.Now.ToString("yyyy-MM-dd");
            txtTDBD.Text = DateTime.Now.AddMinutes(10).ToString("hh\\:mm");
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int MAKM = (int)Convert.ToInt32(GridView1.DataKeys[e.NewSelectedIndex].Value);

            SQL = "SELECT * FROM KHUYENMAI WHERE MAKM = " + MAKM;
            DataTable dt = new DataTable();
            dt = xuly.Bang(SQL);
            Session["Khuyenmai"] = dt;
            Response.Redirect("~/Admin/ChiTietKhuyenMai.aspx");
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int MAKM = (int)Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            SQL = "DELETE FROM KHUYENMAI WHERE MAKM = " + MAKM;
            xuly.thucthiSQL(SQL);
            loadData();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int MAKM = (int)Convert.ToInt32(GridView1.DataKeys[e.NewEditIndex].Value);

            SQL = "SELECT * FROM KHUYENMAI WHERE MAKM = " + MAKM;
            DataTable tb = xuly.Bang(SQL);
            txtTENKM.Text = tb.Rows[0]["TENKM"].ToString();
            txtNGAYBD.Text = DateTime.Parse(tb.Rows[0]["NGAYBD"].ToString()).ToString("yyyy-MM-dd");
            txtTDBD.Text = DateTime.Parse(tb.Rows[0]["NGAYBD"].ToString()).ToString("hh\\:mm");
            txtNGAYKT.Text = DateTime.Parse(tb.Rows[0]["NGAYKT"].ToString()).ToString("yyyy-MM-dd");
            txtTDKT.Text = DateTime.Parse(tb.Rows[0]["NGAYKT"].ToString()).ToString("hh\\:mm");
            xuly.thucthiSQL(SQL);
            Session["makm"] = MAKM;
            loadData();
        }
    }
}