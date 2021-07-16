using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace FHRealEstate.Models
{
    public class UserModel
    {
        public Guid Id { get; set; }
        [Required]
        [StringLength(500)]
        public string Email { get; set; }
        [Required]
        public string Emailverificationlink { get; set; }
        public bool Emailverified { get; set; }
        public DateTime? Emailverifieddate { get; set; }
        [Required]
        [StringLength(200)]
        public string Firstname { get; set; }
        [StringLength(200)]
        public string Middlename { get; set; }
        [Required]
        [StringLength(200)]
        public string Lastname { get; set; }
        public string Profilephoto { get; set; }
        public int? Gender { get; set; }
        public DateTime? Birthdate { get; set; }
        public bool Displayofficialbadge { get; set; }
        public int Status { get; set; }
        public string FullName => $"{Firstname} {Lastname}";
        public bool RememberMe { get; set; }
    }
}
