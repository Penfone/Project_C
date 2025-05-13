// DTOs/UsuarioCreateDto.cs
namespace API_Project_c.DTOs
{
    public class UsuarioCreateDto
    {
        public string Email { get; set; }
        public string Senha { get; set; }
        public string Nome { get; set; }
        public string Sobrenome { get; set; }
    }
}

// DTOs/UsuarioUpdateDto.cs
namespace API_Project_c.DTOs
{
    public class UsuarioUpdateDto
    {
        public string Nome { get; set; }
        public string Sobrenome { get; set; }
        public bool Ativo { get; set; }
    }
}

// DTOs/LoginDto.cs
namespace API_Project_c.DTOs
{
    public class LoginDto
    {
        public string Email { get; set; }
        public string Senha { get; set; }
    }
}