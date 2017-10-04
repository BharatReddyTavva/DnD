using DnD.Model.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DnD.Model.ViewModel
{
    public class AddEditProductMasterViewModel
    {
        public List<ProductTag> ProductTags { get; set; }
        public List<ProductType> ProductTypes { get; set; }
        public List<ProductBrand> ProductBrands { get; set; }
        public List<ProductSupplier> ProductSuppliers { get; set; }
        public List<StoreOutlet> StoreOutlets { get; set; }
        public List<ProductVariantAttribute> ProductVariantAttributes { get; set; }
        public List<SalesTax> SalesTaxes { get; set; }
    }
}
