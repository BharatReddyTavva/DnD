(function () {
    angular.module('inspinia')
        .service('sellService', sellService);

    sellService.$inject = [
        'datacontext'
    ];

    function sellService(datacontext) {
        var sellService = {
            getAllProductsForSaleByStore: getAllProductsForSaleByStore,
            getAllCustomers: getAllCustomers
        };

        return sellService;

        //API call to get all Products
        function getAllProductsForSaleByStore() {
            return datacontext.get('Product/GetAllProductsForSaleByStore');
        };

        //API call to get all customers
        function getAllCustomers() {
            return datacontext.get('Product/GetAllCustomers');
        };
    };
})();