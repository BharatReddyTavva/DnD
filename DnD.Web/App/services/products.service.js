(function () {
    angular.module('inspinia')
        .service('productService', productService);

    productService.$inject = [
        'datacontext'
    ];

    function productService(datacontext) {
        var productService = {
            getAllProducts: getAllProducts,
            getProductsBySearch: getProductsBySearch,
            getAllMasterDataForCreateOrEditProduct: getAllMasterDataForCreateOrEditProduct,
            getAllMasterDataForCreateOrEditDiscountOffer: getAllMasterDataForCreateOrEditDiscountOffer,
            postProduct: postProduct,
            deleteProduct: deleteProduct,
            updateProduct: updateProduct,
            getAllBrands: getAllBrands,
            postBrand: postBrand,
            deleteBrand: deleteBrand,
            updateBrand: updateBrand,
            getAllSuppliers: getAllSuppliers,
            postSupplier: postSupplier,
            deleteSupplier: deleteSupplier,
            updateSupplier: updateSupplier,
            getAllTags: getAllTags,
            postTag: postTag,
            deleteTag: deleteTag,
            updateTag: updateTag,
            getAllTypes: getAllTypes,
            postType: postType,
            deleteType: deleteType,
            updateType: updateType,
            getStoreOutlets: getStoreOutlets,
            getInventoryBySearch: getInventoryBySearch
        };

        return productService;

        //API call to get all Products
        function getAllProducts() {
            return datacontext.get('Product/GetAllProductsByStore');
        };

        function getInventoryBySearch(searchCriteriaObject)
        {
            return datacontext.post('Product/GetInventoryBySearch/', searchCriteriaObject);
        };

        function getProductsBySearch(searchCriteriaObject, options) {
            return datacontext.post('Product/GetProductsBySearch/', searchCriteriaObject, options);
        };

        function getAllMasterDataForCreateOrEditProduct() {
            return datacontext.get('Product/GetAllMasterDataForCreateOrEditProduct');
        };

        function getAllMasterDataForCreateOrEditDiscountOffer() {
            return datacontext.get('Product/GetAllMasterDataForCreateOrEditDiscountOffer');
        }

        //API call to save the Product Object
        function postProduct(productObject, options) {
            return datacontext.post('Product/SaveProduct/', productObject, options);
        };

        //API call to update the Product Object
        function updateProduct(productObject, options) {
            return datacontext.post('Product/UpdateProduct/', productObject, options);
        };

        //API call to delete the Product Object
        function deleteProduct(productObject, options) {
            return datacontext.post('Product/DeleteProduct/', productObject, options);
        };

        //API call to get all Brands
        function getAllBrands() {
            return datacontext.get('Product/GetAllBrands');
        };

        //API call to save the Brand Object
        function postBrand(brandObject, options) {
            return datacontext.post('Product/SaveBrand/', brandObject, options);
        };

        //API call to update the Brand Object
        function updateBrand(brandObject, options) {
            return datacontext.post('Product/UpdateBrand/', brandObject, options);
        };

        //API call to delete the Brand Object
        function deleteBrand(brandObject, options) {
            return datacontext.post('Product/DeleteBrand/', brandObject, options);
        };

        //API call to get all Suppliers
        function getAllSuppliers() {
            return datacontext.get('Product/GetAllSuppliers');
        };

        //API call to save the Supplier Object
        function postSupplier(supplierObject, options) {
            return datacontext.post('Product/SaveSupplier/', supplierObject, options);
        };

        //API call to update the Supplier Object
        function updateSupplier(supplierObject, options) {
            return datacontext.post('Product/UpdateSupplier/', supplierObject, options);
        };

        //API call to delete the Supplier Object
        function deleteSupplier(supplierObject, options) {
            return datacontext.post('Product/DeleteSupplier/', supplierObject, options);
        };

        //API call to get all Tags
        function getAllTags() {
            return datacontext.get('Product/GetAllTags');
        };

        //API call to save the Tag Object
        function postTag(tagObject, options) {
            return datacontext.post('Product/SaveTag/', tagObject, options);
        };

        //API call to update the Tag Object
        function updateTag(tagObject, options) {
            return datacontext.post('Product/UpdateTag/', tagObject, options);
        };

        //API call to delete the Tag Object
        function deleteTag(tagObject, options) {
            return datacontext.post('Product/DeleteTag/', tagObject, options);
        };

        //API call to get all Types
        function getAllTypes() {
            return datacontext.get('Product/GetAllTypes');
        };

        //API call to save the Type Object
        function postType(brandObject, options) {
            return datacontext.post('Product/SaveType/', brandObject, options);
        };

        //API call to update the Type Object
        function updateType(brandObject, options) {
            return datacontext.post('Product/UpdateType/', brandObject, options);
        };

        //API call to delete the Type Object
        function deleteType(brandObject, options) {
            return datacontext.post('Product/DeleteType/', brandObject, options);
        };

        //Stock Control
        function getStoreOutlets() {
            return datacontext.get('Product/GetStoreOutlets');
        };

    };
})();