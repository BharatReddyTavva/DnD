using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DnD.Model.ViewModel
{
    public class StoreOutletInventoryViewModel
    {
        public int ProductVariantId { get; set; }
        public int StoreOutletId { get; set; }
        public int? StoreOutletCurrentInventory { get; set; }
        public decimal? ProductVariantSupplyPrice { get; set; }
    }
}
