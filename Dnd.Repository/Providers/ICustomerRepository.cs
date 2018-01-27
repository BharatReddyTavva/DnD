using DnD.Model.Entity;
using DnD.Model.ViewModel;
using System.Collections.Generic;

namespace DnD.Repository.Providers
{
    public interface ICustomerRepository
    {
        int SaveGroup(CustomerGroupMaster customerGroupObj);
        int UpdateGroup(CustomerGroupMaster customerGroupObj);
        int DeleteGroup(CustomerGroupMaster customerGroupObj);
        List<CustomerGroupMaster> GetAllGroups();
        AddEditCustomerMasterViewModel GetAllMasterDataForCreateOrEditCustomer();
        int SaveCustomer(Customer customerObj);
        List<Customer> GetAllCustomerByGroup(int? groupId, int? customerId);
        List<Customer> GetCustomerBySearch(CustomerSearchCriteria searchCriteriaObject);
        bool UpdateCustomer(Customer customerObj);
        int DeleteCustomer(int customerId, int updatedBy);
        
    }
}
