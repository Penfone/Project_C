using API_Project_c.Data;
using API_Project_c.Services;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// 1) Registra Controllers
builder.Services.AddControllers();

// 2) Swagger/OpenAPI
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// 3) DbContext
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

builder.Services.AddScoped<IUsuariosService, UsuariosService>();


var app = builder.Build();

// 4) Swagger UI em dev
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

// 5) (Opcional) Autorização
// Se usar [Authorize] nos controllers, descomente e registre AddAuthorization()/AddAuthentication() acima.
// app.UseAuthorization();

// 6) Mapeia as rotas dos Controllers
app.MapControllers();

app.Run();
