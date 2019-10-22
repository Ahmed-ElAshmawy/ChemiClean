using ChemiClean.Core.Models;
using ChemiClean.Repository.Interfaces;
using ChemiClean.Services.Interfaces;
using System;
using System.Collections.Generic;

namespace ChemiClean.Services.Services
{
    public class ProductDocumentService : IProductDocumentService
    {
        private readonly IProductDocumentRepository _productDocumentRepository;
        private readonly IUrlFileService _urlFileService;
        private readonly IUnitOfWork _unitOfWork;

        public ProductDocumentService(IProductDocumentRepository productDocumentRepository, IUrlFileService urlFileService, IUnitOfWork unitOfWork)
        {
            _productDocumentRepository = productDocumentRepository;
            _urlFileService = urlFileService;
            _unitOfWork = unitOfWork;
        }

        public tblProductDocument GetProductDocument(int id)
        {
            List<string> includes = new List<string>
            {
                "tblProduct"
            };

            tblProductDocument productDocument = _productDocumentRepository.GetById(a => a.ProductId == id, includes);
            return productDocument;
        }

        public void CreateProductDocument(tblProductDocument productDocument)
        {
            _productDocumentRepository.Add(productDocument);
        }

        public void UpdateProductDocument(tblProductDocument productDocument)
        {
            _productDocumentRepository.Update(a => a.ProductId == productDocument.ProductId, productDocument);
        }

        public void DeleteProductDocument(tblProductDocument productDocument)
        {
            _productDocumentRepository.Delete(productDocument);
        }

        public void SaveProductDocument()
        {
            _unitOfWork.SaveChanges();
        }

        public bool ProcessProductAddedDocument(tblProduct product)
        {
            string url = product.Url;
            bool urlExists = _urlFileService.URLExists(url);

            if (urlExists)
            {
                byte[] urlFileData = _urlFileService.ReadUrlFileData(url);

                tblProductDocument productDocument = new tblProductDocument
                {
                    tblProduct = product,
                    DocumentContent = urlFileData,
                    LastModifiedDate = DateTime.Today
                };

                _productDocumentRepository.Add(productDocument);
            }

            return urlExists;
        }

        public bool ProcessProductUpdatedDocument(tblProduct product)
        {
            string url = product.Url;
            bool urlExists = _urlFileService.URLExists(url);

            byte[] urlFileData = new byte[] { };

            if (urlExists)
            {
                urlFileData = _urlFileService.ReadUrlFileData(url);
            }

            tblProductDocument productDocument = _productDocumentRepository.GetById(a => a.ProductId == product.Id);
            productDocument.DocumentContent = urlFileData;
            productDocument.LastModifiedDate = DateTime.Today;
            productDocument.tblProduct = null;

            _productDocumentRepository.Update(a => a.ProductId == productDocument.ProductId, productDocument);

            return urlExists;
        }
    }
}
