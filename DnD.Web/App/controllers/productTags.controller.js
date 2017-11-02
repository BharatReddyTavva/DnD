
//Tags Start
function productTagsCtrl($scope, $uibModal, productService) {
    $scope.newTag = { productTagMasterId: '', TagName: '', TagDescription: '' };
    $scope.updatedTag = { productTagMasterId: '', TagName: '', TagDescription: '' };
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
                    return 'ADD';
                },
                tagsList: function () {
                    return $scope.tags;
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
                    return 'EDIT';
                },
                tagsList: function () {
                    return $scope.tags;
                }
            }
        });

        editTagModalInstance.result.then(function (updatedTag) {
            $scope.updatedTag = updatedTag;
            //getAllTags();
            //$log.info('Modal dismissed at: ' + new Date());
        });
        getAllTags();
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
                    return 'DELETE';
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

function addTagModalInstanceCtrl($scope, $uibModalInstance, $filter, actionName, tagsList, productService) {
    $scope.tagAlreadyExists = false;
    $scope.newTag = { productTagMasterId: '', tagName: '' };

    if (actionName == 'ADD') {
        $scope.addOrEditTitle = 'Add Tag';
        $scope.addOrUpdateTagActionText = 'Add Tag'
    }
    $scope.addNewOrUpdateTag = function () {
        $scope.newTag.tagName = $scope.tagName;
        var newTagToSave = $filter('filter')(tagsList, { tagName: $scope.newTag.tagName })[0];
        if (newTagToSave) {
            $scope.tagAlreadyExists = true;
            return;
        }
        saveNewTag();
        $uibModalInstance.close($scope.newTag);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };

    function saveNewTag() {
        var options = { successMessage: "Tag saved successfully.", errorMessage: "Error occurred in saving Tag" };
        if ($scope.addTag_form.$valid) {
            productService.postTag($scope.newTag, options)
                .then(function (data) {
                    var successData = data;

                }, function (error) {
                    //
                });
        } else {
            $scope.addTag_form.submitted = true;
        }
    }
};

function editTagModalInstanceCtrl($scope, $uibModalInstance, $filter, selectedTagToEdit, actionName, tagsList, productService) {
    $scope.tagAlreadyExists = false;
    $scope.updatedTag = { productTagMasterId: '', tagName: '' };
    if (actionName == 'EDIT') {
        $scope.addOrEditTitle = 'Edit Tag';
        $scope.addOrUpdateTagActionText = 'Save Tag'
        $scope.tagName = selectedTagToEdit.tagName;
    }
    $scope.addNewOrUpdateTag = function () {
        $scope.updatedTag.productTagMasterId = selectedTagToEdit.productTagMasterId;
        $scope.updatedTag.tagName = $scope.tagName;
        if (selectedTagToEdit.tagName != $scope.updatedTag.tagName) {
            var newTagToSave = $filter('filter')(tagsList, { tagName: $scope.updatedTag.tagName })[0];
            if (newTagToSave) {
                $scope.tagAlreadyExists = true;
                return;
            }
        }
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
    $scope.deletedTag = { productTagMasterId: '', tagName: '' };
    if (actionName == 'DELETE') {
        $scope.addOrEditTitle = 'Delete Tag';
        $scope.addOrUpdateTagActionText = 'Delete Tag'
        $scope.tagName = selectedTagToDelete.tagName;
    }
    $scope.deleteTag = function () {
        $scope.deletedTag.productTagMasterId = selectedTagToDelete.productTagMasterId;
        $scope.deletedTag.tagName = $scope.tagName;
        deleteTag();
        $uibModalInstance.close($scope.deletedTag);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };

    function deleteTag() {
        var options = { successMessage: "Tag" + selectedTagToDelete.tagName + "deleted successfully.", errorMessage: "Error occurred in saving Tag" };
        productService.deleteTag($scope.deletedTag, options)
            .then(function (data) {
                var successData = data;

            }, function (error) {
                //
            });

    }
};
//Tags End
