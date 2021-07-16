using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FHRealEstate.Helper
{
    public class CoreHelper
    {
        private readonly IHttpContextAccessor _httpContext;
        public CoreHelper(IHttpContextAccessor httpContext)
        {
            _httpContext = httpContext;

        }

        public string GetBaseURL()
        {
            string basePath = $"{_httpContext.HttpContext.Request.Scheme}://{_httpContext.HttpContext.Request.Host}{_httpContext.HttpContext.Request.PathBase}";
            return basePath;
        }
        public static string GetBaseURL(HttpContext context)
        {
            string basePath = $"{context.Request.Scheme}://{context.Request.Host}{context.Request.PathBase}";
            return basePath;
        }
    }
}
