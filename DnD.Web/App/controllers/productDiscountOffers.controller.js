//Brands Start
function productDiscountOffersCtrl($scope, $uibModal, productService) {
    $scope.suppliers = {};
    $scope.discountTypes = {};
    $scope.discountOffer = {
        offerName: '',
        offerDisplayText: '',
        discountOfferDateRange: '',
        discountType : ''
    };

    init();

    function init() {
        getAllMasterDataForCreateOrEditDiscountOffer();
    }

    /* Product Suppliers Start*/
    $scope.supplier = {};

    $scope.saveSupplier = function () {
        var options = { successMessage: "Supplier saved successfully.", errorMessage: "Error occurred in saving Supplier" };
        if ($scope.dataSupplierForm.$valid) {
            // Submit as normal
            productService.postSupplier($scope.supplier, options)
                .then(function (data) {
                    var successData = data;
                    getAllSuppliers();

                }, function (error) {
                    //
                });
        } else {
            $scope.dataSupplierForm.submitted = true;
        }
    }

    $scope.onDiscountTypeChange = function () {
        if ($scope.discountOffer.discountType.discountTypeId == 1) {
            $scope.discountTypeText = 'product';
        }
        else if ($scope.discountOffer.discountType.discountTypeId == 2) {
            $scope.discountTypeText = 'product category';
        }
        else if ($scope.discountOffer.discountType.discountTypeId == 3) {
            $scope.discountTypeText = 'brand';
        }
        else if ($scope.discountOffer.discountType.discountTypeId == 4) {
            $scope.discountTypeText = 'tag';
        }
        else if ($scope.discountOffer.discountType.discountTypeId == 5) {
            $scope.discountTypeText = 'order';
        }
    }

    $scope.$watch('discountOffer.discountOfferType', function (newVal, oldVal) {
        if (newVal === oldVal) return;

        if (newVal == percentDiscount) {
            var test = percentDiscount;
        }
        
    });

    function getAllMasterDataForCreateOrEditDiscountOffer() {
        productService.getAllMasterDataForCreateOrEditDiscountOffer().then(
            function (data) {
                if (data) {
                    $scope.discountTypes = data.discountTypes;
                }
            });
    };

    /* Product Suppliers End*/



};
