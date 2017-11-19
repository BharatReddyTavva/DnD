using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DnD.Common
{
    /// <summary>
    /// Base providers all the constants for the application
    /// </summary>
    public sealed class Constants
    {
        /// <summary>
        /// get the base database connection key of the application DealnDone
        /// </summary>
        public const string DealnDoneConnectionStringKey = "DealnDone";


        //Procedure Names
        //logged in User details procedure
        public const string UspGetLoggedInUserDetails = "usp_GetLoggedInUserDetails";

        //Products
        public const string UspInsertBrand = "usp_InsertBrand";
        public const string UspUpdateBrand = "usp_UpdateBrand";
        public const string UspDeleteBrand = "usp_DeleteBrand";
        public const string UspGetStoreOutlets = "usp_GetStoreOutlets";
        public const string UspGetAllBrandsByStore = "usp_GetAllBrandsByStore";
        public const string UspGetAllProductsByStore = "usp_GetAllProductsByStore";
        public const string UspGetAllProductsForSaleByStore = "usp_GetAllProductsForSaleByStore";
        public const string UspGetProductsBySearch = "usp_GetProductsBySearch";
        public const string UspGetInventoryBySearch = "usp_GetInventoryBySearch";
        public const string UspInsertProduct = "usp_InsertProduct";
        public const string UspInsertProductImage = "usp_InsertProductImage";
        public const string UspInsertProductTag = "usp_InsertProductTag";
        public const string UspInsertProductVariant = "usp_InsertProductVariant";
        public const string UspInsertProductVariantAttribute = "usp_InsertProductVariantAttribute";
        public const string UspInsertProductInventory = "usp_InsertProductInventory";
        public const string UspInsertProductPricing = "usp_InsertProductPricing";
        public const string UspInsertProductOutletPricing = "usp_InsertProductOutletPricing";
        public const string UspInsertSupplier = "usp_InsertSupplier";
        public const string UspUpdateSupplier = "usp_UpdateSupplier";
        public const string UspDeleteSupplier = "usp_DeleteSupplier";
        public const string UspGetAllSuppliersByStore = "usp_GetAllSuppliersByStore";
        public const string UspInsertProductType = "usp_InsertProductType";
        public const string UspUpdateProductType = "usp_UpdateProductType";
        public const string UspDeleteProductType = "usp_DeleteProductType";
        public const string UspGetAllProductTypesByStore = "usp_GetAllProductTypesByStore";
        public const string UspInsertTag = "usp_InsertTag";
        public const string UspUpdateTag = "usp_UpdateTag";
        public const string UspDeleteTag = "usp_DeleteTag";
        public const string UspGetAllTagsByStore = "usp_GetAllTagsByStore";
        public const string UspGetAllMasterDataForCreateOrEditProduct = "usp_GetAllMasterDataForCreateOrEditProduct";
        public const string UspGetAllMasterDataForCreateOrEditDiscountOffer = "usp_GetAllMasterDataForCreateOrEditDiscountOffer";
        public const string UspGetAllSalesTaxList = "usp_GetAllSalesTaxList";

    }
}
