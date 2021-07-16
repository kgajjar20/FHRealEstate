using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using FHRealEstate.Models;
using FHRealEstate.Repository;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using static FHRealEstate.Enumerations;

namespace FHRealEstate.Controllers
{
    public class UserController : Controller
    {
        private readonly ILogger<UserController> _logger;
        private readonly IAdmin _adminRepository;
        private readonly IWebHostEnvironment _environment;
        public UserController(ILogger<UserController> logger, IAdmin adminRepository, IWebHostEnvironment environment)
        {
            _logger = logger;
            _adminRepository = adminRepository;
            _environment = environment;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Dashboard()
        {
            return View();
        }

        public async Task<IActionResult> AddUpdateProperty()
        {
            AddUpdatePropertyModel model = new AddUpdatePropertyModel();
            model.Aminities = await _adminRepository.GetAllAminities();
            model.PropertyTypeList = await _adminRepository.GetPropertyTypeList();
            model.PropertyStatusList = await _adminRepository.GetPropertyStatusList();
            model.ConstructionStatusList = await _adminRepository.GetConstructionStatusList();
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> AddUpdateProperty(AddUpdatePropertyModel model)
        {

            if (ModelState.IsValid)
            {
                List<FileModel> files = new List<FileModel>() { };
                if (model.ImageFiles != null && model.ImageFiles.Count > 0)
                {
                    #region Add Files (Gallery Image)
                    foreach (var file in model.ImageFiles)
                    {
                        FileModel f = new FileModel();
                        f.FileName = Common.SaveFile(Path.Combine(_environment.WebRootPath, "userfiles"), file);
                        f.FileType = (int)PropertyImageType.GalleryImage;
                        files.Add(f);
                    }
                    #endregion
                }

                if (model.DocumentFiles != null && model.DocumentFiles.Count > 0)
                {
                    #region Add Files (Documents)
                    foreach (var file in model.DocumentFiles)
                    {
                        FileModel f = new FileModel();
                        f.FileName = Common.SaveFile(Path.Combine(_environment.WebRootPath, "userfiles"), file);
                        f.FileType = (int)PropertyImageType.Documents;
                        files.Add(f);
                    }
                    #endregion
                }


                bool result = await _adminRepository.AddUpdateProperty(model);
                if (result)
                {
                    TempData["SuccessMessage"] = "New Property has been added successfully.";
                    return RedirectToAction("MyProperties");
                }
                else
                {

                    #region Delete File
                    files.ForEach(x =>
                    {
                        string file = Path.Combine(_environment.WebRootPath, "userfiles") + "\\" + x.FileName;
                        Common.DeleteFile(file);
                    });

                    #endregion
                }
            }
            else
            {
                TempData["ErrorMessage"] = string.Join(", ", ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage));
            }

            return View(model);
        }

        public IActionResult MyProperties()
        {
            return View();
        }



    }
}
