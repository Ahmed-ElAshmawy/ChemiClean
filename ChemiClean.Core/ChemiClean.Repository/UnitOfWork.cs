using ChemiClean.Core.Models;
using ChemiClean.Repository.Interfaces;

namespace ChemiClean.Repository
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly ChemiCleanDBEntities _dbContext;

        public UnitOfWork(ChemiCleanDBEntities dbContext)
        {
            _dbContext = dbContext;
        }

        public void SaveChanges()
        {
            _dbContext.SaveChanges();
        }
    }
}
