using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FHRealEstate.Models
{

    public class PropertyIndexModel
    {
        public PropertiesResponseModel PropertiesResponse { get; set; }
        public List<TextValueInt> PropertyStatusList { get; set; }
    }

    public class PropertiesRequestModel
    {
        [JsonProperty("request")]
        public DataRequest Request { get; set; }
        public bool DisplaySellProperties { get; set; }
        public bool DisplayRentProperties { get; set; }
        public int? PropertyStatusId => DisplaySellProperties == true ? (int)Enumerations.PropertyStatus.For_Sell
                                                                      : (DisplayRentProperties == true
                                                                                        ? (int)Enumerations.PropertyStatus.For_Rent
                                                                                        : (int?)null);
    }


    public class PropertiesResponseModel
    {
        public PropertiesResponseModel()
        {
            AllProperties = new List<PropertyModel>() { };
        }

        public int Total { get; set; }
        public int TotalPages => (int)Math.Ceiling(Total / (double)Request.PageSize);
        public bool HasPreviousPage => Request.PageIndex > 1;
        public bool HasNextPage => Request.PageIndex < TotalPages;
        public List<PropertyModel> AllProperties { get; set; }

        [JsonProperty("request")]
        public DataRequest Request { get; set; }
    }


    public class DataRequest
    {
        public DataRequest()
        {
            PageIndex = 1;
            PageSize = 50;
        }

        [JsonProperty("pageSize")]
        public int PageSize { get; set; }
        [JsonProperty("pageIndex")]
        public int PageIndex { get; set; }
        [JsonProperty("search")]
        public string Sort { get; set; }
        public string Search { get; set; }
    }

}
