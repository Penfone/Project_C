using System;
using System.Collections.Generic;

namespace API_Project_c.Models;

public partial class UsuarioPapeis
{
    public int UsuarioPapelId { get; set; }

    public int UsuarioId { get; set; }

    public int MinisterioId { get; set; }

    public int PapelId { get; set; }

    public DateTime AtribuidoEm { get; set; }

    public virtual Ministerios Ministerio { get; set; } = null!;

    public virtual Papeis Papel { get; set; } = null!;

    public virtual Usuarios Usuario { get; set; } = null!;
}
