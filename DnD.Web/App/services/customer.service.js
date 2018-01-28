(function () {

    angular.module('inspinia').
        service('customerService', customerService);

    customerService.$inject = ['datacontext'];

    
    function customerService(datacontext) {

        var customerList = [];

        var customerService = {
            //Customers
            getAllGroups: getAllGroups,
            postGroup: postGroup,
            updatecustomerGroup: updatecustomerGroup,
            deleteGroup: deleteGroup,
            getAllMasterDataForCreateOrEditCustomer: getAllMasterDataForCreateOrEditCustomer,
            saveCustomer: saveCustomer,
            deleteCustomer: deleteCustomer,
            getAllCustomerByGroup: getAllCustomerByGroup,
            getCustomerBySearch: getCustomerBySearch,
            getCustomerById: getCustomerById,
            addCustomer: addCustomer,
            getCustomers: getCustomers,
            updateCustomer: updateCustomer
        };

        return customerService;

       

        function addCustomer(newObj) {
            customerList = [];
            customerList.push(newObj);
        };

        function getCustomers() {
            return customerList;
        };



        //API call to get all Groups
        function getAllGroups() {
            return datacontext.get('Customer/GetAllGroups');
        };

        //API call to save the Group Object
        function postGroup(customerGroupObj, options) {
            return datacontext.post('Customer/SaveGroup/', customerGroupObj, options);
        };

        //API call to update the Group Object
        function updatecustomerGroup(customerGroupObj, options) {
            return datacontext.post('Customer/UpdateGroup/', customerGroupObj, options);
        };

        //API call to delete the Group Object
        function deleteGroup(customerGroupObj, options) {
            return datacontext.post('Customer/DeleteGroup/', customerGroupObj, options);
        };


        function getAllMasterDataForCreateOrEditCustomer() {
            return datacontext.get('Customer/GetAllMasterDataForCreateOrEditCustomer');
        }

        //API call to Save Customer
        function saveCustomer(customerObj, options) {
            return datacontext.post('Customer/SaveCustomer/', customerObj, options);
        };

        //API call to Update Customer
        function updateCustomer(customerObj, options) {
            return datacontext.post('Customer/UpdateCustomer/', customerObj, options);
        };
        

        //API call to delete the Product Object
        function deleteCustomer(customerObj, options) {
            return datacontext.post('Customer/DeleteCustomer/', customerObj, options);
        };

        //API call to get All Customer ByGroup
        function getAllCustomerByGroup() {
            return datacontext.get('Customer/GetAllCustomerByGroup');
        };

        function getCustomerBySearch(customerSearchCriteriaObj, options) {
            return datacontext.post('Customer/GetCustomerBySearch/', customerSearchCriteriaObj, options);
        };

        function getCustomerById(customerId) {
            return datacontext.post('Customer/getCustomerById/', customerId, options);
        };


    }

})();