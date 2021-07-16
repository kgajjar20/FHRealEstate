using FHRealEstate.Extensions;
using FHRealEstate.Helper;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace FHRealEstate.Middleware
{
    /// <summary>
    /// Central error/exception handler Middleware
    /// </summary>

    public class ExceptionHandlerMiddleware
    {
        private readonly RequestDelegate request;
        LogHelper _logger;

        /// <summary>
        /// Initializes a new instance of the <see cref="ExceptionHandlerMiddleware"/> class.
        /// </summary>
        /// <param name="next">The next.</param>

        public ExceptionHandlerMiddleware(RequestDelegate next, LogHelper logHelper)
        {
            this.request = next;
            _logger = logHelper;
        }

        /// <summary>
        /// Invokes the specified context.
        /// </summary>
        /// <param name="context">The context.</param>
        /// <returns></returns>

        public Task Invoke(HttpContext context) => this.InvokeAsync(context);

        async Task InvokeAsync(HttpContext context)
        {
            string basePath = CoreHelper.GetBaseURL(context);

            try
            {
                await this.request(context);
                if (context.Response.StatusCode == (int)HttpStatusCode.NotFound)
                {
                    context.Response.Redirect($"{basePath}/notfound");
                }
            }
            catch (Exception exception)
            {
                _logger.LogException(exception, context);

                var httpStatusCode = ConfigurateExceptionTypes(exception);

                if (!context.Request.IsAjaxRequest())
                {
                    if (httpStatusCode == HttpStatusCode.NotFound)
                    {
                        context.Response.Redirect($"{basePath}/notfound");
                    }
                    else
                    {
                        context.Response.Redirect($"{basePath}/error");
                    }
                }
                else
                {
                    // Only set status code. jQuery will handle redirecting to proper error page.
                    context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;
                    await context.Response.WriteAsync("error");
                }
            }
        }

        /// <summary>
        /// Configurates/maps exception to the proper HTTP error Type
        /// </summary>
        /// <param name="exception">The exception.</param>
        /// <returns></returns>

        private static HttpStatusCode ConfigurateExceptionTypes(Exception exception)
        {
            if (exception is WebException)
            {
                var webException = exception as WebException;
                return ((HttpWebResponse)webException.Response).StatusCode;
            }
            else
            {
                return HttpStatusCode.InternalServerError;
            }
        }
    }
}
