using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VeterinariaEL;
using VeterinariaDL;

namespace VeterinariaBL
{
    public class EspecieBL
    {
        public List<EspecieEL> ListarEspecies(EspecieEL especieEL)
        {
            List<EspecieEL> list = new List<EspecieEL>();
            EspecieDL especieDL = new EspecieDL();
            list = especieDL.ListarEspecies(especieEL);
            return list;
        }
    }
}
