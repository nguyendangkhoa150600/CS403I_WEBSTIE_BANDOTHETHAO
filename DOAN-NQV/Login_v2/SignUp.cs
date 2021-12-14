using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Login_v2
{
    public static class SignUp
    {
        static string tendangnhap,hoten, matkhau, diachi,gioitinh,sdt, gmail, maxt;

        public static string TenDanhNhap { get => tendangnhap; set => tendangnhap = value; }
        public static string Hoten { get => hoten; set => hoten = value; }
        public static string Matkhau { get => matkhau; set => matkhau = value; }
        public static string Diachi { get => diachi; set => diachi = value; }
        public static string Sdt { get => sdt; set => sdt = value; }
        public static string GioiTinh { get => gioitinh; set => gioitinh = value; }
        public static string Gmail { get => gmail; set => gmail = value; }
        public static string Maxt { get => maxt; set => maxt = value; }
    }
}