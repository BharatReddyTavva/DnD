namespace DnD.Model.Entity
{
    using System;
    using System.Collections.Generic;

    public partial class DiscountOfferType
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DiscountOfferType()
        {
            this.DiscountOffers = new HashSet<DiscountOffer>();
        }

        public int DiscountOfferTypeId { get; set; }
        public string DiscountOfferTypeName { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DiscountOffer> DiscountOffers { get; set; }
    }
}
