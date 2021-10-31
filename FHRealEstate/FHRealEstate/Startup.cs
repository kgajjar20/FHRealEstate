using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FHRealEstate.Helper;
using FHRealEstate.Models;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpOverrides;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using FHRealEstate.Repository;
using FHRealEstate.DB;
using Microsoft.EntityFrameworkCore;
using FHRealEstate.Middleware;
using Microsoft.AspNetCore.Http.Features;

namespace FHRealEstate
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddMvc();
            services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
                  .AddCookie(CookieAuthenticationDefaults.AuthenticationScheme,
                  options =>
                  {
                      options.LoginPath = "/login";
                      options.LogoutPath = "/logout";
                      options.Cookie.HttpOnly = true;
                      options.Cookie.Name = "auth.fhrealestate";
                      options.Cookie.SecurePolicy = CookieSecurePolicy.SameAsRequest;
                      options.ExpireTimeSpan = TimeSpan.FromMinutes(30); //Set idle expiration time
                      options.SlidingExpiration = true; //Allowes expiration time to update with user use until absolute expiration is met
                  });

            services.AddHttpContextAccessor();
            services.AddSession();

            services.Configure<IISServerOptions>(options =>
            {
                options.MaxRequestBodySize = int.MaxValue;
            });

            services.Configure<FormOptions>(x =>
            {
                x.ValueLengthLimit = int.MaxValue;
                x.MultipartBodyLengthLimit = int.MaxValue;
                x.MultipartHeadersLengthLimit = int.MaxValue;
            });


            services.AddControllersWithViews(config =>
            {
                // By default we are enabling authentication for all controllers. We have to add [AllowAnonymous] attribute if we want to bypass authentication.
                var policy = new AuthorizationPolicyBuilder()
                .RequireAuthenticatedUser()
                .Build();

                //config.Filters.Add(new AuthorizeFilter(policy));
            }).AddRazorRuntimeCompilation();

            services.Configure<AppSettingsViewModel>(Configuration.GetSection("AppSettings"));
            services.Configure<ForwardedHeadersOptions>(options =>
            {
                options.ForwardedHeaders = ForwardedHeaders.XForwardedFor | ForwardedHeaders.XForwardedProto;
                //// Only loopback proxies are allowed by default.
                //// Clear that restriction because forwarders are enabled by explicit 
                //// configuration.
                //options.KnownNetworks.Clear();
                //options.KnownProxies.Clear();
            });


            services.AddAntiforgery(options => options.HeaderName = "MY-XSRF-TOKEN");

            services.AddDbContext<FHRealEstateContext>(options => options.UseSqlServer(Configuration.GetConnectionString("FHRealEstateConnection")));
            services.AddTransient<FHRealEstateContext>();
            services.AddCors();

            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddSingleton<IActionContextAccessor, ActionContextAccessor>();
            services.AddSingleton<LogHelper>();
            services.AddScoped<CoreHelper>();
            services.AddScoped<AuthenticationHelper>();
            services.AddScoped<IUser, UserRepository>();
            services.AddScoped<IAdmin, AdminRepository>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILoggerFactory loggerFactory)
        {
            //loggerFactory.AddFile(Configuration.GetSection("Logging:PathFormat").Value,
            //   outputTemplate: Configuration.GetSection("Logging:OutputTemplate").Value);

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            app.UseHttpsRedirection();
            app.UseSession();
            app.UseStaticFiles();


            app.UseDefaultFiles();
            app.UseStaticFiles();
            app.UseCookiePolicy();

            app.UseRouting();
            app.UseAuthentication();
            app.UseAuthorization();

            app.UseMiddleware<ExceptionHandlerMiddleware>();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });

            UserSession.Configure(app.ApplicationServices.GetRequiredService<IHttpContextAccessor>());

        }
    }
}
