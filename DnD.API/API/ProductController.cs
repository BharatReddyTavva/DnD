using DnD.BLL.Providers;
using DnD.Model.Entity;
using DnD.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;

namespace DnD.API.API
{
    public class ProductController : BaseApiController
    {
        /// <summary>
        /// declare object for role manager provider
        /// </summary>
        readonly IProductManager _productManager;

        public ProductController(IProductManager productManager)
            : base()
        {
            _productManager = productManager;
        }

        /// <summary>
        /// Get the all Products list 
        /// </summary>
        /// <returns>Collection of Products</returns>
        [HttpGet]
        [ActionName("GetAllProductsByStore")]
        public IHttpActionResult GetAllProductsByStore()
        {
            try
            {
                return Ok(_productManager.GetAllProductsByStore(1));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Get the all Products By Search
        /// </summary>
        /// <returns>Collection of Products</returns>
        [HttpPost]
        [ActionName("GetProductsBySearch")]
        public IHttpActionResult GetProductsBySearch([FromBody]ProductSearchCriteria searchCriteriaObject)
        {
            try
            {
                return Ok(_productManager.GetProductsBySearch(searchCriteriaObject));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }
        }

        /// <summary>
        /// Save Brand
        /// </summary>
        /// <returns>Brand Id</returns>
        [HttpPost]
        [ActionName("SaveBrand")]
        public IHttpActionResult SaveBrand(ProductBrand productBrandObj)
        {
            try
            {
                return Ok(_productManager.SaveBrand(productBrandObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Update Brand
        /// </summary>
        /// <returns>Brand Id</returns>
        [HttpPut]
        [ActionName("UpdateBrand")]
        public IHttpActionResult UpdateBrand(ProductBrand productBrandObj)
        {
            try
            {
                return Ok(_productManager.UpdateBrand(productBrandObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Delete Brand
        /// </summary>
        /// <returns>Brand Id</returns>
        [HttpPost]
        [ActionName("DeleteBrand")]
        public IHttpActionResult DeleteBrand(ProductBrand productBrandObj)
        {
            try
            {
                return Ok(_productManager.DeleteBrand(productBrandObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }


        /// <summary>
        /// Get the all Brands list 
        /// </summary>
        /// <returns>Collection of Brands</returns>
        [HttpGet]
        [ActionName("GetAllBrands")]
        public IHttpActionResult GetAllBrands()
        {
            try
            {
                return Ok(_productManager.GetAllBrandsByStore(1));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        [HttpPost]
        public async Task<IHttpActionResult> UploadProductImages()
        {
            if (!Request.Content.IsMimeMultipartContent())
                throw new HttpResponseException(HttpStatusCode.UnsupportedMediaType);

            try
            {
                var provider = new MultipartMemoryStreamProvider();
                await Request.Content.ReadAsMultipartAsync(provider);

                var baseUploadPath = @"D:\Uploads\";// + Request.QueryString["someParameter"];

                foreach (var file in provider.Contents)
                {
                    if (file.Headers.ContentLength > 0)
                    {
                        var fileName = file.Headers.ContentDisposition.FileName.Trim('\"');
                        var filePath = Path.Combine(baseUploadPath, fileName);
                        var buffer = await file.ReadAsByteArrayAsync();
                        File.WriteAllBytes(filePath, buffer);
                    }
                }

                return Ok();
            }
            catch (Exception ex)
            {
                var response = Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
                throw new HttpResponseException(response);
            }
        }

        /// <summary>
        /// Save Product
        /// </summary>
        /// <returns>Product Id</returns>
        [HttpPost]
        [ActionName("SaveProduct")]
        public IHttpActionResult SaveProduct(Product productObj)
        {
            try
            {
                return Ok(_productManager.SaveProduct(productObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Save Supplier
        /// </summary>
        /// <returns>Supplier Id</returns>
        [HttpPost]
        [ActionName("SaveSupplier")]
        public IHttpActionResult SaveSupplier(ProductSupplier productSupplierObj)
        {
            try
            {
                return Ok(_productManager.SaveSupplier(productSupplierObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Update Supplier
        /// </summary>
        /// <returns>Supplier Id</returns>
        [HttpPut]
        [ActionName("UpdateSupplier")]
        public IHttpActionResult UpdateSupplier(ProductSupplier productSupplierObj)
        {
            try
            {
                return Ok(_productManager.UpdateSupplier(productSupplierObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Delete Supplier
        /// </summary>
        /// <returns>Supplier Id</returns>
        [HttpPost]
        [ActionName("DeleteSupplier")]
        public IHttpActionResult DeleteSupplier(ProductSupplier productSupplierObj)
        {
            try
            {
                return Ok(_productManager.DeleteSupplier(productSupplierObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }


        /// <summary>
        /// Get the all Suppliers list 
        /// </summary>
        /// <returns>Collection of Suppliers</returns>
        [HttpGet]
        [ActionName("GetAllSuppliers")]
        public IHttpActionResult GetAllSuppliers()
        {
            try
            {
                return Ok(_productManager.GetAllSuppliersByStore(1));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Save Type
        /// </summary>
        /// <returns>Type Id</returns>
        [HttpPost]
        [ActionName("SaveType")]
        public IHttpActionResult SaveType(ProductType productTypeObj)
        {
            try
            {
                return Ok(_productManager.SaveType(productTypeObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Update Type
        /// </summary>
        /// <returns>Type Id</returns>
        [HttpPut]
        [ActionName("UpdateType")]
        public IHttpActionResult UpdateType(ProductType productTypeObj)
        {
            try
            {
                return Ok(_productManager.UpdateType(productTypeObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Delete Type
        /// </summary>
        /// <returns>Type Id</returns>
        [HttpPost]
        [ActionName("DeleteType")]
        public IHttpActionResult DeleteType(ProductType productTypeObj)
        {
            try
            {
                return Ok(_productManager.DeleteType(productTypeObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }


        /// <summary>
        /// Get the all Types list 
        /// </summary>
        /// <returns>Collection of Types</returns>
        [HttpGet]
        [ActionName("GetAllTypes")]
        public IHttpActionResult GetAllTypes()
        {
            try
            {
                return Ok(_productManager.GetAllTypesByStore(1));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }



        /// <summary>
        /// Save Tag
        /// </summary>
        /// <returns>Tag Id</returns>
        [HttpPost]
        [ActionName("SaveTag")]
        public IHttpActionResult SaveTag(ProductTag productTagObj)
        {
            try
            {
                return Ok(_productManager.SaveTag(productTagObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Update Tag
        /// </summary>
        /// <returns>Tag Id</returns>
        [HttpPut]
        [ActionName("UpdateTag")]
        public IHttpActionResult UpdateTag(ProductTag productTagObj)
        {
            try
            {
                return Ok(_productManager.UpdateTag(productTagObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Delete Tag
        /// </summary>
        /// <returns>Tag Id</returns>
        [HttpPost]
        [ActionName("DeleteTag")]
        public IHttpActionResult DeleteTag(ProductTag productTagObj)
        {
            try
            {
                return Ok(_productManager.DeleteTag(productTagObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }


        /// <summary>
        /// Get the all Tags list 
        /// </summary>
        /// <returns>Collection of Tags</returns>
        [HttpGet]
        [ActionName("GetAllTags")]
        public IHttpActionResult GetAllTags()
        {
            try
            {
                return Ok(_productManager.GetAllTagsByStore(1));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Get All MasterData For Create Or Edit Product
        /// </summary>
        /// <returns>Collection of Tags</returns>
        [HttpGet]
        [ActionName("GetAllMasterDataForCreateOrEditProduct")]
        public IHttpActionResult GetAllMasterDataForCreateOrEditProduct()
        {
            try
            {
                return Ok(_productManager.GetAllMasterDataForCreateOrEditProduct(1));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }
        }



    }
}
