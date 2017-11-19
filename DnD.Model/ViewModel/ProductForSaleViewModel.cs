
namespace DnD.Model.ViewModel
{
    using DnD.Model.Entity;
    using System;
    using System.Collections.Generic;

    public partial class ProductForSaleViewModel
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public int ProductTypeId { get; set; }
        public string ProductTypeName { get; set; }
        public bool IsProductHasVariants { get; set; }
        public bool IsActive { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int CurrentInventory { get; set; }
        public Nullable<decimal> Price { get; set; }
        public int StoreOutletId { get; set; }
        public int Quantity { get; set; }
        public Nullable<decimal> DiscountPercent { get; set; }
        public string ProductNotes { get; set; }
        public byte[] ProductImage { get; set; }
    }
}
