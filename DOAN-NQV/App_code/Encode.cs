using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace DOAN_NQV.App_code
{
    public class Encoding
    {
        //Encoding
        public static string Base64EncodingMethod(string Data)
        {
            byte[] toEncodeAsBytes = System.Text.Encoding.UTF8.GetBytes(Data);
            string sReturnValues = System.Convert.ToBase64String(toEncodeAsBytes);
            return sReturnValues;
        }
        //Decoding
        public static string Base64DecodingMethod(string Data)
        {
            byte[] encodedDataAsBytes = System.Convert.FromBase64String(Data);
            string returnValue = System.Text.Encoding.UTF8.GetString(encodedDataAsBytes);
            return returnValue;
        }
    }
}
