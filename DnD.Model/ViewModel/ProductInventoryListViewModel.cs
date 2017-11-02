using DnD.Model.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DnD.Model.ViewModel
{
    public class ProductInventoryListViewModel
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public bool IsProductHasVariants { get; set; }
        public int ProductVariantId { get; set; }
        public string ProductVariantName { get; set; }
        public string ProductSKU { get; set; }
        public bool IsActive { get; set; }
        public List<StoreOutletInventoryViewModel> StoreOutletsInventory { get; set; }
        
    }
}
