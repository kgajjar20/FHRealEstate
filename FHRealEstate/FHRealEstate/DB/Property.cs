using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FHRealEstate.DB
{
    public partial class Property
    {
        public Property()
        {
            PropertyAmenity = new HashSet<PropertyAmenity>();
            PropertyFloorPlan = new HashSet<PropertyFloorPlan>();
            PropertyImage = new HashSet<PropertyImage>();
        }

        [Key]
        public Guid PropertyId { get; set; }
        [Required]
        [StringLength(1000)]
        public string Title { get; set; }
        [Required]
        public string Description { get; set; }
        public int PropertyTypeId { get; set; }
        public int PropertyStatusId { get; set; }
        public int ConstructionStatusId { get; set; }
        [Column(TypeName = "numeric(18, 2)")]
        public decimal MinPrice { get; set; }
        [Column(TypeName = "numeric(18, 2)")]
        public decimal MaxPrice { get; set; }
        public double PropertySize { get; set; }
        [StringLength(50)]
        public string PropertySizePrefix { get; set; }
        public double? GarageSize { get; set; }
        [StringLength(50)]
        public string GarageSizePrefix { get; set; }
        public int? TotalRooms { get; set; }
        public int? TotalGarages { get; set; }
        public int? TotalBathrooms { get; set; }
        public int? BuildYear { get; set; }
        [StringLength(1000)]
        public string Address { get; set; }
        [StringLength(1000)]
        public string City { get; set; }
        [StringLength(1000)]
        public string State { get; set; }
        [StringLength(1000)]
        public string Zip { get; set; }
        [StringLength(1000)]
        public string Country { get; set; }
        [Column("VideoURL")]
        public string VideoUrl { get; set; }
        [Column("VirtualTourURL")]
        public string VirtualTourUrl { get; set; }
        public Guid? CreatedBy { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime? ModifiedDate { get; set; }
        public int Status { get; set; }

        [ForeignKey(nameof(ConstructionStatusId))]
        [InverseProperty("Property")]
        public virtual ConstructionStatus ConstructionStatus { get; set; }
        [ForeignKey(nameof(PropertyStatusId))]
        [InverseProperty("Property")]
        public virtual PropertyStatus PropertyStatus { get; set; }
        [ForeignKey(nameof(PropertyTypeId))]
        [InverseProperty("Property")]
        public virtual PropertyType PropertyType { get; set; }
        [InverseProperty("Property")]
        public virtual ICollection<PropertyAmenity> PropertyAmenity { get; set; }
        [InverseProperty("Property")]
        public virtual ICollection<PropertyFloorPlan> PropertyFloorPlan { get; set; }
        [InverseProperty("Property")]
        public virtual ICollection<PropertyImage> PropertyImage { get; set; }
    }
}
