function customersCtrl($scope, $uibModal, $rootScope, $compile, $state, customerService) {

    $scope.customers = {};
    $scope.customer = {};
    $scope.submitted = null;
    $scope.customerContent = {};
    $scope.selectedcustomerGroupType = null;
    $scope.selectedcustomerCountry = null;
    init();

    function init() {
        getAllCustomerByGroup();
        getAllMasterDataForCreateOrEditCustomer();

    }

    //Customer related 

    $scope.searchCriteria = {
        searchWord: null,
        customerGroupId: null,
        city: null,
        postalCountryId: null,
        createdOn: null
    };

    $scope.onCustomerNameChange = function () {
        var customerFirstNameWithSpaces = $scope.customer.firstName;
        var customerLastNameWithSpaces = $scope.customer.lastName;
        var customerCompanyNameWithSpaces = $scope.customer.company;
        $scope.customer.firstName = customerFirstNameWithSpaces.replace(/ /g, '');
        $scope.customer.lastName = customerLastNameWithSpaces.replace(/ /g, '');
        $scope.customer.company = customerCompanyNameWithSpaces.replace(/ /g, '');
    };

    function getAllMasterDataForCreateOrEditCustomer() {
        customerService.getAllMasterDataForCreateOrEditCustomer().then(
            function (data) {
                if (data) {
                    $scope.customerGroups = data.customerGroup;
                    $scope.physicalCountry = data.country;
                    $scope.postalCountryList = data.country;
                }
            });


    };

    function getAllCustomerByGroup() {
        customerService.getAllCustomerByGroup().then(
            function (data) {
                if (data) {
                    $scope.customers = null;
                    $scope.customers = data;

                    angular.forEach($scope.customers, function (value, key) {

                        if (value.country && value.physicalCity) {
                            value.location = value.country.name + ", " + value.physicalCity
                        }
                        else {
                            value.location = (value.physicalCity != null) ? value.physicalCity : value.country.name;
                        }

                        value.customerName = value.firstName + " " + value.lastName;
                    });
                }
            });
    };

    $scope.searchCustomers = function () {
        var options = { successMessage: "", errorMessage: "" };
        $scope.searchCriteria = {
            searchWord: $scope.customerSearchParam,
            customerGroupId: $scope.selectedcustomerGroupType,
            city: $scope.enteredCity,
            postalCountryId: $scope.selectedcustomerCountry,
            createdOn: $scope.selectedcustomerDate
        };

        customerService.getCustomerBySearch($scope.searchCriteria, options).then(
            function (data) {
                if (data.length > 0) {
                    $scope.customers = null;
                    $scope.customers = data;
                    angular.forEach($scope.customers, function (value, key) {

                        value.customerName = value.firstName + ' ' + value.lastName;
                    });

                };
                $state.go('customers.customersList');
            },
            function (error) {
            });
    };


    $scope.editCustomer = function (customer) {

        customerService.addCustomer(customer);

        $state.go('customers.updateCustomer');

    };


    $scope.saveCustomer = function () {

        var options = { successMessage: "Customer saved successfully.", errorMessage: "Error occurred in saving Customer." };
        $scope.customerContent.firstName = $scope.customer.firstName;
        $scope.customerContent.lastName = $scope.customer.lastName;
        $scope.customerContent.company = $scope.customer.company;
        $scope.customerContent.customerCode = $scope.customer.customerCode;
        if ($scope.customer.customerGroupCategory)
            $scope.customerContent.customerGroupId = $scope.customer.customerGroupCategory.customerGroupMasterId;
        $scope.customerContent.isLoyaltyEnabled = $scope.customer.isLoyaltyEnabled;
        $scope.customerContent.dateOfBirth = new Date($scope.customer.birthYear, $scope.customer.birthMonth, $scope.customer.birthDay);
        $scope.customerContent.sex = $scope.customer.sex;
        $scope.customerContent.phone = $scope.customer.phone;
        $scope.customerContent.mobile = $scope.customer.mobile;
        $scope.customerContent.fax = $scope.customer.fax;
        $scope.customerContent.email = $scope.customer.email;
        $scope.customerContent.website = $scope.customer.website;
        $scope.customerContent.twitter = $scope.customer.twitter;
        $scope.customerContent.isCustomerOptedOutMail = $scope.customer.isCustomerOptedOutMail;
        $scope.customerContent.physicalAddressStreet1 = $scope.customer.physicalAddressStreet1;
        $scope.customerContent.physicalAddressStreet2 = $scope.customer.physicalAddressStreet2;
        $scope.customerContent.physicalSuburb = $scope.customer.physicalSuburb;
        $scope.customerContent.physicalCity = $scope.customer.physicalCity;
        $scope.customerContent.physicalPostcode = $scope.customer.physicalPostcode;
        $scope.customerContent.physicalState = $scope.customer.physicalState;
        if ($scope.customer.selectedphysicalCountry)
            $scope.customerContent.physicalCountryId = $scope.customer.selectedphysicalCountry.countryId;
        $scope.customerContent.isPostalAddSameAsPhysicalAdd = $scope.customer.isPostalAddSameAsPhysicalAdd;
        $scope.customerContent.postalAddressStree1 = $scope.customer.postalAddressStreet1;
        $scope.customerContent.postalAddressStreet2 = $scope.customer.postalAddressStreet2;
        $scope.customerContent.postalSuburb = $scope.customer.postalSuburb;
        $scope.customerContent.postalCity = $scope.customer.postalCity;
        $scope.customerContent.postalPostCode = $scope.customer.postalPostCode;
        $scope.customerContent.postalState = $scope.customer.postalState;
        if ($scope.customer.selectedpostalCountry)
            $scope.customerContent.postalCountryId = $scope.customer.selectedpostalCountry.countryId;

        if ($scope.customer.isPostalAddSameAsPhysicalAdd) {

            $scope.customerContent.postalAddressStree1 = $scope.customer.physicalAddressStreet1
            $scope.customerContent.postalAddressStreet2 = $scope.customer.physicalAddressStreet2
            $scope.customerContent.postalSuburb = $scope.customer.physicalSuburb
            $scope.customerContent.postalCity = $scope.customer.physicalCity
            $scope.customerContent.postalPostCode = $scope.customer.physicalPostcode
            $scope.customerContent.postalState = $scope.customer.physicalState
            $scope.customerContent.postalCountryId = $scope.customer.selectedphysicalCountry.countryId;
        }


        if ($scope.dataCustomerForm.$valid) {
            // Submit as normal

            customerService.saveCustomer($scope.customerContent, options).then(
                function (data) {
                    $state.go('customers.customersList');
                },
                function (error) {
                    //
                });

        } else {
            $scope.dataCustomerForm.submitted = true;
        }

    };

    $scope.deleteCustomer = function (index, deleteCustomer) {

        

        var deleteCustomerModalInstance = $uibModal.open({
            templateUrl: 'app/views/customers/customers/deleteCustomerConfirm.html',
            controller: 'deleteCustomerModalInstanceCtrl',
            resolve: {
                selectedCustomerToDelete: function () {
                    return deleteCustomer;
                },
                actionName: function () {
                    return 'DELETE'
                }
            }
        });

        deleteCustomerModalInstance.result.then(function (deletedBrand) {
            $scope.deletedBrand = deletedBrand;
            getAllCustomerByGroup();
            //$state.go('customers.customersList');
        });
    };

    //End Customer

};

///Delete
function deleteCustomerModalInstanceCtrl($scope, $uibModalInstance, selectedCustomerToDelete, actionName, customerService) {
    $scope.deletedCustomer = { customerId: '' };
    if (actionName == 'DELETE') {
        $scope.addOrEditTitle = 'Delete Customer';
        $scope.addOrUpdateGroupActionText = 'Delete Customer'
    }
    $scope.deleteCustomer = function () {
        $scope.deletedCustomer.customerId = selectedCustomerToDelete.customerId;
        deleteCustomer();
        $uibModalInstance.close($scope.deleteCustomer);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };

    function deleteCustomer() {
        var options = { successMessage: "Customer deleted successfully.", errorMessage: "Error occurred in saving Group" };
        customerService.deleteCustomer($scope.deletedCustomer, options)
            .then(function (data) {
                var successData = data;
                $uibModalInstance.dismiss('cancel');
            }, function (error) {
                //
            });

    }
};