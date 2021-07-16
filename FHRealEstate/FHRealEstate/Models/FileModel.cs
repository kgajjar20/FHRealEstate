using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FHRealEstate.Models
{
    public class FileModel
    {
        public Guid? UserId { get; set; }
        public Guid? FileId { get; set; }
        public string FileName { get; set; }
        public int FileType { get; set; }
    }
}
