using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DnD.Model.ViewModel
{
    public class ProductListViewModel
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string ProductBrandName { get; set; }
        public string SupplierName { get; set; }

        public bool IsActive { get; set; }
        public int StoreId { get; set; }
        public int CreatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedOn { get; set; }
        public Nullable<int> UpdatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
    }
}
