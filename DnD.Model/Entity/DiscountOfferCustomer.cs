namespace DnD.Model.Entity
{
    using System;
    using System.Collections.Generic;

    public partial class DiscountOfferCustomer
    {
        public int DiscountOfferCustomerId { get; set; }
        public int DiscountOfferId { get; set; }
        public int CustomerGroupId { get; set; }

        public virtual CustomerGroup CustomerGroup { get; set; }
        public virtual DiscountOffer DiscountOffer { get; set; }
    }
}
