function transferOrderCtrl($scope, $uibModal, $rootScope, $compile, $state, $filter, productService) {
    //$scope.products = {};
    $scope.storeOutlets = {};
    $scope.transferOrder = {};
    $scope.selectedSourceOutlet = {};
    $scope.selectedDestinationOutlet = {};
    $scope.selectedProducts = [];
    $scope.productsToTransfer = [];

    init();

    function init() {
        getStoreOutlets();

    }

    $scope.$watch('selectedProducts', function (newValue, oldValue) {

        if ($scope.selectedProducts.length > 0) {
            angular.forEach($scope.selectedProducts, function (product, productNum) {
                var sourceStoreoutlet = $filter('filter')(product.storeOutletsInventory, { storeOutletId: $scope.selectedSourceOutlet.storeOutletId })[0];
                var productNum = 0;
                $scope.productsToTransfer.push(
                    {
                        orderNum: productNum++,
                        isProductHasVariants: product.isProductHasVariants,
                        productId: product.productId,
                        productName: product.productName,
                        productVariantId: product.productVariantId,
                        productVariantName: product.productVariantName,
                        inventoryAtHand: sourceStoreoutlet.storeOutletCurrentInventory
                    }
                );
            });
        }
        else {
        }
    }, true);

    //$scope.product = {};

    function getStoreOutlets() {
        productService.getStoreOutlets().then(
            function (data) {
                if (data) {
                    $scope.storeOutlets = data;
                }
            });
    };

    //function getAllProducts() {
    //    productService.getAllProducts().then(
    //        function (data) {
    //            if (data) {
    //                $scope.products = data;
    //            }
    //        });
    //};


};
