using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace VeterinariaDL
{
    public class ConnectionVeterinaria
    {        
        public SqlConnection GetConnection()
        {
            SqlConnection SqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlConnection"].ConnectionString);
            return SqlConnection;
        }
    }
}
