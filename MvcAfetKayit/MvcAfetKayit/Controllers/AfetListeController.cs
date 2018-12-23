using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcAfetKayit.ViewModel;
using MvcAfetKayit.Models.AfetDBmodel;

namespace MvcAfetKayit.Controllers
{
    public class AfetListeController : Controller
    {
        DBAfetModel db = new DBAfetModel();
       
        // GET: AfetListe
        public ActionResult Index()
        {
            var afetListesi = db.Afetlers.OrderByDescending(a => a.BaslangicTarihi).ToList();
            return View(afetListesi);
        }

        public ActionResult Delete(int id)
        {
            var SilinecekAfet = db.Afetlers.Where(a => a.AfetID == id).SingleOrDefault();
            if (SilinecekAfet != null)
            {
                db.Afetlers.Remove(SilinecekAfet);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View();
        }
    }
}