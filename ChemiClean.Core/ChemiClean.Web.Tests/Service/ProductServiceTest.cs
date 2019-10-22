using ChemiClean.Core.Models;
using ChemiClean.Repository;
using ChemiClean.Repository.Repositories;
using ChemiClean.Services.Services;
using Xunit;

namespace ChemiClean.Web.Tests.Service
{
    public class ProductServiceTest
    {
        [Fact]
        public void GetProductById_NoneExistingId()
        {
            ChemiCleanDBEntities _dbContext = new ChemiCleanDBEntities();

            ProductRepository productsRepository = new ProductRepository(_dbContext);
            ProductDocumentRepository productDocumentRepository = new ProductDocumentRepository(_dbContext);

            UrlFileService urlFileService = new UrlFileService();
            UnitOfWork unitOfWork = new UnitOfWork(_dbContext);

            ProductDocumentService productDocumentService = new ProductDocumentService(productDocumentRepository, urlFileService, unitOfWork);
            ProductService productsService = new ProductService(productsRepository, productDocumentService, unitOfWork);

            var NonExistingFile = productsService.GetProduct(0);
            Assert.Null(NonExistingFile);
        }

    }
}
