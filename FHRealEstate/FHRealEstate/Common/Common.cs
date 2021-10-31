using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace FHRealEstate
{
    public static class Common
    {
        #region Common Constants
        public static readonly string FirstNameClaim = "FirstName";
        public static readonly string LastNameClaim = "LastName";
        #endregion


        #region
        public static void WriteLog(string filePath, string log)
        {
            string docPath = filePath;

            using (StreamWriter outputFile = new StreamWriter(Path.Combine(docPath, "Log.txt"), true))
            {
                outputFile.WriteLine(log);
            }
        }

        #endregion


        #region Save & Get File & Delete file
        #region Save File
        /// <summary>
        /// Save file to defined path and return new file name with datetimetick
        /// </summary>
        /// <param name="FilePath"></param>
        /// <param name="File"></param>
        /// <returns></returns>
        public static string SaveFile(string filePath, IFormFile file)
        {
            string filename = DateTime.Now.Ticks + "_" + file.FileName;
            using (var fileStream = new FileStream(filePath + "\\" + filename, FileMode.Create, FileAccess.ReadWrite))
            {
                file.CopyTo(fileStream);
            }
            return filename;
        }
        #endregion
        public static void DeleteFile(string fullPath)
        {
            if (System.IO.File.Exists(fullPath))
            {
                System.IO.File.Delete(fullPath);
            }
        }


        #region GetFile
        public static byte[] GetFile(string FolderPath, string FileName)
        {
            byte[] fileContent = null;
            try
            {
                FileStream fs = new FileStream((FolderPath + "\\" + FileName), FileMode.Open, FileAccess.Read);
                BinaryReader binaryReader = new BinaryReader(fs);
                long byteLength = new FileInfo((FolderPath + "\\" + FileName)).Length;
                fileContent = binaryReader.ReadBytes((Int32)byteLength);
                fs.Close();
                fs.Dispose();
                binaryReader.Close();

            }
            catch (Exception)
            {
                fileContent = null;
            }
            return fileContent;
        }

        #endregion

        #region GetFileType
        public static string GetFileType(string fileExtention)
        {
            string fileType = string.Empty;
            var mappings = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase) {

                  {".pdf", "application/pdf"},
                   {".doc", "application/msword"},
                   {".docx", "application/vnd.openxmlformats-officedocument.wordprocessingml.document"},
                   {".bmp", "image/bmp"},
                  {".jpe", "image/jpeg"},
                {".jpeg", "image/jpeg"},
                {".jpg", "image/jpeg"},
                {".ppt", "application/vnd.ms-powerpoint"},
                {".pptx", "application/vnd.openxmlformats-officedocument.presentationml.presentation"},
                 {".png", "image/png"},
                  {".gif", "image/gif"},
                   {".txt", "text/plain"},
                   {".xls", "application/vnd.ms-excel"},
                {".xlsx", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"},
                   };
            mappings.TryGetValue(fileExtention, out fileType);
            return fileType;
        }
        #endregion
        #endregion

        public static string CustomPrice(decimal price, bool withoutAbbr = false)
        {
            string priceString = "";

            if (price >= 10000000)
            {
                priceString = !withoutAbbr ? (price / 10000000) + " Crore" : Convert.ToString(price / 10000000);
            }
            else if (price >= 100000)
            {
                priceString = !withoutAbbr ? (price / 100000) + " Lac" : Convert.ToString(price / 100000);
            }
            else if (price >= 1000)
            {
                priceString = !withoutAbbr ? (price / 1000) + " K" : Convert.ToString(price / 1000);
            }
            return priceString;
        }

        public static string GetPriceRange(decimal minPrice, decimal maxPrice)
        {

            bool withoutAbbr = false;
            if (minPrice >= 10000000 && maxPrice >= 10000000)
            {
                withoutAbbr = true;
            }
            else if (minPrice >= 100000 && minPrice < 10000000 && maxPrice >= 100000 && maxPrice < 10000000)
            {
                withoutAbbr = true;
            }
            else if (minPrice >= 1000 && minPrice < 100000 && maxPrice >= 1000 && maxPrice < 100000)
            {
                withoutAbbr = true;
            }
            else if (minPrice >= 0 && minPrice < 1000 && maxPrice >= 0 && maxPrice < 1000)
            {
                withoutAbbr = true;
            }

            string priceString = $"₹ {CustomPrice(minPrice, withoutAbbr)} - {CustomPrice(maxPrice)}";
            return priceString;
        }



    }
}
