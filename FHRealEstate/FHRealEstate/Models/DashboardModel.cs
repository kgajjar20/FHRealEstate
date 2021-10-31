using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FHRealEstate.Models
{
    public class DashboardModel
    {

        public DashboardModel()
        {
            SellPropertiesList = new List<PropertyModel>() { };
            RentPropertiesList = new List<PropertyModel>() { };
        }

        public List<PropertyModel> SellPropertiesList { get; set; }
        public List<PropertyModel> RentPropertiesList { get; set; }
    }


}
