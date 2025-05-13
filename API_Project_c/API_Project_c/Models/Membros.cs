using System;
using System.Collections.Generic;

namespace API_Project_c.Models;

public partial class Membros
{
    public int MembroId { get; set; }

    public int UsuarioId { get; set; }

    public int MinisterioId { get; set; }

    public DateOnly DataEntrada { get; set; }

    public DateOnly? DataSaida { get; set; }

    public string? PapelNoMinisterio { get; set; }

    public virtual Ministerios Ministerio { get; set; } = null!;

    public virtual Usuarios Usuario { get; set; } = null!;
}
