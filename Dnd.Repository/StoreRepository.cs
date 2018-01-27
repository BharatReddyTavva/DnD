using DnD.Repository.Providers;
using DnD.Model.Entity;
using DnD.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DnD.Model.ViewModel;
using System.Xml.Linq;
using Microsoft.SqlServer.Server;
using System.Data.SqlClient;

namespace DnD.Repository
{
    public class StoreRepository: IStoreRepository
    {
        /// <summary>
        /// private properties
        /// </summary>
        DataBaseRepository _dataBaseRepository;

        /// <summary>
        /// Initialise the Database repository object
        /// </summary>
        /// <param name="dbRespository"></param>
        public StoreRepository(DataBaseRepository dataBaseRepository)
        {
            _dataBaseRepository = dataBaseRepository;
        }


        #region Store Setup

        public StoreSetupMasterDataViewModel GetAllMasterDataForStore()
        {
            StoreSetupMasterDataViewModel storeSetupMasterDataViewModel = new StoreSetupMasterDataViewModel();
            List<Country> countryList = new List<Country>();
            List<Model.Entity.TimeZone> timeZoneList = new List<Model.Entity.TimeZone>();
            List<DisplayPrice> priceList = new List<Model.Entity.DisplayPrice>();
            List<UserSwitchingSecurityType> usstList = new List<Model.Entity.UserSwitchingSecurityType>();
            List<Currency> currencyList = new List<Model.Entity.Currency>();
            List<SKUGenerationType> skuList = new List<Model.Entity.SKUGenerationType>();

            using (var command = _dataBaseRepository.db.GetStoredProcCommand(Constants.UspGetAllMasterDataForStore))
            {
                using (var dataReader = _dataBaseRepository.db.ExecuteReader(command))
                {
                    // Get country
                    while (dataReader.Read())
                    {
                        Country country = new Country
                        {
                            CountryId = HelperMethods.GetDataValue<int>(dataReader, "CountryId"),
                            Name = HelperMethods.GetDataValue<string>(dataReader, "CountryName")
                        };
                        countryList.Add(country);
                    }
                    //Get Time Zone
                    if (dataReader.NextResult())
                    {
                        while (dataReader.Read())
                        {
                            Model.Entity.TimeZone timeZone = new Model.Entity.TimeZone
                            {
                                TimeZoneId = HelperMethods.GetDataValue<int>(dataReader, "TimeZoneId"),
                                DsiplayName = HelperMethods.GetDataValue<string>(dataReader, "DsiplayName"),
                                StandardName = HelperMethods.GetDataValue<string>(dataReader, "StandardName")
                            };
                            timeZoneList.Add(timeZone);
                        }
                    }
                    // GET Price
                    if (dataReader.NextResult())
                    {
                        while (dataReader.Read())
                        {
                            Model.Entity.DisplayPrice price = new Model.Entity.DisplayPrice
                            {
                                DisplayPriceId = HelperMethods.GetDataValue<int>(dataReader, "DisplayPriceId"),
                                DisplayPriceName = HelperMethods.GetDataValue<string>(dataReader, "DisplayPriceName")
                            };
                            priceList.Add(price);
                        }
                    }

                    // GET UserSwitchingSecurityType
                    if (dataReader.NextResult())
                    {
                        while (dataReader.Read())
                        {
                            Model.Entity.UserSwitchingSecurityType usst = new Model.Entity.UserSwitchingSecurityType
                            {
                                UserSwitchingSecurityTypeId = HelperMethods.GetDataValue<int>(dataReader, "UserSwitchingSecurityTypeId"),
                                UserSwitchingSecurityTypeName = HelperMethods.GetDataValue<string>(dataReader, "UserSwitchingSecurityTypeName")
                            };
                            usstList.Add(usst);
                        }
                    }

                    // GET UserSwitchingSecurityType
                    if (dataReader.NextResult())
                    {
                        while (dataReader.Read())
                        {
                            Model.Entity.SKUGenerationType sku = new Model.Entity.SKUGenerationType
                            {
                                SKUGenerationTypeId = HelperMethods.GetDataValue<int>(dataReader, "SKUGenerationTypeId"),
                                SKUGenerationName = HelperMethods.GetDataValue<string>(dataReader, "SKUGenerationName")
                            };
                            skuList.Add(sku);
                        }
                    }

                    // GET Currency
                    if (dataReader.NextResult())
                    {
                        while (dataReader.Read())
                        {
                            Model.Entity.Currency currency = new Model.Entity.Currency
                            {
                                CurrencyId = HelperMethods.GetDataValue<int>(dataReader, "CurrencyId"),
                                CurrencyName = HelperMethods.GetDataValue<string>(dataReader, "CurrencyName"),
                                CurrencySymbol = HelperMethods.GetDataValue<string>(dataReader, "CurrencySymbol")
                            };
                            currencyList.Add(currency);
                        }
                    }

                }
            }

            storeSetupMasterDataViewModel.Country = countryList;
            storeSetupMasterDataViewModel.TimeZone = timeZoneList;
            storeSetupMasterDataViewModel.DisplayPrice = priceList;
            storeSetupMasterDataViewModel.UserSwitchingSecurityType = usstList;
            storeSetupMasterDataViewModel.Currency = currencyList;
            storeSetupMasterDataViewModel.SKUGenerationType = skuList;

            return storeSetupMasterDataViewModel;
        }


        public int CreateStoreSetup(StoreSetupViewModel storeSetupViewModel)
        {

            using (var command = _dataBaseRepository.db.GetStoredProcCommand(DnD.Common.Constants.UspCreateStoreSetup))
            {

                SqlParameter sqlparam = new SqlParameter();
                sqlparam = AddStructureParamStore(storeSetupViewModel);
                command.Parameters.Add(sqlparam);
                var customerId = Convert.ToInt32(_dataBaseRepository.db.ExecuteScalar(command));
                return customerId;

            }
        }


        private SqlParameter AddStructureParamStore(StoreSetupViewModel storeSetup)
        {
            var param = new SqlParameter(DnD.Common.Constants.UDTStoreSetup, SqlDbType.Structured)
            {
                Direction = ParameterDirection.Input,
                TypeName = DnD.Common.Constants.UDTStoreSetup,
                Value = BuildStoreSetupData(storeSetup)
            };
            return param;
        }

        private static IEnumerable<SqlDataRecord> BuildStoreSetupData(StoreSetupViewModel storeSetup)
        {
            List<SqlDataRecord> records = new List<SqlDataRecord>();
            SqlDataRecord record = StoreSqlDataRecord();
            if (!string.IsNullOrEmpty(storeSetup.StoreName))
                record.SetString(0, storeSetup.StoreName);
            if (!string.IsNullOrEmpty(storeSetup.StoreURL))
                record.SetString(1, storeSetup.StoreURL);
            if (storeSetup.DefaultCurrencyId.HasValue)
                record.SetInt32(2, (int)storeSetup.DefaultCurrencyId.Value);
            if (storeSetup.TimeZoneId.HasValue)
                record.SetInt32(3, (int)storeSetup.TimeZoneId.Value);
            if (storeSetup.DisplayPricesId.HasValue)
                record.SetInt32(4, (int)storeSetup.DisplayPricesId.Value);
            if (storeSetup.SKUGenerationId.HasValue)
                record.SetInt32(5, (int)storeSetup.SKUGenerationId.Value);
            if (!string.IsNullOrEmpty(storeSetup.CurrentSequenceNumber))
                record.SetString(6, storeSetup.CurrentSequenceNumber);
            if (storeSetup.UserSwitchingSecurityId.HasValue)
                record.SetInt32(7, (int)storeSetup.UserSwitchingSecurityId.Value);
            if (storeSetup.IsDiscountAllowedOnReceipt.HasValue)
                record.SetBoolean(8, (bool)storeSetup.IsDiscountAllowedOnReceipt.Value);
            if (storeSetup.IsOutOfStockEmailNotificationAllowed.HasValue)
                record.SetBoolean(9, (bool)storeSetup.IsOutOfStockEmailNotificationAllowed.Value);
            if (storeSetup.IsTipsOrSurchargeAllowed.HasValue)
                record.SetBoolean(10, (bool)storeSetup.IsTipsOrSurchargeAllowed.Value);
            if (storeSetup.IsLaybyAllowed.HasValue)
                record.SetBoolean(11, (bool)storeSetup.IsLaybyAllowed.Value);
            if (storeSetup.IsOnAccountSaleAllowed.HasValue)
                record.SetBoolean(12, (bool)storeSetup.IsOnAccountSaleAllowed.Value);
            if (!string.IsNullOrEmpty(storeSetup.ContactFirstName))
                record.SetString(13, storeSetup.ContactFirstName);
            if (!string.IsNullOrEmpty(storeSetup.ContactLastName))
                record.SetString(14, storeSetup.ContactLastName);
            if (!string.IsNullOrEmpty(storeSetup.Email))
                record.SetString(15, storeSetup.Email);
            if (!string.IsNullOrEmpty(storeSetup.PhoneNumber))
                record.SetString(16, storeSetup.PhoneNumber);
            if (!string.IsNullOrEmpty(storeSetup.Website))
                record.SetString(17, storeSetup.Website);
            if (!string.IsNullOrEmpty(storeSetup.TwitterHandle))
                record.SetString(18, storeSetup.TwitterHandle);
            if (!string.IsNullOrEmpty(storeSetup.FaceBook))
                record.SetString(19, storeSetup.FaceBook);
            if (!string.IsNullOrEmpty(storeSetup.LinkedIn))
                record.SetString(20, storeSetup.LinkedIn);
            if (!string.IsNullOrEmpty(storeSetup.PhysicalAddressStreet1))
                record.SetString(21, storeSetup.PhysicalAddressStreet1);
            if (!string.IsNullOrEmpty(storeSetup.PhysicalAddressStreet2))
                record.SetString(22, storeSetup.PhysicalAddressStreet2);
            if (!string.IsNullOrEmpty(storeSetup.PhysicalSuburb))
                record.SetString(23, storeSetup.PhysicalSuburb);
            if (!string.IsNullOrEmpty(storeSetup.PhysicalCity))
                record.SetString(24, storeSetup.PhysicalCity);
            if (!string.IsNullOrEmpty(storeSetup.PhysicalPostcode))
                record.SetString(25, storeSetup.PhysicalPostcode);
            if (!string.IsNullOrEmpty(storeSetup.PhysicalState))
                record.SetString(26, storeSetup.PhysicalState);
            if (storeSetup.PhysicalCountryId.HasValue)
                record.SetInt32(27, (int)storeSetup.PhysicalCountryId.Value);
            if (storeSetup.IsPostalAddressSameAsPhysicalAddress.HasValue)
                record.SetBoolean(28, (bool)storeSetup.IsPostalAddressSameAsPhysicalAddress.Value);
            if (!string.IsNullOrEmpty(storeSetup.PostalAddressStreet1))
                record.SetString(29, storeSetup.PostalAddressStreet1);
            if (!string.IsNullOrEmpty(storeSetup.PostalAddressStreet2))
                record.SetString(30, storeSetup.PostalAddressStreet2);
            if (!string.IsNullOrEmpty(storeSetup.PostalSuburb))
                record.SetString(31, storeSetup.PostalSuburb);
            if (!string.IsNullOrEmpty(storeSetup.PostalCity))
                record.SetString(32, storeSetup.PostalCity);
            if (!string.IsNullOrEmpty(storeSetup.PostalPostCode))
                record.SetString(33, storeSetup.PostalPostCode);
            if (!string.IsNullOrEmpty(storeSetup.PostalState))
                record.SetString(34, storeSetup.PostalState);
            if (storeSetup.PostalCountryId.HasValue)
                record.SetInt32(35, storeSetup.PostalCountryId.Value);
            //if (storeSetup.CreatedBy.HasValue)
                record.SetInt32(36, 1);//storeSetup.CreatedBy.Value
           // if (storeSetup.CreatedOn != null)
                record.SetString(37, DateTime.Now.ToString());//storeSetup.CreatedOn.ToString()
            //if (storeSetup.UpdatedBy.HasValue)
                record.SetInt32(38, 1);//storeSetup.UpdatedBy.Value
           // if (storeSetup.UpdatedOn != null)
                record.SetString(39, DateTime.Now.ToString());
            records.Add(record);
            return records;
        }

        private static SqlDataRecord StoreSqlDataRecord()
        {
            SqlDataRecord record = new SqlDataRecord(

                  new SqlMetaData[] {
                  new SqlMetaData("StoreName", SqlDbType.NVarChar, 100),
                  new SqlMetaData("StoreURL", SqlDbType.NVarChar, 100),
                  new SqlMetaData("DefaultCurrencyId", SqlDbType.Int),
                  new SqlMetaData("TimeZoneId", SqlDbType.Int),
                  new SqlMetaData("DisplayPricesId", SqlDbType.Int),
                  new SqlMetaData("SKUGenerationId", SqlDbType.Int),
                  new SqlMetaData("CurrentSequenceNumber", SqlDbType.NVarChar, 100),
                  new SqlMetaData("UserSwitchingSecurityId", SqlDbType.Int),
                  new SqlMetaData("IsDiscountAllowedOnReceipt", SqlDbType.Bit),
                  new SqlMetaData("IsOutOfStockEmailNotificationAllowed", SqlDbType.Bit),
                  new SqlMetaData("IsTipsOrSurchargeAllowed", SqlDbType.Bit),
                  new SqlMetaData("IsLaybyAllowed", SqlDbType.Bit),
                  new SqlMetaData("IsOnAccountSaleAllowed", SqlDbType.Bit),
                  new SqlMetaData("ContactFirstName", SqlDbType.NVarChar, 100),
                  new SqlMetaData("ContactLastName", SqlDbType.NVarChar, 100),
                  new SqlMetaData("Email", SqlDbType.NVarChar, 50),
                  new SqlMetaData("PhoneNumber", SqlDbType.NVarChar, 20),
                  new SqlMetaData("Website", SqlDbType.NVarChar, 50),
                  new SqlMetaData("TwitterHandle", SqlDbType.NVarChar, 50),
                  new SqlMetaData("FaceBook", SqlDbType.NVarChar, 50),
                  new SqlMetaData("LinkedIn", SqlDbType.NVarChar, 50),
                  new SqlMetaData("PhysicalAddressStreet1", SqlDbType.NVarChar, 200),
                  new SqlMetaData("PhysicalAddressStreet2", SqlDbType.NVarChar, 200),
                  new SqlMetaData("PhysicalSuburb", SqlDbType.NVarChar, 50),
                  new SqlMetaData("PhysicalCity", SqlDbType.NVarChar, 50),
                  new SqlMetaData("PhysicalPostcode", SqlDbType.NVarChar, 20),
                  new SqlMetaData("PhysicalState", SqlDbType.NVarChar, 50),
                  new SqlMetaData("PhysicalCountryId", SqlDbType.Int),
                  new SqlMetaData("IsPostalAddSameAsPhysicalAdd", SqlDbType.Bit),
                  new SqlMetaData("PostalAddressStree1", SqlDbType.NVarChar, 200),
                  new SqlMetaData("PostalAddressStreet2", SqlDbType.NVarChar, 200),
                  new SqlMetaData("PostalSuburb", SqlDbType.NVarChar, 50),
                  new SqlMetaData("PostalCity", SqlDbType.NVarChar, 50),
                  new SqlMetaData("PostalPostCode", SqlDbType.NVarChar, 20),
                  new SqlMetaData("PostalState", SqlDbType.NVarChar, 50),
                  new SqlMetaData("PostalCountryId", SqlDbType.Int),
                  new SqlMetaData("CreatedBy", SqlDbType.Int),
                  new SqlMetaData("CreatedOn", SqlDbType.NVarChar, 100),
                  new SqlMetaData("UpdatedBy", SqlDbType.Int),
                  new SqlMetaData("UpdatedOn", SqlDbType.NVarChar, 100)

                                });
            return record;

        }

        #endregion


    }
}
