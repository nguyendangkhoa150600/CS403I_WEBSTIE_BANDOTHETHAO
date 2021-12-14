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
    public partial class ChiTietKhuyenMai : System.Web.UI.Page
    {
        SQLXuLyDuLieu xuly;
        String SQL;
        String MAKM;
        DataTable dtKM;

        protected void Page_Load(object sender, EventArgs e)
        {
            xuly = new SQLXuLyDuLieu(this.Page);
            dtKM = (DataTable)Session["Khuyenmai"];
            if (dtKM.Rows[0]["MATT"].ToString() != "1") btnDone.Visible = false;
            if (!IsPostBack)
            {
                if (dtKM != null)
                {
                    lbKM.Text += ": " + dtKM.Rows[0]["TENKM"].ToString();
                    if (dtKM.Rows[0]["MAAD"].ToString() != "")
                    {
                        RadioButtonList1.SelectedIndex = (int.Parse(dtKM.Rows[0]["MAAD"].ToString()) - 1);
                        loadData();
                    }
                }
            }
        }

        private void loadData()
        {
            DataTable dt = new DataTable();
            SQL = "SELECT MASP, HINHANH, TENSP, TENDM, TENNCC FROM SANPHAM, DANHMUC, NHACUNGCAP" +
                " WHERE NHACUNGCAP.MANCC = SANPHAM.MANCC AND DANHMUC.MADM = SANPHAM.MADM";
            GridViewSP.DataSource = xuly.Bang(SQL);
            GridViewSP.DataBind(); 
            SQL = "SELECT * FROM DANHMUC";
            GridViewDM.DataSource = xuly.Bang(SQL);
            GridViewDM.DataBind();
            MAKM = dtKM.Rows[0]["MAKM"].ToString();
            SQL = "SELECT * FROM CHITIETKM WHERE MAKM = " + MAKM;
            dt = xuly.Bang(SQL);

            if (dt.Rows.Count > 0)
            {
                txtTYLEKM.Text = dt.Rows[0]["TYLEKM"].ToString();
                txtGHICHU_TC.Text = dt.Rows[0]["GHICHU"].ToString();

                if (RadioButtonList1.SelectedIndex == 0)
                {
                    // do nothing
                }
                else if (RadioButtonList1.SelectedIndex == 1)
                {
                    GridViewDM.Visible = true;
                    foreach (GridViewRow item in this.GridViewDM.Rows)
                    {
                        int MADM = Convert.ToInt32(GridViewDM.DataKeys[item.RowIndex].Value);
                        CheckBox chk = (CheckBox)item.FindControl("chkDM");


                        SQL = "SELECT * FROM CHITIETKM WHERE MAKM = " + MAKM + " AND MASP IN (SELECT MASP FROM SANPHAM WHERE MADM = " + MADM + ")";
                        DataTable dt1 = new DataTable();
                        dt1 = xuly.Bang(SQL);

                        if (dt1.Rows.Count > 0)
                            chk.Checked = true;
                    }
                }
                else
                {
                    GridViewSP.Visible = true;
                    foreach (GridViewRow item in this.GridViewSP.Rows)
                    {
                        int MASP = Convert.ToInt32(GridViewSP.DataKeys[item.RowIndex].Value);
                        CheckBox chk = (CheckBox)item.FindControl("chkSP");


                        SQL = "SELECT * FROM CHITIETKM WHERE MAKM = " + MAKM + " AND MASP = " + MASP;
                        DataTable dt1 = new DataTable();
                        dt1 = xuly.Bang(SQL);

                        if (dt1.Rows.Count > 0)
                            chk.Checked = true;
                    }
                }
            }
            

        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedIndex == 0)
            {
                GridViewDM.Visible = false;
                GridViewSP.Visible = false;

            }
            else if (RadioButtonList1.SelectedIndex == 1)
            {
                GridViewDM.Visible = true;
                GridViewSP.Visible = false;
            }
            else
            {
                GridViewSP.Visible = true;
                GridViewDM.Visible = false;
            }
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            SQL = "SELECT MASP FROM SANPHAM";
            DataTable dt = new DataTable();
            dt = xuly.Bang(SQL);
            MAKM = dtKM.Rows[0]["MAKM"].ToString();

            SQL = "DELETE FROM CHITIETKM WHERE MAKM = " + MAKM;
            xuly.thucthiSQL(SQL);

            if (RadioButtonList1.SelectedIndex == 0)
            {
                SQL = "UPDATE KHUYENMAI SET MAAD = 1 WHERE MAKM = " + MAKM;
                xuly.thucthiSQL(SQL);
                foreach (DataRow item in dt.Rows)
                {
                    SQL = "INSERT INTO CHITIETKM (MAKM, MASP, TYLEKM, GHICHU) " +
                        "VALUES(" + MAKM + "," + item["MASP"].ToString() + "," + txtTYLEKM.Text + ",N'" + txtGHICHU_TC.Text + "')";
                    xuly.thucthiSQL(SQL);
                }
            }
            else if (RadioButtonList1.SelectedIndex == 1)
            {
                SQL = "UPDATE KHUYENMAI SET MAAD = 2 WHERE MAKM = " + MAKM;
                xuly.thucthiSQL(SQL);
                foreach (GridViewRow item in this.GridViewDM.Rows)
                {
                    CheckBox chk = (CheckBox)item.FindControl("chkDM");
                    if (chk.Checked)
                    {

                        SQL = "KM_DM " + MAKM + "," + (item.RowIndex + 1) + "," +
                             txtTYLEKM.Text + ",N'" + txtGHICHU_TC.Text + "'";
                        xuly.thucthiSQL(SQL);
                    }
                }
            }
            else
            {
                SQL = "UPDATE KHUYENMAI SET MAAD = 3 WHERE MAKM = " + MAKM;
                xuly.thucthiSQL(SQL);
                foreach (GridViewRow item in this.GridViewSP.Rows)
                {
                    CheckBox chk = (CheckBox)item.FindControl("chkSP");
                    if (chk.Checked)
                    {
                        SQL = "INSERT INTO CHITIETKM (MAKM, MASP, TYLEKM, GHICHU) " +
                        "VALUES(" + MAKM + "," + dt.Rows[item.RowIndex]["MASP"].ToString() + "," + txtTYLEKM.Text + ",N'" + txtGHICHU_TC.Text + "')";
                        xuly.thucthiSQL(SQL);
                    }
                }
            }
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "messDone()", true);
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/KhuyenMai.aspx");
        }

        protected void GridViewSP_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewSP.PageIndex = e.NewPageIndex;
            loadData();
        }
    }
}