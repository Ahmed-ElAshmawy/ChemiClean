using ChemiClean.Core.Models;
using ChemiClean.Repository.Interfaces;

namespace ChemiClean.Repository.Repositories
{
    public class ProductRepository : BaseRepository<tblProduct>, IProductRepository
    {
        public ProductRepository(ChemiCleanDBEntities dbContext) : base(dbContext)
        {
        }
    }
}
