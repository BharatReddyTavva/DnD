namespace DnD.Model.Entity
{
    using System;
    using System.Collections.Generic;

    public partial class DiscountTypeData
    {
        public int DiscountTypeDataId { get; set; }
        public int DiscountOfferId { get; set; }
        public int DiscountTypeId { get; set; }
        public int DiscountOfferTypeId { get; set; }
        public int ItemId { get; set; }
    }
}
