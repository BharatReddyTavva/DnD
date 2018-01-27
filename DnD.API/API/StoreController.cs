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
    public class StoreController : BaseApiController
    {
        /// <summary>
        /// declare object for cutomer manager provider
        /// </summary>
        readonly IStoreManager _storeManager;

        public StoreController(IStoreManager storeManager)
            : base()
        {
            _storeManager = storeManager;
        }


        [HttpGet]
        [ActionName("GetAllMasterDataForStore")]
        public IHttpActionResult GetAllMasterDataForStore()
        {
            try
            {
                return Ok(_storeManager.GetAllMasterDataForStore());
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }


        /// <summary>
        /// Save Store Setup
        /// </summary>
        /// <param name="storeSetup"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("SaveStoreSetup")]
        public IHttpActionResult CreateStoreSetup(StoreSetupViewModel storeSetup)
        {
            try
            {
                return Ok(_storeManager.CreateStoreSetup(storeSetup));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }
    }
}
