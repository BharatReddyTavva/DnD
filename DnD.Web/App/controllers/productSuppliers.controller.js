//Brands Start
function productSuppliersCtrl($scope, $uibModal, productService) {
    $scope.suppliers = {};

    init();

    function init() {
        getAllSuppliers();
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

    function getAllSuppliers() {
        productService.getAllSuppliers().then(
            function (data) {
                if (data) {
                    $scope.suppliers = data;
                }
            });
    };

    /* Product Suppliers End*/
    


};
