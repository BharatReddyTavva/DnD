using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DnD.Model.Entity
{
    using System;
    using System.Collections.Generic;

    public partial class ProductOutletPricing
    {
        public Nullable<int> ProductOutletPricingId { get; set; }
        public Nullable<int> ProductId { get; set; }
        public Nullable<int> PricingTierId { get; set; }
        public Nullable<int> StoreOutletId { get; set; }
        public Nullable<int> SalestaxId { get; set; }
        public Nullable<decimal> TaxAmount { get; set; }
        public Nullable<decimal> ProductPriceIncludingTax { get; set; }
        public bool IsActive { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
    }
}
