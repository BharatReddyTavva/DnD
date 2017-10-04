//Brands Start
function productBrandsCtrl($scope, $uibModal, productService) {
    $scope.newBrand = { productBrandId: '', brandName: '', brandDescription: '' };
    $scope.updatedBrand = { productBrandId: '', brandName: '', brandDescription: '' };
    $scope.brands = {};
    $scope.suppliers = {};

    init();

    function init() {
        getAllBrands();
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


    function getAllBrands() {
        productService.getAllBrands().then(
            function (data) {
                if (data) {
                    $scope.brands = data;
                }
            });
    };

    $scope.openAddBrand = function () {
        var addBrandModalInstance = $uibModal.open({
            templateUrl: 'app/views/products/Brands/addEditBrand.html',
            controller: 'addBrandModalInstanceCtrl',
            resolve: {
                actionName: function () {
                    return 'ADD'
                }
            }
        });

        addBrandModalInstance.result.then(function (newBrand) {
            $scope.newBrand = newBrand;
            getAllBrands();
            //$log.info('Modal dismissed at: ' + new Date());
        });

    };

    $scope.editBrand = function (brand) {
        var editBrandModalInstance = $uibModal.open({
            templateUrl: 'app/views/products/Brands/addEditBrand.html',
            controller: 'editBrandModalInstanceCtrl',
            resolve: {
                selectedBrandToEdit: function () {
                    return brand;
                },
                actionName: function () {
                    return 'EDIT'
                }
            }
        });

        editBrandModalInstance.result.then(function (updatedBrand) {
            $scope.updatedBrand = updatedBrand;
            getAllBrands();
            //$log.info('Modal dismissed at: ' + new Date());
        });

    };

    $scope.deleteBrand = function (deletedBrand) {
        var deleteBrandModalInstance = $uibModal.open({
            templateUrl: 'app/views/products/Brands/deleteBrandConfirm.html',
            controller: 'deleteBrandModalInstanceCtrl',
            resolve: {
                selectedBrandToDelete: function () {
                    return deletedBrand;
                },
                actionName: function () {
                    return 'DELETE'
                }
            }
        });

        deleteBrandModalInstance.result.then(function (deletedBrand) {
            $scope.deletedBrand = deletedBrand;
            getAllBrands();
            //$log.info('Modal dismissed at: ' + new Date());
        });
    };



};

function addBrandModalInstanceCtrl($scope, $uibModalInstance, actionName, productService) {
    $scope.newBrand = { productBrandId: '', brandName: '', brandDescription: '' };
    if (actionName == 'ADD') {
        $scope.addOrEditTitle = 'Add Brand';
        $scope.addOrUpdateBrandActionText = 'Add Brand'
    }
    $scope.addNewOrUpdateBrand = function () {
        $scope.newBrand.brandName = $scope.brandName;
        $scope.newBrand.brandDescription = $scope.brandDescription;
        saveNewBrand();
        $uibModalInstance.close($scope.newBrand);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };

    function saveNewBrand() {
        var options = { successMessage: "Brand saved successfully.", errorMessage: "Error occurred in saving Brand" };
        productService.postBrand($scope.newBrand, options)
            .then(function (data) {
                var successData = data;

            }, function (error) {
                //
            });

    }
};

function editBrandModalInstanceCtrl($scope, $uibModalInstance, selectedBrandToEdit, actionName, productService) {
    $scope.updatedBrand = { productBrandId: '', brandName: '', brandDescription: '' };
    if (actionName == 'EDIT') {
        $scope.addOrEditTitle = 'Update Brand';
        $scope.addOrUpdateBrandActionText = 'Update Brand'
        $scope.brandName = selectedBrandToEdit.brandName;
        $scope.brandDescription = selectedBrandToEdit.brandDescription;
    }
    $scope.addNewOrUpdateBrand = function () {
        $scope.updatedBrand.productBrandId = selectedBrandToEdit.productBrandId;
        $scope.updatedBrand.brandName = $scope.brandName;
        $scope.updatedBrand.brandDescription = $scope.brandDescription;
        updateBrand();
        $uibModalInstance.close($scope.updatedBrand);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };

    function updateBrand() {
        var options = { successMessage: "Brand updated successfully.", errorMessage: "Error occurred in saving Brand" };
        productService.updateBrand($scope.updatedBrand, options)
            .then(function (data) {
                var successData = data;

            }, function (error) {
                //
            });

    }
};

function deleteBrandModalInstanceCtrl($scope, $uibModalInstance, selectedBrandToDelete, actionName, productService) {
    $scope.deletedBrand = { productBrandId: '', brandName: '', brandDescription: '' };
    if (actionName == 'DELETE') {
        $scope.addOrEditTitle = 'Delete Brand';
        $scope.addOrUpdateBrandActionText = 'Delete Brand'
        $scope.brandName = selectedBrandToDelete.brandName;
    }
    $scope.deleteBrand = function () {
        $scope.deletedBrand.productBrandId = selectedBrandToDelete.productBrandId;
        $scope.deletedBrand.brandName = $scope.brandName;
        $scope.deletedBrand.brandDescription = $scope.brandDescription;
        deleteBrand();
        $uibModalInstance.close($scope.deletedBrand);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };

    function deleteBrand() {
        var options = { successMessage: "Brand" + $scope.brandName + "deleted successfully.", errorMessage: "Error occurred in saving Brand" };
        productService.deleteBrand($scope.deletedBrand, options)
            .then(function (data) {
                var successData = data;

            }, function (error) {
                //
            });

    }
};
//Brands End