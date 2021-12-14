using DOAN_NQV;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Login_v2;
using DOAN_NQV.App_code;
namespace WebApplication1.Login_v2
{
    public partial class Signup : System.Web.UI.Page
    {
        Dictionary<string, string> dic;
        XL xuly;
        protected void Page_Load(object sender, EventArgs e)
        {
            xuly = new XL(this.Page);
            tbemail.Visible = false;
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            dic = new Dictionary<string, string>();
            SignUp.Matkhau = pass.Value;
            SignUp.Hoten = hoten.Value;
            SignUp.Diachi = dc.Value.Trim();
            SignUp.GioiTinh = drgt.SelectedValue;
            SignUp.Gmail = email.Value;
            SignUp.Sdt = sdt.Value.Trim();

            string SQL = "SELECT * FROM TAIKHOAN WHERE EMAIL = '" + Encoding.Base64EncodingMethod(SignUp.Gmail) + "'";
            DataTable dt = new DataTable();
            dt = xuly.bang(SQL);

            if (dt.Rows.Count > 0)
            {
                tbemail.Visible = true;
            }

            else
            {
                //sendMail(email.Value);
                //Response.Redirect("Confirm.aspx");
                Confirm();

            }
        }

        private void sendMail(string mail)
        {
            Random random = new Random();
            SignUp.Maxt = random.Next(100000, 999999).ToString();
            //try
            //{
            MailMessage message = new MailMessage();
            message.From = new MailAddress("cdio246810@gmail.com");
            message.To.Add(mail);
            message.Subject = "XÁC NHẬN EMAIL";
            message.Body = "VUI LÒNG NHẬP MÃ XÁC NHẬN NÀY ĐỂ HOÀN THÀNH VIỆC ĐĂNG KÝ: " + SignUp.Maxt;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.EnableSsl = true;
            client.Credentials = new System.Net.NetworkCredential("cdio246810@gmail.com", "dothethao");
            client.Send(message);
            /* }
             catch (Exception ex)
             {

             }*/
        }

        private void Confirm()
        {
            string constr = @"Data Source=DESKTOP-D6PGGJA;Initial Catalog=NQV_DOAN_NEW;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(constr))
            {
                String sql = "INSERT INTO TAIKHOAN( MATKHAU, HOTEN, GIOITINH, SDT,EMAIL, DIACHI, MALOAI)" +
                    " VALUES( @MATKHAU, @HOTEN, @GIOITINH,@SDT, @EMAIL, @DIACHI, @MALOAI)";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    int gt;
                    cmd.Parameters.AddWithValue("@MATKHAU", Encoding.Base64EncodingMethod(SignUp.Matkhau));
                    cmd.Parameters.AddWithValue("@HOTEN", SignUp.Hoten);
                    if (SignUp.GioiTinh == "NAM")
                    {
                        gt = 1;
                    }
                    else
                    {
                        gt = 0;
                    }
                    cmd.Parameters.AddWithValue("@GIOITINH", gt);
                    cmd.Parameters.AddWithValue("@SDT", SignUp.Sdt);
                    cmd.Parameters.AddWithValue("@EMAIL", Encoding.Base64EncodingMethod(SignUp.Gmail));
                    cmd.Parameters.AddWithValue("@DIACHI", SignUp.Diachi);
                    cmd.Parameters.AddWithValue("@MALOAI", "1");
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Redirect("Login.aspx");
                }
            }

        }
    }
}