using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DOAN_NQV.App_code;

namespace DOAN_NQV.USER
{
    public partial class DMK : System.Web.UI.Page
    {
        XL xuly;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            //string mkc = txtmk.Text;
            //if (mkc == null)
            //{
            //    lbtb.Text = "Bạn chưa nhập mật khẩu";
            //}
            //else
            //{
            //    btncontinue.Enabled = true;
            //}
            xuly = new XL(this.Page);
            
        }
       
        protected void btncontinue_Click(object sender, EventArgs e)
        {
            var user = Session["TenDangNhap"] as DataTable;
            var maTK = user.Rows[0]["MaTK"].ToString();
            var mkc = Encoding.Base64EncodingMethod(txtmk.Text);

            string sql = "select * from TAIKHOAN where MATK = " + maTK + " AND MATKHAU = '" +  mkc +"'";
            DataTable dt = new DataTable();
            dt = xuly.bang(sql);
            if(dt.Rows.Count>0)
            {
                Response.Redirect("~/USER/XNDMK.aspx");
            }   
            else
            {
                lbtb.Visible = true;
                lbtb.Text = "MẬT KHẨU SAI";
            }    

        }
    }
}