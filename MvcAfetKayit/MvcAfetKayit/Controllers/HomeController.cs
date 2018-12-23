using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcAfetKayit.Models.AfetDBmodel;
using MvcAfetKayit.Models.TurkiyeModel;
using MvcAfetKayit.ViewModel;

namespace MvcAfetKayit.Controllers
{
    public class HomeController : Controller
    {    
        // GET: Home
        public ActionResult Index()
        {          
            var number = CreatePassword(12);
            ViewBag.Number = number;
            var number2 = CreatePassword(12);
            ViewBag.Number2 = number2;


            AfetTurkiyeModel model1 = new AfetTurkiyeModel();
            List<SelectListItem> model = new List<SelectListItem>();

            model = model1.Afetler.ToList();
            model = model1.Iller.ToList();
            model = model1.İlceler.ToList();
            model = model1.Semtler.ToList();
            model = model1.Mahalleler.ToList();
            
            return View(model1);
        }

        [HttpPost]
        public ActionResult Index(FormCollection form, AfetTurkiyeModel model, int? id)
        {
            DBAfetModel dbA = new DBAfetModel();
            DBTurkiyeModel dbT = new DBTurkiyeModel();         
            Afetler afetler = new Afetler();

            if (form != null)
            {

                afetler.AfetKategoriID = model.AfetID;
                afetler.SeriNo = ViewBag.Number;
                afetler.GuideNo = ViewBag.Number2;
                afetler.BaslangicTarihi = Convert.ToDateTime(form["BasTarihi"]);
                afetler.BitisTarihi = Convert.ToDateTime(form["BitisTarihi"]);
                afetler.Sure = Convert.ToInt32(form["Sure"]);

                AfetKategori a = dbA.AfetKategoris.Where(x => x.AfetKategoriID == model.AfetID).SingleOrDefault();
                tbl_il b = dbT.tbl_il.Where(x => x.il_id == model.ilID).SingleOrDefault();
                tbl_ilce c = dbT.tbl_ilce.Where(x => x.ilce_id == model.IlceID).SingleOrDefault();
                tbl_semt d = dbT.tbl_semt.Where(x => x.semt_id == model.SemtID).SingleOrDefault();
                tbl_mahalle e = dbT.tbl_mahalle.Where(x => x.mahalle_id == model.MahalleID).SingleOrDefault();

                afetler.AfetTuru = a.AfetAdi;
                afetler.Il = b.il_ad;
                afetler.Ilce = c.ilce_ad;
                afetler.Koy = d.semt_ad;
                afetler.Mahalle = e.mahalle_ad;

                afetler.Belde = form["Belde"];
                afetler.Neden = form["Neden"];
                afetler.Enlem = form["Enlem"];
                afetler.Boylam = form["Boylam"];
                afetler.NedenAciklama = form["Neden"];
                afetler.EtkiledigiAlanlar = form["EtAlan"];
                afetler.Kaynak = form["Kaynak"];

                dbA.Afetlers.Add(afetler);
                dbA.SaveChanges();
            }
            else
            {
                ModelState.AddModelError("Bilgi", "Bilgileri Kontrol ediniz");
            }

            return View();
        }

        [HttpPost]
        public JsonResult IlceList(int id)
        {
            DBTurkiyeModel dbT = new DBTurkiyeModel();
            List<tbl_ilce> ilceList = dbT.tbl_ilce.Where(i => i.il_id == id).OrderBy(i => i.ilce_ad).ToList();

            List<SelectListItem> itemList = (from i in ilceList
                                             select new SelectListItem
                                             {
                                                 Selected = false,
                                                 Text = i.ilce_ad,
                                                 Value = i.ilce_id.ToString()
                                             }).ToList();

           return Json(itemList, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult SemtList(int id)
        {
            DBTurkiyeModel dbT = new DBTurkiyeModel();
            List<tbl_semt> semtList = dbT.tbl_semt.Where(s => s.ilce_id == id).OrderBy(i => i.semt_id).ToList();

            List<SelectListItem> itemList = (from s in semtList
                                             select new SelectListItem
                                             {
                                                 Selected = false,
                                                 Text = s.semt_ad,
                                                 Value = s.semt_id.ToString()
                                             }).ToList();

            return Json(itemList, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult MahalleList(int id)
        {
            DBTurkiyeModel dbT = new DBTurkiyeModel();
            List<tbl_mahalle> mahalleList = dbT.tbl_mahalle.Where(s => s.semt_id == id).OrderBy(i => i.mahalle_id).ToList();

            List<SelectListItem> itemList = (from s in mahalleList
                                             select new SelectListItem
                                             {
                                                 Selected = false,
                                                 Text = s.mahalle_ad,
                                                 Value = s.mahalle_id.ToString()
                                             }).ToList();

            return Json(itemList, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Giris()
        {
            return View();
        }

        public string CreatePassword(int size)
        {
            char[] cr = "0123456789ABCDEFGHIJKLMNOPQRSTUCWXYZabcdefghijklmnopqrstucwxyz".ToCharArray();
            string result = string.Empty;
            Random r = new Random();

            for (int i = 0; i < size; i++)
            {
                if (i == 8)
                {
                    result += "-";
                }
                result += cr[r.Next(0, cr.Length - 1)].ToString();
            }

            return result;
        }

        
    }
}