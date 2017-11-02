using DnD.Repository.Providers;
using DnD.Model.Entity;
using DnD.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DnD.Model.ViewModel;
using System.Xml.Linq;

namespace DnD.Repository
{
    public class ProductRepository : IProductRepository
    {
        /// <summary>
        /// private properties
        /// </summary>
        DataBaseRepository _dataBaseRepository;

        /// <summary>
        /// Initialise the Database repository object
        /// </summary>
        /// <param name="dbRespository"></param>
        public ProductRepository(DataBaseRepository dbRespository)
        {
            _dataBaseRepository = dbRespository;
        }

        /// <summary>
        /// Save Brand
        /// </summary>
        /// <returns></returns>
        public int SaveBrand(ProductBrand productBrandObj)
        {
            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspInsertBrand))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "BrandName", productBrandObj.BrandName, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "BrandDescription", productBrandObj.BrandDescription, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "CreatedBy", 1, DbType.Int32));
                var BrandId = Convert.ToInt32(_dataBaseRepository.db.ExecuteScalar(command));

                return BrandId;

            }
        }

        /// <summary>
        /// Update Brand
        /// </summary>
        /// <returns></returns>
        public int UpdateBrand(ProductBrand productBrandObj)
        {
            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspUpdateBrand))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductBrandId", productBrandObj.ProductBrandId, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "BrandName", productBrandObj.BrandName, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "BrandDescription", productBrandObj.BrandDescription, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "UpdatedBy", 1, DbType.Int32));
                var BrandId = Convert.ToInt32(_dataBaseRepository.db.ExecuteScalar(command));

                return BrandId;

            }
        }

        /// <summary>
        /// Delete Brand
        /// </summary>
        /// <returns></returns>
        public int DeleteBrand(ProductBrand productBrandObj)
        {
            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspDeleteBrand))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductBrandId", productBrandObj.ProductBrandId, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "UpdatedBy", 1, DbType.Int32));
                var BrandId = Convert.ToInt32(_dataBaseRepository.db.ExecuteScalar(command));

                return BrandId;

            }
        }

        public List<ProductBrand> GetAllBrandsByStore(int storeId)
        {
            List<ProductBrand> Brands = new List<ProductBrand>();

            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspGetAllBrandsByStore))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "StoreId", storeId, DbType.Int32));
                using (var objDataReader = _dataBaseRepository.db.ExecuteReader(command))
                {
                    while (objDataReader.Read())
                    {
                        ProductBrand Brand = new ProductBrand();
                        Brand.ProductBrandId = HelperMethods.GetDataValue<int>(objDataReader, "ProductBrandId");
                        Brand.BrandName = HelperMethods.GetDataValue<string>(objDataReader, "BrandName"); ;
                        Brand.BrandDescription = HelperMethods.GetDataValue<string>(objDataReader, "BrandDescription"); ;
                        Brand.IsActive = HelperMethods.GetDataValue<bool>(objDataReader, "IsActive");
                        Brands.Add(Brand);
                    }
                }
                return Brands;
            }
        }

        public List<ProductInventoryListViewModel> GetInventoryBySearch(ProductSearchCriteria searchCriteriaObject)
        {
            List<ProductInventoryListViewModel> productInventories = new List<ProductInventoryListViewModel>();

            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspGetInventoryBySearch))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "NameSkuHandleSupplier", searchCriteriaObject.NameSkuHandleSupplier, DbType.String));
                using (var objDataReader = _dataBaseRepository.db.ExecuteReader(command))
                {
                    while (objDataReader.Read())
                    {
                        ProductInventoryListViewModel productInventory = new ProductInventoryListViewModel();
                        productInventory.ProductId = HelperMethods.GetDataValue<int>(objDataReader, "ProductId");
                        productInventory.ProductName = HelperMethods.GetDataValue<string>(objDataReader, "ProductName");
                        productInventory.IsProductHasVariants = HelperMethods.GetDataValue<bool>(objDataReader, "IsProductHasVariants");
                        productInventory.ProductVariantId = HelperMethods.GetDataValue<int>(objDataReader, "ProductVariantId");
                        productInventory.ProductVariantName = HelperMethods.GetDataValue<string>(objDataReader, "ProductVariantName");
                        productInventory.ProductSKU = HelperMethods.GetDataValue<string>(objDataReader, "ProductSKU");
                        productInventory.IsActive = HelperMethods.GetDataValue<bool>(objDataReader, "IsActive");

                        productInventories.Add(productInventory);
                    }

                    if(objDataReader.NextResult())
                    {
                        while(objDataReader.Read())
                        {
                            var inventory = productInventories.FirstOrDefault(i => i.ProductVariantId == HelperMethods.GetDataValue<int>(objDataReader, "ProductVariantId"));
                            if(inventory.StoreOutletsInventory == null)
                            {
                                inventory.StoreOutletsInventory = new List<StoreOutletInventoryViewModel>();
                            }
                            StoreOutletInventoryViewModel storeOutletInventory = new StoreOutletInventoryViewModel();
                            storeOutletInventory.ProductVariantId = HelperMethods.GetDataValue<int>(objDataReader, "ProductVariantId");
                            storeOutletInventory.StoreOutletId = HelperMethods.GetDataValue<int>(objDataReader, "StoreOutletId");
                            storeOutletInventory.StoreOutletCurrentInventory = HelperMethods.GetDataValue<int>(objDataReader, "StoreOutletCurrentInventory");
                            inventory.StoreOutletsInventory.Add(storeOutletInventory);
                        }
                    }
                }
                return productInventories;
            }
        }

        public List<Product> GetProductsBySearch(ProductSearchCriteria searchCriteriaObject)
        {
            List<Product> products = new List<Product>();

            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspGetProductsBySearch))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "NameSkuHandleSupplier", searchCriteriaObject.NameSkuHandleSupplier, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductTypeId", searchCriteriaObject.ProductTypeId, DbType.Int32));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductBrandId", searchCriteriaObject.ProductBrandId, DbType.Int32));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductSupplierId", searchCriteriaObject.ProductSupplierId, DbType.Int32));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductTags", searchCriteriaObject.ProductTags, DbType.String));
                using (var objDataReader = _dataBaseRepository.db.ExecuteReader(command))
                {
                    while (objDataReader.Read())
                    {
                        Product product = new Product();
                        product.ProductBrand = new ProductBrand();
                        product.ProductSupplier = new ProductSupplier();
                        product.ProductId = HelperMethods.GetDataValue<int>(objDataReader, "ProductId");
                        product.ProductName = HelperMethods.GetDataValue<string>(objDataReader, "ProductName");
                        product.CreatedOn = HelperMethods.GetDataValue<DateTime>(objDataReader, "CreatedOn");
                        product.ProductBrand.BrandName = HelperMethods.GetDataValue<string>(objDataReader, "BrandName");
                        product.ProductSupplier.SupplierName = HelperMethods.GetDataValue<string>(objDataReader, "SupplierName");
                        product.IsActive = HelperMethods.GetDataValue<bool>(objDataReader, "IsActive");
                        products.Add(product);
                    }

                    if (objDataReader.NextResult())
                    { // Get Product Tags
                        while (objDataReader.Read())
                        {

                            var product = products.FirstOrDefault(p => p.ProductId == HelperMethods.GetDataValue<int>(objDataReader, "ProductId"));
                            if (product != null)
                            {
                                if (product.ProductTags == null)
                                {
                                    product.ProductTags = new List<ProductTagMaster>();
                                }
                                ProductTagMaster tag = new ProductTagMaster();
                                //tag.ProductTagId = HelperMethods.GetDataValue<int>(dataReader, "ProductTagId");
                                tag.TagName = HelperMethods.GetDataValue<string>(objDataReader, "TagName");
                                product.ProductTags.Add(tag);
                            }
                        }
                    }
                }
                return products;
            }
        }

        public List<Product> GetAllProductsByStore(int storeId)
        {
            List<Product> products = new List<Product>();

            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspGetAllProductsByStore))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "StoreId", storeId, DbType.Int32));
                using (var objDataReader = _dataBaseRepository.db.ExecuteReader(command))
                {
                    while (objDataReader.Read())
                    {
                        Product product = new Product();
                        product.ProductBrand = new ProductBrand();
                        product.ProductSupplier = new ProductSupplier();
                        product.ProductId = HelperMethods.GetDataValue<int>(objDataReader, "ProductId");
                        product.ProductName = HelperMethods.GetDataValue<string>(objDataReader, "ProductName");
                        product.CreatedOn = HelperMethods.GetDataValue<DateTime>(objDataReader, "CreatedOn");
                        product.ProductBrand.BrandName = HelperMethods.GetDataValue<string>(objDataReader, "BrandName");
                        product.ProductSupplier.SupplierName = HelperMethods.GetDataValue<string>(objDataReader, "SupplierName");
                        product.IsActive = HelperMethods.GetDataValue<bool>(objDataReader, "IsActive");
                        products.Add(product);
                    }

                    if (objDataReader.NextResult())
                    { // Get Product Tags
                        while (objDataReader.Read())
                        {

                            var product = products.FirstOrDefault(p => p.ProductId == HelperMethods.GetDataValue<int>(objDataReader, "ProductId"));
                            if (product != null)
                            {
                                if (product.ProductTags == null)
                                {
                                    product.ProductTags = new List<ProductTagMaster>();
                                }
                                ProductTagMaster tag = new ProductTagMaster();
                                //tag.ProductTagMasterId = HelperMethods.GetDataValue<int>(dataReader, "ProductTagMasterId");
                                tag.TagName = HelperMethods.GetDataValue<string>(objDataReader, "TagName");
                                product.ProductTags.Add(tag);
                            }
                        }
                    }
                }
                return products;
            }
        }


        /// <summary>
        /// Save Product
        /// </summary>
        /// <returns>Product Id</returns>
        public int SaveProduct(Product productObj)
        {

            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspInsertProduct))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductName", productObj.ProductName, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductHandle", productObj.ProductHandle, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "IsProductCanBeSold", productObj.IsProductCanBeSold, DbType.Boolean));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Description", productObj.Description, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductTypeId", productObj.ProductTypeId, DbType.Int32));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductBrandId", productObj.ProductBrandId, DbType.Int32));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "SupplierId", productObj.SupplierId, DbType.Int32));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "SupplierCode", productObj.SupplierCode, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "SalesAccountCode", productObj.SalesAccountCode, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "PurchaseAccountCode", productObj.PurchaseAccountCode, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "IsProductHasVariants", productObj.IsProductHasVariants, DbType.Boolean));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "CreatedBy", 1, DbType.Int32));
                var productId = Convert.ToInt32(_dataBaseRepository.db.ExecuteScalar(command));
                SaveProductTags(productId, productObj.ProductTags);
                //SaveProductPricings(productId, productObj.ProductPricings);
                //SaveProductOutletPricings(productId, productObj.ProductOutletPricings);
                if (productObj.IsProductHasVariants)
                {
                    SaveProductVariantAttributes(productId, productObj.ProductVariantAttributes);
                }
                SaveProductInventory(productId, productObj.ProductName, productObj.IsProductHasVariants, productObj.ProductInventory);

                return productId;

            }
        }

        public int SaveProductVariantAttributes(int productId, ICollection<ProductVariantAttribute> productVariantAttributes)
        {

            using (var command = _dataBaseRepository.db.GetStoredProcCommand((Constants.UspInsertProductVariantAttribute)))
            {
                //convert the variants list to xml string
                var productVariantAttributesListXML = new XElement("ProductVariantAttributesList",
                                                productVariantAttributes.Select(a => new XElement("productVariantAttribute",
                                                new XElement("ProductId", productId),
                                                new XElement("ProductVariantAttributeMasterId", a.ProductVariantAttributeMasterId),
                                                new XElement("VariantAttributeTagName", a.VariantAttributeTagName))));

                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductVariantAttributesList", productVariantAttributesListXML.ToString(), DbType.Xml));
                int value = _dataBaseRepository.db.ExecuteNonQuery(command);
                return value;
            }
        }

        public int SaveProductVariant(int productId, string productName, ProductInventory productInventory)
        {

            using (var command = _dataBaseRepository.db.GetStoredProcCommand((Constants.UspInsertProductVariant)))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductId", productId, DbType.Int32));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductVariantName", productName + " -- " + productInventory.ProductVariantName, DbType.String));
                var productVariantId = Convert.ToInt32(_dataBaseRepository.db.ExecuteScalar(command));
                return productVariantId;
            }
        }

        public int SaveProductInventory(int productId, string productName, bool isProductHasVariants, ICollection<ProductInventory> productInventory)
        {
            int returnProductInventoryId = 0;
                foreach (var inventory in productInventory)
                {
                    
                    using (var command = _dataBaseRepository.db.GetStoredProcCommand((Constants.UspInsertProductInventory)))
                    {
                        command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductId", productId, DbType.Int32));
                        if (isProductHasVariants)
                        {
                            int productVariantId = SaveProductVariant(productId, productName, inventory);
                            command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductVariantId", productVariantId, DbType.Int32));
                        }
                        else
                        {
                            command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductVariantId", null, DbType.Int32));
                        }
                        
                        command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductVariantSKU", inventory.ProductVariantSKU, DbType.String));
                        command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductVariantSupplierCode", inventory.ProductVariantSupplierCode, DbType.String));
                        command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductVariantSupplyPrice", inventory.ProductVariantSupplyPrice, DbType.Decimal));
                        command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductVariantMarkup", inventory.ProductVariantMarkup, DbType.Decimal));
                        command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductVariantRetailPrice", inventory.ProductVariantRetailPrice, DbType.Decimal));
                    //convert the store outlet inventorys list to xml string
                    var storeOutletInventoryListXML = new XElement("StoreOutletInventoryList",
                                                        inventory.ProductVariantInventory.Select(
                                                            so => new XElement("StoreOutletInventory",
                                                        new XElement("StoreOutletId", so.StoreOutletId),
                                                        new XElement("StoreOutletCurrentInventory", so.StoreOutletCurrentInventory),
                                                        new XElement("StoreOutletReorderPoint", so.StoreOutletReorderPoint),
                                                        new XElement("StoreOutletReorderAmount", so.StoreOutletReorderAmount))));

                        command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "StoreOutletInventoryList", storeOutletInventoryListXML.ToString(), DbType.Xml));
                    returnProductInventoryId = _dataBaseRepository.db.ExecuteNonQuery(command);
                    }
                }
            return returnProductInventoryId;
        }

        public int SaveProductTags(int productId, ICollection<ProductTagMaster> productTags)
        {

            using (var command = _dataBaseRepository.db.GetStoredProcCommand((Constants.UspInsertProductTag)))
            {
                //convert the tags list to xml string
                var tagsListXML = new XElement("TagsList",
                                                productTags.Select(t => new XElement("Tag",
                                                new XElement("ProductId", productId),
                                                new XElement("ProductTagMasterId", t.ProductTagMasterId))));

                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "TagsList", tagsListXML.ToString(), DbType.Xml));
                int value = _dataBaseRepository.db.ExecuteNonQuery(command);
                return value;
            }
        }

        public int SaveProductPricings(int productId, ICollection<ProductPricing> productPricings)
        {
            using (var command = _dataBaseRepository.db.GetStoredProcCommand((Constants.UspInsertProductPricing)))
            {
                //convert the product pricings list to xml string
                var productPricingsListXML = new XElement("ProductPricingsList",
                                                productPricings.Select(p => new XElement("ProductPricing",
                                                new XElement("ProductId", productId),
                                                new XElement("PricingTierId", p.PricingTierId),
                                                new XElement("SupplyPrice", p.SupplyPrice),
                                                new XElement("MarkupPercentage", p.MarkupPercentage),
                                                new XElement("ProductPriceExcludingTax", p.ProductPriceExcludingTax))));

                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductPricingsList", productPricingsListXML.ToString(), DbType.Xml));
                int value = _dataBaseRepository.db.ExecuteNonQuery(command);
                return value;
            }
        }

        public int SaveProductOutletPricings(int productId, ICollection<ProductOutletPricing> productOutletPricings)
        {

            using (var command = _dataBaseRepository.db.GetStoredProcCommand((Constants.UspInsertProductOutletPricing)))
            {
                //convert the product outlet pricings list to xml string
                var productOutletPricingsListXML = new XElement("ProductOutletPricingsList",
                                                productOutletPricings.Select(p => new XElement("ProductOutletPricing",
                                                new XElement("ProductId", productId),
                                                new XElement("StoreOutletId", p.StoreOutletId),
                                                new XElement("SalestaxId", p.SalestaxId),
                                                new XElement("TaxAmount", p.TaxAmount),
                                                new XElement("ProductPriceIncludingTax", p.ProductPriceIncludingTax))));

                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductOutletPricingsList", productOutletPricingsListXML.ToString(), DbType.Xml));
                int value = _dataBaseRepository.db.ExecuteNonQuery(command);
                return value;
            }
        }

        /// <summary>
        /// Save Supplier
        /// </summary>
        /// <returns></returns>
        public int SaveSupplier(ProductSupplier productSupplierObj)
        {
            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspInsertSupplier))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "SupplierName", productSupplierObj.SupplierName, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "SupplierDefaultMarkup", productSupplierObj.SupplierDefaultMarkup, DbType.Decimal));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Description", productSupplierObj.Description, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Firstname", productSupplierObj.Firstname, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Lastname", productSupplierObj.Lastname, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Company", productSupplierObj.Company, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Email", productSupplierObj.Email, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Phone", productSupplierObj.Phone, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Mobile", productSupplierObj.Mobile, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Fax", productSupplierObj.Fax, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Website", productSupplierObj.Website, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Twitter", productSupplierObj.Twitter, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "AddressStreet1", productSupplierObj.AddressStreet1, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "AddressStreet2", productSupplierObj.AddressStreet2, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Postcode", productSupplierObj.Postcode, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "State", productSupplierObj.State, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Country", productSupplierObj.Country, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "CreatedBy", 1, DbType.Int32));
                var supplierId = Convert.ToInt32(_dataBaseRepository.db.ExecuteScalar(command));

                return supplierId;

            }
        }

        /// <summary>
        /// Update Supplier
        /// </summary>
        /// <returns></returns>
        public int UpdateSupplier(ProductSupplier productSupplierObj)
        {
            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspUpdateSupplier))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "SupplierName", productSupplierObj.SupplierName, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "SupplierDefaultMarkup", productSupplierObj.SupplierDefaultMarkup, DbType.Decimal));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Description", productSupplierObj.Description, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Firstname", productSupplierObj.Firstname, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Lastname", productSupplierObj.Lastname, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Company", productSupplierObj.Company, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Email", productSupplierObj.Email, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Phone", productSupplierObj.Phone, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Mobile", productSupplierObj.Mobile, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Fax", productSupplierObj.Fax, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Website", productSupplierObj.Website, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Twitter", productSupplierObj.Twitter, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "AddressStreet1", productSupplierObj.AddressStreet1, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "AddressStreet2", productSupplierObj.AddressStreet2, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Postcode", productSupplierObj.Postcode, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "State", productSupplierObj.State, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "Country", productSupplierObj.Country, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "UpdatedBy", 1, DbType.Int32));
                var supplierId = Convert.ToInt32(_dataBaseRepository.db.ExecuteScalar(command));

                return supplierId;

            }
        }

        /// <summary>
        /// Delete Supplier
        /// </summary>
        /// <returns></returns>
        public int DeleteSupplier(ProductSupplier productSupplierObj)
        {
            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspDeleteSupplier))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductSupplierId", productSupplierObj.ProductSupplierId, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "UpdatedBy", 1, DbType.Int32));
                var supplierId = Convert.ToInt32(_dataBaseRepository.db.ExecuteScalar(command));

                return supplierId;

            }
        }

        public List<ProductSupplier> GetAllSuppliersByStore(int storeId)
        {
            List<ProductSupplier> suppliers = new List<ProductSupplier>();

            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspGetAllSuppliersByStore))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "StoreId", storeId, DbType.Int32));
                using (var objDataReader = _dataBaseRepository.db.ExecuteReader(command))
                {
                    while (objDataReader.Read())
                    {
                        ProductSupplier supplier = new ProductSupplier();
                        supplier.ProductSupplierId = HelperMethods.GetDataValue<int>(objDataReader, "ProductSupplierId");
                        supplier.SupplierName = HelperMethods.GetDataValue<string>(objDataReader, "SupplierName");
                        supplier.SupplierDefaultMarkup = HelperMethods.GetDataValue<decimal>(objDataReader, "SupplierDefaultMarkup");
                        supplier.Description = HelperMethods.GetDataValue<string>(objDataReader, "Description");
                        supplier.Firstname = HelperMethods.GetDataValue<string>(objDataReader, "Firstname");
                        supplier.Lastname = HelperMethods.GetDataValue<string>(objDataReader, "Lastname");
                        supplier.Company = HelperMethods.GetDataValue<string>(objDataReader, "Company");
                        supplier.Email = HelperMethods.GetDataValue<string>(objDataReader, "Email");
                        supplier.Phone = HelperMethods.GetDataValue<string>(objDataReader, "Phone");
                        supplier.Mobile = HelperMethods.GetDataValue<string>(objDataReader, "Mobile");
                        supplier.Fax = HelperMethods.GetDataValue<string>(objDataReader, "Fax");
                        supplier.Website = HelperMethods.GetDataValue<string>(objDataReader, "Website");
                        supplier.Twitter = HelperMethods.GetDataValue<string>(objDataReader, "Twitter");
                        supplier.AddressStreet1 = HelperMethods.GetDataValue<string>(objDataReader, "AddressStreet1");
                        supplier.AddressStreet2 = HelperMethods.GetDataValue<string>(objDataReader, "AddressStreet2");
                        supplier.Postcode = HelperMethods.GetDataValue<string>(objDataReader, "Postcode");
                        supplier.State = HelperMethods.GetDataValue<string>(objDataReader, "State");
                        supplier.Country = HelperMethods.GetDataValue<string>(objDataReader, "Country");
                        supplier.IsActive = HelperMethods.GetDataValue<bool>(objDataReader, "IsActive");
                        suppliers.Add(supplier);
                    }
                }
                return suppliers;
            }
        }

        /// <summary>
        /// Save Type
        /// </summary>
        /// <returns></returns>
        public int SaveType(ProductType productTypeObj)
        {
            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspInsertProductType))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductTypeName", productTypeObj.ProductTypeName, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "CreatedBy", 1, DbType.Int32));
                var productTypeId = Convert.ToInt32(_dataBaseRepository.db.ExecuteScalar(command));

                return productTypeId;

            }
        }

        /// <summary>
        /// Update Type
        /// </summary>
        /// <returns></returns>
        public int UpdateType(ProductType productTypeObj)
        {
            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspUpdateProductType))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductTypeId", productTypeObj.ProductTypeId, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductTypeName", productTypeObj.ProductTypeName, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "UpdatedBy", 1, DbType.Int32));
                var productTypeId = Convert.ToInt32(_dataBaseRepository.db.ExecuteScalar(command));

                return productTypeId;

            }
        }

        /// <summary>
        /// Delete Product type
        /// </summary>
        /// <returns></returns>
        public int DeleteType(ProductType productTypeObj)
        {
            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspDeleteProductType))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductTypeId", productTypeObj.ProductTypeId, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "UpdatedBy", 1, DbType.Int32));
                var productTypeId = Convert.ToInt32(_dataBaseRepository.db.ExecuteScalar(command));

                return productTypeId;

            }
        }

        public List<ProductType> GetAllTypesByStore(int storeId)
        {
            List<ProductType> productTypes = new List<ProductType>();

            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspGetAllProductTypesByStore))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "StoreId", storeId, DbType.Int32));
                using (var objDataReader = _dataBaseRepository.db.ExecuteReader(command))
                {
                    while (objDataReader.Read())
                    {
                        ProductType productType = new ProductType();
                        productType.ProductTypeId = HelperMethods.GetDataValue<int>(objDataReader, "ProductTypeId");
                        productType.ProductTypeName = HelperMethods.GetDataValue<string>(objDataReader, "ProductTypeName"); ;
                        productType.IsActive = HelperMethods.GetDataValue<bool>(objDataReader, "IsActive");
                        productTypes.Add(productType);
                    }
                }
                return productTypes;
            }
        }

        /// <summary>
        /// Save Tag
        /// </summary>
        /// <returns></returns>
        public int SaveTag(ProductTagMaster productTagObj)
        {
            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspInsertTag))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "TagName", productTagObj.TagName, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "CreatedBy", 1, DbType.Int32));
                var tagId = Convert.ToInt32(_dataBaseRepository.db.ExecuteScalar(command));

                return tagId;

            }
        }

        /// <summary>
        /// Update Tag
        /// </summary>
        /// <returns></returns>
        public int UpdateTag(ProductTagMaster productTagMasterObj)
        {
            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspUpdateTag))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductTagMasterId", productTagMasterObj.ProductTagMasterId, DbType.Int32));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "TagName", productTagMasterObj.TagName, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "UpdatedBy", 1, DbType.Int32));
                var tagId = Convert.ToInt32(_dataBaseRepository.db.ExecuteScalar(command));

                return tagId;

            }
        }

        /// <summary>
        /// Delete Tag
        /// </summary>
        /// <returns></returns>
        public int DeleteTag(ProductTagMaster productTagMasterObj)
        {
            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspDeleteTag))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "ProductTagMasterId", productTagMasterObj.ProductTagMasterId, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "UpdatedBy", 1, DbType.Int32));
                var tagId = Convert.ToInt32(_dataBaseRepository.db.ExecuteScalar(command));

                return tagId;

            }
        }

        public List<ProductTagMaster> GetAllTagsByStore(int storeId)
        {
            List<ProductTagMaster> tags = new List<ProductTagMaster>();

            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspGetAllTagsByStore))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "StoreId", storeId, DbType.Int32));
                using (var objDataReader = _dataBaseRepository.db.ExecuteReader(command))
                {
                    while (objDataReader.Read())
                    {
                        ProductTagMaster tag = new ProductTagMaster();
                        tag.ProductTagMasterId = HelperMethods.GetDataValue<int>(objDataReader, "ProductTagMasterId");
                        tag.TagName = HelperMethods.GetDataValue<string>(objDataReader, "TagName"); ;
                        tag.IsActive = HelperMethods.GetDataValue<bool>(objDataReader, "IsActive");
                        tags.Add(tag);
                    }
                }
                return tags;
            }
        }

        public List<StoreOutlet> GetStoreOutlets(int storeId)
        {
            List<StoreOutlet> storeOutlets = new List<StoreOutlet>();
            using (var command = _dataBaseRepository.db.GetStoredProcCommand(Constants.UspGetStoreOutlets))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "StoreId", storeId, DbType.Int32));
                using (var dataReader = _dataBaseRepository.db.ExecuteReader(command))
                {
                    // Get Store Outlets
                        while (dataReader.Read())
                        {
                            StoreOutlet outlet = new StoreOutlet();
                            outlet.StoreOutletId = HelperMethods.GetDataValue<int>(dataReader, "StoreOutletId");
                            outlet.OutletName = HelperMethods.GetDataValue<string>(dataReader, "OutletName");
                            outlet.OutletDefaultSalesTaxId = HelperMethods.GetDataValue<int>(dataReader, "OutletDefaultSalesTaxId");
                            storeOutlets.Add(outlet);
                        }
                }
            }
            return storeOutlets;
        }

        public AddEditDiscountOfferMasterViewModel GetAllMasterDataForCreateOrEditDiscountOffer(int storeId)
        {
            AddEditDiscountOfferMasterViewModel addEditDiscountOfferMaster = new AddEditDiscountOfferMasterViewModel();
            List<DiscountType> discountTypes = new List<DiscountType>();
            List<DiscountOfferType> discountOfferTypes = new List<DiscountOfferType>();
            List<Product> products = new List<Product>();
            List<ProductTagMaster> productTags = new List<ProductTagMaster>();
            List<ProductType> productTypes = new List<ProductType>();
            List<ProductBrand> productBrands = new List<ProductBrand>();
            List<StoreOutlet> storeOutlets = new List<StoreOutlet>();
            List<CustomerGroupMaster> customerGroups = new List<CustomerGroupMaster>();

            using (var command = _dataBaseRepository.db.GetStoredProcCommand(Constants.UspGetAllMasterDataForCreateOrEditDiscountOffer))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "StoreId", storeId, DbType.Int32));
                using (var dataReader = _dataBaseRepository.db.ExecuteReader(command))
                {
                    while (dataReader.Read())
                    {
                        DiscountType discountType = new DiscountType();
                        discountType.DiscountTypeId = HelperMethods.GetDataValue<int>(dataReader, "DiscountTypeId");
                        discountType.DiscountTypeName = HelperMethods.GetDataValue<string>(dataReader, "DiscountTypeName");
                        discountTypes.Add(discountType);
                    }

                    if (dataReader.NextResult())
                    {
                        while (dataReader.Read())
                        {
                            DiscountOfferType discountOfferType = new DiscountOfferType();
                            discountOfferType.DiscountOfferTypeId = HelperMethods.GetDataValue<int>(dataReader, "DiscountOfferTypeId");
                            discountOfferType.DiscountOfferTypeName = HelperMethods.GetDataValue<string>(dataReader, "DiscountOfferTypeName");
                            discountOfferTypes.Add(discountOfferType);
                        }
                    }

                    if (dataReader.NextResult())
                    {
                        while (dataReader.Read())
                        {
                            Product product = new Product();
                            product.ProductId = HelperMethods.GetDataValue<int>(dataReader, "ProductId");
                            product.ProductName = HelperMethods.GetDataValue<string>(dataReader, "ProductName");
                            products.Add(product);
                        }
                    }

                    if (dataReader.NextResult())
                    {
                        // Get Product Tags
                        while (dataReader.Read())
                        {
                            ProductTagMaster tag = new ProductTagMaster();
                            tag.ProductTagMasterId = HelperMethods.GetDataValue<int>(dataReader, "ProductTagMasterId");
                            tag.TagName = HelperMethods.GetDataValue<string>(dataReader, "TagName"); ;
                            productTags.Add(tag);
                        }
                    }

                    // Get product types
                    if (dataReader.NextResult())
                    {
                        while (dataReader.Read())
                        {
                            ProductType type = new ProductType();
                            type.ProductTypeId = HelperMethods.GetDataValue<int>(dataReader, "ProductTypeId");
                            type.ProductTypeName = HelperMethods.GetDataValue<string>(dataReader, "ProductTypeName");
                            productTypes.Add(type);
                        }
                    }

                    // Get Product Brands
                    if (dataReader.NextResult())
                    {
                        while (dataReader.Read())
                        {
                            ProductBrand brand = new ProductBrand();
                            brand.ProductBrandId = HelperMethods.GetDataValue<int>(dataReader, "ProductBrandId");
                            brand.BrandName = HelperMethods.GetDataValue<string>(dataReader, "BrandName");
                            brand.BrandDescription = HelperMethods.GetDataValue<string>(dataReader, "BrandDescription");
                            productBrands.Add(brand);
                        }
                    }

                    // Get Store Outlets
                    if (dataReader.NextResult())
                    {
                        while (dataReader.Read())
                        {
                            StoreOutlet outlet = new StoreOutlet();
                            outlet.StoreOutletId = HelperMethods.GetDataValue<int>(dataReader, "StoreOutletId");
                            outlet.OutletName = HelperMethods.GetDataValue<string>(dataReader, "OutletName");
                            storeOutlets.Add(outlet);
                        }
                    }

                    if (dataReader.NextResult())
                    {
                        while (dataReader.Read())
                        {
                            CustomerGroupMaster customerGroup = new CustomerGroupMaster();
                            customerGroup.CustomerGroupMasterId = HelperMethods.GetDataValue<int>(dataReader, "CustomerGroupMasterId");
                            customerGroup.GroupName = HelperMethods.GetDataValue<string>(dataReader, "GroupName");
                            customerGroups.Add(customerGroup);
                        }
                    }


                }
            }

            addEditDiscountOfferMaster.DiscountTypes = discountTypes;
            addEditDiscountOfferMaster.DiscountOfferTypes = discountOfferTypes;
            addEditDiscountOfferMaster.ProductTags = productTags;
            addEditDiscountOfferMaster.ProductTypes = productTypes;
            addEditDiscountOfferMaster.ProductBrands = productBrands;
            addEditDiscountOfferMaster.StoreOutlets = storeOutlets;
            addEditDiscountOfferMaster.CustomerGroups = customerGroups;
            return addEditDiscountOfferMaster;
        }

        public AddEditProductMasterViewModel GetAllMasterDataForCreateOrEditProduct(int storeId)
        {
            AddEditProductMasterViewModel addEditProductMaster = new AddEditProductMasterViewModel();
            List<ProductTagMaster> productTags = new List<ProductTagMaster>();
            List<ProductType> productTypes = new List<ProductType>();
            List<ProductBrand> productBrands = new List<ProductBrand>();
            List<ProductSupplier> productSuppliers = new List<ProductSupplier>();
            List<StoreOutlet> storeOutlets = new List<StoreOutlet>();
            List<ProductVariantAttributeMaster> productVariantAttributes = new List<ProductVariantAttributeMaster>();
            List<SalesTax> salesTaxes = new List<SalesTax>();

            using (var command = _dataBaseRepository.db.GetStoredProcCommand(Constants.UspGetAllMasterDataForCreateOrEditProduct))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "StoreId", storeId, DbType.Int32));
                using (var dataReader = _dataBaseRepository.db.ExecuteReader(command))
                {
                    // Get Product Tags
                    while (dataReader.Read())
                    {
                        ProductTagMaster tag = new ProductTagMaster();
                        tag.ProductTagMasterId = HelperMethods.GetDataValue<int>(dataReader, "ProductTagMasterId");
                        tag.TagName = HelperMethods.GetDataValue<string>(dataReader, "TagName"); ;
                        productTags.Add(tag);
                    }

                    // Get product types
                    if (dataReader.NextResult())
                    {
                        while (dataReader.Read())
                        {
                            ProductType type = new ProductType();
                            type.ProductTypeId = HelperMethods.GetDataValue<int>(dataReader, "ProductTypeId");
                            type.ProductTypeName = HelperMethods.GetDataValue<string>(dataReader, "ProductTypeName");
                            productTypes.Add(type);
                        }
                    }

                    // Get Product Brands
                    if (dataReader.NextResult())
                    {
                        while (dataReader.Read())
                        {
                            ProductBrand brand = new ProductBrand();
                            brand.ProductBrandId = HelperMethods.GetDataValue<int>(dataReader, "ProductBrandId");
                            brand.BrandName = HelperMethods.GetDataValue<string>(dataReader, "BrandName");
                            brand.BrandDescription = HelperMethods.GetDataValue<string>(dataReader, "BrandDescription");
                            productBrands.Add(brand);
                        }
                    }

                    // Get product suppliers
                    if (dataReader.NextResult())
                    {
                        while (dataReader.Read())
                        {
                            ProductSupplier supplier = new ProductSupplier();

                            supplier.ProductSupplierId = HelperMethods.GetDataValue<int>(dataReader, "ProductSupplierId");
                            supplier.SupplierName = HelperMethods.GetDataValue<string>(dataReader, "SupplierName");
                            supplier.SupplierDefaultMarkup = HelperMethods.GetDataValue<decimal>(dataReader, "SupplierDefaultMarkup");
                            supplier.Description = HelperMethods.GetDataValue<string>(dataReader, "Description");
                            productSuppliers.Add(supplier);
                        }
                    }

                    // Get Store Outlets
                    if (dataReader.NextResult())
                    {
                        while (dataReader.Read())
                        {
                            StoreOutlet outlet = new StoreOutlet();
                            outlet.StoreOutletId = HelperMethods.GetDataValue<int>(dataReader, "StoreOutletId");
                            outlet.OutletName = HelperMethods.GetDataValue<string>(dataReader, "OutletName");
                            outlet.OutletDefaultSalesTaxId = HelperMethods.GetDataValue<int>(dataReader, "OutletDefaultSalesTaxId");
                            storeOutlets.Add(outlet);
                        }
                    }

                    // Get Product Variant Attributes
                    if (dataReader.NextResult())
                    {
                        while (dataReader.Read())
                        {
                            ProductVariantAttributeMaster variantAttribute = new ProductVariantAttributeMaster();
                            variantAttribute.ProductVariantAttributeMasterId = HelperMethods.GetDataValue<int>(dataReader, "ProductVariantAttributeMasterId");
                            variantAttribute.VariantAttributeName = HelperMethods.GetDataValue<string>(dataReader, "VariantAttributeName");
                            productVariantAttributes.Add(variantAttribute);
                        }
                    }

                    // Get Sales Tax
                    if (dataReader.NextResult())
                    {
                        while (dataReader.Read())
                        {
                            SalesTax salesTax = new SalesTax();
                            salesTax.SalesTaxId = HelperMethods.GetDataValue<int>(dataReader, "SalesTaxId");
                            salesTax.TaxName = HelperMethods.GetDataValue<string>(dataReader, "TaxName");
                            salesTax.TaxRate = HelperMethods.GetDataValue<decimal>(dataReader, "TaxRate");
                            salesTaxes.Add(salesTax);
                        }
                    }
                }
            }

            addEditProductMaster.ProductTags = productTags;
            addEditProductMaster.ProductTypes = productTypes;
            addEditProductMaster.ProductBrands = productBrands;
            addEditProductMaster.ProductSuppliers = productSuppliers;
            addEditProductMaster.StoreOutlets = storeOutlets;
            addEditProductMaster.ProductVariantAttributes = productVariantAttributes;
            addEditProductMaster.SalesTaxes = salesTaxes;
            return addEditProductMaster;
        }
    }
}
