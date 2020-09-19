using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using VeterinariaBL;
using VeterinariaEL;

namespace VeterinariaV01.Controllers
{
    public class MascotaController : Controller
    {
        private MascotaBL mascotaBL = new MascotaBL();
        private EspecieBL especieBL = new EspecieBL();

        // GET: Mascota
        public ActionResult Index()
        {
            MascotaEL mascotaEL = new MascotaEL();
            return View(mascotaBL.ListarMascotas(mascotaEL));
        }

        public ActionResult Editar(int id = 0)
        {
            MascotaEL mascotaEL = new MascotaEL();
            EspecieEL especieEL = new EspecieEL();
            mascotaEL.MascotaId = id;
            ViewBag.Especies = especieBL.ListarEspecies(especieEL);
            return View(id == 0 ? new MascotaEL() : mascotaBL.BuscarMascotasById(mascotaEL));
        }

        public ActionResult Guardar(MascotaEL mascotaEL)
        {
            var resultado = mascotaEL.MascotaId > 0 ? mascotaBL.ActualizarMascota(mascotaEL) : mascotaBL.RegistrarMascota(mascotaEL);
            if (resultado <= 0)
            {
                ViewBag.Mensaje = "Ocurrió un error";
                return View("~/Views/Shared/_Mensaje.cshtml");
            }
            return Redirect("~/mascota/index");
        }

        public ActionResult Eliminar(int id)
        {
            MascotaEL mascotaEL = new MascotaEL();
            mascotaEL.MascotaId = id;
            var resultado = mascotaBL.EliminarMascota(mascotaEL);
            if (resultado <= 0)
            {
                ViewBag.Mensaje = "Ocurrió un error";
                return View("~/Views/Shared/_Mensaje.cshtml");
            }
            return Redirect("~/mascota/index");
        }
    }
}