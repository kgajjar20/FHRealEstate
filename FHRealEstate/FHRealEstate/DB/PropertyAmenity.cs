using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FHRealEstate.DB
{
    public partial class PropertyAmenity
    {
        [Key]
        public Guid PropertyAmenityId { get; set; }
        public Guid PropertyId { get; set; }
        public Guid AmenityId { get; set; }

        [ForeignKey(nameof(AmenityId))]
        [InverseProperty(nameof(Amenities.PropertyAmenity))]
        public virtual Amenities Amenity { get; set; }
        [ForeignKey(nameof(PropertyId))]
        [InverseProperty("PropertyAmenity")]
        public virtual Property Property { get; set; }
    }
}
