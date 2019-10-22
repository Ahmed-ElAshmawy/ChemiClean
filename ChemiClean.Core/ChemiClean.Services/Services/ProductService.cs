using ChemiClean.Core.Models;
using ChemiClean.Repository.Interfaces;
using ChemiClean.Services.Interfaces;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;

namespace ChemiClean.Services.Services
{
    public class ProductService : IProductService
    {
        private readonly IProductRepository _productRepository;
        private readonly IProductDocumentService _productDocumentService;
        private readonly IUnitOfWork _unitOfWork;

        public ProductService(IProductRepository productRepository, IProductDocumentService productDocumentService, IUnitOfWork unitOfWork)
        {
            _productRepository = productRepository;
            _productDocumentService = productDocumentService;
            _unitOfWork = unitOfWork;
        }

        public List<tblProduct> GetAll()
        {
            List<tblProduct> products = _productRepository.GetAll().ToList();
            return products;
        }

        public IPagedList<tblProduct> GetAll(int PageNumber, int PageSize, string SortBy = "", string SortDirection = "")
        {
            List<string> includes = new List<string>
            {
                "tblProductDocument"
            };

            IPagedList<tblProduct> products = _productRepository.GetAll(PageNumber, PageSize, includes, SortBy, SortDirection);
            return products;
        }

        public IPagedList<tblProduct> GetAllPagedByExpression(int PageNumber, int PageSize, Expression<Func<tblProduct, bool>> filter = null, string SortBy = "", string SortDirection = "")
        {
            List<string> includes = new List<string>
            {
                "tblProductDocument"
            };

            IPagedList<tblProduct> products = _productRepository.GetAll(PageNumber, PageSize, includes, filter, SortBy, SortDirection);
            return products;
        }

        public List<tblProduct> GetAllByExpression(Expression<Func<tblProduct, bool>> where)
        {
            List<string> includes = new List<string>
            {
                "tblProductDocument"
            };

            return _productRepository.GetMany(includes, where).ToList();
        }

        public tblProduct GetProduct(int id)
        {
            List<string> includes = new List<string>
            {
                "tblProductDocument"
            };

            tblProduct product = _productRepository.GetById(a => a.Id == id, includes);
            return product;
        }

        public void CreateProduct(tblProduct product)
        {
            _productRepository.Add(product);

            SyncSingleProductDocument(product);
        }

        public void UpdateProduct(tblProduct product)
        {
            _productRepository.Update(a => a.Id == product.Id, product);

            product.tblProductDocument = _productDocumentService.GetProductDocument(product.Id);

            SyncSingleProductDocument(product);
        }

        public void DeleteProduct(tblProduct product)
        {
            _productRepository.Delete(product);
        }

        public void SaveProduct()
        {
            _unitOfWork.SaveChanges();
        }

        //make paged products synced with product document
        public void SyncMultipleProductsDocument(int page, int pageSize)
        {
            List<string> includes = new List<string>
            {
                "tblProductDocument"
            };

            IPagedList<tblProduct> allProducts = _productRepository.GetAll(page, pageSize, includes, "", "");

            foreach (tblProduct product in allProducts)
            {
                SyncSingleProductDocument(product);
            }
        }

        //make single product synced with product document
        public void SyncSingleProductDocument(tblProduct product)
        {
            if (product.DocumentAvailable == false && product.tblProductDocument == null)
            {
                bool documentAdded = _productDocumentService.ProcessProductAddedDocument(product);

                if (documentAdded)
                {
                    OnDocumentAddedHandler(product);
                }
                else
                {
                    OnDocumentFailureHandler(product);
                }
            }
            else
            {
                bool documentUpdatedWithNewFile = _productDocumentService.ProcessProductUpdatedDocument(product);

                if (documentUpdatedWithNewFile)
                {
                    OnDocumentUpdatedHandler(product);
                }
                else
                {
                    OnDocumentFailureHandler(product);
                }
            }

        }

        private void OnDocumentFailureHandler(tblProduct product)
        {
            product.DocumentAvailable = false;
        }

        private void OnDocumentUpdatedHandler(tblProduct product)
        {
            product.DocumentAvailable = true;
        }

        private void OnDocumentAddedHandler(tblProduct product)
        {
            product.DocumentAvailable = true;
        }

    }
}
