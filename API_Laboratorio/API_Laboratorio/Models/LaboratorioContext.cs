using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace API_Laboratorio.Models;

public partial class LaboratorioContext : DbContext
{
    public LaboratorioContext()
    {
    }

    public LaboratorioContext(DbContextOptions<LaboratorioContext> options)
        : base(options)
    {
    }


    public virtual DbSet<EstadosOrden> EstadosOrdens { get; set; }

    public virtual DbSet<Laboratorio> Laboratorios { get; set; }

    public virtual DbSet<Laboratorista> Laboratoristas { get; set; }

    public virtual DbSet<Muestra> Muestras { get; set; }

    public virtual DbSet<Paciente> Pacientes { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=DESKTOP-11O6E15\\MYSQLSERVER; Database=Laboratorio; Trusted_Connection=True; TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<EstadosOrden>(entity =>
        {
            entity.HasKey(e => e.EstadoId).HasName("PK__EstadosO__FEF86B605F7A993E");

            entity.ToTable("EstadosOrden");

            entity.Property(e => e.EstadoId).HasColumnName("EstadoID");
            entity.Property(e => e.Estado).HasMaxLength(50);
            entity.Property(e => e.NombreExamen).HasMaxLength(100);
        });

        modelBuilder.Entity<Laboratorio>(entity =>
        {
            entity.HasKey(e => e.LaboratorioId).HasName("PK__Laborato__5BC421B0295BE0EB");

            entity.ToTable("Laboratorio");

            entity.Property(e => e.LaboratorioId).HasColumnName("LaboratorioID");
            entity.Property(e => e.Sucursal).HasMaxLength(100);
            entity.Property(e => e.Token).HasMaxLength(50);
        });

        modelBuilder.Entity<Laboratorista>(entity =>
        {
            entity.HasKey(e => e.LaboratoristaId).HasName("PK__Laborato__E54C79EC39BDE729");

            entity.Property(e => e.LaboratoristaId).HasColumnName("LaboratoristaID");
            entity.Property(e => e.Especialidad).HasMaxLength(100);
            entity.Property(e => e.LaboratorioId).HasColumnName("LaboratorioID");
            entity.Property(e => e.Nombre).HasMaxLength(100);

            entity.HasOne(d => d.Laboratorio).WithMany(p => p.Laboratorista)
                .HasForeignKey(d => d.LaboratorioId)
                .HasConstraintName("FK__Laborator__Labor__4CA06362");
        });

        modelBuilder.Entity<Muestra>(entity =>
        {
            entity.HasKey(e => new { e.MuestraId, e.CodigoBarras }).HasName("PK__Muestras__9713E85DDA4B2274");

            entity.Property(e => e.MuestraId)
                .ValueGeneratedOnAdd()
                .HasColumnName("MuestraID");
            entity.Property(e => e.CodigoBarras).HasMaxLength(100);
            entity.Property(e => e.EstadoOrdenId).HasColumnName("EstadoOrdenID");
            entity.Property(e => e.LaboratorioId).HasColumnName("LaboratorioID");
            entity.Property(e => e.LaboratoristaId).HasColumnName("LaboratoristaID");
            entity.Property(e => e.PacienteId).HasColumnName("PacienteID");
            entity.Property(e => e.Urgencia).HasMaxLength(50);

            entity.HasOne(d => d.EstadoOrden).WithMany(p => p.Muestras)
                .HasForeignKey(d => d.EstadoOrdenId)
                .HasConstraintName("FK__Muestras__Estado__60A75C0F");

            entity.HasOne(d => d.Laboratorio).WithMany(p => p.Muestras)
                .HasForeignKey(d => d.LaboratorioId)
                .HasConstraintName("FK__Muestras__Labora__5EBF139D");

            entity.HasOne(d => d.Laboratorista).WithMany(p => p.Muestras)
                .HasForeignKey(d => d.LaboratoristaId)
                .HasConstraintName("FK__Muestras__Labora__5FB337D6");

            entity.HasOne(d => d.Paciente).WithMany(p => p.Muestras)
                .HasForeignKey(d => d.PacienteId)
                .HasConstraintName("FK__Muestras__Pacien__5DCAEF64");
        });

        modelBuilder.Entity<Paciente>(entity =>
        {
            entity.HasKey(e => e.PacienteId).HasName("PK__Paciente__9353C07F47203C92");

            entity.Property(e => e.PacienteId).HasColumnName("PacienteID");
            entity.Property(e => e.Nombre).HasMaxLength(100);
            entity.Property(e => e.Sexo).HasMaxLength(20);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
