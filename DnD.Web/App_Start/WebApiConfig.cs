using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json.Serialization;
using System.Web.Http;

namespace DnD.Web.App_Start
{
    /// <summary>
    /// Web API Config
    /// </summary>
    public static class WebApiConfig
    {
        /// <summary>
        /// Registers all Web API routes
        /// </summary>
        /// <param name="config"></param>
        public static void Register(HttpConfiguration config)
        {
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "APIWithActions",
                routeTemplate: "api/{controller}/{action}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );


            var appXmlType = config.Formatters.XmlFormatter.SupportedMediaTypes.FirstOrDefault(t => t.MediaType == "application/xml");
            config.Formatters.XmlFormatter.SupportedMediaTypes.Remove(appXmlType);

            config.IncludeErrorDetailPolicy = IncludeErrorDetailPolicy.Always;

            //((DefaultContractResolver)config.Formatters.JsonFormatter.SerializerSettings.ContractResolver).IgnoreSerializableAttribute = true;
            var jsonFormatter = GlobalConfiguration.Configuration.Formatters.JsonFormatter;
            var contractResolver = new CamelCasePropertyNamesContractResolver();
            contractResolver.IgnoreSerializableAttribute = true;
            jsonFormatter.SerializerSettings.ContractResolver = contractResolver;
        }
    }
}