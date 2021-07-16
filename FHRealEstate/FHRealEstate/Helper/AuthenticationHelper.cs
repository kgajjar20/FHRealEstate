using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using static FHRealEstate.Enumerations;

namespace FHRealEstate.Helper
{
    public class AuthenticationHelper
    {
        public AuthenticationHelper()
        {
        }

        public string GetSaltedHashedText(string clearTxt, string salt)
        {
            string retval = string.Empty;

            using (SHA256 key = SHA256Managed.Create())
            {
                string preHash = salt + clearTxt;
                byte[] hash = key.ComputeHash(Encoding.ASCII.GetBytes(preHash));

                retval = Convert.ToBase64String(hash);
            }

            return retval;
        }

        public string GenerateSalt()
        {
            string retval = string.Empty;

            using (RNGCryptoServiceProvider rngCsp = new RNGCryptoServiceProvider())
            {
                byte[] salt = new byte[32];
                rngCsp.GetBytes(salt);

                retval = Convert.ToBase64String(salt);
            }

            return retval;
        }


        /// <summary>
        /// Create a byte array for the given string
        /// </summary>
        /// <param name="strText">String to convert</param>
        /// <returns>byte array</returns>
        private static byte[] GetBytesFromString(string strText)
        {
            char[] strChars = strText.ToCharArray();
            byte[] retVal = new byte[strChars.Length];

            for (int i = 0; i < strChars.Length; i++)
            {
                retVal[i] = Convert.ToByte(strChars[i]);
            }

            return retVal;
        }
    }
}
