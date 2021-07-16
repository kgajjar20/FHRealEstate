using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FHRealEstate.DB
{
    public partial class PropertyType
    {
        public PropertyType()
        {
            Property = new HashSet<Property>();
        }

        [Key]
        public int PropertyTypeId { get; set; }
        [Required]
        [StringLength(1000)]
        public string PropertyTypeName { get; set; }
        public bool IsCommarcial { get; set; }
        public int Status { get; set; }

        [InverseProperty("PropertyType")]
        public virtual ICollection<Property> Property { get; set; }
    }
}
