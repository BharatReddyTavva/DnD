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
    
    public partial class StoreOutletRegister
    {
        public int StoreOutletRegisterId { get; set; }
        public int StoreOutletId { get; set; }
        public string RegisterName { get; set; }
        public Nullable<int> CashManagementId { get; set; }
        public Nullable<int> ReceiptTemplateId { get; set; }
        public string ReceiptNumber { get; set; }
        public string ReceiptPrefix { get; set; }
        public string ReceiptSufix { get; set; }
        public Nullable<bool> IsSelectUserForNextSaleAtEndOfSale { get; set; }
        public Nullable<bool> DoEmailReceipt { get; set; }
        public string DoPrintReceipt { get; set; }
        public Nullable<int> AskForNoteId { get; set; }
        public Nullable<bool> DoPrintNoteOnReceipt { get; set; }
        public Nullable<bool> DoShowDiscountsOnReceipts { get; set; }
        public bool IsActive { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
    
        public virtual SetupRegistersAskForNote SetupRegistersAskForNote { get; set; }
        public virtual SetupRegistersCashManagement SetupRegistersCashManagement { get; set; }
        public virtual SetupRegistersReceiptTemplate SetupRegistersReceiptTemplate { get; set; }
        public virtual StoreOutlet StoreOutlet { get; set; }
    }
}
