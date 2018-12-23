namespace MvcAfetKayit.Models.TurkiyeModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_mahalle
    {
        [Key]
        public int mahalle_id { get; set; }

        public short semt_id { get; set; }

        [StringLength(40)]
        public string mahalle_ad { get; set; }

        public short? pk_id { get; set; }
    }
}
