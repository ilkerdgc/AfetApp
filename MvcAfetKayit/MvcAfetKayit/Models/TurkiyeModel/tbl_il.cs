namespace MvcAfetKayit.Models.TurkiyeModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_il
    {
        [Key]
        public short il_id { get; set; }

        [StringLength(16)]
        public string il_ad { get; set; }
    }
}
