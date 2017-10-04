using DnD.BLL.Unity;
using Microsoft.Practices.Unity;
using System.Web.Http;
using Unity.WebApi;

namespace DnD.API
{
    public static class UnityConfig
    {
        /// <summary>
        /// get the resolved unity container after resolving all the objects
        /// </summary>
        public static void RegisterComponents()
        {
            var container = UnityResolver.BuildUnityContainer();
            GlobalConfiguration.Configuration.DependencyResolver = new UnityDependencyResolver(container);
        }
    }
}