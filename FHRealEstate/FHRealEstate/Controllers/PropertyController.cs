using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FHRealEstate.Repository;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace FHRealEstate.Controllers
{
    public class PropertyController : Controller
    {
        private readonly ILogger<PropertyController> _logger;
        private readonly IAdmin _adminRepository;
        public PropertyController(ILogger<PropertyController> logger, IAdmin adminRepository)
        {
            _logger = logger;
            _adminRepository = adminRepository;
        }

        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> GetProperty(Guid propertyId)
        {
            var property = await _adminRepository.GetPropertyAsync(propertyId);
            return View(property);
        }


    }
}
