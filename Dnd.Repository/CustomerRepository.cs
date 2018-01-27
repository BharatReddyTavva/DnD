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
using Microsoft.SqlServer.Server;
using System.Data.SqlClient;

namespace DnD.Repository
{
    public class CustomerRepository : ICustomerRepository
    {
        /// <summary>
        /// private properties
        /// </summary>
        DataBaseRepository _dataBaseRepository;

        /// <summary>
        /// Initialise the Database repository object
        /// </summary>
        /// <param name="dbRespository"></param>
        public CustomerRepository(DataBaseRepository dataBaseRepository)
        {
            _dataBaseRepository = dataBaseRepository;
        }


        #region Customer

        public List<Customer> GetCustomerBySearch(CustomerSearchCriteria searchCriteriaObject)
        {
            List<Customer> customers = new List<Customer>();

            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspGetCustomersBySearch))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, DnD.Common.Constants.SearchWord, searchCriteriaObject.SearchWord, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, DnD.Common.Constants.CustomerGroupMasterId, searchCriteriaObject.CustomerGroupId, DbType.Int32));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, DnD.Common.Constants.PostalCountryId, searchCriteriaObject.PostalCountryId, DbType.Int32));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, DnD.Common.Constants.City, searchCriteriaObject.City, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, DnD.Common.Constants.CreatedOn, searchCriteriaObject.CreatedOn, DbType.String));
                using (var objDataReader = _dataBaseRepository.db.ExecuteReader(command))
                {
                    while (objDataReader.Read())
                    {
                        Customer customer = new Customer();
                        Country c = new Country();
                        customer.CustomerId = HelperMethods.GetDataValue<int>(objDataReader, "CustomerId");
                        customer.StoreId = HelperMethods.GetDataValue<int>(objDataReader, "StoreId");
                        customer.FirstName = HelperMethods.GetDataValue<string>(objDataReader, "FirstName");
                        customer.LastName = HelperMethods.GetDataValue<string>(objDataReader, "LastName");
                        customer.Company = HelperMethods.GetDataValue<string>(objDataReader, "Company");
                        customer.CustomerCode = HelperMethods.GetDataValue<string>(objDataReader, "CustomerCode");
                        customer.CustomerGroupId = HelperMethods.GetDataValue<int>(objDataReader, "CustomerGroupId");
                        customer.IsLoyaltyEnabled = HelperMethods.GetDataValue<bool?>(objDataReader, "IsLoyaltyEnabled");
                        customer.DateOfBirth = HelperMethods.GetDataValue<DateTime?>(objDataReader, "DateOfBirth");
                        customer.Sex = HelperMethods.GetDataValue<string>(objDataReader, "Sex");
                        customer.Phone = HelperMethods.GetDataValue<string>(objDataReader, "Phone");
                        customer.Mobile = HelperMethods.GetDataValue<string>(objDataReader, "Mobile");
                        customer.Fax = HelperMethods.GetDataValue<string>(objDataReader, "Email");
                        customer.Email = HelperMethods.GetDataValue<string>(objDataReader, "Fax");
                        customer.Website = HelperMethods.GetDataValue<string>(objDataReader, "Website");
                        customer.Twitter = HelperMethods.GetDataValue<string>(objDataReader, "Twitter");
                        customer.IsCustomerOptedOutMail = HelperMethods.GetDataValue<bool>(objDataReader, "IsCustomerOptedOutMail");
                        customer.PhysicalAddressStreet1 = HelperMethods.GetDataValue<string>(objDataReader, "PhysicalAddressStreet1");
                        customer.PhysicalAddressStreet2 = HelperMethods.GetDataValue<string>(objDataReader, "PhysicalAddressStreet2");
                        customer.PhysicalSuburb = HelperMethods.GetDataValue<string>(objDataReader, "PhysicalSuburb");
                        customer.PhysicalCity = HelperMethods.GetDataValue<string>(objDataReader, "PhysicalCity");
                        customer.PhysicalPostcode = HelperMethods.GetDataValue<string>(objDataReader, "PhysicalPostcode");
                        customer.PhysicalPostcode = HelperMethods.GetDataValue<string>(objDataReader, "PhysicalPostcode");
                        customer.PhysicalCountryId = HelperMethods.GetDataValue<int?>(objDataReader, "PhysicalCountryId");
                        customer.IsPostalAddSameAsPhysicalAdd = HelperMethods.GetDataValue<bool?>(objDataReader, "IsPostalAddSameAsPhysicalAdd");
                        customer.PostalAddressStree1 = HelperMethods.GetDataValue<string>(objDataReader, "PostalAddressStree1");
                        customer.PostalAddressStreet2 = HelperMethods.GetDataValue<string>(objDataReader, "PostalAddressStreet2");
                        customer.PostalSuburb = HelperMethods.GetDataValue<string>(objDataReader, "PostalSuburb");
                        customer.PostalCity = HelperMethods.GetDataValue<string>(objDataReader, "PostalCity");
                        customer.PostalPostCode = HelperMethods.GetDataValue<string>(objDataReader, "PostalPostCode");
                        customer.PostalState = HelperMethods.GetDataValue<string>(objDataReader, "PostalState");
                        customer.PostalCountryId = HelperMethods.GetDataValue<int?>(objDataReader, "PostalCountryId");
                        customer.IsActive = HelperMethods.GetDataValue<bool>(objDataReader, "IsActive");
                        customer.CreatedBy = HelperMethods.GetDataValue<int>(objDataReader, "CreatedBy");
                        customer.CreatedOn = HelperMethods.GetDataValue<DateTime>(objDataReader, "CreatedOn");
                        customer.UpdatedBy = HelperMethods.GetDataValue<int>(objDataReader, "UpdatedBy");
                        customer.UpdatedOn = HelperMethods.GetDataValue<DateTime>(objDataReader, "UpdatedOn");
                        c.CountryId = HelperMethods.GetDataValue<int>(objDataReader, "CountryId");
                        c.Name = HelperMethods.GetDataValue<string>(objDataReader, "CountryName");
                        customer.Country = c;
                        customers.Add(customer);
                    }


                }
                return customers;
            }
        }

        /// <summary>
        /// Get All Customer By Group
        /// </summary>
        /// <param name="groupId"></param>
        /// <returns></returns>
        public List<Customer> GetAllCustomerByGroup(int? groupId, int? customerId)
        {
            List<Customer> customers = new List<Customer>();

            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspGetAllCustomersByGroup))
            {
                if (groupId.HasValue)
                    command.Parameters.Add(_dataBaseRepository.CreateParameter(command, DnD.Common.Constants.CustomerGroupMasterId, groupId, DbType.Int32));
                if (customerId.HasValue)
                    command.Parameters.Add(_dataBaseRepository.CreateParameter(command, DnD.Common.Constants.CustomerId, customerId, DbType.Int32));
                using (var objDataReader = _dataBaseRepository.db.ExecuteReader(command))
                {
                    while (objDataReader.Read())
                    {
                        Customer customer = new Customer();
                        Country c = new Country();
                        customer.CustomerId = HelperMethods.GetDataValue<int>(objDataReader, "CustomerId");
                        customer.StoreId = HelperMethods.GetDataValue<int>(objDataReader, "StoreId");
                        customer.FirstName = HelperMethods.GetDataValue<string>(objDataReader, "FirstName");
                        customer.LastName = HelperMethods.GetDataValue<string>(objDataReader, "LastName");
                        customer.Company = HelperMethods.GetDataValue<string>(objDataReader, "Company");
                        customer.CustomerCode = HelperMethods.GetDataValue<string>(objDataReader, "CustomerCode");
                        customer.CustomerGroupId = HelperMethods.GetDataValue<int>(objDataReader, "CustomerGroupId");
                        customer.IsLoyaltyEnabled = HelperMethods.GetDataValue<bool?>(objDataReader, "IsLoyaltyEnabled");
                        customer.DateOfBirth = HelperMethods.GetDataValue<DateTime?>(objDataReader, "DateOfBirth");
                        customer.Sex = HelperMethods.GetDataValue<string>(objDataReader, "Sex");
                        customer.Phone = HelperMethods.GetDataValue<string>(objDataReader, "Phone");
                        customer.Mobile = HelperMethods.GetDataValue<string>(objDataReader, "Mobile");
                        customer.Fax = HelperMethods.GetDataValue<string>(objDataReader, "Email");
                        customer.Email = HelperMethods.GetDataValue<string>(objDataReader, "Fax");
                        customer.Website = HelperMethods.GetDataValue<string>(objDataReader, "Website");
                        customer.Twitter = HelperMethods.GetDataValue<string>(objDataReader, "Twitter");
                        customer.IsCustomerOptedOutMail = HelperMethods.GetDataValue<bool>(objDataReader, "IsCustomerOptedOutMail");
                        customer.PhysicalAddressStreet1 = HelperMethods.GetDataValue<string>(objDataReader, "PhysicalAddressStreet1");
                        customer.PhysicalAddressStreet2 = HelperMethods.GetDataValue<string>(objDataReader, "PhysicalAddressStreet2");
                        customer.PhysicalSuburb = HelperMethods.GetDataValue<string>(objDataReader, "PhysicalSuburb");
                        customer.PhysicalCity = HelperMethods.GetDataValue<string>(objDataReader, "PhysicalCity");
                        customer.PhysicalPostcode = HelperMethods.GetDataValue<string>(objDataReader, "PhysicalPostcode");
                        customer.PhysicalPostcode = HelperMethods.GetDataValue<string>(objDataReader, "PhysicalPostcode");
                        customer.PhysicalCountryId = HelperMethods.GetDataValue<int?>(objDataReader, "PhysicalCountryId");
                        customer.IsPostalAddSameAsPhysicalAdd = HelperMethods.GetDataValue<bool?>(objDataReader, "IsPostalAddSameAsPhysicalAdd");
                        customer.PostalAddressStree1 = HelperMethods.GetDataValue<string>(objDataReader, "PostalAddressStree1");
                        customer.PostalAddressStreet2 = HelperMethods.GetDataValue<string>(objDataReader, "PostalAddressStreet2");
                        customer.PostalSuburb = HelperMethods.GetDataValue<string>(objDataReader, "PostalSuburb");
                        customer.PostalCity = HelperMethods.GetDataValue<string>(objDataReader, "PostalCity");
                        customer.PostalPostCode = HelperMethods.GetDataValue<string>(objDataReader, "PostalPostCode");
                        customer.PostalState = HelperMethods.GetDataValue<string>(objDataReader, "PostalState");
                        customer.PostalCountryId = HelperMethods.GetDataValue<int?>(objDataReader, "PostalCountryId");
                        customer.IsActive = HelperMethods.GetDataValue<bool>(objDataReader, "IsActive");
                        customer.CreatedBy = HelperMethods.GetDataValue<int>(objDataReader, "CreatedBy");
                        customer.CreatedOn = HelperMethods.GetDataValue<DateTime>(objDataReader, "CreatedOn");
                        customer.UpdatedBy = HelperMethods.GetDataValue<int>(objDataReader, "UpdatedBy");
                        customer.UpdatedOn = HelperMethods.GetDataValue<DateTime>(objDataReader, "UpdatedOn");
                        c.CountryId = HelperMethods.GetDataValue<int>(objDataReader, "CountryId");
                        c.Name = HelperMethods.GetDataValue<string>(objDataReader, "CountryName");
                        customer.Country = c;
                        customers.Add(customer);
                    }

                }
                return customers;
            }
        }


        /// <summary>
        /// Save Customer
        /// </summary>
        /// <param name="customerObj"></param>
        /// <returns></returns>
        public int SaveCustomer(Customer customerObj)
        {

            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspInsertCustomer))
            {

                SqlParameter sqlparam = new SqlParameter();
                sqlparam = AddStructureParam(customerObj);
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "IsActive", true, DbType.Boolean));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "CreatedBy", 1, DbType.Int32));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "CreatedOn", DateTime.Now, DbType.DateTime));
                command.Parameters.Add(sqlparam);
                var customerId = Convert.ToInt32(_dataBaseRepository.db.ExecuteScalar(command));
                return customerId;

            }
        }


        /// <summary>
        /// Update Customer
        /// </summary>
        /// <param name="customerObj"></param>
        /// <returns></returns>
        public bool UpdateCustomer(Customer customerObj)
        {

            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspUpdateCustomer))
            {

                SqlParameter sqlparam = new SqlParameter();
                sqlparam = AddStructureParam(customerObj);
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "IsActive", true, DbType.Boolean));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "UpdatedBy", 1, DbType.Int32));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, "UpdatedOn", DateTime.Now, DbType.DateTime));
                command.Parameters.Add(sqlparam);
                _dataBaseRepository.db.ExecuteScalar(command);
                return true;

            }
        }

        /// <summary>
        /// Delete Customer
        /// </summary>
        /// <param name="customerGroupObj"></param>
        /// <returns></returns>
        public int DeleteCustomer(int customerId, int updatedBy)
        {
            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.uspDeleteCustomer))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, DnD.Common.Constants.CustomerId, customerId, DbType.Int32));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, DnD.Common.Constants.UpdatedBy, updatedBy, DbType.Int32));
                var customerID = Convert.ToInt32(_dataBaseRepository.db.ExecuteScalar(command));
                return customerID;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public AddEditCustomerMasterViewModel GetAllMasterDataForCreateOrEditCustomer()
        {
            AddEditCustomerMasterViewModel addEditCustomerMasterViewModel = new AddEditCustomerMasterViewModel();
            List<Country> countryList = new List<Country>();
            List<CustomerGroupMaster> customerGroupMaster = new List<CustomerGroupMaster>();

            using (var command = _dataBaseRepository.db.GetStoredProcCommand(Constants.UspGetAllMasterDataForCreateOrEditCustomer))
            {
                using (var dataReader = _dataBaseRepository.db.ExecuteReader(command))
                {
                    // Get Product Tags
                    while (dataReader.Read())
                    {
                        Country country = new Country();
                        country.CountryId = HelperMethods.GetDataValue<int>(dataReader, "CountryId");
                        country.Name = HelperMethods.GetDataValue<string>(dataReader, "CountryName");
                        countryList.Add(country);
                    }

                    // Get product types
                    if (dataReader.NextResult())
                    {
                        while (dataReader.Read())
                        {
                            CustomerGroupMaster group = new CustomerGroupMaster();
                            group.CustomerGroupMasterId = HelperMethods.GetDataValue<int>(dataReader, "CustomerGroupMasterId");
                            group.GroupName = HelperMethods.GetDataValue<string>(dataReader, "GroupName");
                            customerGroupMaster.Add(group);
                        }
                    }

                }
            }

            addEditCustomerMasterViewModel.Country = countryList;
            addEditCustomerMasterViewModel.CustomerGroup = customerGroupMaster;
            return addEditCustomerMasterViewModel;
        }

        private SqlParameter AddStructureParam(Customer customerObj)
        {
            var param = new SqlParameter(DnD.Common.Constants.UDTCustomer, SqlDbType.Structured)
            {
                Direction = ParameterDirection.Input,
                TypeName = DnD.Common.Constants.UDTCustomer,
                Value = BuildCustomerData(customerObj)
            };
            return param;
        }

        private static IEnumerable<SqlDataRecord> BuildCustomerData(Customer customerObj)
        {
            List<SqlDataRecord> records = new List<SqlDataRecord>();
            SqlDataRecord record = CustomerSqlDataRecord();
            if (customerObj.CustomerId > 0)
                record.SetInt32(0, customerObj.CustomerId);
            //if (customerObj.StoreId > 0)
            record.SetInt32(1, 1);
            if (!string.IsNullOrEmpty(customerObj.FirstName))
                record.SetString(2, customerObj.FirstName);
            if (!string.IsNullOrEmpty(customerObj.LastName))
                record.SetString(3, customerObj.LastName);
            if (!string.IsNullOrEmpty(customerObj.Company))
                record.SetString(4, customerObj.Company);
            if (!string.IsNullOrEmpty(customerObj.CustomerCode))
                record.SetString(5, customerObj.CustomerCode);
            if (customerObj.CustomerGroupId.HasValue)
                record.SetInt32(6, (int)customerObj.CustomerGroupId.Value);
            if (customerObj.IsLoyaltyEnabled.HasValue)
                record.SetBoolean(7, (bool)customerObj.IsLoyaltyEnabled.Value);
            if (customerObj.DateOfBirth.HasValue)
                record.SetString(8, customerObj.DateOfBirth.Value.ToString());
            if (!string.IsNullOrEmpty(customerObj.Sex))
                record.SetString(9, customerObj.Sex);
            if (!string.IsNullOrEmpty(customerObj.Phone))
                record.SetString(10, customerObj.Phone);
            if (!string.IsNullOrEmpty(customerObj.Mobile))
                record.SetString(11, customerObj.Mobile);
            if (!string.IsNullOrEmpty(customerObj.Fax))
                record.SetString(12, customerObj.Fax);
            if (!string.IsNullOrEmpty(customerObj.Email))
                record.SetString(13, customerObj.Email);
            if (!string.IsNullOrEmpty(customerObj.Website))
                record.SetString(14, customerObj.Website);
            if (!string.IsNullOrEmpty(customerObj.Twitter))
                record.SetString(15, customerObj.Twitter);
            if (customerObj.IsCustomerOptedOutMail.HasValue)
                record.SetBoolean(16, (bool)customerObj.IsCustomerOptedOutMail.Value);
            if (!string.IsNullOrEmpty(customerObj.PhysicalAddressStreet1))
                record.SetString(17, customerObj.PhysicalAddressStreet1);
            if (!string.IsNullOrEmpty(customerObj.PhysicalAddressStreet2))
                record.SetString(18, customerObj.PhysicalAddressStreet2);
            if (!string.IsNullOrEmpty(customerObj.PhysicalSuburb))
                record.SetString(19, customerObj.PhysicalSuburb);
            if (!string.IsNullOrEmpty(customerObj.PhysicalCity))
                record.SetString(20, customerObj.PhysicalCity);
            if (!string.IsNullOrEmpty(customerObj.PhysicalPostcode))
                record.SetString(21, customerObj.PhysicalPostcode);
            if (!string.IsNullOrEmpty(customerObj.PhysicalState))
                record.SetString(22, customerObj.PhysicalState);
            if (customerObj.PhysicalCountryId.HasValue)
                record.SetInt32(23, (int)customerObj.PhysicalCountryId.Value);
            if (customerObj.IsPostalAddSameAsPhysicalAdd.HasValue)
                record.SetBoolean(24, (bool)customerObj.IsPostalAddSameAsPhysicalAdd.Value);
            if (!string.IsNullOrEmpty(customerObj.PostalAddressStree1))
                record.SetString(25, customerObj.PostalAddressStree1);
            if (!string.IsNullOrEmpty(customerObj.PostalAddressStreet2))
                record.SetString(26, customerObj.PostalAddressStreet2);
            if (!string.IsNullOrEmpty(customerObj.PostalSuburb))
                record.SetString(27, customerObj.PostalSuburb);
            if (!string.IsNullOrEmpty(customerObj.PostalCity))
                record.SetString(28, customerObj.PostalCity);
            if (!string.IsNullOrEmpty(customerObj.PostalPostCode))
                record.SetString(29, customerObj.PostalPostCode);
            if (!string.IsNullOrEmpty(customerObj.PostalState))
                record.SetString(30, customerObj.PostalState);
            if (customerObj.PostalCountryId.HasValue)
                record.SetInt32(31, customerObj.PostalCountryId.Value);
            records.Add(record);
            return records;
        }

        private static SqlDataRecord CustomerSqlDataRecord()
        {
            SqlDataRecord record = new SqlDataRecord(

                new SqlMetaData[] {

                   new SqlMetaData("CustomerId",SqlDbType.Int),
                   new SqlMetaData("StoreId", SqlDbType.Int ),
                   new SqlMetaData("FirstName",SqlDbType.NVarChar,200 ),
                   new SqlMetaData("LastName",SqlDbType.NVarChar,200),
                   new SqlMetaData("Company", SqlDbType.NVarChar,200),
                   new SqlMetaData("CustomerCode",SqlDbType.NVarChar,200),
                   new SqlMetaData("CustomerGroupId", SqlDbType.Int),
                   new SqlMetaData("IsLoyaltyEnabled", SqlDbType.Bit),
                   new SqlMetaData("DateOfBirth", SqlDbType.NVarChar,100),
                   new SqlMetaData("Sex", SqlDbType.NVarChar,20),
                   new SqlMetaData("Phone", SqlDbType.NVarChar,40),
                   new SqlMetaData("Mobile",  SqlDbType.NVarChar,40),
                   new SqlMetaData("Fax",  SqlDbType.NVarChar,40),
                   new SqlMetaData("Email",  SqlDbType.NVarChar,100),
                   new SqlMetaData("Website", SqlDbType.NVarChar,100 ),
                   new SqlMetaData("Twitter",  SqlDbType.NVarChar,100),
                   new SqlMetaData("IsCustomerOptedOutMail", SqlDbType.Bit),
                   new SqlMetaData("PhysicalAddressStreet1", SqlDbType.NVarChar,400),
                   new SqlMetaData("PhysicalAddressStreet2", SqlDbType.NVarChar,400),
                   new SqlMetaData("PhysicalSuburb", SqlDbType.NVarChar,200),
                   new SqlMetaData("PhysicalCity", SqlDbType.NVarChar,200),
                   new SqlMetaData("PhysicalPostcode",SqlDbType.NVarChar,100),
                   new SqlMetaData("PhysicalState", SqlDbType.NVarChar,100),
                   new SqlMetaData("PhysicalCountryId",  SqlDbType.Int ),
                   new SqlMetaData("IsPostalAddSameAsPhysicalAdd",  SqlDbType.Bit ),
                   new SqlMetaData("PostalAddressStree1", SqlDbType.NVarChar,400),
                   new SqlMetaData("PostalAddressStreet2", SqlDbType.NVarChar,400),
                   new SqlMetaData("PostalSuburb", SqlDbType.NVarChar,200),
                   new SqlMetaData("PostalCity", SqlDbType.NVarChar,200),
                   new SqlMetaData("PostalPostCode",SqlDbType.NVarChar,100),
                   new SqlMetaData("PostalState",SqlDbType.NVarChar,100),
                   new SqlMetaData("PostalCountryId",SqlDbType.Int )

                                });
            return record;

        }

        #endregion

        #region Group

        public int DeleteGroup(CustomerGroupMaster customerGroupObj)
        {
            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspDeleteGroup))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, DnD.Common.Constants.CustomerGroupMasterId, customerGroupObj.CustomerGroupMasterId, DbType.Int32));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, DnD.Common.Constants.UpdatedBy, customerGroupObj.CustomerGroupMasterId, DbType.Int32));
                var groupID = Convert.ToInt32(_dataBaseRepository.db.ExecuteScalar(command));
                return groupID;
            }
        }

        public List<CustomerGroupMaster> GetAllGroups()
        {
            List<CustomerGroupMaster> Groups = new List<CustomerGroupMaster>();
            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspGetAllGroups))
            {
                using (var objDataReader = _dataBaseRepository.db.ExecuteReader(command))
                {
                    while (objDataReader.Read())
                    {
                        CustomerGroupMaster Group = new CustomerGroupMaster();
                        Group.CustomerGroupMasterId = HelperMethods.GetDataValue<int>(objDataReader, DnD.Common.Constants.CustomerGroupMasterId);
                        Group.GroupName = HelperMethods.GetDataValue<string>(objDataReader, DnD.Common.Constants.GroupName); ;
                        Group.DiscountPercentage = HelperMethods.GetDataValue<int>(objDataReader, DnD.Common.Constants.DiscountPercentage); ;
                        Group.IsActive = HelperMethods.GetDataValue<bool>(objDataReader, DnD.Common.Constants.IsActive);
                        Group.CreatedOn = HelperMethods.GetDataValue<DateTime>(objDataReader, DnD.Common.Constants.CreatedOn);
                        Groups.Add(Group);
                    }
                }
                return Groups;
            }
        }

        public int SaveGroup(CustomerGroupMaster customerGroupObj)
        {
            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspInsertGroup))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, DnD.Common.Constants.GroupName, customerGroupObj.GroupName, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, DnD.Common.Constants.DiscountPercentage, customerGroupObj.DiscountPercentage, DbType.Int32));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, DnD.Common.Constants.CreateddBy, 1, DbType.Int32));
                var groupID = Convert.ToInt32(_dataBaseRepository.db.ExecuteScalar(command));

                return groupID;

            }
        }

        public int UpdateGroup(CustomerGroupMaster customerGroupObj)
        {
            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspUpdateGroup))
            {
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, DnD.Common.Constants.CustomerGroupMasterId, customerGroupObj.CustomerGroupMasterId, DbType.Int32));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, DnD.Common.Constants.GroupName, customerGroupObj.GroupName, DbType.String));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, DnD.Common.Constants.DiscountPercentage, customerGroupObj.DiscountPercentage, DbType.Int32));
                command.Parameters.Add(_dataBaseRepository.CreateParameter(command, DnD.Common.Constants.UpdatedBy, 1, DbType.Int32));
                var groupID = Convert.ToInt32(_dataBaseRepository.db.ExecuteScalar(command));

                return groupID;

            }
        }

        #endregion
    }
}
