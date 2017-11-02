using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DnD.Model.Entity
{

    using System;
    using System.Collections.Generic;

    public partial class ProductInventory
    {
        public int ProductInventoryId { get; set; }
        public int ProductId { get; set; }
        public string ProductVariantId { get; set; }
        public string ProductVariantName { get; set; }
        public string ProductVariantSKU { get; set; }
        public string ProductVariantSupplierCode { get; set; }
        public decimal? ProductVariantSupplyPrice { get; set; }
        public decimal? ProductVariantMarkup { get; set; }
        public decimal? ProductVariantRetailPrice { get; set; }
        public bool IsActive { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public virtual ICollection<ProductVariantInventory> ProductVariantInventory { get; set; }
    }
}
