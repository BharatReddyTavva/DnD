//Brands Start
function sellCtrl($scope, $uibModal, $rootScope, $compile, $state, $filter, sellService) {

    $scope.products = {};
    $scope.showSellTransaction = true;
    $scope.productCategoriesList = [];
    $scope.productListSelectedForSale = [];
    $scope.selectedCustomer = [];
    $scope.productSelectedForSaleTransaction = {
        productId: null,
        productName: null,
        productQuantity: null,
        productPrice: null,
        discountPercent: null
    };
    $scope.sellTransaction = {
        productsSelectedForSale: null,
        saleNote: '',
        discountPrice: parseFloat(0).toFixed(2),
        numberOfItems: 0,
        saleTax: parseFloat(0).toFixed(2),
        subTotalPrice: parseFloat(0).toFixed(2),
        totalSaleTransactionPrice: parseFloat(0).toFixed(2)
    }

    init();

    function init() {
        getAllProductsForSaleByStore();
        getAllCustomers();
    }

    function getAllProductsForSaleByStore() {
        sellService.getAllProductsForSaleByStore().then(
            function (data) {
                if (data) {
                    $scope.products = data;
                    angular.forEach($scope.products, function (product, productNum) {
                        var newCategoryToSave = $filter('filter')($scope.productCategoriesList, { productTypeId: product.productTypeId })[0];
                        if (newCategoryToSave == undefined) {
                            $scope.productCategoriesList.push(
                                {
                                    productTypeId: product.productTypeId,
                                    productTypeName: product.productTypeName
                                });
                        }

                    });
                }
            });
    };

    function getAllCustomers() {
        sellService.getAllCustomers().then(
            function (data) {
                if (data) {
                    $scope.customers = data;
                }
            });
    };


    $scope.selectProductForSale = function (productSelected) {
        $scope.productSelectedForSaleTransaction.productId = productSelected.productId;
        $scope.productSelectedForSaleTransaction.productName = productSelected.productName;
        $scope.productSelectedForSaleTransaction.productPrice = productSelected.price;
        $scope.productSelectedForSaleTransaction.productQuantity = 1;
        $scope.productSelectedForSaleTransaction.discountPercent = 0;

        $scope.productListSelectedForSale.push(
        {
                productId: $scope.productSelectedForSaleTransaction.productId,
                productName: $scope.productSelectedForSaleTransaction.productName,
                productTotalPrice: ($scope.productSelectedForSaleTransaction.productPrice * $scope.productSelectedForSaleTransaction.productQuantity) -
                    (($scope.productSelectedForSaleTransaction.productPrice * $scope.productSelectedForSaleTransaction.productQuantity) * ($scope.productSelectedForSaleTransaction.discountPercent)/100),
                productPrice: $scope.productSelectedForSaleTransaction.productPrice,
                productQuantity: $scope.productSelectedForSaleTransaction.productQuantity,
                discountPercent: $scope.productSelectedForSaleTransaction.discountPercent
        });

        sellTransactionUpdate();

    };

    $scope.productPriceQuantityDiscountChange = function (productSelected) {
        var productWhoseQuantityUpdated = $filter('filter')($scope.productListSelectedForSale, { productId: productSelected.productId })[0];
        angular.forEach($scope.productListSelectedForSale, function (product, productNum) {
            if (product.productId == productSelected.productId) {
                product.productTotalPrice = (productSelected.productPrice * productSelected.productQuantity) -
                    ((productSelected.productPrice * productSelected.productQuantity) * (productSelected.discountPercent) / 100);
            }
        });
        sellTransactionUpdate();
    };

    function sellTransactionUpdate() {
        $scope.sellTransaction = {
            productsSelectedForSale: null,
            saleNote: '',
            discountPrice: parseFloat(0).toFixed(2),
            numberOfItems: 0,
            saleTax: parseFloat(0).toFixed(2),
            subTotalPrice: parseFloat(0).toFixed(2),
            totalSaleTransactionPrice: parseFloat(0).toFixed(2)
        }
        $scope.sellTransaction.numberOfItems = $scope.productListSelectedForSale.length;
        $scope.sellTransaction.productsSelectedForSale = $scope.productListSelectedForSale;
        angular.forEach($scope.productListSelectedForSale, function (product, productNum) {
            $scope.sellTransaction.subTotalPrice = (parseFloat($scope.sellTransaction.subTotalPrice) + parseFloat(product.productTotalPrice)).toFixed(2);
            $scope.sellTransaction.totalSaleTransactionPrice = (parseFloat($scope.sellTransaction.subTotalPrice) - parseFloat($scope.sellTransaction.discountPrice) + parseFloat($scope.sellTransaction.saleTax)).toFixed(2);
        });
    }

    $scope.doSellTransactionPayment = function () {
        var selectedCustomer = $scope.selectedCustomer;
        $scope.showSellTransaction = !($scope.showSellTransaction);
    }
};
