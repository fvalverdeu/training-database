using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using VeterinariaEL;

namespace VeterinariaDL
{
    public class EspecieDL
    {
        ConnectionVeterinaria connection = new ConnectionVeterinaria();

        public List<EspecieEL> ListarEspecies(EspecieEL especieEL)
        {
            List<EspecieEL> lista = new List<EspecieEL>();
            using (var conn = connection.GetConnection())
            {
                conn.Open();
                try
                {
                    using (var command = new SqlCommand("USP_Especie_CRUD", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add(new SqlParameter("@Operacion", 'R'));
                        command.Parameters.Add(new SqlParameter("@EspecieId", especieEL.EspecieId));
                        command.Parameters.Add(new SqlParameter("@Descripcion", especieEL.Descripcion));

                        using (var reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                EspecieEL especie = new EspecieEL();
                                especie.EspecieId = (int)reader["EspecieId"];
                                especie.Descripcion = reader["Descripcion"].ToString();
                                lista.Add(especie);
                            }
                            reader.Close();
                        }

                    }
                }
                catch (Exception ex)
                {

                    throw new Exception("Error", ex);
                }

                return lista;
            }
        }
    }
}
