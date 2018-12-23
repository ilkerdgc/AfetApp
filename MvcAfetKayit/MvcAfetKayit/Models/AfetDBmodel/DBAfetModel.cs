namespace MvcAfetKayit.Models.AfetDBmodel
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class DBAfetModel : DbContext
    {
        public DBAfetModel()
            : base("name=DBAfetModel")
        {
        }

        public virtual DbSet<AfetKategori> AfetKategoris { get; set; }
        public virtual DbSet<Afetler> Afetlers { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }
    }
}
