using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using FHRealEstate.Helper;
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
        private readonly LogHelper _logHelper;
        public UserController(ILogger<UserController> logger, IAdmin adminRepository, IWebHostEnvironment environment, LogHelper logHelper)
        {
            _logger = logger;
            _adminRepository = adminRepository;
            _environment = environment;
            _logHelper = logHelper;
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
        [DisableRequestSizeLimit]
        public async Task<IActionResult> AddUpdateProperty([FromForm] AddUpdatePropertyModel model)
        {
            string message = string.Empty;
            if (ModelState.IsValid)
            {
                List<FileModel> files = new List<FileModel>() { };
                if (model.ImageFiles != null && model.ImageFiles.Count > 0)
                {
                    #region Add Files (Gallery Image)
                    foreach (var file in model.ImageFiles)
                    {
                        FileModel f = new FileModel();
                        f.NewFileName = Common.SaveFile(Path.Combine(_environment.WebRootPath, "userfiles"), file);
                        f.FileName = file.FileName;
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
                        f.NewFileName = Common.SaveFile(Path.Combine(_environment.WebRootPath, "userfiles"), file);
                        f.FileName = file.FileName;
                        f.FileType = (int)PropertyImageType.Documents;
                        files.Add(f);
                    }
                    #endregion
                }


                bool result = await _adminRepository.AddUpdateProperty(model, files);
                if (result)
                {
                    message = "New Property has been added successfully.";
                    return Json(new { Success = result, Message = message });
                }
                else
                {

                    #region Delete File
                    files.ForEach(x =>
                    {
                        string file = Path.Combine(_environment.WebRootPath, "userfiles") + "\\" + x.NewFileName;
                        Common.DeleteFile(file);
                    });
                    #endregion
                    message = "Some error has been occured.Please try again.";
                    return Json(new { Success = false, Message = message });
                }
            }
            else
            {
                message = string.Join(", ", ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage));
                return Json(new { Success = false, Message = message });

            }
        }

        [HttpGet]
        public IActionResult MyProperties()
        {
            return View();
        }



    }
}
