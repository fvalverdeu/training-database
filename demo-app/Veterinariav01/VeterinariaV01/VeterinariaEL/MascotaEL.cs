using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VeterinariaEL
{
    public class MascotaEL
    {
        public int MascotaId { get; set; }
        public string Nombre { get; set; }
        public int Edad { get; set; }
        public int EspecieId { get; set; }
        public int Estado { get; set; }

        public EspecieEL EspecieEL { get; set; }

        public MascotaEL()
        {
            EspecieEL = new EspecieEL();
        }

    }
}
