function purchaseOrderCtrl($scope, $uibModal, $rootScope, $compile, $state, $filter, productService) {
    //$scope.products = {};
    $scope.storeOutlets = {};
    $scope.suppliers = {};
    $scope.selectedPurchaseOrderFromSupplier = {};
    $scope.selectedPurchaseOrderDestinationOutlet = {};
    $scope.selectedProducts = [];
    $scope.productsToOrder = [];

    init();

    function init() {
        getStoreOutlets();
        getAllSuppliers();

    }

    $scope.$watch('selectedProducts', function (newValue, oldValue) {

        if ($scope.selectedProducts.length > 0) {
            angular.forEach($scope.selectedProducts, function (product, productNum) {
                var destinationStoreoutlet = $filter('filter')(product.storeOutletsInventory, { storeOutletId: $scope.selectedPurchaseOrderDestinationOutlet.storeOutletId })[0];
                var productNum = 0;
                $scope.productsToOrder = [];
                $scope.productsToOrder.push(
                    {
                        orderNum: productNum++,
                        isProductHasVariants: product.isProductHasVariants,
                        productId: product.productId,
                        productName: product.productName,
                        productVariantId: product.productVariantId,
                        productVariantName: product.productVariantName,
                        inventoryAtHand: destinationStoreoutlet.storeOutletCurrentInventory
                    }
                );
            });
        }
        else {
        }
    }, true);

    function getStoreOutlets() {
        productService.getStoreOutlets().then(
            function (data) {
                if (data) {
                    $scope.storeOutlets = data;
                }
            });
    };

    function getAllSuppliers() {
        productService.getAllSuppliers().then(
            function (data) {
                if (data) {
                    $scope.suppliers = data;
                }
            });
    };


};
