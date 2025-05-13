using System;
using System.Collections.Generic;

namespace API_Project_c.Models;

public partial class LogsAuditoria
{
    public int LogAuditoriaId { get; set; }

    public string NomeTabela { get; set; } = null!;

    public int RegistroId { get; set; }

    public int? UsuarioId { get; set; }

    public string Acao { get; set; } = null!;

    public DateTime DataAlteracao { get; set; }

    public string? Detalhes { get; set; }

    public virtual Usuarios? Usuario { get; set; }
}
