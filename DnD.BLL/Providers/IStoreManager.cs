using DnD.Model.Entity;
using DnD.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DnD.BLL.Providers
{
    public interface IStoreManager
    {
        int CreateStoreSetup(StoreSetupViewModel storeSetupViewModel);
        StoreSetupMasterDataViewModel GetAllMasterDataForStore();
    }
}
