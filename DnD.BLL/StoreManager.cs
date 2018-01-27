using DnD.Repository.Providers;
using DnD.BLL.Providers;
using DnD.Model.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DnD.Model.ViewModel;
namespace DnD.BLL
{
    public class StoreManager : IStoreManager
    {
        /// <summary>
        /// declare object for store Repository
        /// </summary>
        IStoreRepository _storeRepository;

        /// <summary>
        /// initialize the Customer repository object, this will be resolved by unity dependency injection
        /// </summary>
        /// <param name="storeRepository"></param>
        public StoreManager(IStoreRepository storeRepository)
        {
            _storeRepository = storeRepository;
        }


        /// <summary>
        /// Create Store Setup
        /// </summary>
        /// <param name="storeSetupViewModel"></param>
        /// <returns></returns>
        public int CreateStoreSetup(StoreSetupViewModel storeSetupViewModel)
        {
            return _storeRepository.CreateStoreSetup(storeSetupViewModel);
        }

        /// <summary>
        /// Get All Master Data ForStore
        /// </summary>
        /// <returns></returns>
        public StoreSetupMasterDataViewModel GetAllMasterDataForStore()
        {
            return _storeRepository.GetAllMasterDataForStore();
        }
    }
}
