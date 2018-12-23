namespace MvcAfetKayit.Models.TurkiyeModel
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class DBTurkiyeModel : DbContext
    {
        public DBTurkiyeModel()
            : base("name=DBTurkiyeModel")
        {
        }

        public virtual DbSet<tbl_il> tbl_il { get; set; }
        public virtual DbSet<tbl_ilce> tbl_ilce { get; set; }
        public virtual DbSet<tbl_mahalle> tbl_mahalle { get; set; }
        public virtual DbSet<tbl_semt> tbl_semt { get; set; }
        public virtual DbSet<tbl_pk> tbl_pk { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<tbl_pk>()
                .Property(e => e.kod)
                .IsFixedLength()
                .IsUnicode(false);
        }
    }
}
