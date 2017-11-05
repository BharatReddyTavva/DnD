function loginCtrl($scope, $uibModal, $rootScope, $compile, $state, $filter, productService) {

    init();

    function init() {
    }

    $scope.onLoginSubmit = function () {
        //if (loginForm.$valid) {
        $state.go('products.productsList');
        //}
    }

};
