
namespace DnD.Model.Entity
{
    using System;
    using System.Collections.Generic;

    public partial class ProductVariant
    {
        public int ProductVariantId { get; set; }
        public int ProductId { get; set; }
        public string ProductVariantName { get; set; }
        public bool IsActive { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
    }
}
