using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace DnD.Web.App_Start
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.IgnoreList.Clear();
            bundles.FileExtensionReplacementList.Clear();

            bundles.Add(new ScriptBundle("~/bundles/vendors").Include(
                        "~/Scripts/jquery-3.1.1.min.js",
                        "~/Scripts/plugins/jquery-ui/jquery-ui.min.js",
                        "~/Scripts/bootstrap.min.js",
                        "~/Scripts/plugins/metisMenu/jquery.metisMenu.js",
                        "~/Scripts/plugins/slimscroll/jquery.slimscroll.js",
                        "~/App/inspinia.js",
                        "~/Scripts/plugins/pace/pace.min.js",
                        "~/Scripts/angular.js",
                        "~/Scripts/angular-sanitize.js",
                        "~/Scripts/plugins/ocLazyLoad/ocLazyLoad.js",
                        "~/Scripts/angular-translate.min.js",
                        "~/Scripts/angular-ui-router.js",
                        "~/Scripts/angular-ui/ui-bootstrap-tpls-1.1.2.min.js",
                        "~/Scripts/plugins/angular-idle/angular-idle.js",
                        "~/Scripts/plugins/dropzone/dropzone.js",
                        "~/Scripts/plugins/dropzone/ng-dropzone.min.js"
            ));

            bundles.Add(new ScriptBundle("~/bundles/app")
                    .Include(
                        "~/app/app.js",
                        "~/app/config.js",
                        "~/app/translations.js",
                        "~/app/directives.js",
                        "~/app/controllers/productBrands.controller.js",
                        "~/app/controllers/productTags.controller.js",
                        "~/app/controllers/productSuppliers.controller.js",
                        "~/app/controllers/productTypes.controller.js",
                        "~/app/controllers/products.controller.js",
                        "~/app/controllers.js",
                        "~/app/datacontext.service.js",
                        "~/app/logger.service.js",
                        "~/app/services/products.service.js"
                    ));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/font-awesome.css",
                      "~/Content/plugins/toastr/toastr.min.css",
                      "~/Content/animate.css",
                      "~/Content/plugins/dropzone/basic.css",
                      "~/Content/plugins/dropzone/dropzone.css",
                      "~/Content/plugins/dropzone/ng-dropzone.min.css"));
#if DEBUG
            BundleTable.EnableOptimizations = false;
#endif
        }
    }
}