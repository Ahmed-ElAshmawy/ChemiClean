using ChemiClean.Core.Models;
using ChemiClean.Services.Interfaces;
using ChemiClean.Web.DTOs;
using ChemiClean.Web.Helpers;
using PagedList;
using System;
using System.Web.Mvc;

namespace ChemiClean.Web.Controllers
{
    public class ProductController : Controller
    {
        private readonly IProductService _productService;
        private readonly IUrlFileService _urlFileService;

        public ProductController(IProductService productService, IUrlFileService urlFileService)
        {
            _productService = productService;
            _urlFileService = urlFileService;
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ProductsGridDataPartial(int? page)
        {
            int pageSize = int.Parse(AppSettingsHelper.GetValue("ProductPageSize"));
            int pageNumber = page ?? 1;

            IPagedList<tblProduct> products = _productService.GetAll(pageNumber, pageSize);

            int productsWithDocumentAvailableCount = _productService.GetAllByExpression(a => a.DocumentAvailable == true).Count;

            int productsWithOutDocumentAvailableCount = _productService.GetAllByExpression(a => a.DocumentAvailable == false).Count;

            ViewBag.DocumentAvailableCount = productsWithDocumentAvailableCount;
            ViewBag.DocumentNotAvailableCount = productsWithOutDocumentAvailableCount;

            return PartialView("_ProductsGridData", products);
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(tblProduct product)
        {
            if (ModelState.IsValid)
            {
                _productService.CreateProduct(product);
                _productService.SaveProduct();

                return RedirectToAction("Index");
            }

            return View(product);
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            tblProduct product = _productService.GetProduct(id);

            if (product == null)
            {
                return HttpNotFound();
            }

            return View(product);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(tblProduct product)
        {
            if (ModelState.IsValid)
            {
                _productService.UpdateProduct(product);
                _productService.SaveProduct();

                return RedirectToAction("Index");
            }

            return View(product);
        }

        [HttpGet]
        public ActionResult SyncProductDocuments(int page, int pageSize)
        {
            ApiResponse apiResponse = new ApiResponse();

            try
            {
                _productService.SyncMultipleProductsDocument(page, pageSize);
                _productService.SaveProduct();
                apiResponse.Success = true;
            }
            catch (Exception ex)
            {
                apiResponse.Success = false;
            }

            return Json(apiResponse, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult SyncSingleProductDocument(int id)
        {
            ApiResponse apiResponse = new ApiResponse();

            try
            {
                tblProduct product = _productService.GetProduct(id);
                bool urlExists = _urlFileService.URLExists(product.Url);

                if (urlExists == false)
                {
                    apiResponse.Success = false;
                    return Json(apiResponse, JsonRequestBehavior.AllowGet);
                }

                _productService.SyncSingleProductDocument(product);
                _productService.SaveProduct();
                apiResponse.Success = true;
            }
            catch (Exception ex)
            {
                apiResponse.Success = false;
            }

            return Json(apiResponse, JsonRequestBehavior.AllowGet);
        }
    }
}