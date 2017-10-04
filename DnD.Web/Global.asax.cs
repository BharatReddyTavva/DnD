using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Optimization;
using DnD.Web.App_Start;
using System.Web.Http;
using DnD.API;
using System.Web.SessionState;

namespace DnD.Web
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            GlobalConfiguration.Configure(WebApiConfig.Register);
            UnityConfig.RegisterComponents();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            
            //Unhandled expections event
            AppDomain.CurrentDomain.UnhandledException += OnUnhandledException;

        }

        public void Application_End(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// enable the session state
        /// </summary>
        public void Application_PostAuthorizeRequest()
        {
            if (IsWebApiRequest())
            {
                HttpContext.Current.SetSessionStateBehavior(SessionStateBehavior.Required);
            }
        }

        /// <summary>
        /// checks whether its a api call
        /// </summary>
        /// <returns></returns>
        private static bool IsWebApiRequest()
        {
            var hi = HttpContext.Current.Request.AppRelativeCurrentExecutionFilePath.ToLower().Contains("~/api/Imports");
            // Null check on AppRelativeCurrentExecutionFilePath to avoid NullReferenceException.
            return HttpContext.Current.Request.AppRelativeCurrentExecutionFilePath != null
                && HttpContext.Current.Request.AppRelativeCurrentExecutionFilePath.ToLower().StartsWith("~/api");
        }

        /// <summary>
        /// this method will handled all the unhandled expections
        /// </summary>
        /// <param name="o"></param>
        /// <param name="e"></param>
        private void OnUnhandledException(object o, UnhandledExceptionEventArgs e)
        {
            var exception = e.ExceptionObject as Exception;
            if (exception != null)
            {
                //Logger.HandleException(LoggingBoundaries.UI, exception);
            }
        }
    }
}
