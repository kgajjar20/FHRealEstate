using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using FHRealEstate.Models;
using FHRealEstate.Repository;
using FHRealEstate.DB;
using System.Security.Claims;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;

namespace FHRealEstate.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IUser _userRepository;
        private readonly IAdmin _adminRepository;
        public HomeController(ILogger<HomeController> logger, IUser userRepository, IAdmin adminRepository)
        {
            _logger = logger;
            _userRepository = userRepository;
            _adminRepository = adminRepository;
        }

        public async Task<IActionResult> Index()
        {
            DashboardModel model = new DashboardModel();
            model.SellPropertiesList = await _adminRepository.GetSellPropertiesForDashboardAsync();
            model.RentPropertiesList = await _adminRepository.GetRentPropertiesForDashboardAsync();
            return View(model);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [Route("/login")]
        [HttpGet]
        public IActionResult Login(string ReturnUrl = null)
        {
            LoginModel model = new LoginModel();
            if (UserSession.IsAuthenticated)
            {

                if (Url.IsLocalUrl(ReturnUrl))
                    return Redirect(ReturnUrl);
                else
                    return RedirectToAction("Index", "Home");
            }
            model.ReturnUrl = !string.IsNullOrWhiteSpace(ReturnUrl) ? ReturnUrl : string.Empty;
            return View();
        }


        [Route("/logout")]
        public async Task<IActionResult> Logout()
        {
            if (UserSession.IsAuthenticated)
            {
                await HttpContext.SignOutAsync();
            }
            return RedirectToAction("Index");
        }


        [HttpPost]
        public async Task<IActionResult> Index(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                User user = await _userRepository.AuthenticateUser(model);
                if (user != null)
                {
                    UserModel userModel = await _userRepository.GetUserByIdAsync(user.Id);
                    userModel.RememberMe = model.RememberMe;
                    bool result = await LoginUser(userModel);
                    if (result)
                    {
                        if (!string.IsNullOrWhiteSpace(model.ReturnUrl))
                        {
                            if (Url.IsLocalUrl(model.ReturnUrl))
                                return Redirect(model.ReturnUrl);
                            else
                                return RedirectToAction("Index", "Home");
                        }
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        return Redirect("~/login");
                    }
                }
                else
                {
                    TempData["ErrorMessage"] = "Email or password does not match.";
                }
            }
            else
            {
                TempData["ErrorMessage"] = string.Join(",", ModelState.Values.Where(E => E.Errors.Count > 0).SelectMany(E => E.Errors).Select(E => E.ErrorMessage).ToArray());
            }
            return Redirect("~/login");
        }

        #region Login User
        public async Task<bool> LoginUser(UserModel user)
        {
            bool result = false;
            var claims = new[]
            {
                      new Claim(ClaimTypes.NameIdentifier,user.Id.ToString()),
                      new Claim(ClaimTypes.Name,user.FullName),
                      new Claim(ClaimTypes.Email, user.Email),
                      new Claim(Common.FirstNameClaim, user.Firstname),
                      new Claim(Common.LastNameClaim, user.Lastname),
            };

            ClaimsIdentity identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            ClaimsPrincipal principal = new ClaimsPrincipal(identity);

            var props = new AuthenticationProperties();
            props.IsPersistent = user.RememberMe;

            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal, props);
            result = true;
            return result;
        }

        #endregion

        public IActionResult Signup()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Signup(SignupModel model)
        {
            if (ModelState.IsValid)
            {
                bool userExists = await _userRepository.CheckUserExists(model.Email);
                if (!userExists)
                {
                    bool addUser = await _userRepository.AddUserAsync(model);
                    if (addUser)
                    {
                        TempData["SuccessMessage"] = "User has been registered successfully.";
                        return RedirectToAction("login");
                    }
                }
                else
                {
                    TempData["ErrorMessage"] = "User already exists.";
                }
            }
            else
            {
                TempData["ErrorMessage"] = string.Join(",", ModelState.Values.Where(E => E.Errors.Count > 0).SelectMany(E => E.Errors).Select(E => E.ErrorMessage).ToArray());
            }

            return View(model);
        }


        [AllowAnonymous]
        [Route("notfound")]
        public IActionResult NotFoud()
        {
            return View();
        }


        public IActionResult Contact()
        {
            return View();
        }

        public IActionResult AboutUs()
        {
            return View();
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        [AllowAnonymous]
        [Route("error")]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
