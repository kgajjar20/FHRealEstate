using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FHRealEstate.DB
{
    public partial class PropertyFloorPlan
    {
        [Key]
        public Guid PropertyFloorPlanId { get; set; }
        public Guid PropertyId { get; set; }
        [Required]
        public string PlanName { get; set; }
        public string Description { get; set; }
        public int? RoomSize { get; set; }
        public int? BathroomSize { get; set; }
        [Column(TypeName = "decimal(10, 2)")]
        public decimal? Price { get; set; }
        public int? FloorSize { get; set; }
        public int PlanOrder { get; set; }

        [ForeignKey(nameof(PropertyId))]
        [InverseProperty("PropertyFloorPlan")]
        public virtual Property Property { get; set; }
    }
}
