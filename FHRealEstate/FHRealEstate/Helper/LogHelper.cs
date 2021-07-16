using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FHRealEstate.Helper
{
    public class LogViewModel
    {
        public string ErrorUrl { get; set; }
        public string ErrorMessage { get; set; }
        public DateTime LogDate { get; set; }
    }

    public class LogHelper
    {
        readonly ILogger<LogHelper> _logger;

        public LogHelper(ILogger<LogHelper> logger)
        {
            _logger = logger;
        }

        public void LogException(Exception exception, HttpContext httpContext)
        {
            var logInfo = new LogViewModel
            {
                LogDate = DateTime.Now,
                ErrorUrl = httpContext.Request.Path.Value,
                ErrorMessage = $"Exception: {exception.Message} \n InnerException: {exception.InnerException?.Message}"
            };

            _logger.LogError(JsonConvert.SerializeObject(logInfo));
        }

        public void LogException(LogViewModel error)
        {
            _logger.LogError(JsonConvert.SerializeObject(error));
        }

        public void LogInfo(string info)
        {
            _logger.LogInformation(info);
        }
    }
}
