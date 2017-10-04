using DnD.Repository;
using DnD.Repository.Providers;
using DnD.BLL.Providers;
using Microsoft.Practices.Unity;

namespace DnD.BLL.Unity
{
    public static class UnityResolver
    {
        /// <summary>
        /// resolve the dependency classes
        /// </summary>
        /// <returns></returns>
        public static IUnityContainer BuildUnityContainer()
        {
            var container = new UnityContainer();

            // register all your components with the container here
            // it is NOT necessary to register your controllers
            container.RegisterType<IProductRepository, ProductRepository>(
                  new ContainerControlledLifetimeManager(), new InjectionConstructor(
                   new ResolvedParameter<DataBaseRepository>()));

            container.RegisterType<IProductManager, ProductManager>(
                  new ContainerControlledLifetimeManager(), new InjectionConstructor(
                   new ResolvedParameter<IProductRepository>()));

            return container;
        }
    }
}
