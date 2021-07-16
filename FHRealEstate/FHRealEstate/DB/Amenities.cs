using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FHRealEstate.DB
{
    public partial class Amenities
    {
        public Amenities()
        {
            PropertyAmenity = new HashSet<PropertyAmenity>();
        }

        [Key]
        public Guid AmenityId { get; set; }
        [Required]
        [StringLength(2100)]
        public string AmenityName { get; set; }
        public int Status { get; set; }
        public Guid? CreatedBy { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime? ModifiedDate { get; set; }

        [InverseProperty("Amenity")]
        public virtual ICollection<PropertyAmenity> PropertyAmenity { get; set; }
    }
}
