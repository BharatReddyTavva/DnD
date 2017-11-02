
namespace DnD.Model.Entity
{
    using System;
    using System.Collections.Generic;

    public partial class DiscountOffer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DiscountOffer()
        {
            this.DiscountOfferCustomers = new HashSet<DiscountOfferCustomer>();
            this.DiscountOfferStoreOutlets = new HashSet<DiscountOfferStoreOutlet>();
        }

        public int DiscountOfferId { get; set; }
        public string OfferName { get; set; }
        public string OfferDisplayText { get; set; }
        public Nullable<int> DiscountTypeId { get; set; }
        public Nullable<int> DiscountOfferTypeId { get; set; }
        public Nullable<decimal> DiscountPercentOff { get; set; }
        public Nullable<int> BuyUnitsToGetUnits { get; set; }
        public Nullable<int> GetUnitsWhenBoughtUnits { get; set; }
        public Nullable<decimal> BuyUnitsToGetPercentOff { get; set; }
        public Nullable<System.DateTime> OfferValidFrom { get; set; }
        public Nullable<System.DateTime> OfferValidTo { get; set; }

        public virtual DiscountOfferType DiscountOfferType { get; set; }
        public virtual DiscountType DiscountType { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DiscountOfferCustomer> DiscountOfferCustomers { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DiscountOfferStoreOutlet> DiscountOfferStoreOutlets { get; set; }
    }
}
