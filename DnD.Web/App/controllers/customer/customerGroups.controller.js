////Groups Start
function customerGroupsCtrl($scope, $uibModal, customerService) {

    $scope.newGroup = {  groupName: '', createdOn: '', discountPercentage: '' };
    $scope.updatedGroup = { customerGroupMasterId: '', groupName: '', createdOn: '', discountPercentage: '' };
    $scope.groups = {};

    init();

    function init() {
        getAllGroups();
    }

    ///Get All Customer Group start
    function getAllGroups() {
        customerService.getAllGroups().then(function (data) {
            if (data) {
                $scope.groups = data;
            }
        });

    };

    ///Get All Customer Group end

    $scope.openAddGroup = function () {
        var addGroupModalInstance = $uibModal.open({
            templateUrl: 'app/views/customers/groups/addEditGroup.html',
            controller: 'addGroupModalInstanceCtrl',
            resolve: {
                actionName: function () {
                    return 'ADD'
                }
            }
        });

        addGroupModalInstance.result.then(function (newGroup) {
            $scope.newGroup = newGroup;
            getAllGroups();
            //$log.info('Modal dismissed at: ' + new Date());
        });

    };

    $scope.editGroup = function (group) {
        var editGroupModalInstance = $uibModal.open({
            templateUrl: 'app/views/customers/groups/addEditGroup.html',
            controller: 'editGroupModalInstanceCtrl',
            resolve: {
                selectedGroupToEdit: function () {
                    return group;
                },
                actionName: function () {
                    return 'EDIT'
                }
            }
        });

        editGroupModalInstance.result.then(function (updatedGroup) {
            $scope.updatedGroup = updatedGroup;
            getAllGroups();
            //$log.info('Modal dismissed at: ' + new Date());
        });

    };

    $scope.deleteGroup = function (deletedGroup) {
        var deleteGroupModalInstance = $uibModal.open({
            templateUrl: 'app/views/customers/groups/deleteGroupConfirm.html',
            controller: 'deleteGroupModalInstanceCtrl',
            resolve: {
                selectedGroupToDelete: function () {
                    return deletedGroup;
                },
                actionName: function () {
                    return 'DELETE'
                }
            }
        });

        deleteGroupModalInstance.result.then(function (deletedGroup ) {
            $scope.deleteGroup = deletedGroup;
            getAllGroups();
            //$log.info('Modal dismissed at: ' + new Date());
        });
    };

};

///Save
function addGroupModalInstanceCtrl($scope, $uibModalInstance, actionName, customerService) {
    $scope.newGroup = {  groupName: '', createdOn: '', discountPercentage: '' };
    if (actionName == 'ADD') {
        $scope.addOrEditTitle = 'Add Group';
        $scope.addOrUpdateGroupActionText = 'Add Group'
    }
    $scope.addNewOrUpdateGroup = function () {
        $scope.newGroup.groupName = $scope.groupName;
        $scope.newGroup.discountPercentage = $scope.discountPercentage;
        saveNewGroup();
        $uibModalInstance.close($scope.newGroup);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };

    function saveNewGroup() {
        var options = { successMessage: "Group saved successfully.", errorMessage: "Error occurred in saving Group" };
        customerService.postGroup($scope.newGroup, options)
            .then(function (data) {
                var successData = data;

            }, function (error) {
                //
            });

    }
};

///Update 
function editGroupModalInstanceCtrl($scope, $uibModalInstance, selectedGroupToEdit, actionName, customerService) {
    $scope.updatedGroup = { customerGroupMasterId: '', groupName: '', createdOn: '', discountPercentage: '' };
    if (actionName == 'EDIT') {
        $scope.addOrEditTitle = 'Update Group';
        $scope.addOrUpdateGroupActionText = 'Update Group'
        $scope.groupName = selectedGroupToEdit.groupName;
        $scope.discountPercentage = selectedGroupToEdit.discountPercentage;
    }
    $scope.addNewOrUpdateGroup = function () {
        $scope.updatedGroup.customerGroupMasterId = selectedGroupToEdit.customerGroupMasterId;
        $scope.updatedGroup.groupName = $scope.groupName;
        $scope.updatedGroup.discountPercentage = $scope.discountPercentage;
        updateGroup();
        $uibModalInstance.close($scope.updatedGroup);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };

    function updateGroup() {
        var options = { successMessage: "Group updated successfully.", errorMessage: "Error occurred in saving Group" };
        customerService.updatecustomerGroup($scope.updatedGroup, options)
            .then(function (data) {
                var successData = data;

            }, function (error) {
                //
            });

    }
};

///Delete
function deleteGroupModalInstanceCtrl($scope, $uibModalInstance, selectedGroupToDelete, actionName, customerService) {
    $scope.deletedGroup = { customerGroupMasterId: '', groupName: '', createdOn: '', discountPercentage: '' };
    if (actionName == 'DELETE') {
        $scope.addOrEditTitle = 'Delete Group';
        $scope.addOrUpdateGroupActionText = 'Delete Group'
        $scope.groupName = selectedGroupToDelete.groupName;
    }
    $scope.deleteGroup = function () {
        $scope.deletedGroup.customerGroupMasterId = selectedGroupToDelete.customerGroupMasterId;
        $scope.deletedGroup.groupName = $scope.groupName;
        $scope.deletedGroup.discountPercentage = $scope.discountPercentage;
        deleteGroup();
        $uibModalInstance.close($scope.deletedGroup);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };

    function deleteGroup() {
        var options = { successMessage: "Group" + $scope.groupName + "deleted successfully.", errorMessage: "Error occurred in saving Group" };
        customerService.deleteGroup($scope.deletedGroup, options)
            .then(function (data) {
                var successData = data;

            }, function (error) {
                //
            });

    }
};