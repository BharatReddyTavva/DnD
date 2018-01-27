using DnD.Model.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DnD.Model.ViewModel
{
    public class AddEditCustomerMasterViewModel
    {
        public List<CustomerGroupMaster> CustomerGroup { get; set; }
        public List<Country> Country { get; set; }
    }
}
