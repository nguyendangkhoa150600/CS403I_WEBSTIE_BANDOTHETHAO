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
    public partial class XNDMK : System.Web.UI.Page
    {
        XL xl;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            xl = new XL(this.Page);
        }

        protected void btnconfirm_Click(object sender, EventArgs e)
        {
            var user = Session["TenDangNhap"] as DataTable;
            var maTK = user.Rows[0]["MaTK"].ToString();
            var mkm1 = Encoding.Base64EncodingMethod(txtmkm.Text);
            var mkm12 = Encoding.Base64EncodingMethod(txtmkm2.Text);
            if(mkm1==mkm12)
            {  
            string sql = "UPDATE TAIKHOAN SET MATKHAU = '" + mkm1 + "' WHERE MATK = "+ maTK;
                xl.ExecuteNonQuery(sql);
                lbtb.Visible = true;
                lbtb.Text = "THAY ĐỔI THÀNH CÔNG ";
            }
            else
            {
                lbtb.Visible = true;
                lbtb.Text = "Hai mật khẩu không giống nhau ";
            }    

        }
    }
}