using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webBanThietBiMayTinh.App_Code;

namespace DOAN_NQV.USER
{
    public partial class GIOHANG : System.Web.UI.Page
    {
        Cart cart;
        XL _database;

        private void loadGioHang(Cart cart)
        {
            if (cart.displayData().Rows.Count > 0)
            {
                setStatusEmptyGridview(false);
                this.grdGioHang.DataSource = cart.displayData();
                this.grdGioHang.DataBind();
                this.grdGioHang.FooterRow.Cells[3].Text = "Tổng tiền";
                this.grdGioHang.FooterRow.Cells[4].Text = cart.Total().ToString();
                foreach (GridViewRow row in grdGioHang.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {

                        TextBox txtQty = row.Cells[3].FindControl("txtQuantity") as TextBox;
                        if (txtQty != null)
                        {
                            txtQty.Enabled = false;
                        }

                    }
                }
            }
            else
            {
                setStatusEmptyGridview(true);
                this.grdGioHang.DataSource = cart.displayData();
                this.grdGioHang.DataBind();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            _database = new XL(this);
            if (Session["Cart"] != null)
            {
                cart = (Cart)Session["Cart"];
                if (!IsPostBack)
                {
                    loadGioHang(cart);
                }
            }
        }

        protected void btnRemove_Click1(object sender, EventArgs e)
        {

            Button btn = sender as Button;
            foreach (GridViewRow row in grdGioHang.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    if (row.Cells[0].Text == btn.CommandArgument)
                    {
                        cart.Remove(row.Cells[0].Text);
                    }
                }
            }

            Session["Cart"] = cart;
            loadGioHang(cart);
        }

        protected void btnMuaSam_Click(object sender, EventArgs e)
        {
            Response.Redirect("DSSP.aspx");
        }

        protected void btnMuaSam_Click1(object sender, EventArgs e)
        {
            Response.Redirect("DSSP.aspx");
        }

        protected void btnXacNhanGH_Click(object sender, EventArgs e)
        {
            
            var selectedItems = new Cart();
            bool check = false;
            foreach (GridViewRow item in this.grdGioHang.Rows)
            {
                CheckBox chk = (CheckBox)item.FindControl("CheckBox1");

                if (chk.Checked)
                {
                    check = true;
                    var maSP = item.Cells[0].Text.Trim();
                    TextBox txtQty = item.Cells[3].FindControl("txtQuantity") as TextBox;
                    int qty = int.Parse(txtQty.Text);
                    selectedItems.Add(cart.ListItem[maSP], qty);
                    Session["Cart1"] = selectedItems;
                }

            }

            //Response.Write("<script>");
            //Response.Write("<script> alert('Bạn vẫn chưa chọn sản phẩm nào để mua') </script>");
            //Response.Write("</script>");
            //if (ListItem[selectedItems]. == 0) { hien thong bao chua co cai nao duoc chọn} else { ...}
            if (check)
            {
                Response.Redirect("MUANGAY.aspx");
            }
            else
            {
                lbtbcdh.Visible = true;
            }


        }


        private void setStatusEmptyGridview(bool status)
        {
            if (status)
            {
                lb1.Visible = true;
                btn1.Visible = true;
                //btnRemove.Visible = false;
                btnMuaSam1.Visible = false;
                btnXacNhanGH.Visible = false;
            }
            else
            {
                lb1.Visible = false;
                btn1.Visible = false;
                //btnRemove.Visible = true;
                btnMuaSam1.Visible = true;
                btnXacNhanGH.Visible = true;
            }
        }
        protected void btnIncreateQuantity_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
           
            foreach (GridViewRow row in grdGioHang.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    if (row.Cells[0].Text == btn.CommandArgument)
                    {
                        
                        TextBox txtQty = row.Cells[3].FindControl("txtQuantity") as TextBox;
                        LinkButton btnincreate = row.Cells[3].FindControl("btnIncreate") as LinkButton ;
                        int qty = int.Parse(txtQty.Text);

                        var maCTSP = int.Parse(row.Cells[0].Text);
                        //var maSize = int.Parse(row.Cells[6].Text);
                        //var maMau = int.Parse(row.Cells[8].Text);

                        string sqllaysoluong = "SELECT SOLUONG FROM CTSANPHAM WHERE MACTSP = " + maCTSP;
                            //+ " AND MASIZE = " + maSize + " AND MAMAU = " + maMau;
                        int SL = int.Parse(_database.bang(sqllaysoluong).Rows[0][0].ToString());

                        if (qty < SL)
                        {
                            this.cart.Update(btn.CommandArgument, qty + 1);
                            txtQty.Text = (qty + 1).ToString();
                            Session["Cart"] = cart;
                            loadGioHang(cart);

                        }
                        else
                        {
                            btnincreate.Visible = false;
                        }




                    }
                }
            }
        }


        protected void btnDecreateQuantity_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            foreach (GridViewRow row in grdGioHang.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    if (row.Cells[0].Text == btn.CommandArgument)
                    {
                        TextBox txtQty = row.Cells[3].FindControl("txtQuantity") as TextBox;
                        int qty = int.Parse(txtQty.Text);
                        if (qty > 1)
                        {
                            this.cart.Update(btn.CommandArgument, qty - 1);
                            txtQty.Text = (qty - 1).ToString();
                            Session["Cart"] = cart;
                            loadGioHang(cart);
                        }
                    }
                }
            }
        }
    }
}