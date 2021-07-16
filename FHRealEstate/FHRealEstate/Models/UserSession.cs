using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace FHRealEstate.Models
{
    public static class UserSession
    {
        private static IHttpContextAccessor _accessor;

        public static void Configure(IHttpContextAccessor httpContextAccessor)
        {
            _accessor = httpContextAccessor;
        }

        public static HttpContext HttpContext => _accessor.HttpContext;

        public static bool IsAuthenticated
        {
            get
            {
                return HttpContext.User.Identity.IsAuthenticated;
            }
        }

        public static Guid? GetUserId()
        {
            return HttpContext.User.Identity.IsAuthenticated
                ? (new Guid(HttpContext.User.Claims.Where(c => c.Type == ClaimTypes.NameIdentifier).FirstOrDefault().Value))
                : (Guid?)null;
        }

        public static string GetFirstName()
        {
            return (HttpContext.User.Claims.Where(c => c.Type == Common.FirstNameClaim).FirstOrDefault()?.Value ?? string.Empty);
        }

        public static string GetLastName()
        {
            return (HttpContext.User.Claims.Where(c => c.Type == Common.LastNameClaim).FirstOrDefault()?.Value ?? string.Empty);
        }

      
        public static string GetName()
        {
            return (HttpContext.User.Claims.Where(c => c.Type == ClaimTypes.Name).FirstOrDefault()?.Value ?? string.Empty);
        }
        public static string GetEmail()
        {
            return (HttpContext.User.Claims.Where(c => c.Type == ClaimTypes.Email).FirstOrDefault()?.Value ?? string.Empty);
        }

        public static Guid UserId
        {
            get
            {
                return (Guid)GetUserId();
            }
        }

    }
}
