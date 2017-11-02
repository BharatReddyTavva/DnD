using DnD.Model.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DnD.Model.ViewModel
{
    public class AddEditDiscountOfferMasterViewModel
    {
        public List<DiscountType> DiscountTypes { get; set; }
        public List<DiscountOfferType> DiscountOfferTypes { get; set; }
        public List<Product> Products { get; set; }
        public List<ProductTagMaster> ProductTags { get; set; }
        public List<ProductType> ProductTypes { get; set; }
        public List<ProductBrand> ProductBrands { get; set; }
        public List<StoreOutlet> StoreOutlets { get; set; }
        public List<CustomerGroupMaster> CustomerGroups { get; set; }
    }
}
