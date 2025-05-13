using API_Project_c.DTOs;
using API_Project_c.Models;
using Microsoft.AspNetCore.Mvc;
using API_Project_c.Services;

namespace API_Project_c.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UsuariosController : ControllerBase
    {
        private readonly IUsuariosService _svc;
        public UsuariosController(IUsuariosService svc) => _svc = svc;

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Usuarios>>> GetAll() =>
        Ok(await _svc.GetAllAsync());

        [HttpGet("{id}")]
        public async Task<ActionResult<Usuarios>> Get(int id)
        {
            var u = await _svc.GetByIdAsync(id);
            return u == null ? NotFound() : Ok(u);
        }

        [HttpPost("cadastro")]
        public async Task<ActionResult<Usuarios>> Create(UsuarioCreateDto dto)
        {
            var u = await _svc.CreateAsync(dto);
            return CreatedAtAction(nameof(Get), new { id = u.UsuarioId }, u);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, UsuarioUpdateDto dto) =>
            await _svc.UpdateAsync(id, dto) ? NoContent() : NotFound();

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id) =>
            await _svc.DeleteAsync(id) ? NoContent() : NotFound();

        [HttpPost("login")]
        public async Task<ActionResult<Usuarios>> Login(LoginDto dto)
        {
            var u = await _svc.LoginAsync(dto);
            return u == null ? Unauthorized() : Ok(u);
        }
    }
}