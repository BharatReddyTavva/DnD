
//Types Start
function productTypesCtrl($scope, $uibModal, productService) {
    $scope.newType = { productTypeId: '', TypeName: '' };
    $scope.updatedType = { productTypeId: '', TypeName: '' };
    $scope.Types = {};

    init();

    function init() {
        getAllTypes();
    }

    function getAllTypes() {
        productService.getAllTypes().then(
            function (data) {
                if (data) {
                    $scope.Types = data;
                }
            });
    };

    $scope.openAddType = function () {
        var addTypeModalInstance = $uibModal.open({
            templateUrl: 'app/views/products/productTypes/addEditType.html',
            controller: 'addTypeModalInstanceCtrl',
            resolve: {
                actionName: function () {
                    return 'ADD'
                }
            }
        });

        addTypeModalInstance.result.then(function (newType) {
            $scope.newType = newType;
            getAllTypes();
            //$log.info('Modal dismissed at: ' + new Date());
        });

    };

    $scope.editType = function (Type) {
        var editTypeModalInstance = $uibModal.open({
            templateUrl: 'app/views/products/productTypes/addEditType.html',
            controller: 'editTypeModalInstanceCtrl',
            resolve: {
                selectedTypeToEdit: function () {
                    return Type;
                },
                actionName: function () {
                    return 'EDIT'
                }
            }
        });

        editTypeModalInstance.result.then(function (updatedType) {
            $scope.updatedType = updatedType;
            getAllTypes();
            //$log.info('Modal dismissed at: ' + new Date());
        });

    };

    $scope.deleteType = function (deletedType) {
        var deleteTypeModalInstance = $uibModal.open({
            templateUrl: 'app/views/products/productTypes/deleteTypeConfirm.html',
            controller: 'deleteTypeModalInstanceCtrl',
            resolve: {
                selectedTypeToDelete: function () {
                    return deletedType;
                },
                actionName: function () {
                    return 'DELETE'
                }
            }
        });

        deleteTypeModalInstance.result.then(function (deletedType) {
            $scope.deletedType = deletedType;
            getAllTypes();
            //$log.info('Modal dismissed at: ' + new Date());
        });
    };



};

function addTypeModalInstanceCtrl($scope, $uibModalInstance, actionName, productService) {
    $scope.newType = { productTypeId: '', TypeName: '' };
    if (actionName == 'ADD') {
        $scope.addOrEditTitle = 'Add Type';
        $scope.addOrUpdateTypeActionText = 'Add Type'
    }
    $scope.addNewOrUpdateType = function () {
        $scope.newType.TypeName = $scope.TypeName;
        saveNewType();
        $uibModalInstance.close($scope.newType);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };

    function saveNewType() {
        var options = { successMessage: "Type saved successfully.", errorMessage: "Error occurred in saving Type" };
        productService.postType($scope.newType, options)
            .then(function (data) {
                var successData = data;

            }, function (error) {
                //
            });

    }
};

function editTypeModalInstanceCtrl($scope, $uibModalInstance, selectedTypeToEdit, actionName, productService) {
    $scope.updatedType = { productTypeId: '', TypeName: '' };
    if (actionName == 'EDIT') {
        $scope.addOrEditTitle = 'Update Type';
        $scope.addOrUpdateTypeActionText = 'Update Type'
        $scope.TypeName = selectedTypeToEdit.TypeName;
    }
    $scope.addNewOrUpdateType = function () {
        $scope.updatedType.productTypeId = selectedTypeToEdit.productTypeId;
        $scope.updatedType.TypeName = $scope.TypeName;
        updateType();
        $uibModalInstance.close($scope.updatedType);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };

    function updateType() {
        var options = { successMessage: "Type updated successfully.", errorMessage: "Error occurred in saving Type" };
        productService.updateType($scope.updatedType, options)
            .then(function (data) {
                var successData = data;

            }, function (error) {
                //
            });

    }
};

function deleteTypeModalInstanceCtrl($scope, $uibModalInstance, selectedTypeToDelete, actionName, productService) {
    $scope.deletedType = { productTypeId: '', TypeName: '' };
    if (actionName == 'DELETE') {
        $scope.addOrEditTitle = 'Delete Type';
        $scope.addOrUpdateTypeActionText = 'Delete Type'
        $scope.TypeName = selectedTypeToDelete.TypeName;
    }
    $scope.deleteType = function () {
        $scope.deletedType.productTypeId = selectedTypeToDelete.productTypeId;
        $scope.deletedType.TypeName = $scope.TypeName;
        deleteType();
        $uibModalInstance.close($scope.deletedType);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };

    function deleteType() {
        var options = { successMessage: "Type" + $scope.TypeName + "deleted successfully.", errorMessage: "Error occurred in saving Type" };
        productService.deleteType($scope.deletedType, options)
            .then(function (data) {
                var successData = data;

            }, function (error) {
                //
            });

    }
};
//Types End
