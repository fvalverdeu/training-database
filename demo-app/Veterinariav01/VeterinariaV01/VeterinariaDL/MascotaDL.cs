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
    public class MascotaDL
    {
        ConnectionVeterinaria connection = new ConnectionVeterinaria();

        public int RegistrarMascota(MascotaEL mascotaEL)
        {
            int filasAfectadas = 0;
            using (var conn = connection.GetConnection())
            {
                conn.Open();
                using (var command = new SqlCommand("USP_Mascota_CRUD", conn))
                {
                    try
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add(new SqlParameter("@Operacion", 'C'));
                        command.Parameters.Add(new SqlParameter("@MascotaId", mascotaEL.MascotaId));
                        command.Parameters.Add(new SqlParameter("@Nombre", mascotaEL.Nombre));
                        command.Parameters.Add(new SqlParameter("@Edad", mascotaEL.Edad));
                        command.Parameters.Add(new SqlParameter("@EspecieId", mascotaEL.EspecieId));

                        filasAfectadas = command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {

                        throw new Exception("Error", ex);
                    }
                }
                return filasAfectadas;
            }
        }

        public List<MascotaEL> ListarMascotas(MascotaEL mascotaEL)
        {
            List<MascotaEL> lista = new List<MascotaEL>();
            using (var conn = connection.GetConnection())
            {
                conn.Open();
                try
                {
                    using (var command = new SqlCommand("USP_Mascota_CRUD", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add(new SqlParameter("@Operacion", 'R'));
                        command.Parameters.Add(new SqlParameter("@MascotaId", mascotaEL.MascotaId));
                        command.Parameters.Add(new SqlParameter("@Nombre", mascotaEL.Nombre));
                        command.Parameters.Add(new SqlParameter("@Edad", mascotaEL.Edad));
                        command.Parameters.Add(new SqlParameter("@EspecieId", mascotaEL.EspecieId));

                        using (var reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                MascotaEL mascota = new MascotaEL();
                                mascota.MascotaId = (int)reader["MascotaId"];
                                mascota.Nombre = reader["Nombre"].ToString();
                                mascota.Edad = (int)reader["Edad"];
                                mascota.EspecieId = (int)reader["EspecieId"];
                                mascota.EspecieEL.EspecieId = (int)reader["EspecieId"];
                                mascota.EspecieEL.Descripcion = reader["Descripcion"].ToString();
                                lista.Add(mascota);
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

        public int ActualizarMascota(MascotaEL mascotaEL)
        {
            int filasAfectadas = 0;
            using (var conn = connection.GetConnection())
            {
                conn.Open();
                using (var command = new SqlCommand("USP_Mascota_CRUD", conn))
                {
                    try
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add(new SqlParameter("@Operacion", 'U'));
                        command.Parameters.Add(new SqlParameter("@MascotaId", mascotaEL.MascotaId));
                        command.Parameters.Add(new SqlParameter("@Nombre", mascotaEL.Nombre));
                        command.Parameters.Add(new SqlParameter("@Edad", mascotaEL.Edad));
                        command.Parameters.Add(new SqlParameter("@EspecieId", mascotaEL.EspecieId));

                        filasAfectadas = command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {

                        throw new Exception("Error", ex);
                    }
                }
                return filasAfectadas;
            }
        }

        public int EliminarMascota(MascotaEL mascotaEL)
        {
            int filasAfectadas = 0;
            using (var conn = connection.GetConnection())
            {
                conn.Open();
                using (var command = new SqlCommand("USP_Mascota_CRUD", conn))
                {
                    try
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add(new SqlParameter("@Operacion", 'D'));
                        command.Parameters.Add(new SqlParameter("@MascotaId", mascotaEL.MascotaId));
                        //command.Parameters.Add(new SqlParameter("@Nombre", mascotaEL.Nombre));
                        //command.Parameters.Add(new SqlParameter("@Edad", mascotaEL.Edad));
                        //command.Parameters.Add(new SqlParameter("@EspecieId", mascotaEL.EspecieId));

                        filasAfectadas = command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {

                        throw new Exception("Error", ex);
                    }
                }
                return filasAfectadas;
            }
        }

        public MascotaEL BuscarMascotasById(MascotaEL mascotaEL)
        {
            MascotaEL mascota = new MascotaEL();
            using (var conn = connection.GetConnection())
            {
                conn.Open();
                try
                {
                    using (var command = new SqlCommand("USP_Mascota_CRUD", conn))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add(new SqlParameter("@Operacion", 'F'));
                        command.Parameters.Add(new SqlParameter("@MascotaId", mascotaEL.MascotaId));
                        //command.Parameters.Add(new SqlParameter("@Nombre", mascotaEL.Nombre));
                        //command.Parameters.Add(new SqlParameter("@Edad", mascotaEL.Edad));
                        //command.Parameters.Add(new SqlParameter("@EspecieId", mascotaEL.EspecieId));

                        using (var reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                mascota.MascotaId = (int)reader["MascotaId"];
                                mascota.Nombre = reader["Nombre"].ToString();
                                mascota.Edad = (int)reader["Edad"];
                                mascota.EspecieId = (int)reader["EspecieId"];
                                mascota.EspecieEL.EspecieId = (int)reader["EspecieId"];
                                mascota.EspecieEL.Descripcion = reader["Descripcion"].ToString();
                            }
                            reader.Close();
                        }
                    }
                }
                catch (Exception ex)
                {

                    throw new Exception("Error", ex);
                }

                return mascota;
            }
        }
    }
}
