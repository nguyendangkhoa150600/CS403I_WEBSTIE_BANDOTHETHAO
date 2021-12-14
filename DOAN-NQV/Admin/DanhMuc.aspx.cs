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
    public partial class DanhMuc : System.Web.UI.Page
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
            SQL = "SELECT * FROM DANHMUC";
            GridView1.DataSource = xuly.Bang(SQL);
            GridView1.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (Session["madm"] == null)
                {
                    SQL = "INSERT INTO DANHMUC (TENDM)" +
                        "VALUES(N'" + txtTENDM.Text + "')";
                    xuly.thucthiSQL(SQL);
                }
                else
                {
                    SQL = "UPDATE DANHMUC " +
                        "SET TENDM = N'" + txtTENDM.Text + "' " +
                        "WHERE MADM = " + (int)Session["madm"];
                    xuly.thucthiSQL(SQL);
                }
                GridView1.DataBind();
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "messDone()", true);
                loadData();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int MADM = (int)Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            SQL = "DELETE FROM DANHMUC WHERE MADM = " + MADM;
            xuly.thucthiSQL(SQL);
            loadData();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int MADM = (int)Convert.ToInt32(GridView1.DataKeys[e.NewEditIndex].Value);
            SQL = "SELECT * FROM DANHMUC WHERE MADM = " + MADM;
            DataTable tb = xuly.Bang(SQL);
            txtTENDM.Text = tb.Rows[0]["TENDM"].ToString();
            Session["madm"] = MADM;
        }
    }
}