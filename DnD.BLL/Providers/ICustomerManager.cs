using DnD.Model.Entity;
using DnD.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace DnD.BLL.Providers
{
    public interface ICustomerManager
    {
        int SaveGroup(CustomerGroupMaster customerGroupObj);
        int UpdateGroup(CustomerGroupMaster customerGroupObj);
        int DeleteGroup(CustomerGroupMaster customerGroupObj);
        List<CustomerGroupMaster> GetAllGroups();
        List<Customer> GetAllCustomerByGroup(int? groupId, int? customerId);
        List<Customer> GetCustomerBySearch(CustomerSearchCriteria searchCriteriaObject);
        int SaveCustomer(Customer customerObj);
        AddEditCustomerMasterViewModel GetAllMasterDataForCreateOrEditCustomer();
        bool UpdateCustomer(Customer customerObj);
        int DeleteCustomer(int customerId, int updatedBy);
       
    }
}
