using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using webBanThietBiMayTinh.App_Code;

namespace DOAN_NQV.USER
{
    public partial class HTTHANHTOAN : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Session["Cart1"] = new Cart();
                Session["Cart"] = new Cart();
            }

        }


        protected void btnMuaSam_Click1(object sender, EventArgs e)
        {
            Response.Redirect("DSSP.aspx");
        }
    }
}