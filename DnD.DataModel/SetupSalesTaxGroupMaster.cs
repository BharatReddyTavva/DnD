//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DnD.DataModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class SetupSalesTaxGroupMaster
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SetupSalesTaxGroupMaster()
        {
            this.SetupSalesTaxGroupIds = new HashSet<SetupSalesTaxGroupId>();
        }
    
        public int SetupSalesTaxGroupMasterId { get; set; }
        public int StoreId { get; set; }
        public string TaxGroupName { get; set; }
        public bool IsActive { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SetupSalesTaxGroupId> SetupSalesTaxGroupIds { get; set; }
    }
}