namespace MvcAfetKayit.Models.AfetDBmodel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Afetler")]
    public partial class Afetler
    {
        [Key]
        public int AfetID { get; set; }

        public int? AfetKategoriID { get; set; }

        [StringLength(13)]
        public string SeriNo { get; set; }

        [StringLength(13)]
        public string GuideNo { get; set; }

        [Column(TypeName = "datetime")]
        public DateTime? BaslangicTarihi { get; set; }

        [Column(TypeName = "datetime")]
        public DateTime? BitisTarihi { get; set; }

        public int? Sure { get; set; }

        [StringLength(50)]
        public string AfetTuru { get; set; }

        [StringLength(50)]
        public string Il { get; set; }

        [StringLength(50)]
        public string Ilce { get; set; }

        [StringLength(50)]
        public string Koy { get; set; }

        [StringLength(50)]
        public string Mahalle { get; set; }

        [StringLength(50)]
        public string Belde { get; set; }

        [StringLength(200)]
        public string Neden { get; set; }

        [StringLength(50)]
        public string Enlem { get; set; }

        [StringLength(50)]
        public string Boylam { get; set; }

        [StringLength(300)]
        public string NedenAciklama { get; set; }

        [StringLength(200)]
        public string EtkiledigiAlanlar { get; set; }

        [StringLength(200)]
        public string Kaynak { get; set; }

        public virtual AfetKategori AfetKategori { get; set; }
    }
}
