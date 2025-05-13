using System;
using System.Collections.Generic;

namespace API_Project_c.Models;

public partial class ConfiguracoesMinisterio
{
    public int ConfiguracaoId { get; set; }

    public int MinisterioId { get; set; }

    public string Chave { get; set; } = null!;

    public string Valor { get; set; } = null!;

    public virtual Ministerios Ministerio { get; set; } = null!;
}
