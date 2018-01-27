using DnD.Model.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DnD.Model.ViewModel
{
    public class StoreSetupMasterDataViewModel
    {
        public List<UserSwitchingSecurityType> UserSwitchingSecurityType { get; set; }
        public List<DisplayPrice> DisplayPrice { get; set; }
        public List<Entity.TimeZone> TimeZone { get; set; }
        public List<SKUGenerationType> SKUGenerationType { get; set; }
        public List<Country> Country { get; set; }
        public List<Currency> Currency { get; set; }
    }
}
