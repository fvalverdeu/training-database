using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VeterinariaDL;
using VeterinariaEL;

namespace VeterinariaBL
{
    public class MascotaBL
    {
        public int RegistrarMascota(MascotaEL mascotaEL)
        {
            MascotaDL mascotaDL = new MascotaDL();
            int filasAfectadas = 0;
            filasAfectadas = mascotaDL.RegistrarMascota(mascotaEL);
            return filasAfectadas;
        }

        public List<MascotaEL> ListarMascotas(MascotaEL mascotaEL)
        {
            List<MascotaEL> list = new List<MascotaEL>();
            MascotaDL mascotaDL = new MascotaDL();
            list = mascotaDL.ListarMascotas(mascotaEL);
            return list;
        }

        public int ActualizarMascota(MascotaEL mascotaEL)
        {
            MascotaDL mascotaDL = new MascotaDL();
            int filasAfectadas = 0;
            filasAfectadas = mascotaDL.ActualizarMascota(mascotaEL);
            return filasAfectadas;
        }

        public int EliminarMascota(MascotaEL mascotaEL)
        {
            MascotaDL mascotaDL = new MascotaDL();
            int filasAfectadas = 0;
            filasAfectadas = mascotaDL.EliminarMascota(mascotaEL);
            return filasAfectadas;
        }

        public MascotaEL BuscarMascotasById(MascotaEL mascotaEL)
        {
            MascotaEL mascota = new MascotaEL();
            MascotaDL mascotaDL = new MascotaDL();
            mascota = mascotaDL.BuscarMascotasById (mascotaEL);
            return mascota;
        }
    }
}
