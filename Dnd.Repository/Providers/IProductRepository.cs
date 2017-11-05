using DnD.Model.Entity;
using DnD.Model.ViewModel;
using System.Collections.Generic;

namespace DnD.Repository.Providers
{
    public interface IProductRepository
    {
        int SaveBrand(ProductBrand productBrandObj);
        int UpdateBrand(ProductBrand productBrandObj);
        int DeleteBrand(ProductBrand productBrandObj);
        List<ProductBrand> GetAllBrandsByStore(int storeId);
        List<Product> GetAllProductsByStore(int storeId);
        List<Product> GetProductsBySearch(ProductSearchCriteria searchCriteriaObject);
        List<ProductInventoryListViewModel> GetInventoryBySearch(ProductSearchCriteria searchCriteriaObject);
        int SaveProduct(Product productObj);
        int SaveSupplier(ProductSupplier productSupplierObj);
        int UpdateSupplier(ProductSupplier productSupplierObj);
        int DeleteSupplier(ProductSupplier productSupplierObj);
        List<ProductSupplier> GetAllSuppliersByStore(int storeId);

        int SaveType(ProductType productTypeObj);
        int UpdateType(ProductType productTypeObj);
        int DeleteType(ProductType productTypeObj);
        List<ProductType> GetAllTypesByStore(int storeId);

        int SaveTag(ProductTagMaster productTagObj);
        int UpdateTag(ProductTagMaster productTagObj);
        int DeleteTag(ProductTagMaster productTagObj);
        List<ProductTagMaster> GetAllTagsByStore(int storeId);

        AddEditProductMasterViewModel GetAllMasterDataForCreateOrEditProduct(int storeId);
        AddEditDiscountOfferMasterViewModel GetAllMasterDataForCreateOrEditDiscountOffer(int storeId);
        List<StoreOutlet> GetStoreOutlets(int storeId);
        List<SalesTax> GetAllSalesTaxList(int storeId);
    }
}
