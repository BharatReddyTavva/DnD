using DnD.Model.Entity;
using DnD.Model.ViewModel;
using System.Collections.Generic;

namespace DnD.Repository.Providers
{
    public interface IStoreRepository
    {
        int CreateStoreSetup(StoreSetupViewModel storeSetupViewModel);
        StoreSetupMasterDataViewModel GetAllMasterDataForStore();
    }
}
