using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Login_v2;
namespace DOAN_NQV.Login_v2
{
    //Tran Van Son
    public partial class confirm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btncontinue_Click(object sender, EventArgs e)
        {
            var maxt = txtmxt.Text;
            if(txtmxt.Text==SignUp.Maxt)
            {
                Response.Redirect("DMKLOGIN.aspx");

            }    
            else
            {
                lbtb.Visible = true;
                lbtb.Text = "MÃ XÁC THỰC KHÔNG ĐÚNG";
            }    
        }
    }
}