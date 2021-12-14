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
    public partial class NhaCungCap : System.Web.UI.Page
    {
        SQLXuLyDuLieu xuly;
        String SQL;

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
            SQL = "SELECT * FROM NHACUNGCAP";
            GridView1.DataSource = xuly.Bang(SQL);
            GridView1.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (Session["mancc"] == null)
                {
                    SQL = "INSERT INTO NHACUNGCAP (TENNCC, DIACHI, SDT)" +
                        "VALUES(N'" + txtTENNCC.Text + "',N'" + txtDIACHI.Text + "','" + txtSDT.Text + "')";
                }
                else
                {
                    SQL = "UPDATE NHACUNGCAP " +
                        "SET TENNCC = N'" + txtTENNCC.Text + "', DIACHI = N'" + txtDIACHI.Text + "', SDT = '" + txtSDT.Text + "' " +
                        "WHERE MANCC = " + (int)Session["mancc"];
                    Session["mancc"] = null;
                }
                xuly.thucthiSQL(SQL);
                GridView1.DataBind();
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "messDone()", true);
                loadData();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int MANCC = (int)Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            SQL = "DELETE FROM NHACUNGCAP WHERE MANCC = " + MANCC;
            xuly.thucthiSQL(SQL);
            loadData();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int MANCC = (int)Convert.ToInt32(GridView1.DataKeys[e.NewEditIndex].Value);
            SQL = "SELECT * FROM NHACUNGCAP WHERE MANCC = " + MANCC;
            DataTable tb = xuly.Bang(SQL);
            txtTENNCC.Text = tb.Rows[0]["TENNCC"].ToString();
            txtDIACHI.Text = tb.Rows[0]["DIACHI"].ToString();
            txtSDT.Text = tb.Rows[0]["SDT"].ToString();
            Session["mancc"] = MANCC;
        }
    }
}