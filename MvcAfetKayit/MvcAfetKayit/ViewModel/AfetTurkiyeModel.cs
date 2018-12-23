using MvcAfetKayit.Models.AfetDBmodel;
using MvcAfetKayit.Models.TurkiyeModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcAfetKayit.ViewModel
{
    public class AfetTurkiyeModel
    {
        public AfetTurkiyeModel()
        {
            this.İlceler = new List<SelectListItem>();
            İlceler.Add(new SelectListItem { Text = "..Seçiniz..", Value = "" });
            this.Semtler = new List<SelectListItem>();
            Semtler.Add(new SelectListItem { Text = "..Seçiniz..", Value = "" });
            this.Mahalleler = new List<SelectListItem>();
            Mahalleler.Add(new SelectListItem { Text = "..Seçiniz..", Value = "" });

            DBAfetModel dbA = new DBAfetModel();
            DBTurkiyeModel dbT = new DBTurkiyeModel();

            this.Afetler = (from a in dbA.AfetKategoris
                           select new SelectListItem
                           {
                               Text = a.AfetAdi,
                               Value = a.AfetKategoriID.ToString()
                           }).ToList();

            this.Afetler.Insert(0, new SelectListItem
            {
                Value = "",
                Text = ".. Seçiniz .."
            });

            this.Iller = (from i in dbT.tbl_il
                         select new SelectListItem
                         {
                             Selected = false,
                             Text = i.il_ad,
                             Value = i.il_id.ToString()
                         }).ToList();

            this.Iller.Insert(0, new SelectListItem
            {
                Selected = true,
                Value = "",
                Text = ".. Seçiniz .."
            });
        }

        public List<SelectListItem> Afetler { get; set; }

        public int AfetID { get; set; }

        public List<SelectListItem> Iller { get; set; }

        public int ilID { get; set; }
        
        public List<SelectListItem> İlceler { get; set; }

        public int IlceID { get; set; }

        public List<SelectListItem> Semtler { get; set; }

        public int SemtID { get; set; }

        public List<SelectListItem> Mahalleler { get; set; }

        public int MahalleID { get; set; }
    }
}