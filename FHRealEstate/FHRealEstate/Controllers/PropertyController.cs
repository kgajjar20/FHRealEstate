using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FHRealEstate.Models;
using FHRealEstate.Repository;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace FHRealEstate.Controllers
{
    public class PropertyController : Controller
    {
        private readonly ILogger<PropertyController> _logger;
        private readonly IAdmin _adminRepository;

        public const string Properties_Index_Route_A = "Property/Index";
        public const string Properties_Index_Route_B = "Property/DisplaySellProperties";
        public const string Properties_Index_Route_C = "Property/DisplayRentProperties";
        public PropertyController(ILogger<PropertyController> logger, IAdmin adminRepository)
        {
            _logger = logger;
            _adminRepository = adminRepository;
        }

        [Route(Properties_Index_Route_A)]
        [Route(Properties_Index_Route_B)]
        [Route(Properties_Index_Route_C)]

        public async Task<IActionResult> Index(PropertiesRequestModel model)
        {
            var route = this.ControllerContext.ActionDescriptor.AttributeRouteInfo.Template;
            if (route == Properties_Index_Route_B)
            {
                model.DisplaySellProperties = true;
            }
            if (route == Properties_Index_Route_C)
            {
                model.DisplayRentProperties = true;
            }

            PropertiesResponseModel response = new PropertiesResponseModel();
            response.Request = model.Request;
            response = await _adminRepository.GetPropertiesDetails(model);
            return View(response);
        }

        [HttpPost]
        public async Task<IActionResult> Properties(PropertiesRequestModel model)
        {
            PropertiesResponseModel response = new PropertiesResponseModel();
            response.Request = model.Request;
            response = await _adminRepository.GetPropertiesDetails(model);
            return View(response);
        }


        [HttpPost("getproperties")]
        public async Task<IActionResult> GetProperties(PropertiesRequestModel model)
        {
            PropertiesResponseModel response = new PropertiesResponseModel();
            response.Request = model.Request;
            response = await _adminRepository.GetPropertiesDetails(model);
            return PartialView("_Properties", response);
        }

        public async Task<IActionResult> GetProperty(Guid propertyId)
        {
            var property = await _adminRepository.GetPropertyAsync(propertyId);
            return View(property);
        }


    }
}
