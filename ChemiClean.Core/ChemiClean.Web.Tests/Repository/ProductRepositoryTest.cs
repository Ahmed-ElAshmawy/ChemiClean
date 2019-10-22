using ChemiClean.Core.Models;
using ChemiClean.Repository.Repositories;
using System.Linq;
using Xunit;

namespace ChemiClean.Web.Tests.Repository
{
    public class ProductRepositoryTest
    {
        [Fact]
        public void GetAllProducts()
        {
            ChemiCleanDBEntities _dbContext = new ChemiCleanDBEntities();

            ProductRepository productsRepository = new ProductRepository(_dbContext);

            var products = productsRepository.GetAll();
            int dbSetProductsCount = _dbContext.tblProducts.Count();
            Assert.Equal(products.Count(), dbSetProductsCount);
        }

        [Fact]
        public void GetProducts_PageSizeAndNumberAreBig()
        {
            ChemiCleanDBEntities _dbContext = new ChemiCleanDBEntities();

            ProductRepository productsRepository = new ProductRepository(_dbContext);
            var products = productsRepository.GetAll(1000, 1000, null, "", "");
            Assert.NotNull(products);
        }

    }
}
