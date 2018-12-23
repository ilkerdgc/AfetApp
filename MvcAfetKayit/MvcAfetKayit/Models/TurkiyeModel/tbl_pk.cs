namespace MvcAfetKayit.Models.TurkiyeModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_pk
    {
        [Key]
        public short pk_id { get; set; }

        [StringLength(5)]
        public string kod { get; set; }
    }
}
