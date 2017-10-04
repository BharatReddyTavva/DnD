using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DnD.Model.Entity
{
    public class ProductVariantInventory
    {
        public int ProductVariantInventoryId { get; set; }
        public Nullable<int> StoreOutletId { get; set; }
        public Nullable<int> StoreOutletCurrentInventory { get; set; }
        public Nullable<int> StoreOutletReorderPoint { get; set; }
        public Nullable<int> StoreOutletReorderAmount { get; set; }
        public bool IsActive { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
    }
}
