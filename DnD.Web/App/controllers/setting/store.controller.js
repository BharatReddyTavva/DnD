function storeCtrl($scope, $uibModal, $rootScope, $compile, $state, adminSettingService) {

    $scope.store = {};
    $scope.storeContent = {};
    $scope.selectedPrice = null;
    $scope.selectedStoreCountry = null;
    $scope.selectedSST = null;
    $scope.selectedCurrency = null;
    $scope.selectedTimeZone = null;

    init();

    function init() {

        getAllMasterDataForStore();

    }

    function getAllMasterDataForStore() {
        adminSettingService.getAllMasterDataForStore().then(
            function (data) {
                if (data) {
                    $scope.country = data.country;
                    $scope.timeZone = data.timeZone;
                    $scope.currency = data.currency;
                    $scope.displayPrices = data.displayPrice;
                    $scope.sST = data.userSwitchingSecurityType;
                    $scope.sku = data.skuGenerationType;
                }
            });


    };


    $scope.saveStoreSetup = function () {

        var options = { successMessage: "Storesetup created successfully.", errorMessage: "Error occurred in saving Storesetup." };
        $scope.storeContent.storeName = $scope.store.storeName;                            
        $scope.storeContent.storeURL = $scope.store.storeURL;                           
        $scope.storeContent.defaultCurrencyId = $scope.store.selectedCurrency.currencyId;                    
        $scope.storeContent.timeZoneId = $scope.store.selectedTimeZone.timeZoneId;                           
        $scope.storeContent.displayPricesId = $scope.store.selectedPrice.displayPriceId;                     
	    $scope.storeContent.sKUGenerationId                             =   1 //$scope.store.sKUGenerationId                      
        $scope.storeContent.currentSequenceNumber = $scope.store.currentSequenceNumber;               
        $scope.storeContent.userSwitchingSecurityId = $scope.store.selectedSST.userSwitchingSecurityTypeId;              
        $scope.storeContent.isDiscountAllowedOnReceipt = $scope.store.isDiscountAllowedOnReceipt;        
        $scope.storeContent.isOutOfStockEmailNotificationAllowed = $scope.store.isOutOfStockEmailNotificationAllowed;
	    $scope.storeContent.isTipsOrSurchargeAllowed                    =    $scope.store.isTipsOrSurchargeAllowed             
	    $scope.storeContent.isLaybyAllowed                              =    $scope.store.isLaybyAllowed                       
	    $scope.storeContent.isOnAccountSaleAllowed                      =    $scope.store.isOnAccountSaleAllowed               
	    $scope.storeContent.contactFirstName                            =    $scope.store.contactFirstName                     
	    $scope.storeContent.contactLastName                             =    $scope.store.contactLastName                      
	    $scope.storeContent.email                                       =    $scope.store.email                                
	    $scope.storeContent.phoneNumber                                 =    $scope.store.phoneNumber                          
	    $scope.storeContent.website                                     =    $scope.store.website                              
	    $scope.storeContent.twitterHandle                               =    $scope.store.twitterHandle                        
	    $scope.storeContent.faceBook                                    =    $scope.store.faceBook                             
	    $scope.storeContent.linkedIn                                    =    $scope.store.linkedIn                             
	    $scope.storeContent.physicalAddressStreet1                      =    $scope.store.physicalAddressStreet1               
	    $scope.storeContent.physicalAddressStreet2                      =    $scope.store.physicalAddressStreet2               
	    $scope.storeContent.physicalSuburb                              =    $scope.store.physicalSuburb                       
	    $scope.storeContent.physicalCity                                =    $scope.store.physicalCity                         
	    $scope.storeContent.physicalPostcode                            =    $scope.store.physicalPostcode                     
	    $scope.storeContent.physicalState                               =    $scope.store.physicalState                        
	    $scope.storeContent.physicalCountryId                           =    $scope.store.physicalCountryId                    
	    $scope.storeContent.isPostalAddressSameAsPhysicalAddress        =    $scope.store.isPostalAddressSameAsPhysicalAddress 
	    $scope.storeContent.postalAddressStreet1                        =    $scope.store.postalAddressStreet1                 
	    $scope.storeContent.postalAddressStreet2                        =    $scope.store.postalAddressStreet2                 
	    $scope.storeContent.postalSuburb                                =    $scope.store.postalSuburb                         
	    $scope.storeContent.postalCity                                  =    $scope.store.postalCity                           
	    $scope.storeContent.postalPostCode                              =    $scope.store.postalPostCode                       
        $scope.storeContent.postalState                                 =    $scope.store.postalState                          
        $scope.storeContent.postalCountryId                             =    $scope.store.postalCountryId


        if ($scope.store.isPostalAddressSameAsPhysicalAddress) {

            $scope.storeContent.postalAddressStreet1 = $scope.store.postalAddressStreet1
            $scope.storeContent.postalAddressStreet2 = $scope.store.postalAddressStreet2
            $scope.storeContent.postalSuburb = $scope.store.postalSuburb
            $scope.storeContent.postalCity = $scope.store.postalCity
            $scope.storeContent.postalPostCode = $scope.store.postalPostCode
            $scope.storeContent.postalState = $scope.store.postalState
            $scope.storeContent.postalCountryId = $scope.store.postalCountryId
        }

        if ($scope.storeSetupForm.$valid) {
            // Submit as normal

            adminSettingService.saveStoreSetup($scope.storeContent, options).then(
                function (data) {
                    //$state.go('customers.customersList');
                },
                function (error) {
                    //
                });

        } else {
            $scope.storeSetupForm.submitted = true;
        }

    }

}