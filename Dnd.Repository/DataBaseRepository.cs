using DnD.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace DnD.Repository
{
    public class DataBaseRepository
    {
        public Database db = null;
        public Database dbReporting = null;

        /// <summary>
        /// Constructor to create default connection
        /// </summary>
        public DataBaseRepository()
        {
            db = new DatabaseProviderFactory().Create(Constants.DealnDoneConnectionStringKey);
        }

        /// <summary>
        /// returns a named parameter object for the command
        /// </summary>
        /// <param name="parameterName"></param>
        /// <param name="dbType"></param>
        /// <param name="parameterValue"></param>
        /// <returns></returns>
        public DbParameter CreateParameter(DbCommand command, string parameterName, object parameterValue, DbType dbType)
        {
            DbParameter param = command.CreateParameter();
            param.DbType = dbType;
            param.ParameterName = parameterName;
            param.Value = parameterValue;
            return param;
        }

        public DbParameter CreateCustomParameter(DbCommand command, string parameterName,
            object parameterValue, SqlDbType dbType, string typeName)
        {
            SqlParameter param = (SqlParameter)command.CreateParameter();
            param.SqlDbType = dbType;
            param.ParameterName = parameterName;
            param.TypeName = typeName;
            param.Value = parameterValue;
            return param;
        }
    }
}
