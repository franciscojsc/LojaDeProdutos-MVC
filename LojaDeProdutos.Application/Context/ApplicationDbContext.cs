using LojaDeProdutos.Application.Models;
using Microsoft.EntityFrameworkCore;

namespace LojaDeProdutos.Application.Context
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }

        public DbSet<Categoria> Categorias { get; set; }
        public DbSet<Produto> Produtos { get; set; }
    }
}
