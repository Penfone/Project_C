using System;
using System.Collections.Generic;

namespace API_Project_c.Models;

public partial class Usuarios
{
    public int UsuarioId { get; set; }

    public string Email { get; set; } = null!;

    public string Nome { get; set; } = null!;

    public string Sobrenome { get; set; } = null!;

    public bool Ativo { get; set; }

    public byte NivelAcesso { get; set; }

    public string? Telefone { get; set; }

    public DateOnly? DataNascimento { get; set; }

    public DateTime DataCadastro { get; set; }

    public string? FotoUrl { get; set; }

    public virtual ICollection<LogsAuditoria> LogsAuditoria { get; set; } = new List<LogsAuditoria>();

    public virtual ICollection<Membros> Membros { get; set; } = new List<Membros>();

    public virtual ICollection<Ministerios> Ministerios { get; set; } = new List<Ministerios>();

    public virtual ICollection<UsuarioPapeis> UsuarioPapeis { get; set; } = new List<UsuarioPapeis>();
}
