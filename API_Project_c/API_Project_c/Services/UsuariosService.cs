// Services/IUsuarioService.cs
using API_Project_c.Data;
using API_Project_c.DTOs;
using API_Project_c.Models;
using System.Collections.Generic;
using System.Threading.Tasks;
// Services/UsuarioService.cs
using API_Project_c.Data;
using API_Project_c.DTOs;
using API_Project_c.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace API_Project_c.Services
{
    public interface IUsuariosService
    {
        Task<IEnumerable<Usuarios>> GetAllAsync();
        Task<Usuarios> GetByIdAsync(int id);
        Task<Usuarios> CreateAsync(UsuarioCreateDto dto);
        Task<bool> UpdateAsync(int id, UsuarioUpdateDto dto);
        Task<bool> DeleteAsync(int id);
        Task<Usuarios> LoginAsync(LoginDto dto);
    }
}



namespace API_Project_c.Services
{
    public class UsuariosService : IUsuariosService
    {
        private readonly AppDbContext _ctx;
        public UsuariosService(AppDbContext ctx) => _ctx = ctx;

        public async Task<IEnumerable<Usuarios>> GetAllAsync() =>
            await _ctx.Usuarios.ToListAsync();

        public async Task<Usuarios> GetByIdAsync(int id) =>
            await _ctx.Usuarios.FindAsync(id);

        public async Task<Usuarios> CreateAsync(UsuarioCreateDto dto)
        {
            var u = new Usuarios
            {
                Email = dto.Email,
                // aqui hash de dto.Senha
                Nome = dto.Nome,
                Sobrenome = dto.Sobrenome,
                Ativo = true
            };
            _ctx.Usuarios.Add(u);
            await _ctx.SaveChangesAsync();
            return u;
        }

        public async Task<bool> UpdateAsync(int id, UsuarioUpdateDto dto)
        {
            var u = await _ctx.Usuarios.FindAsync(id);
            if (u == null) return false;
            u.Nome = dto.Nome;
            u.Sobrenome = dto.Sobrenome;
            u.Ativo = dto.Ativo;
            await _ctx.SaveChangesAsync();
            return true;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            var u = await _ctx.Usuarios.FindAsync(id);
            if (u == null) return false;
            _ctx.Usuarios.Remove(u);
            await _ctx.SaveChangesAsync();
            return true;
        }

        public async Task<Usuarios> LoginAsync(LoginDto dto)
        {
            // verificar hash/senha depois
            return await _ctx.Usuarios
                .FirstOrDefaultAsync(x => x.Email == dto.Email);
        }
    }
}
