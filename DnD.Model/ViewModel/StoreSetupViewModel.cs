using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DnD.Model.ViewModel
{
    public class StoreSetupViewModel
    {

        public string StoreName { get; set; }

        public string StoreURL { get; set; }

        public int? DefaultCurrencyId { get; set; }

        public int? TimeZoneId { get; set; }

        public int? DisplayPricesId { get; set; }

        public int? LabelPrinterFormatId { get; set; }

        public int? SKUGenerationId { get; set; }

        public string CurrentSequenceNumber { get; set; }

        public int? UserSwitchingSecurityId { get; set; }

        public bool? IsDiscountAllowedOnReceipt { get; set; }

        public bool? IsOutOfStockEmailNotificationAllowed { get; set; }

        public bool? IsTipsOrSurchargeAllowed { get; set; }

        public bool? IsLaybyAllowed { get; set; }

        public bool? IsOnAccountSaleAllowed { get; set; }

        public string ContactFirstName { get; set; }

        public string ContactLastName { get; set; }

        public string Email { get; set; }

        public string PhoneNumber { get; set; }

        public string Website { get; set; }

        public string TwitterHandle { get; set; }

        public string FaceBook { get; set; }

        public string LinkedIn { get; set; }

        public string PhysicalAddressStreet1 { get; set; }

        public string PhysicalAddressStreet2 { get; set; }

        public string PhysicalSuburb { get; set; }

        public string PhysicalCity { get; set; }

        public string PhysicalPostcode { get; set; }

        public string PhysicalState { get; set; }

        public int? PhysicalCountryId { get; set; }

        public bool? IsPostalAddressSameAsPhysicalAddress { get; set; }

        public string PostalAddressStreet1 { get; set; }

        public string PostalAddressStreet2 { get; set; }

        public string PostalSuburb { get; set; }

        public string PostalCity { get; set; }

        public string PostalPostCode { get; set; }

        public string PostalState { get; set; }

        public int? PostalCountryId { get; set; }

        public int? CreatedBy { get; set; }

        public DateTime? CreatedOn { get; set; }

        public int? UpdatedBy { get; set; }

        public DateTime? UpdatedOn { get; set; }

    }
}
