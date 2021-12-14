using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace webBanThietBiMayTinh.App_Code
{
    public class Cart
    {
        Dictionary<String, DataRow> listItem;

        public Dictionary<string, DataRow> ListItem { get => listItem; set => listItem = value; }

        public Cart()
        {
            listItem = new Dictionary<string, DataRow>();
        }

        public void Add(DataRow value, int soLuongTon)
        {
            //String key = value["MASP"].ToString();
            String key = value["MACTSP"].ToString();
            if (listItem.ContainsKey(key))
            {
                int soLuong = Convert.ToInt32(listItem[key]["SOLUONG"].ToString())
                    + Convert.ToInt32(value["SOLUONG"].ToString());
                if (soLuong <= soLuongTon)
                {
                    listItem[key]["SOLUONG"] = soLuong;
                }
            }
            else
            {
                listItem.Add(key, value);
            }
        }

        public void Update(string maSP, int soLuong)
        {
            if (listItem.Any(x => x.Key == maSP))
            {
                var item = listItem[maSP];
                item["SOLUONG"] = soLuong;
                listItem[maSP] = item;
            }
        }

        public void Remove(String key)
        {
            listItem.Remove(key);
        }

        public double Total()
        {
            double total = 0;
            foreach (DataRow row in listItem.Values)
            {
                total += (Convert.ToInt32(row["SOLUONG"].ToString()) * Convert.ToInt32(row["DONGIA"].ToString()));
            }
            return total;
        }

        public DataTable displayData()
        {
            DataTable tbCart = new DataTable();
            tbCart.Columns.Add("MACTSP", typeof(String));
            tbCart.Columns.Add("TENSP", typeof(String));
            tbCart.Columns.Add("DONGIA", typeof(double));
            tbCart.Columns.Add("SOLUONG", typeof(int));
            tbCart.Columns.Add("THANHTIEN", typeof(double), "SOLUONG * DONGIA");
            tbCart.Columns.Add("HINHANH", typeof(String));
            tbCart.Columns.Add("MASP", typeof(int));
            tbCart.Columns.Add("MASIZE", typeof(int));
            tbCart.Columns.Add("TENSIZE", typeof(string));
            tbCart.Columns.Add("MAMAU", typeof(int));
            tbCart.Columns.Add("TENMAU", typeof(string));

            foreach (DataRow item in listItem.Values)
            {
                tbCart.Rows.Add(item.ItemArray);
            }

            return tbCart;
        }

    }
}