
//Tags Start
function productTagsCtrl($scope, $uibModal, productService) {
    $scope.newTag = { productTagId: '', TagName: '', TagDescription: '' };
    $scope.updatedTag = { productTagId: '', TagName: '', TagDescription: '' };
    $scope.Tags = {};

    init();

    function init() {
        getAllTags();
    }

    function getAllTags() {
        productService.getAllTags().then(
            function (data) {
                if (data) {
                    $scope.tags = data;
                }
            });
    };

    $scope.openAddTag = function () {
        var addTagModalInstance = $uibModal.open({
            templateUrl: 'app/views/products/Tags/addEditTag.html',
            controller: 'addTagModalInstanceCtrl',
            resolve: {
                actionName: function () {
                    return 'ADD'
                }
            }
        });

        addTagModalInstance.result.then(function (newTag) {
            $scope.newTag = newTag;
            getAllTags();
            //$log.info('Modal dismissed at: ' + new Date());
        });

    };

    $scope.editTag = function (tag) {
        var editTagModalInstance = $uibModal.open({
            templateUrl: 'app/views/products/Tags/addEditTag.html',
            controller: 'editTagModalInstanceCtrl',
            resolve: {
                selectedTagToEdit: function () {
                    return tag;
                },
                actionName: function () {
                    return 'EDIT'
                }
            }
        });

        editTagModalInstance.result.then(function (updatedTag) {
            $scope.updatedTag = updatedTag;
            getAllTags();
            //$log.info('Modal dismissed at: ' + new Date());
        });

    };

    $scope.deleteTag = function (deletedTag) {
        var deleteTagModalInstance = $uibModal.open({
            templateUrl: 'app/views/products/Tags/deleteTagConfirm.html',
            controller: 'deleteTagModalInstanceCtrl',
            resolve: {
                selectedTagToDelete: function () {
                    return deletedTag;
                },
                actionName: function () {
                    return 'DELETE'
                }
            }
        });

        deleteTagModalInstance.result.then(function (deletedTag) {
            $scope.deletedTag = deletedTag;
            getAllTags();
            //$log.info('Modal dismissed at: ' + new Date());
        });
    };



};

function addTagModalInstanceCtrl($scope, $uibModalInstance, actionName, productService) {
    $scope.newTag = { productTagId: '', tagName: '' };
    if (actionName == 'ADD') {
        $scope.addOrEditTitle = 'Add Tag';
        $scope.addOrUpdateTagActionText = 'Add Tag'
    }
    $scope.addNewOrUpdateTag = function () {
        $scope.newTag.tagName = $scope.tagName;
        saveNewTag();
        $uibModalInstance.close($scope.newTag);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };

    function saveNewTag() {
        var options = { successMessage: "Tag saved successfully.", errorMessage: "Error occurred in saving Tag" };
        productService.postTag($scope.newTag, options)
            .then(function (data) {
                var successData = data;

            }, function (error) {
                //
            });

    }
};

function editTagModalInstanceCtrl($scope, $uibModalInstance, selectedTagToEdit, actionName, productService) {
    $scope.updatedTag = { productTagId: '', tagName: '' };
    if (actionName == 'EDIT') {
        $scope.addOrEditTitle = 'Update Tag';
        $scope.addOrUpdateTagActionText = 'Update Tag'
        $scope.tagName = selectedTagToEdit.tagName;
    }
    $scope.addNewOrUpdateTag = function () {
        $scope.updatedTag.productTagId = selectedTagToEdit.productTagId;
        $scope.updatedTag.tagName = $scope.tagName;
        updateTag();
        $uibModalInstance.close($scope.updatedTag);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };

    function updateTag() {
        var options = { successMessage: "Tag updated successfully.", errorMessage: "Error occurred in saving Tag" };
        productService.updateTag($scope.updatedTag, options)
            .then(function (data) {
                var successData = data;

            }, function (error) {
                //
            });

    }
};

function deleteTagModalInstanceCtrl($scope, $uibModalInstance, selectedTagToDelete, actionName, productService) {
    $scope.deletedTag = { productTagId: '', tagName: '' };
    if (actionName == 'DELETE') {
        $scope.addOrEditTitle = 'Delete Tag';
        $scope.addOrUpdateTagActionText = 'Delete Tag'
        $scope.tagName = selectedTagToDelete.tagName;
    }
    $scope.deleteTag = function () {
        $scope.deletedTag.productTagId = selectedTagToDelete.productTagId;
        $scope.deletedTag.tagName = $scope.tagName;
        deleteTag();
        $uibModalInstance.close($scope.deletedTag);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };

    function deleteTag() {
        var options = { successMessage: "Tag" + $scope.tagName + "deleted successfully.", errorMessage: "Error occurred in saving Tag" };
        productService.deleteTag($scope.deletedTag, options)
            .then(function (data) {
                var successData = data;

            }, function (error) {
                //
            });

    }
};
//Tags End
