using DOAN_NQV;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using WebApplication1.Login_v2;
using DOAN_NQV.App_code;

namespace DOAN_NQV.Login_v2
{
    public partial class QMK : System.Web.UI.Page
    {
        XL xl;
      
        DataTable dt;
        Dictionary<string, string> dic;
        protected void Page_Load(object sender, EventArgs e)
        {
            xl = new XL(this.Page);
        }

        protected void btntk_Click(object sender, EventArgs e)
        {
            
            dic = new Dictionary<string, string>();
            SignUp.Gmail = txtemail.Text;
            string constr = @"Data Source=DESKTOP-Q060S8Q\SQLEXPRESS;Initial Catalog=NQV_DOAN_NEW;Integrated Security=True";
            string queryString = "SELECT * FROM TAIKHOAN WHERE EMAIL = @MAIL ";
            SqlConnection connection = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand(queryString, connection);

            cmd.Parameters.AddWithValue("@MAIL", Encoding.Base64EncodingMethod(SignUp.Gmail));
           
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            connection.Open();
            int i = cmd.ExecuteNonQuery();
            connection.Close();
            if (dt.Rows.Count > 0 )
            {
                sendMail(txtemail.Text);
                Response.Redirect("confirm2.aspx");

            }
            else
            {
                lbtb.Visible = true;
                lbtb.Text = "Không tồn tại tài khoản này";
            }    
        }



        private void sendMail(string mail)
        {
            Random random = new Random();
            SignUp.Maxt = random.Next(100000, 999999).ToString();
            try
            {
                MailMessage message = new MailMessage();
                message.From = new MailAddress("cdio246810@gmail.com");
                message.To.Add(mail);
                message.Subject = "XÁC NHẬN EMAIL";
                message.Body = "VUI LÒNG NHẬP MÃ XÁC NHẬN NÀY ĐỂ ĐẶT LẠI MẬT KHẨU: " + SignUp.Maxt;
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.Credentials = new System.Net.NetworkCredential("cdio246810@gmail.com", "dothethao");
                client.Send(message);
            }
            catch (Exception ex)
            {

            }
        }
    }
}