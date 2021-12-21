using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Text;
using System.Drawing.Imaging;
using System.Security.Cryptography;
using System.IO;
namespace DOAN_NQV.Login_v2
{
    //Tran Van Son
    public partial class capcha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Bitmap bmp = new Bitmap(Server.MapPath("~\\Login_v2\\img\\captcha4.jpg"));
            MemoryStream mem = new MemoryStream();
            int width = bmp.Width;
            int height = bmp.Height;
            string fontfamily = "Arial";
            string text = Request.Cookies["capcha"]["value"];
            Bitmap bitmap = new Bitmap(bmp, new Size(width, height));
            Graphics g = Graphics.FromImage(bitmap);
            g.SmoothingMode = SmoothingMode.AntiAlias;
            int xcopyright = width - 150;
            int ycopyright = height - 50;
            Rectangle rect;
            Font font;

            int newfontsize = 45;
            font = new Font(fontfamily, newfontsize, FontStyle.Italic);
            rect = new Rectangle(xcopyright, ycopyright, 0, 0);

            StringFormat format = new StringFormat();
            format.Alignment = StringAlignment.Near;
            format.LineAlignment = StringAlignment.Near;
            GraphicsPath path = new GraphicsPath();
            path.AddString(text, font.FontFamily, (int)font.Style, font.Size, rect, format);

            HatchBrush hatchbrush = new HatchBrush(HatchStyle.LargeCheckerBoard, Color.FromName("blue"), Color.FromName("black"));
            g.FillPath(hatchbrush, path);


            HttpContext.Current.Response.ContentType = "img/jpeg";
            bitmap.Save(mem, ImageFormat.Jpeg);
            bmp.Dispose();
            font.Dispose();
            hatchbrush.Dispose();
            g.Dispose();
            mem.WriteTo(HttpContext.Current.Response.OutputStream);
            bitmap.Dispose();
        }

    }
}