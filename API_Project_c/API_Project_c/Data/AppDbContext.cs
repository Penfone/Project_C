using System;
using System.Collections.Generic;
using API_Project_c.Models;
using Microsoft.EntityFrameworkCore;

namespace API_Project_c.Data;

public partial class AppDbContext : DbContext
{

    //Scaffold commands
   
    

    public AppDbContext()
    {
    }

    public AppDbContext(DbContextOptions<AppDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<ConfiguracoesMinisterio> ConfiguracoesMinisterio { get; set; }

    public virtual DbSet<LogsAuditoria> LogsAuditoria { get; set; }

    public virtual DbSet<Membros> Membros { get; set; }

    public virtual DbSet<Ministerios> Ministerios { get; set; }

    public virtual DbSet<Papeis> Papeis { get; set; }

    public virtual DbSet<UsuarioPapeis> UsuarioPapeis { get; set; }

    public virtual DbSet<Usuarios> Usuarios { get; set; }
        
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<ConfiguracoesMinisterio>(entity =>
        {
            entity.HasKey(e => e.ConfiguracaoId).HasName("PK__Configur__6AAFCF09B8A738E4");

            entity.HasIndex(e => new { e.MinisterioId, e.Chave }, "UQ__Configur__922400F77B0500B8").IsUnique();

            entity.Property(e => e.Chave)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Valor)
                .HasMaxLength(500)
                .IsUnicode(false);

            entity.HasOne(d => d.Ministerio).WithMany(p => p.ConfiguracoesMinisterio)
                .HasForeignKey(d => d.MinisterioId)
                .HasConstraintName("FK__Configura__Minis__367C1819");
        });

        modelBuilder.Entity<LogsAuditoria>(entity =>
        {
            entity.HasKey(e => e.LogAuditoriaId).HasName("PK__LogsAudi__D6EAFE708C957448");

            entity.Property(e => e.Acao)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.DataAlteracao)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Detalhes).IsUnicode(false);
            entity.Property(e => e.NomeTabela)
                .HasMaxLength(100)
                .IsUnicode(false);

            entity.HasOne(d => d.Usuario).WithMany(p => p.LogsAuditoria)
                .HasForeignKey(d => d.UsuarioId)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK__LogsAudit__Usuar__3A4CA8FD");
        });

        modelBuilder.Entity<Membros>(entity =>
        {
            entity.HasKey(e => e.MembroId).HasName("PK__Membros__6D50D4E6EDABB590");

            entity.Property(e => e.DataEntrada).HasDefaultValueSql("(getdate())");
            entity.Property(e => e.PapelNoMinisterio)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.Ministerio).WithMany(p => p.Membros)
                .HasForeignKey(d => d.MinisterioId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Membros__Ministe__2A164134");

            entity.HasOne(d => d.Usuario).WithMany(p => p.Membros)
                .HasForeignKey(d => d.UsuarioId)
                .HasConstraintName("FK__Membros__Usuario__29221CFB");
        });

        modelBuilder.Entity<Ministerios>(entity =>
        {
            entity.HasKey(e => e.MinisterioId).HasName("PK__Minister__EB5E44218DB9CB1F");

            entity.Property(e => e.Ativo).HasDefaultValue(true);
            entity.Property(e => e.DataCriacao)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Descricao)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.Nome)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.UltimaAtualizacao)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.Lider).WithMany(p => p.Ministerios)
                .HasForeignKey(d => d.LiderId)
                .HasConstraintName("FK__Ministeri__Lider__25518C17");
        });

        modelBuilder.Entity<Papeis>(entity =>
        {
            entity.HasKey(e => e.PapelId).HasName("PK__Papeis__D4529A239B0E28D1");

            entity.HasIndex(e => e.Nome, "UQ__Papeis__7D8FE3B2247116C1").IsUnique();

            entity.Property(e => e.Descricao)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.Nome)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<UsuarioPapeis>(entity =>
        {
            entity.HasKey(e => e.UsuarioPapelId).HasName("PK__UsuarioP__6EE051EFA689E07B");

            entity.Property(e => e.AtribuidoEm)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");

            entity.HasOne(d => d.Ministerio).WithMany(p => p.UsuarioPapeis)
                .HasForeignKey(d => d.MinisterioId)
                .HasConstraintName("FK__UsuarioPa__Minis__31B762FC");

            entity.HasOne(d => d.Papel).WithMany(p => p.UsuarioPapeis)
                .HasForeignKey(d => d.PapelId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__UsuarioPa__Papel__32AB8735");

            entity.HasOne(d => d.Usuario).WithMany(p => p.UsuarioPapeis)
                .HasForeignKey(d => d.UsuarioId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__UsuarioPa__Usuar__30C33EC3");
        });

        modelBuilder.Entity<Usuarios>(entity =>
        {
            entity.HasKey(e => e.UsuarioId).HasName("PK__Usuarios__2B3DE7B895FA1368");

            entity.Property(e => e.Ativo).HasDefaultValue(true);
            entity.Property(e => e.DataCadastro)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Email)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.FotoUrl)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.Nome)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Sobrenome)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.Telefone)
                .HasMaxLength(20)
                .IsUnicode(false);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
