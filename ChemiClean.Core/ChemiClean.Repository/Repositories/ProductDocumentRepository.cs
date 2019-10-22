using ChemiClean.Core.Models;
using ChemiClean.Repository.Interfaces;

namespace ChemiClean.Repository.Repositories
{
    public class ProductDocumentRepository : BaseRepository<tblProductDocument>, IProductDocumentRepository
    {
        public ProductDocumentRepository(ChemiCleanDBEntities dbContext) : base(dbContext)
        {
        }

    }
}
