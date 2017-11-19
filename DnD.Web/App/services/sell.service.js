(function () {
    angular.module('inspinia')
        .service('sellService', sellService);

    sellService.$inject = [
        'datacontext'
    ];

    function sellService(datacontext) {
        var sellService = {
            getAllProductsForSaleByStore: getAllProductsForSaleByStore,
        };

        return sellService;

        //API call to get all Products
        function getAllProductsForSaleByStore() {
            return datacontext.get('Product/GetAllProductsForSaleByStore');
        };
    };
})();