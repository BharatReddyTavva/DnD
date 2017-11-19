//Brands Start
function sellCtrl($scope, $uibModal, $rootScope, $compile, $state, $filter, sellService) {

    $scope.products = {};
    $scope.productCategoriesList = [];
    $scope.productListSelectedForSale = [];
    $scope.productSelectedForSaleTransaction = {
        productId: null,
        productName: null,
        productQuantity: null,
        productPrice: null,
        discountPercent: null
    };

    init();

    function init() {
        getAllProductsForSaleByStore();
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
                                })
                        }

                    });
                }
            });
    };

    $scope.selectProductForSale = function (productSelected) {
        $scope.productSelectedForSaleTransaction.productId = productSelected.productId;
        $scope.productSelectedForSaleTransaction.productName = productSelected.productName;
        $scope.productSelectedForSaleTransaction.productPrice = productSelected.productPrice;

        $scope.productListSelectedForSale.push(
        {
                productId: $scope.productSelectedForSaleTransaction.productId,
                productName: $scope.productSelectedForSaleTransaction.productName,
                productPrice: $scope.productSelectedForSaleTransaction.productPrice
        });

    };
};
