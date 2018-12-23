namespace MvcAfetKayit.Models.AfetDBmodel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AfetKategori")]
    public partial class AfetKategori
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public AfetKategori()
        {
            Afetlers = new HashSet<Afetler>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int AfetKategoriID { get; set; }

        [StringLength(50)]
        public string AfetAdi { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Afetler> Afetlers { get; set; }
    }
}
