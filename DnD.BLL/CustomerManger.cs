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
    public class CustomerManger : ICustomerManager
    {
        /// <summary>
        /// declare object for Customer Repository
        /// </summary>
        ICustomerRepository _customerRepository;

        /// <summary>
        /// initialize the Customer repository object, this will be resolved by unity dependency injection
        /// </summary>
        /// <param name="customerRepository"></param>
        public CustomerManger(ICustomerRepository customerRepository)
        {
            _customerRepository = customerRepository;
        }


        #region Customer

        /// <summary>
        /// GetAllCustomerByGroup
        /// </summary>
        /// <param name="groupId"></param>
        /// <returns></returns>
        public List<Customer> GetAllCustomerByGroup(int? groupId, int? customerId)
        {
            return _customerRepository.GetAllCustomerByGroup(groupId, customerId);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="searchCriteriaObject"></param>
        /// <returns></returns>
        public List<Customer> GetCustomerBySearch(CustomerSearchCriteria searchCriteriaObject)
        {
            return _customerRepository.GetCustomerBySearch(searchCriteriaObject);
        }

        /// <summary>
        /// Save Customer
        /// </summary>
        /// <param name="customerObj"></param>
        /// <returns></returns>
        public int SaveCustomer(Customer customerObj)
        {
            return _customerRepository.SaveCustomer(customerObj);
        }

        /// <summary>
        /// Update Customer
        /// </summary>
        /// <param name="customerObj"></param>
        /// <returns></returns>
        public bool UpdateCustomer(Customer customerObj)
        {
            return _customerRepository.UpdateCustomer(customerObj);
        }

        /// <summary>
        /// Delete Customer
        /// </summary>
        /// <param name="customerGroupObj"></param>
        /// <returns></returns>
        public int DeleteCustomer(int customerId, int updatedBy)
        {
            return _customerRepository.DeleteCustomer(customerId, updatedBy);
        }

        /// <summary>
        /// GetAllMasterDataForCreateOrEditCustomer
        /// </summary>
        /// <returns></returns>
        public AddEditCustomerMasterViewModel GetAllMasterDataForCreateOrEditCustomer()
        {
            return _customerRepository.GetAllMasterDataForCreateOrEditCustomer();
        }


        #endregion


        #region Group

        /// <summary>
        /// Delete Group
        /// </summary>
        /// <param name="customerGroupObj"></param>
        /// <returns></returns>
        public int DeleteGroup(CustomerGroupMaster customerGroupObj)
        {
            return _customerRepository.DeleteGroup(customerGroupObj);
        }

        /// <summary>
        /// Get All Groups
        /// </summary>
        /// <returns></returns>
        public List<CustomerGroupMaster> GetAllGroups()
        {
            return _customerRepository.GetAllGroups();
        }

        /// <summary>
        /// Save Group
        /// </summary>
        /// <param name="customerGroupObj"></param>
        /// <returns></returns>
        public int SaveGroup(CustomerGroupMaster customerGroupObj)
        {
            customerGroupObj.CreatedOn = DateTime.Now;
            return _customerRepository.SaveGroup(customerGroupObj);
        }

        /// <summary>
        /// Update Group
        /// </summary>
        /// <param name="customerGroupObj"></param>
        /// <returns></returns>
        public int UpdateGroup(CustomerGroupMaster customerGroupObj)
        {
            customerGroupObj.UpdatedOn = DateTime.Now;
            return _customerRepository.UpdateGroup(customerGroupObj);
        }
        #endregion
    }
}
