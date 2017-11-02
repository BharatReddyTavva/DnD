using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DnD.Model.Entity
{
    public class ProductVariantAttributeMaster
    {
        public int ProductVariantAttributeMasterId { get; set; }
        public string VariantAttributeName { get; set; }
        public bool IsActive { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public int UpdatedBy { get; set; }
        public System.DateTime UpdatedOn { get; set; }
    }
}
