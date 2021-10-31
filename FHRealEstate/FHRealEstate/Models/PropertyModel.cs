using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace FHRealEstate.Models
{
    public class AddUpdatePropertyModel
    {

        public AddUpdatePropertyModel()
        {
            CheckedAminities = new List<Guid>() { };
            PropertyStatusList = new List<TextValueInt>() { };
            ConstructionStatusList = new List<TextValueInt>() { };
            PropertyTypeList = new List<TextValueInt>() { };
            Aminities = new List<TextValueGuid>() { };
        }

        public Guid? PropertyId { get; set; }

        [Required(ErrorMessage = "Title is required.")]
        [StringLength(1000)]
        public string Title { get; set; }

        [Required(ErrorMessage = "Description is required.")]
        public string Description { get; set; }

        public int PropertyTypeId { get; set; }

        public int PropertyStatusId { get; set; }

        public int ConstructionStatusId { get; set; }

        [Column(TypeName = "numeric(18, 2)")]

        [Required(ErrorMessage = "MinPrice is required.")]
        public decimal MinPrice { get; set; }
        [Column(TypeName = "numeric(18, 2)")]

        [Required(ErrorMessage = "MaxPrice is required.")]
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

        public List<Guid> CheckedAminities { get; set; }
        public List<TextValueInt> PropertyStatusList { get; set; }
        public List<TextValueInt> ConstructionStatusList { get; set; }
        public List<TextValueInt> PropertyTypeList { get; set; }
        public List<TextValueGuid> Aminities { get; set; }
        public IList<IFormFile> ImageFiles { get; set; }
        public IList<IFormFile> DocumentFiles { get; set; }

    }

    public class PropertyModel
    {
        public PropertyModel()
        {
            PropertyImages = new List<string>() { };
            PropertyDocuments = new List<string>() { };
            Aminities = new List<string>() { };
        }


        public Guid PropertyId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public int PropertyTypeId { get; set; }
        public string PropertyTypeText { get; set; }
        public int PropertyStatusId { get; set; }
        public string PropertyStatusText { get; set; }
        public int ConstructionStatusId { get; set; }
        public string ConstructionStatus { get; set; }
        public decimal MinPrice { get; set; }
        public string MinPriceStr => Common.CustomPrice(MinPrice);
        public decimal MaxPrice { get; set; }
        public string MaxPriceStr => Common.CustomPrice(MaxPrice);
        public string PriceRange => Common.GetPriceRange(MinPrice, MaxPrice);
        public double PropertySize { get; set; }
        public string PropertySizePrefix { get; set; }
        public double? GarageSize { get; set; }
        public string GarageSizePrefix { get; set; }
        public int? TotalRooms { get; set; }
        public int TotalGarages { get; set; }
        public int? TotalBathrooms { get; set; }
        public int? BuildYear { get; set; }
        public string Address { get; set; }
        public string FullAddress => $"{Address}, {City}, {State}, {Country} {Zip}";
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string Country { get; set; }
        public string VideoUrl { get; set; }
        public string VirtualTourUrl { get; set; }
        public int Status { get; set; }

        public List<string> Aminities { get; set; }
        public List<string> PropertyImages { get; set; }
        public List<string> PropertyDocuments { get; set; }

        //[AllowedExtensions(new string[] { ".pdf", ".doc", ".docx" })]
    }

}
