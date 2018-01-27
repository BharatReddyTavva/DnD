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
    public class CustomerController : BaseApiController
    {
        /// <summary>
        /// declare object for cutomer manager provider
        /// </summary>
        readonly ICustomerManager _customeManager;

        public CustomerController(ICustomerManager customeManager)
            : base()
        {
            _customeManager = customeManager;
        }

        #region Customers


        [HttpGet]
        [ActionName("GetAllCustomerByGroup")]
        public IHttpActionResult GetAllCustomerByGroup()
        {
            try
            {
                return Ok(_customeManager.GetAllCustomerByGroup(groupId: default(int?), customerId: default(int?)));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }


        [HttpGet]
        [ActionName("GetCustomerById")]
        public IHttpActionResult GetCustomerById(int customerId)
        {
            try
            {
                return Ok(_customeManager.GetAllCustomerByGroup(groupId: default(int?), customerId: customerId));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Get the all Customers By Search
        /// </summary>
        /// <returns>Collection of Customer</returns>
        [HttpPost]
        [ActionName("GetCustomerBySearch")]
        public IHttpActionResult GetCustomerBySearch([FromBody]CustomerSearchCriteria customerSearchCriteriaObj)
        {
            try
            {
                return Ok(_customeManager.GetCustomerBySearch(customerSearchCriteriaObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }
        }

        /// <summary>
        /// Save Customer
        /// </summary>
        /// <returns>Customer Id</returns>
        [HttpPost]
        [ActionName("SaveCustomer")]
        public IHttpActionResult SaveCustomer(Customer customerObj)
        {
            try
            {
                return Ok(_customeManager.SaveCustomer(customerObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Update Customer
        /// </summary>
        /// <returns>Customer Id</returns>
        [HttpPost]
        [ActionName("UpdateCustomer")]
        public IHttpActionResult UpdateCustomer(Customer customerObj)
        {
            try
            {
                return Ok(_customeManager.UpdateCustomer(customerObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Delete Customer
        /// </summary>
        /// <param name="customerGroupObj"></param>
        /// <returns></returns>
        [HttpPost]
        [ActionName("DeleteCustomer")]
        public IHttpActionResult DeleteCustomer(CustomerViewModel customerObj)
        {
            try
            {
                return Ok(_customeManager.DeleteCustomer(customerObj.CustomerId, 1));
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
        [ActionName("GetAllMasterDataForCreateOrEditCustomer")]
        public IHttpActionResult GetAllMasterDataForCreateOrEditCustomer()
        {
            try
            {
                return Ok(_customeManager.GetAllMasterDataForCreateOrEditCustomer());
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }
        }
        #endregion

        #region Group
        /// <summary>
        /// Save Group
        /// </summary>
        /// <returns>Group Id</returns>
        [HttpPost]
        [ActionName("SaveGroup")]
        public IHttpActionResult SaveGroup(CustomerGroupMaster customerGroupObj)
        {
            try
            {
                return Ok(_customeManager.SaveGroup(customerGroupObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Update Group
        /// </summary>
        /// <returns>Group Id</returns>
        [HttpPost]
        [ActionName("UpdateGroup")]
        public IHttpActionResult UpdateGroup(CustomerGroupMaster customerGroupObj)
        {
            try
            {
                return Ok(_customeManager.UpdateGroup(customerGroupObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }

        /// <summary>
        /// Delete Group
        /// </summary>
        /// <returns>Group Id</returns>
        [HttpPost]
        [ActionName("DeleteGroup")]
        public IHttpActionResult DeleteGroup(CustomerGroupMaster customerGroupObj)
        {
            try
            {
                return Ok(_customeManager.DeleteGroup(customerGroupObj));
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }


        /// <summary>
        /// Get the all Groups list 
        /// </summary>
        /// <returns>Collection of Groups</returns>
        [HttpGet]
        [ActionName("GetAllGroups")]
        public IHttpActionResult GetAllGroups()
        {
            try
            {
                return Ok(_customeManager.GetAllGroups());
            }
            catch (Exception ex)
            {
                //LoggerEx.HandleException(LoggingBoundaries.DomainLayer, ex, false);
                return BadRequest();
            }

        }
        #endregion

    }
}
