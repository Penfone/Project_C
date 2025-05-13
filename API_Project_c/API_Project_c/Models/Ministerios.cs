using System;
using System.Collections.Generic;

namespace API_Project_c.Models;

public partial class Ministerios
{
    public int MinisterioId { get; set; }

    public string Nome { get; set; } = null!;

    public string? Descricao { get; set; }

    public int LiderId { get; set; }

    public DateTime DataCriacao { get; set; }

    public DateTime UltimaAtualizacao { get; set; }

    public bool Ativo { get; set; }

    public virtual ICollection<ConfiguracoesMinisterio> ConfiguracoesMinisterio { get; set; } = new List<ConfiguracoesMinisterio>();

    public virtual Usuarios Lider { get; set; } = null!;

    public virtual ICollection<Membros> Membros { get; set; } = new List<Membros>();

    public virtual ICollection<UsuarioPapeis> UsuarioPapeis { get; set; } = new List<UsuarioPapeis>();
}
