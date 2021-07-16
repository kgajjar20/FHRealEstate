using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FHRealEstate.DB
{
    public partial class Contact
    {
        [Key]
        public Guid ContactId { get; set; }
        [Required]
        [StringLength(200)]
        public string Name { get; set; }
        [StringLength(500)]
        public string Email { get; set; }
        [StringLength(20)]
        public string Phone { get; set; }
        [StringLength(200)]
        public string Subject { get; set; }
        [Required]
        public string Message { get; set; }
    }
}
