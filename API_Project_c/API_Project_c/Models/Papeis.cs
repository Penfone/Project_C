using System;
using System.Collections.Generic;

namespace API_Project_c.Models;

public partial class Papeis
{
    public int PapelId { get; set; }

    public string Nome { get; set; } = null!;

    public string? Descricao { get; set; }

    public virtual ICollection<UsuarioPapeis> UsuarioPapeis { get; set; } = new List<UsuarioPapeis>();
}
