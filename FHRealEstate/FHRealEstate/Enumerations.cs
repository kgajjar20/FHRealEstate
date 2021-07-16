using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

namespace FHRealEstate
{
    public class Enumerations
    {
        public enum HashSaltType : byte
        {
            PasswordSalt = 1,
            URLSecuritySalt = 2
        }

        public enum Status : int
        {
            Active = 1,
            InActive = 0,
            Deleted = 2
        }


        public enum PropertyImageType : int
        {
            [Description("Gallery Image")]
            GalleryImage = 1,
            [Description("Documents")]
            Documents = 2
        }


    }
}
