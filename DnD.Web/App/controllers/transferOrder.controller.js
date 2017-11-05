function transferOrderCtrl($scope, $uibModal, $rootScope, $compile, $state, $filter, productService) {
    //$scope.products = {};
    $scope.storeOutlets = {};
    $scope.transferOrder = {};
    $scope.selectedSourceOutlet = {};
    $scope.selectedDestinationOutlet = {};
    $scope.selectedProducts = [];
    $scope.productsToTransferTemp = [];
    $scope.isProductsAdded = false;

    init();

    function init() {
        getStoreOutlets();
        getAllSalesTaxList();
    }

    $scope.$watch('selectedProducts', function (newValue, oldValue) {

        if ($scope.selectedProducts.length > 0) {
            angular.forEach($scope.selectedProducts, function (product, productNum) {
                var sourceStoreoutlet = $filter('filter')(product.storeOutletsInventory, { storeOutletId: $scope.selectedSourceOutlet.storeOutletId })[0];
                var productNum = 0;
                $scope.productsToTransferTemp.push(
                    {
                        orderNum: productNum++,
                        isProductHasVariants: product.isProductHasVariants,
                        productId: product.productId,
                        productName: product.productName,
                        productVariantId: product.productVariantId,
                        productVariantName: product.productVariantName,
                        inventoryAtHand: sourceStoreoutlet.storeOutletCurrentInventory,
                        quantity: 0,
                        productVariantSupplyPrice: sourceStoreoutlet.productVariantSupplyPrice
                    }
                );
            });
        }
        else {
        }
    }, true);

    $scope.$watch('isProductsAdded', function (newValue, oldValue) {

        if (newValue == true) {
            $scope.transferOrder.productsToTransfer = angular.copy($scope.productsToTransferTemp);
        }
        else {
            $scope.transferOrder.productsToTransfer = [];
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

    function getAllSalesTaxList() {
        productService.getAllSalesTaxList().then(
            function (data) {
                if (data) {
                    $scope.salesTaxes = data;
                }
            });
    };

    $scope.changeQuantityPriceSalestax = function (productToTransfer) {
        var productTotalPrice = parseFloat(((productToTransfer.quantity) * parseFloat((productToTransfer.productVariantSupplyPrice))) + ((parseFloat((productToTransfer.productVariantSupplyPrice)) * parseFloat((productToTransfer.salesTax.taxRate))) / 100));
    }

    //function getAllProducts() {
    //    productService.getAllProducts().then(
    //        function (data) {
    //            if (data) {
    //                $scope.products = data;
    //            }
    //        });
    //};


};
