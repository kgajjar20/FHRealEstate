using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FHRealEstate.Models
{
    public class CommonModel
    {
    }

    public class TextValueInt
    {
        public int Value { get; set; }
        public string Text { get; set; }
    }

    public class TextValueGuid
    {
        public Guid Value { get; set; }
        public string Text { get; set; }
        public bool Selected { get; set; }
    }

}
