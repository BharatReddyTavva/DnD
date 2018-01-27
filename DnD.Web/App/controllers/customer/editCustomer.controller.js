function editCustomerCtrl($scope, $filter, $uibModal, $rootScope, $compile, $state, customerService) {

    $scope.editCustomer = {};
    var customer = {};
    var customerGroups = {};
    var CountryList = {};
    init();

    function init() {

        getAllMasterDataForEditCustomer();
        customer = customerService.getCustomers();
    }

    function getAllMasterDataForEditCustomer() {
        customerService.getAllMasterDataForCreateOrEditCustomer().then(
            function (data) {
                if (data) {
                    $scope.customerGroups = data.customerGroup;
                    customerGroups = data.customerGroup;
                    $scope.physicalCountry = data.country;
                    CountryList = data.country;
                    $scope.postalCountryList = data.country;
                    fillCustomerObject();
                }
            });


    };
    
    function fillCustomerObject() {
        $scope.editCustomer.customerId = customer[0].customerId;
        $scope.editCustomer.firstName = customer[0].firstName;
        $scope.editCustomer.lastName = customer[0].lastName;
        $scope.editCustomer.company = customer[0].company;
        $scope.editCustomer.customerCode = customer[0].customerCode;
        if (customer[0].customerGroupId)
            $scope.editCustomer.customerGroupCategory = $filter('filter')(customerGroups, { customerGroupMasterId: customer[0].customerGroupId })[0];
        $scope.editCustomer.isLoyaltyEnabled = customer[0].isLoyaltyEnabled;
        if (customer[0].dateOfBirth) {
            var date = new Date(customer[0].dateOfBirth.toString());
            $scope.editCustomer.birthYear = date.getFullYear();
            $scope.editCustomer.birthMonth = date.getMonth();
            $scope.editCustomer.birthDay = date.getDay();
        }
        $scope.editCustomer.sex = customer[0].sex;
        $scope.editCustomer.phone = customer[0].phone;
        $scope.editCustomer.mobile = customer[0].mobile;
        $scope.editCustomer.fax = customer[0].fax;
        $scope.editCustomer.email = customer[0].email;
        $scope.editCustomer.website = customer[0].website;
        $scope.editCustomer.twitter = customer[0].twitter;
        $scope.editCustomer.isCustomerOptedOutMail = customer[0].isCustomerOptedOutMail;
        $scope.editCustomer.physicalAddressStreet1 = customer[0].physicalAddressStreet1;
        $scope.editCustomer.physicalAddressStreet2 = customer[0].physicalAddressStreet2;
        $scope.editCustomer.physicalSuburb = customer[0].physicalSuburb;
        $scope.editCustomer.physicalCity = customer[0].physicalCity;
        $scope.editCustomer.physicalPostcode = customer[0].physicalPostcode;
        $scope.editCustomer.physicalState = customer[0].physicalState;
        if (customer[0].physicalCountryId) {
            $scope.editCustomer.selectedphysicalCountry = {};
            $scope.editCustomer.selectedphysicalCountry = $filter('filter')(CountryList, { countryId: customer[0].physicalCountryId })[0];
        }

        $scope.editCustomer.isPostalAddSameAsPhysicalAdd = customer[0].isPostalAddSameAsPhysicalAdd;
        $scope.editCustomer.postalAddressStree1 = customer[0].postalAddressStreet1;
        $scope.editCustomer.postalAddressStreet2 = customer[0].postalAddressStreet2;
        $scope.editCustomer.postalSuburb = customer[0].postalSuburb;
        $scope.editCustomer.postalCity = customer[0].postalCity;
        $scope.editCustomer.postalPostCode = customer[0].postalPostCode;
        $scope.editCustomer.postalState = customer[0].postalState;
        if (customer[0].postalCountryId) {
            $scope.editCustomer.selectedpostalCountry = {};
            $scope.editCustomer.selectedpostalCountry = $filter('filter')(CountryList, { countryId: customer[0].physicalCountryId })[0];
        }


        if (customer[0].isPostalAddSameAsPhysicalAdd) {

            $scope.editCustomer.postalAddressStree1 = customer[0].physicalAddressStreet1
            $scope.editCustomer.postalAddressStreet2 = customer[0].physicalAddressStreet2
            $scope.editCustomer.postalSuburb = customer[0].physicalSuburb
            $scope.editCustomer.postalCity = customer[0].physicalCity
            $scope.editCustomer.postalPostCode = customer[0].physicalPostcode
            $scope.editCustomer.postalState = customer[0].physicalState
            $scope.editCustomer.selectedpostalCountry.countryId = customer[0].postalCountryId;
        }

    }





    $scope.updateCustomer = function () {


        if ($scope.dataUpdateCustomerForm.$valid) {
            // Submit as normal
            var options = { successMessage: "Customer updated successfully.", errorMessage: "Error occurred in updating Customer." };

            if ($scope.editCustomer.birthYear && $scope.editCustomer.birthMonth && $scope.editCustomer.birthDay)
                $scope.editCustomer.dateOfBirth = new Date($scope.editCustomer.birthYear, $scope.editCustomer.birthMonth, $scope.editCustomer.birthDay);
            if ($scope.editCustomer.customerGroupCategory) {

                $scope.editCustomer.customerGroupId = $scope.editCustomer.customerGroupCategory.customerGroupMasterId;
            }
            if ($scope.editCustomer.selectedphysicalCountry) {

                $scope.editCustomer.physicalCountryId = $scope.editCustomer.selectedphysicalCountry.countryId;
            }
            if ($scope.editCustomer.selectedpostalCountry) {

                $scope.editCustomer.postalCountryId = $scope.editCustomer.selectedpostalCountry.countryId;
            }
            customerService.updateCustomer($scope.editCustomer, options).then(
                function (data) {
                    $state.go('customers.customersList');
                },
                function (error) {
                    //
                });

        } else {
            $scope.dataCustomerForm.submitted = true;
        }
    }



}