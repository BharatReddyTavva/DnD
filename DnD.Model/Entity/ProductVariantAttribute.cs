//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DnD.Model.Entity
{
    using System;
    using System.Collections.Generic;

    public partial class ProductVariantAttribute
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ProductVariantAttribute()
        {
        }

        public int ProductVariantAttributeId { get; set; }
        public int ProductId { get; set; }
        public int ProductVariantAttributeMasterId { get; set; }
        public string VariantAttributeTagName { get; set; }
        public bool IsActive { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
        public int StoreId { get; set; }

    }
}
