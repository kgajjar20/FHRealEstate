using Microsoft.EntityFrameworkCore;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FHRealEstate.DB
{
    public partial class FHRealEstateContext : DbContext
    {
        public FHRealEstateContext()
        {
        }

        public FHRealEstateContext(DbContextOptions<FHRealEstateContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Amenities> Amenities { get; set; }
        public virtual DbSet<ConstructionStatus> ConstructionStatus { get; set; }
        public virtual DbSet<Contact> Contact { get; set; }
        public virtual DbSet<Property> Property { get; set; }
        public virtual DbSet<PropertyAmenity> PropertyAmenity { get; set; }
        public virtual DbSet<PropertyFloorPlan> PropertyFloorPlan { get; set; }
        public virtual DbSet<PropertyImage> PropertyImage { get; set; }
        public virtual DbSet<PropertyStatus> PropertyStatus { get; set; }
        public virtual DbSet<PropertyType> PropertyType { get; set; }
        public virtual DbSet<Test> Test { get; set; }
        public virtual DbSet<User> User { get; set; }


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=192.168.43.91;Database=FHRealEstate;Trusted_Connection=True;Integrated Security=False;uid=sa;pwd=Kaushal#123;MultipleActiveResultSets=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Amenities>(entity =>
            {
                entity.HasKey(e => e.AmenityId)
                    .HasName("PK_amenities");

                entity.Property(e => e.AmenityId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.AmenityName).IsUnicode(false);

                entity.Property(e => e.Status).HasDefaultValueSql("((1))");
            });

            modelBuilder.Entity<ConstructionStatus>(entity =>
            {
                entity.Property(e => e.ConstructionStatusName).IsUnicode(false);

                entity.Property(e => e.Status).HasDefaultValueSql("((1))");
            });

            modelBuilder.Entity<Contact>(entity =>
            {
                entity.Property(e => e.ContactId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.Message).IsUnicode(false);

                entity.Property(e => e.Name).IsUnicode(false);

                entity.Property(e => e.Phone).IsUnicode(false);

                entity.Property(e => e.Subject).IsUnicode(false);
            });

            modelBuilder.Entity<Property>(entity =>
            {
                entity.Property(e => e.PropertyId).HasDefaultValueSql("(newid())");

                entity.HasOne(d => d.ConstructionStatus)
                    .WithMany(p => p.Property)
                    .HasForeignKey(d => d.ConstructionStatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Property_ConstructionStatus");

                entity.HasOne(d => d.PropertyStatus)
                    .WithMany(p => p.Property)
                    .HasForeignKey(d => d.PropertyStatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Property_PropertyStatus");

                entity.HasOne(d => d.PropertyType)
                    .WithMany(p => p.Property)
                    .HasForeignKey(d => d.PropertyTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Property_PropertyType");
            });

            modelBuilder.Entity<PropertyAmenity>(entity =>
            {
                entity.Property(e => e.PropertyAmenityId).HasDefaultValueSql("(newid())");

                entity.HasOne(d => d.Amenity)
                    .WithMany(p => p.PropertyAmenity)
                    .HasForeignKey(d => d.AmenityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PropertyAmenity_amenities");

                entity.HasOne(d => d.Property)
                    .WithMany(p => p.PropertyAmenity)
                    .HasForeignKey(d => d.PropertyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PropertyAmenity_Property");
            });

            modelBuilder.Entity<PropertyFloorPlan>(entity =>
            {
                entity.Property(e => e.PropertyFloorPlanId).HasDefaultValueSql("(newid())");

                entity.HasOne(d => d.Property)
                    .WithMany(p => p.PropertyFloorPlan)
                    .HasForeignKey(d => d.PropertyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PropertyFloorPlan_Property");
            });

            modelBuilder.Entity<PropertyImage>(entity =>
            {
                entity.Property(e => e.PropertyImageId).HasDefaultValueSql("(newid())");

                entity.HasOne(d => d.Property)
                    .WithMany(p => p.PropertyImage)
                    .HasForeignKey(d => d.PropertyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PropertyImage_Property");
            });

            modelBuilder.Entity<PropertyStatus>(entity =>
            {
                entity.Property(e => e.Status).HasDefaultValueSql("((1))");
            });

            modelBuilder.Entity<PropertyType>(entity =>
            {
                entity.Property(e => e.PropertyTypeName).IsUnicode(false);

                entity.Property(e => e.Status).HasDefaultValueSql("((1))");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.Id).HasDefaultValueSql("(newid())");

                entity.Property(e => e.Email).IsUnicode(false);

                entity.Property(e => e.Firstname).IsUnicode(false);

                entity.Property(e => e.Lastname).IsUnicode(false);

                entity.Property(e => e.Middlename).IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
