using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FHRealEstate.DB
{
    public partial class PropertyImage
    {
        [Key]
        public Guid PropertyImageId { get; set; }
        public Guid PropertyId { get; set; }
        [Required]
        public string ImageName { get; set; }
        public int ImageType { get; set; }
        public Guid? CreatedBy { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime? CreatedDate { get; set; }

        [ForeignKey(nameof(PropertyId))]
        [InverseProperty("PropertyImage")]
        public virtual Property Property { get; set; }
    }
}
