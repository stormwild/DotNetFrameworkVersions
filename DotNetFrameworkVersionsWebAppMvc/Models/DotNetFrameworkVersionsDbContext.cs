using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace DotNetFrameworkVersionsWebAppMvc.Models
{
    public partial class DotNetFrameworkVersionsDbContext : DbContext
    {
        public DotNetFrameworkVersionsDbContext()
        {
        }

        public DotNetFrameworkVersionsDbContext(DbContextOptions<DotNetFrameworkVersionsDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<DotNetFrameworkVersion> DotNetFrameworkVersions { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Name=ConnectionStrings.DotNetFrameworkVersionsDb");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Latin1_General_CI_AS");

            modelBuilder.Entity<DotNetFrameworkVersion>(entity =>
            {
                entity.Property(e => e.Description).HasMaxLength(255);

                entity.Property(e => e.FrameworkVersion)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.ReleaseDword)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("ReleaseDWORD");

                entity.Property(e => e.WindowsVersion)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
