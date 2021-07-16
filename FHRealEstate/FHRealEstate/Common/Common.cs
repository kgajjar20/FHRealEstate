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
            string filename = "";
            try
            {
                filename = DateTime.Now.Ticks + "_" + file.FileName;
                using (var fileStream = new FileStream(filePath + "\\" + filename, FileMode.Create, FileAccess.ReadWrite))
                {
                    file.CopyTo(fileStream);
                }
            }
            catch { }
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

        public static string CustomPrice(decimal price)
        {
            string priceString = "";

            if (price >= 10000000)
            {
                priceString = (price / 10000000) + " Cr";
            }
            else if (price >= 100000)
            {
                priceString = (price / 100000) + " Lacs";
            }
            else if (price >= 10000)
            {
                priceString = (price / 100000) + " K";
            }
            return priceString;
        }



    }
}
