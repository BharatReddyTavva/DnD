namespace DnD.Model.Entity
{
    using System;
    using System.Collections.Generic;

    public partial class DiscountOfferStoreOutlet
    {
        public int DiscountOfferStoreOutletId { get; set; }
        public int DiscountOfferId { get; set; }
        public int StoreOutletId { get; set; }

        public virtual DiscountOffer DiscountOffer { get; set; }
        public virtual StoreOutlet StoreOutlet { get; set; }
    }
}
