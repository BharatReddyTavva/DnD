
namespace DnD.Model.Entity
{
    using System;
    using System.Collections.Generic;

    public partial class ProductVariant
    {
        public int ProductVariantId { get; set; }
        public int ProductId { get; set; }
        public int ProductVariantAttributeId { get; set; }
        public string VariantAttributeTagName { get; set; }
    }
}
