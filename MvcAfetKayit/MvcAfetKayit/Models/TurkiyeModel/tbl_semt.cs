namespace MvcAfetKayit.Models.TurkiyeModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_semt
    {
        [Key]
        public short semt_id { get; set; }

        public short ilce_id { get; set; }

        [StringLength(32)]
        public string semt_ad { get; set; }
    }
}
