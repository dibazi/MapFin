﻿using Microsoft.EntityFrameworkCore;

namespace MapFin.Models
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options)
        { }

        public DbSet<Transaction> Transactions { get; set; }

        public DbSet<Category> Categories { get; set; }

        public static implicit operator ApplicationBuilder(ApplicationDbContext v)
        {
            throw new NotImplementedException();
        }
    }
}
