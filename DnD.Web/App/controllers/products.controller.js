//Brands Start
function productsCtrl($scope, $uibModal, $rootScope, $compile, $state, productService) {
    $scope.products = {};

    init();

    function init() {
        getAllProducts();
        getAllMasterDataForCreateOrEditProduct();

    }

    $scope.product = {};
    $scope.productContent = {};
    $scope.productContent.attributes = [];
    $scope.productContent.productTags = [];
    $scope.productContent.productPricings = [];
    $scope.productContent.productOutletPricings = [];
    $scope.productContent.productInventory = [];
    $scope.product.productVariants = [];
    $scope.product.productInventory = [];
    $scope.productContent.productVariants = [];
    $scope.productTags = {};
    $scope.productTagsWithText = [];
    $scope.productTypes = {};
    $scope.productBrands = {};
    $scope.productSuppliers = {};
    $scope.storeOutlets = {};
    $scope.productVariantAttributes = {};
    $scope.salesTaxes = {};
    $scope.combinations = [];

    $scope.selectedRetailSalesTax = {};
    $scope.retailTaxAmount = 0.00;
    $scope.retailPriceIncludingTax = 0.00;

    $scope.selectedWholesaleSalesTax = {};
    $scope.wholesaleTaxAmount = 0.00;
    $scope.wholesalePriceIncludingTax = 0.00

    $scope.selectedDistributionSalesTax = {};
    $scope.distributionTaxAmount = 0.00;
    $scope.distributionPriceIncludingTax = 0.00;

    $scope.showRetailTaxes = true;
    $scope.showWholesaleTaxes = true;
    $scope.showDistributionTaxes = true;
    $scope.enteredNameSkuHandleSupplier = null;
    $scope.selectedProductCategoryType = null;
    $scope.selectedProductBrand = null;
    $scope.selectedProductSupplier = null;
    $scope.enteredProductTags = null;

    $scope.searchCriteria = {
        nameSkuHandleSupplier: null,
        productTypeId: null,
        productBrandId: null,
        productSupplierId: null,
        productTags: null
    };

    //Dropzone code Start
    $scope.dzOptions = {
        paramName: 'photo',
        maxFilesize: '10'
    };

    $scope.dzMethods = {};

    $scope.dzCallbacks = {
        'addedfile': function (file) {
            var uploadedFiles = $scope.dzMethods.getAllFiles();
            console.info('File added from dropzone 1.', file);
        }
    };

    //Dropzone code end

    $scope.addNewVariantAttribute = function () {
        var divElement = angular.element(document.querySelector('#productVariantAttributeDiv'));
        var appendHtml = $compile('<product-variant-attribute></product-variant-attribute>')($scope);
        divElement.append(appendHtml);
    }

    $scope.onProductNameChange = function () {
        var productNameWithSpaces = $scope.product.productName;
        $scope.product.productHandle = productNameWithSpaces.replace(/ /g, '');
    };

    $scope.removeTagOnBackspace = function (event) {
        if (event.keyCode === 8 && ($scope.product.productName === '' || $scope.product.productName === undefined)) {
            $scope.product.productHandle = '';
        }
        else if (event.keyCode === 8 && ($scope.product.productName !== '' || $scope.product.productName !== undefined)) {
            var productNameWithSpaces = $scope.product.productName;
            $scope.product.productHandle = productNameWithSpaces.replace(/ /g, '');
        }
    };

    var getPermutation = function (arraysToCombineAndVariantAttributeType) {
        var arraysToCombine = [[]];
        angular.forEach(arraysToCombineAndVariantAttributeType, function (attributeArraysToCombine, index) {
            arraysToCombine.push(attributeArraysToCombine.productVariantAttributeCollection);
        });
        arraysToCombine.splice(0, 1);
        var divisors = [];
        for (var i = arraysToCombine.length - 1; i >= 0; i--) {
            divisors[i] = divisors[i + 1] ? divisors[i + 1] * arraysToCombine[i + 1].length : 1;
        }

        function getPermutation(n, arraysToCombine) {
            var result = [],
                curArray;
            for (var i = 0; i < arraysToCombine.length; i++) {
                curArray = arraysToCombine[i];
                result.push(curArray[Math.floor(n / divisors[i]) % curArray.length]);
            }
            return result;
        }

        var numPerms = arraysToCombine[0].length;
        for (var i = 1; i < arraysToCombine.length; i++) {
            numPerms *= arraysToCombine[i].length;
        }

        var combinations = [];
        for (var i = 0; i < numPerms; i++) {
            combinations.push(getPermutation(i, arraysToCombine));
        }

        //var combinationsAndVariantAttributeType = new Object();
        //combinationsAndVariantAttributeType.combinations = combinations;
        //combinationsAndVariantAttributeType.productVariantAttributeType = arraysToCombineAndVariantAttributeType[0].productVariantAttributeType;
        return combinations;
    }

    $scope.viewProductVariants = function () {
        $scope.product.productInventory = [];
        var productVariantSKUSeed = 10000;
        var productVariantAttributeArrays = [];
        var ChildHeads = [$scope.$$childHead];
        var currentScope;
        var productVariantAttributeCollectionSet = [[]];
        while (ChildHeads.length) {
            currentScope = ChildHeads.shift();
            while (currentScope) {
                if (currentScope.productVariantAttributeType !== undefined) {
                    var varriantAttributesCommaSeperated = "";
                    productVariantAttributeArrays.push({
                        ProductVariantAttributeType: currentScope.productVariantAttributeType,
                        ProductVariantAttributeTags: currentScope.productVariantAttributeTags
                    });

                    angular.forEach(currentScope.productVariantAttributeTags, function (productVariantAttributeTag, index) {
                        if (index == 0) {
                            varriantAttributesCommaSeperated = productVariantAttributeTag.text;
                        }
                        else {
                            varriantAttributesCommaSeperated = varriantAttributesCommaSeperated + ',' + productVariantAttributeTag.text;
                        }
                    });

                    $scope.productContent.productVariants.push({
                        productVariantAttributeId: currentScope.productVariantAttributeType.productVariantAttributeId,
                        variantAttributeTagName: varriantAttributesCommaSeperated
                    });
                }

                currentScope = currentScope.$$nextSibling;
            }
        }

        if (productVariantAttributeArrays.length > 0) {
            angular.forEach(productVariantAttributeArrays, function (productVariantAttributeArray, index) {
                var productVariantAttributeCollection = [];
                if (productVariantAttributeArray.ProductVariantAttributeTags.length > 0) {
                    angular.forEach(productVariantAttributeArray.ProductVariantAttributeTags, function (productVariantAttributeTag, index) {
                        productVariantAttributeCollection.push(productVariantAttributeTag.text);
                    });
                    productVariantAttributeCollectionSet.push({
                        productVariantAttributeType: productVariantAttributeArray.ProductVariantAttributeType,
                        productVariantAttributeCollection: productVariantAttributeCollection
                    });
                }
            });
            productVariantAttributeCollectionSet.splice(0, 1);
        }

        $scope.combinations = getPermutation(productVariantAttributeCollectionSet);

        angular.forEach($scope.combinations, function (productVariantNamePermutation, index) {
            var productVariantCompleteName = '';
            angular.forEach(productVariantNamePermutation, function (productVariantName, index) {
                if (index == 0) {
                    productVariantCompleteName = productVariantName;
                }
                else {
                    productVariantCompleteName = productVariantCompleteName + ' -- ' + productVariantName;
                }
            });

            $scope.product.productInventory.push(
            {
                productVariantName: productVariantCompleteName,
                productVariantSKU: productVariantSKUSeed++,
                productVariantSupplierCode: '',
                productVariantInventory: []
            });
        });

        angular.forEach($scope.product.productInventory, function (productVariant, productVariantNum) {
            angular.forEach($scope.storeOutlets, function (storeOutlet, storeOutletNum) {
                productVariant.productVariantInventory.push(
                    {
                        storeOutletId: storeOutlet.storeOutletId,
                        storeOutletCurrentInventory: 0,
                        storeOutletReorderPoint: 0,
                        storeOutletReorderAmount: 0
                    });
            });
        });
    };

    $scope.searchProducts = function () {
        var options = { successMessage: "", errorMessage: "" };
        $scope.searchCriteria = {
            nameSkuHandleSupplier: $scope.enteredNameSkuHandleSupplier,
            productTypeId: $scope.selectedProductCategoryType,
            productBrandId: $scope.selectedProductBrand,
            productSupplierId: $scope.selectedProductSupplier,
            productTags: $scope.enteredProductTags
        };

        productService.getProductsBySearch($scope.searchCriteria, options).then(
            function (data) {
                if (data.length > 0) {
                    $scope.products = data;
                    //$state.go('products.productsList');
                }
            },
            function (error) {
            });
    };


    $scope.saveProduct = function () {

        var options = { successMessage: "Product saved successfully.", errorMessage: "Error occurred in saving Product" };
        $scope.productContent.productName = $scope.product.productName;
        $scope.productContent.productHandle = $scope.product.productHandle;
        $scope.productContent.description = $scope.product.description;
        $scope.productContent.productTypeId = $scope.product.productCategoryType.productTypeId;
        $scope.productContent.productBrandId = $scope.product.productBrand.productBrandId;
        $scope.productContent.supplierId = $scope.product.productSupplier.productSupplierId;
        $scope.productContent.supplierCode = $scope.product.supplierCode;
        $scope.productContent.salesAccountCode = $scope.product.salesAccountCode;
        $scope.productContent.purchaseAccountCode = $scope.product.purchaseAccountCode;
        $scope.productContent.isProductCanBeSold = $scope.product.isProductCanBeSold;
        $scope.productContent.isProductHasVariants = $scope.product.isProductHasVariants;


        if ($scope.productContent.isProductHasVariants) {
            angular.forEach($scope.product.productInventory, function (productVariantItem, productVariantItemNum) {
                angular.forEach(productVariantItem.productVariantInventory, function (productVariantInventoryItem, productVariantInventoryNum) {
                    angular.forEach($scope.storeOutlets, function (storeOutlet, storeOutletNum) {
                        productVariantInventoryItem.storeOutletId = storeOutlet.storeOutletId;
                        productVariantInventoryItem.storeOutletCurrentInventory = storeOutlet.currentInventory[productVariantItem.productVariantName];
                        productVariantInventoryItem.storeOutletReorderPoint = storeOutlet.reorderPoint[productVariantItem.productVariantName];
                        productVariantInventoryItem.storeOutletReorderAmount = storeOutlet.reorderAmount[productVariantItem.productVariantName];
                        //$filter('filter')($scope.productContent.productInventory, { productVariantName: productVariantInventory.productVariantName })[0];
                    });
                });
            });
        }
        else {
            angular.forEach($scope.storeOutlets, function (storeOutlet, storeOutletNum) {
                $scope.product.productInventory.push(
                    {
                        productVariantName: null,
                        productVariantSKU: null,
                        productVariantSupplierCode: null,
                        storeOutletId: storeOutlet.storeOutletId,
                        storeOutletCurrentInventory: storeOutlet.currentInventory[productVariantInventory.productVariantName],
                        storeOutletReorderPoint: storeOutlet.reorderPoint[productVariantInventory.productVariantName],
                        storeOutletReorderAmount: storeOutlet.reorderAmount[productVariantInventory.productVariantName]
                    }
                );
            });
        }

        $scope.productContent.productInventory = angular.copy($scope.product.productInventory);

        $scope.productContent.productPricings.push(
            {
                pricingTierId: 1, // Retail
                supplyPrice: $scope.product.retailSupplyPrice,
                markupPercentage: $scope.product.retailMarkup,
                productPriceExcludingTax: $scope.product.retailPrice
            }
        );

        $scope.productContent.productPricings.push(
            {
                pricingTierId: 2, // Wholesale
                supplyPrice: $scope.product.wholesaleSupplyPrice,
                markupPercentage: $scope.product.wholesaleMarkup,
                productPriceExcludingTax: $scope.product.wholesalePrice
            }
        );

        $scope.productContent.productPricings.push(
            {
                pricingTierId: 3, // Distribution
                supplyPrice: $scope.product.distributionSupplyPrice,
                markupPercentage: $scope.product.distributionMarkup,
                productPriceExcludingTax: $scope.product.distributionPrice
            }
        );

        $.each($scope.product.tags, function (index, obj) {
            $scope.productContent.productTags.push({ tagName: obj.text });
        });


        $.each($scope.storeOutlets, function (index, outlet) {

            $scope.productContent.productOutletPricings.push(
                {
                    pricingTierId: 1, // Retail
                    storeOutletId: outlet.storeOutletId,
                    salestaxId: ($scope.selectedRetailSalesTax[outlet.storeOutletId] != undefined) ? $scope.selectedRetailSalesTax[outlet.storeOutletId].salesTaxId : null,
                    taxAmount: outlet.retailTaxAmount,
                    productPriceIncludingTax: outlet.retailPriceIncludingTax
                }
            );

            $scope.productContent.productOutletPricings.push(
                {
                    pricingTierId: 2, // wholesale
                    storeOutletId: outlet.storeOutletId,
                    salestaxId: ($scope.selectedWholesaleSalesTax[outlet.storeOutletId] != undefined) ? $scope.selectedWholesaleSalesTax[outlet.storeOutletId].salesTaxId : null,
                    taxAmount: outlet.wholesaleTaxAmount,
                    productPriceIncludingTax: outlet.wholesalePriceIncludingTax
                }
            );

            $scope.productContent.productOutletPricings.push(
                {
                    pricingTierId: 3, // distribution
                    storeOutletId: outlet.storeOutletId,
                    salestaxId: ($scope.selectedDistributionSalesTax[outlet.storeOutletId] != undefined) ? $scope.selectedDistributionSalesTax[outlet.storeOutletId].salesTaxId : null,
                    taxAmount: outlet.distributionTaxAmount,
                    productPriceIncludingTax: outlet.distributionPriceIncludingTax
                }
            );
        });


        if ($scope.dataProductForm.$valid) {
            // Submit as normal

            productService.postProduct($scope.productContent, options).then(
                function (data) {
                        $state.go('products.productsList');
                },
                function (error) {
                    //
                });

        } else {
            $scope.dataProductForm.submitted = true;
        }
    }

    $scope.retailSupplyPriceChange = function () {
        if ($scope.product.retailMarkup != undefined && $scope.product.retailMarkup != null)
        {
            var retailMarkupPercentageAmount = ((parseFloat($scope.product.retailSupplyPrice) * parseFloat($scope.product.retailMarkup))) / 100;
            $scope.product.retailPrice = parseFloat(0.00);
            $scope.product.retailPrice = parseFloat(retailMarkupPercentageAmount) + parseFloat($scope.product.retailSupplyPrice);
        }
        else {
            $scope.product.retailPrice = parseFloat($scope.product.retailSupplyPrice);
        }

        $.each($scope.storeOutlets, function (index, outlet) {
            if ($scope.selectedRetailSalesTax[outlet.storeOutletId] != '' && $scope.selectedRetailSalesTax[outlet.storeOutletId] != undefined)
            {
                var retailTaxAmountValue = ((parseFloat($scope.product.retailPrice) * parseFloat($scope.selectedRetailSalesTax[outlet.storeOutletId].taxRate))) / 100;
                outlet.retailTaxAmount = retailTaxAmountValue;
                outlet.retailPriceIncludingTax = parseFloat(0.00);
                outlet.retailPriceIncludingTax = parseFloat(retailTaxAmountValue) + parseFloat($scope.product.retailPrice);
            }
            else {
                var retailTaxAmountValue = parseFloat(0.00);
                outlet.retailTaxAmount = retailTaxAmountValue;
                outlet.retailPriceIncludingTax = parseFloat(0.00);
                outlet.retailPriceIncludingTax = parseFloat(retailTaxAmountValue) + parseFloat($scope.product.retailPrice);
            }
        });
         
    }

    $scope.retailPriceChange = function () {
        if (($scope.product.retailPrice != undefined && $scope.product.retailPrice != null) &&
            ($scope.product.retailSupplyPrice != undefined && $scope.product.retailSupplyPrice != null)) {
            $scope.product.retailMarkup = parseFloat(((parseFloat($scope.product.retailPrice) * 100) / parseFloat($scope.product.retailSupplyPrice)) - 100);
        }
    }

    $scope.wholesaleSupplyPriceChange = function () {
        if ($scope.product.wholesaleMarkup != undefined && $scope.product.wholesaleMarkup != null) {
            var wholesaleMarkupPercentageAmount = ((parseFloat($scope.product.wholesaleSupplyPrice) * parseFloat($scope.product.wholesaleMarkup))) / 100;
            $scope.product.wholesalePrice = parseFloat(0.00);
            $scope.product.wholesalePrice = parseFloat(wholesaleMarkupPercentageAmount) + parseFloat($scope.product.wholesaleSupplyPrice);
        }
        else {
            $scope.product.wholesalePrice = parseFloat($scope.product.wholesaleSupplyPrice);
        }

        $.each($scope.storeOutlets, function (index, outlet) {
            if ($scope.selectedWholesaleSalesTax[outlet.storeOutletId] != '' && $scope.selectedWholesaleSalesTax[outlet.storeOutletId] != undefined) {
                var wholesaleTaxAmountValue = ((parseFloat($scope.product.wholesalePrice) * parseFloat($scope.selectedWholesaleSalesTax[outlet.storeOutletId].taxRate))) / 100;
                outlet.wholesaleTaxAmount = wholesaleTaxAmountValue;
                outlet.wholesalePriceIncludingTax = parseFloat(0.00);
                outlet.wholesalePriceIncludingTax = parseFloat(wholesaleTaxAmountValue) + parseFloat($scope.product.wholesalePrice);
            }
            else {
                var wholesaleTaxAmountValue = parseFloat(0.00);
                outlet.wholesaleTaxAmount = wholesaleTaxAmountValue;
                outlet.wholesalePriceIncludingTax = parseFloat(0.00);
                outlet.wholesalePriceIncludingTax = parseFloat(wholesaleTaxAmountValue) + parseFloat($scope.product.wholesalePrice);
            }
        });

    }

    $scope.wholesalePriceChange = function () {
        if (($scope.product.wholesalePrice != undefined && $scope.product.wholesalePrice != null) &&
            ($scope.product.wholesaleSupplyPrice != undefined && $scope.product.wholesaleSupplyPrice != null)) {
            $scope.product.wholesaleMarkup = parseFloat(((parseFloat($scope.product.wholesalePrice) * 100) / parseFloat($scope.product.wholesaleSupplyPrice)) - 100);
        }
    }

    $scope.distributionSupplyPriceChange = function () {
        if ($scope.product.distributionMarkup != undefined && $scope.product.distributionMarkup != null) {
            var distributionMarkupPercentageAmount = ((parseFloat($scope.product.distributionSupplyPrice) * parseFloat($scope.product.distributionMarkup))) / 100;
            $scope.product.distributionPrice = parseFloat(0.00);
            $scope.product.distributionPrice = parseFloat(distributionMarkupPercentageAmount) + parseFloat($scope.product.distributionSupplyPrice);
        }
        else {
            $scope.product.distributionPrice = parseFloat($scope.product.distributionSupplyPrice);
        }

        $.each($scope.storeOutlets, function (index, outlet) {
            if ($scope.selectedDistributionSalesTax[outlet.storeOutletId] != '' && $scope.selectedDistributionSalesTax[outlet.storeOutletId] != undefined) {
                var distributionTaxAmountValue = ((parseFloat($scope.product.distributionPrice) * parseFloat($scope.selectedDistributionSalesTax[outlet.storeOutletId].taxRate))) / 100;
                outlet.distributionTaxAmount = distributionTaxAmountValue;
                outlet.distributionPriceIncludingTax = parseFloat(0.00);
                outlet.distributionPriceIncludingTax = parseFloat(distributionTaxAmountValue) + parseFloat($scope.product.distributionPrice);
            }
            else {
                var distributionTaxAmountValue = parseFloat(0.00);
                outlet.distributionTaxAmount = distributionTaxAmountValue;
                outlet.distributionPriceIncludingTax = parseFloat(0.00);
                outlet.distributionPriceIncludingTax = parseFloat(distributionTaxAmountValue) + parseFloat($scope.product.distributionPrice);
            }
        });

    }

    $scope.distributionPriceChange = function () {
        if (($scope.product.distributionPrice != undefined && $scope.product.distributionPrice != null) &&
            ($scope.product.distributionSupplyPrice != undefined && $scope.product.distributionSupplyPrice != null)) {
            $scope.product.distributionMarkup = parseFloat(((parseFloat($scope.product.distributionPrice) * 100) / parseFloat($scope.product.distributionSupplyPrice)) - 100);
        }
    }

    var productVariantAttributeType = function (id) {
        return $filter('filter')($rootScope.productVariantAttributeTypes, {
            contactId: id
        })[0].contactType;
    };

    $scope.onChangeIsProductHasVariants = function () {
        if ($scope.product.isProductHasVariants) {
            $scope.addNewVariantAttribute();
        }
    };

    function getAllMasterDataForCreateOrEditProduct() {
        productService.getAllMasterDataForCreateOrEditProduct().then(
            function (data) {
                if (data) {
                    $scope.productTags = data.productTags;
                    $scope.productTypes = data.productTypes;
                    $scope.productBrands = data.productBrands;
                    $scope.productSuppliers = data.productSuppliers;
                    $scope.storeOutlets = data.storeOutlets;
                    $scope.productVariantAttributes = data.productVariantAttributes;
                    $rootScope.productVariantAttributeTypes = $scope.productVariantAttributes;
                    $scope.salesTaxes = data.salesTaxes;
                    angular.forEach($scope.productTags, function (tag, index) {
                        $scope.productTagsWithText[index] = { "text": tag.tagName };
                    });
                }
            });

        
    };

    $scope.loadProductTags = function (query) {
        return $scope.productTagsWithText;
    };

    function getAllProducts() {
        productService.getAllProducts().then(
            function (data) {
                if (data) {
                    $scope.products = data;
                }
            });
    };


};
