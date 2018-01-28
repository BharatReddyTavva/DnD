(function () {

    angular.module('inspinia').
        service('adminSettingService', adminSettingService);

    adminSettingService.$inject = ['datacontext'];


    function adminSettingService(datacontext) {

        var adminSettingService = {
            
            getAllMasterDataForStore: getAllMasterDataForStore,
            saveStoreSetup: saveStoreSetup
        };

        return adminSettingService;

        //API call to get all Groups
        function getAllMasterDataForStore() {
            return datacontext.get('Store/GetAllMasterDataForStore');
        };

        //API call to Save Customer
        function saveStoreSetup(storeSetup, options) {
            return datacontext.post('Store/SaveStoreSetup/', storeSetup, options);
        };

    };


})();