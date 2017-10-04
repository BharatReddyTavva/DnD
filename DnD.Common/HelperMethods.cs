using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DnD.Common
{

    /// <summary>
    /// Base provider for all the common methods for the application
    /// </summary>
    public class HelperMethods
    {
        public static string GetConnectionString(string elevateConnectionStringKey)
        {
            throw new NotImplementedException();
        }

        public static string ConfigurationValue(string key)
        {
            if (ConfigurationManager.AppSettings[key] != null)
            {
                return ConfigurationManager.AppSettings[key];
            }
            else
            {
                return string.Empty;
            }
        }

        

        /// <summary>
        /// Method that converts data Record value to desired datatype
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="dataReader"></param>
        /// <param name="columnName"></param>
        /// <returns></returns>
        public static T GetDataValue<T>(IDataReader dataReader, string columnName)
        {
            int ordinal = dataReader.GetOrdinal(columnName);

            if (!dataReader.IsDBNull(ordinal))
                return (T)dataReader.GetValue(ordinal);
            else
                return default(T);
        }
    }
}
