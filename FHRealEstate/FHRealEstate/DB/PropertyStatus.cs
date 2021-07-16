using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FHRealEstate.DB
{
    public partial class PropertyStatus
    {
        public PropertyStatus()
        {
            Property = new HashSet<Property>();
        }

        [Key]
        public int PropertyStatusId { get; set; }
        [Required]
        [StringLength(200)]
        public string PropertyStatusName { get; set; }
        public int Status { get; set; }

        [InverseProperty("PropertyStatus")]
        public virtual ICollection<Property> Property { get; set; }
    }
}
