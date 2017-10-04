(function () {
    'use strict';

    /** 
    * @ngdoc service
    * @name 
    * @description Data context service. Used for calling XHR requests. Handles GET, POST, PUT, DELETE requests.
    * @requires $http
    * @requires 
    */
    angular.module('inspinia')
        .factory('datacontext', ['$http', '$q', 'logger', datacontext]);

    function datacontext($http, $q, logger) {
        var API_PATH = "api/";
        var errorMessage = "An error has occurred in the DealnDone application. If you continue to receive this error, please contact 0000";

        var service = {
            getSync: getSync,
            get: get,
            getById: getById,
            getByParams: getByParams,
            post: post,
            postDataWithFile: postDataWithFile,
            put: put,
            deleteItem: deleteItem,
            uploadFile: uploadFile,
            downloadFile: downloadFile,
            downloadFileWithPost: downloadFileWithPost
        };

        return service;

        function getApiPath() {
            return window.location.pathname + API_PATH;
        };

        function handleError(erroObject, deferred, callbackMethod) {
            var jqXHR = { status: erroObject.status, url: erroObject.config.url }
            if (isReauthNeeded(jqXHR)) {
                return authenticate().then(function () {
                    return callbackMethod();
                });
            } else {
                if (erroObject.errorMessage !== "") {
                    logError(erroObject.errorMessage || errorMessage);
                }
                deferred.reject(erroObject);
            }
        };

        function getSync(apiUrl) {
            var fqApiUrl = getApiPath() + apiUrl;

            return $.ajax({
                dataType: "json",
                url: fqApiUrl,
                async: false
            });
        };

        function get(apiUrl, options) {
            var deferred = $q.defer();
            var fqApiUrl = getApiPath() + apiUrl;

            $http.get(fqApiUrl)
                .then(function (response) {
                    deferred.resolve(response.data);
                }, function (erroObject) {
                    handleError(erroObject, deferred, function () {
                        return get(apiUrl, options)
                    });
                });

            return deferred.promise;
        };

        function getById(apiUrl, id, options) {

            var deferred = $q.defer();
            var fqApiUrl = getApiPath() + apiUrl + "/" + id;

            return $http.get(fqApiUrl)
                .then(function (response) {
                    deferred.resolve(response.data);
                },
                function (erroObject) {
                    handleError(erroObject, deferred, function () {
                        return getById(apiUrl, id, options);
                    });
                });
            return deferred.promise;
        };

        function getByParams(apiUrl, params, options) {

            var deferred = $q.defer();
            var fqApiUrl = getApiPath() + apiUrl;

            $http({
                url: fqApiUrl,
                method: "GET",
                params: JSON.parse(JSON.stringify(params))
            }).then(function (response) {
                deferred.resolve(response.data);
            },
                function (erroObject) {
                    handleError(erroObject, deferred, function () {
                        return getByParams(apiUrl, params, options);
                    });
                });

            return deferred.promise;
        };

        function post(apiUrl, dataToUpdate, options) {
            var deferred = $q.defer();
            var fqApiUrl = getApiPath() + apiUrl;

            $http({
                url: fqApiUrl,
                method: "POST",
                data: dataToUpdate
            }).then(function (response) {
                if (options) {
                    if (options.successMessage)
                        logSuccess(options.successMessage);
                }
                deferred.resolve(response.data);
            },
                function (erroObject) {
                    if (options) {
                        if (erroObject.data.exceptionMessage !== "") {
                            erroObject.errorMessage = erroObject.data.exceptionMessage;
                        }
                        else {
                            erroObject.errorMessage = options.errorMessage;
                        }
                    }
                    handleError(erroObject, deferred, function () {
                        return post(apiUrl, dataToUpdate, options);
                    });
                });

            return deferred.promise;
        };


        function postDataWithFile(apiUrl, dataToUpload, fileToUpload, options) {
            var fqApiUrl = getApiPath() + apiUrl;

            return $http({
                method: 'POST',
                url: fqApiUrl,
                headers: { 'Content-Type': undefined },
                transformRequest: function (data) {
                    var formData = new FormData();
                    formData.append("jsonData", angular.toJson(data.jsonData));
                    for (var i = 0; i < data.files.length; i++) {
                        formData.append("file" + i, data.files[i]);
                    }
                    return formData;
                },
                data: { jsonData: dataToUpload, files: fileToUpload }
            });

        };

        function put(apiUrl, dataToUpdate, options) {
            var deferred = $q.defer();
            var fqApiUrl = getApiPath() + apiUrl;

            $http({
                url: fqApiUrl,
                method: "PUT",
                data: dataToUpdate
            }).then(function (response) {
                if (options) {
                    if (options.successMessage)
                        logSuccess(options.successMessage);
                }
                deferred.resolve(response.data);
            },
                function (erroObject) {
                    if (options) {
                        if (erroObject.data.exceptionMessage !== "") {
                            erroObject.errorMessage = erroObject.data.exceptionMessage;
                        }
                        else {
                            erroObject.errorMessage = options.errorMessage;
                        }
                    }
                    handleError(erroObject, deferred, function () {
                        return post(apiUrl, dataToUpdate, options);
                    });
                });

            return deferred.promise;
        };

        function deleteItem(apiUrl, params, options) {
            var deferred = $q.defer();
            var fqApiUrl = getApiPath() + apiUrl;

            $http({
                url: fqApiUrl,
                method: "POST",
                params: JSON.parse(JSON.stringify(params))
            }).then(function (response) {
                deferred.resolve(response.data);
            },
                function (erroObject) {
                    handleError(erroObject, deferred, function () {
                        return deleteItem(apiUrl, params, options);
                    });
                });

            return deferred.promise;
        };

        function uploadFile(browseElement, addCallback, changeCallback, apiUrl, successCallback, failedCallback) {
            var fqApiUrl = getApiPath() + apiUrl;

            $(browseElement).fileupload({
                url: fqApiUrl,
                dataType: 'json',
                autoUpload: false,
                done: successCallback,
                //To start upload on a button click
                add: addCallback,
                change: changeCallback,
                error: function (jqXHR, textStatus) {
                    if (isReauthNeeded(jqXHR)) {
                        console.log("ReAuth");
                        return authenticate().then(function () {
                            return uploadFile(browseElement, addCallback, changeCallback, apiUrl, successCallback, failedCallback);
                        });
                    } else {
                        if (failedCallback) {
                            failedCallback(jqXHR, textStatus);
                        }
                    }
                }
            });
        };

        function downloadFile(apiUrl, successCallback, failedCallback) {
            var fqApiUrl = getApiPath() + apiUrl;

            return $.fileDownload(fqApiUrl)
                .done(successCallback)
                .fail(failedCallback);
        };

        function downloadFileWithPost(apiUrl, data, successCallback, failedCallback) {
            var fqApiUrl = getApiPath() + apiUrl;

            $.fileDownload(fqApiUrl, {
                httpMethod: "POST",
                data: data
            })
                .done(successCallback)
                .fail(failedCallback);
        };


        function authenticate() {
            return $.Deferred(function (d) {
                var iFrame = $("<iframe></iframe>");
                iFrame.hide();
                if (navigator.userAgent.search("Firefox") >= 0 || navigator.userAgent.search("iPad") >= 0) {
                    iFrame.get(0).onload = function () {
                        iFrame.remove();
                        d.resolve();
                    };
                }
                iFrame.attr('src', keepAlivePage);
                iFrame.appendTo("body");

                iFrame.on('load', function () {
                    iFrame.on('load', function () {
                        iFrame.remove();
                        d.resolve();
                    });
                });
            });
        };

        function isReauthNeeded(jqXHR) {
            if (jqXHR.status == 401) {
                var retryTracker = "retry" + jqXHR.url;
                if ($.cookie(retryTracker)) {
                    //reauthentication failed: reload the app
                    $.cookie(retryTracker, '', { path: '/' });
                    window.location.reload();
                }
                else {
                    // first attempt
                    var expireDate = new Date();
                    var minutes = 1;
                    expireDate.setTime(expireDate.getTime() + (minutes * 60 * 1000));
                    $.cookie(retryTracker, "retrying", { expires: expireDate });
                    return true;
                }
            }
        };

        // Log
        function consoleLog(msg) {
            if (typeof console === 'object')
                console.log(msg);
        };

        function logError(message) {
            //logger.logError(message, null, null, true);
        };

        function logSuccess(message) {
            //logger.logSuccess(message, null, null, true);
        };

    }
})();