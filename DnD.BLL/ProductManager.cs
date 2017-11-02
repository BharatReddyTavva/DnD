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
    public class ProductManager : IProductManager
    {
        /// <summary>
        /// declare object for product Repository
        /// </summary>
        IProductRepository _productRepository;

        /// <summary>
        /// initialize the role repository object, this will be resolved by unity dependency injection
        /// </summary>
        /// <param name="roleRepository"></param>
        public ProductManager(IProductRepository productRepository)
        {
            _productRepository = productRepository;
        }

        /// <summary>
        /// Save Brand
        /// </summary>
        /// <returns>Brand Id</returns>
        public int SaveBrand(ProductBrand productBrandObj)
        {
            return _productRepository.SaveBrand(productBrandObj);
        }

        /// <summary>
        /// Update Brand
        /// </summary>
        /// <returns>Brand Id</returns>
        public int UpdateBrand(ProductBrand productBrandObj)
        {
            return _productRepository.UpdateBrand(productBrandObj);
        }

        /// <summary>
        /// Delete Brand
        /// </summary>
        /// <returns>Brand Id</returns>
        public int DeleteBrand(ProductBrand productBrandObj)
        {
            return _productRepository.DeleteBrand(productBrandObj);
        }

        public List<ProductBrand> GetAllBrandsByStore(int storeId)
        {
            return _productRepository.GetAllBrandsByStore(storeId);
        }

        public List<Product> GetAllProductsByStore(int storeId)
        {
            return _productRepository.GetAllProductsByStore(storeId);
        }

        public List<Product> GetProductsBySearch(ProductSearchCriteria searchCriteriaObject)
        {
            return _productRepository.GetProductsBySearch(searchCriteriaObject);
        }

        public List<ProductInventoryListViewModel> GetInventoryBySearch(ProductSearchCriteria searchCriteriaObject)
        {
            return _productRepository.GetInventoryBySearch(searchCriteriaObject);
        }

        /// <summary>
        /// Save Product
        /// </summary>
        /// <returns>Product Id</returns>
        public int SaveProduct(Product productObj)
        {
            return _productRepository.SaveProduct(productObj);
        }

        /// <summary>
        /// Save Supplier
        /// </summary>
        /// <returns>Supplier Id</returns>
        public int SaveSupplier(ProductSupplier productSupplierObj)
        {
            return _productRepository.SaveSupplier(productSupplierObj);
        }

        /// <summary>
        /// Update Supplier
        /// </summary>
        /// <returns>Supplier Id</returns>
        public int UpdateSupplier(ProductSupplier productSupplierObj)
        {
            return _productRepository.UpdateSupplier(productSupplierObj);
        }

        /// <summary>
        /// Delete Supplier
        /// </summary>
        /// <returns>Supplier Id</returns>
        public int DeleteSupplier(ProductSupplier productSupplierObj)
        {
            return _productRepository.DeleteSupplier(productSupplierObj);
        }

        public List<ProductSupplier> GetAllSuppliersByStore(int storeId)
        {
            return _productRepository.GetAllSuppliersByStore(storeId);
        }

        /// <summary>
        /// Save Type
        /// </summary>
        /// <returns>Type Id</returns>
        public int SaveType(ProductType productTypeObj)
        {
            return _productRepository.SaveType(productTypeObj);
        }

        /// <summary>
        /// Update Type
        /// </summary>
        /// <returns>Type Id</returns>
        public int UpdateType(ProductType productTypeObj)
        {
            return _productRepository.UpdateType(productTypeObj);
        }

        /// <summary>
        /// Delete Type
        /// </summary>
        /// <returns>Type Id</returns>
        public int DeleteType(ProductType productTypeObj)
        {
            return _productRepository.DeleteType(productTypeObj);
        }

        public List<ProductType> GetAllTypesByStore(int storeId)
        {
            return _productRepository.GetAllTypesByStore(storeId);
        }

        /// <summary>
        /// Save Tag
        /// </summary>
        /// <returns>Tag Id</returns>
        public int SaveTag(ProductTagMaster productTagObj)
        {
            return _productRepository.SaveTag(productTagObj);
        }

        /// <summary>
        /// Update Tag
        /// </summary>
        /// <returns>Tag Id</returns>
        public int UpdateTag(ProductTagMaster productTagObj)
        {
            return _productRepository.UpdateTag(productTagObj);
        }

        /// <summary>
        /// Delete Tag
        /// </summary>
        /// <returns>Tag Id</returns>
        public int DeleteTag(ProductTagMaster productTagObj)
        {
            return _productRepository.DeleteTag(productTagObj);
        }

        public List<ProductTagMaster> GetAllTagsByStore(int storeId)
        {
            return _productRepository.GetAllTagsByStore(storeId);
        }

        public AddEditProductMasterViewModel GetAllMasterDataForCreateOrEditProduct(int storeId)
        {
            return _productRepository.GetAllMasterDataForCreateOrEditProduct(storeId);
        }

        public AddEditDiscountOfferMasterViewModel GetAllMasterDataForCreateOrEditDiscountOffer(int storeId)
        {
            return _productRepository.GetAllMasterDataForCreateOrEditDiscountOffer(storeId);
        }

        public List<StoreOutlet> GetStoreOutlets(int storeId)
        {
            return _productRepository.GetStoreOutlets(storeId);
        }
    }
}
