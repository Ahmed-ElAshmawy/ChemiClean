using ChemiClean.Core.Models;
using ChemiClean.Services.Interfaces;
using System.Web.Mvc;

namespace ChemiClean.Web.Controllers
{
    public class ProductDocumentController : Controller
    {
        private readonly IProductDocumentService _productDocumentService;
        private readonly IUrlFileService _urlFileService;

        public ProductDocumentController(IProductDocumentService productDocumentService, IUrlFileService urlFileService)
        {
            _productDocumentService = productDocumentService;
            _urlFileService = urlFileService;
        }

        public ActionResult DownloadDocument(int id)
        {
            tblProductDocument productDocument = _productDocumentService.GetProductDocument(id);

            byte[] fileBytes = productDocument.DocumentContent;
            string fileName = _urlFileService.GetFileName(productDocument.tblProduct.Url);

            return File(fileBytes, System.Net.Mime.MediaTypeNames.Application.Octet, fileName);
        }
    }
}