using ChemiClean.Core.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace ChemiClean.Services.Interfaces
{
    public interface IProductService
    {
        //get all products
        List<tblProduct> GetAll();

        //get all products paged
        IPagedList<tblProduct> GetAll(int PageNumber, int PageSize, string SortBy = "", string SortDirection = "");

        //get all products paged and filtered
        IPagedList<tblProduct> GetAllPagedByExpression(int PageNumber, int PageSize, Expression<Func<tblProduct, bool>> filter = null, string SortBy = "", string SortDirection = "");

        //get many products filtered
        List<tblProduct> GetAllByExpression(Expression<Func<tblProduct, bool>> where);

        //Get product 
        tblProduct GetProduct(int id);

        //Add product 
        void CreateProduct(tblProduct product);

        //Update product 
        void UpdateProduct(tblProduct product);

        //Remove product 
        void DeleteProduct(tblProduct product);

        //logic to make paged products synced with product document
        void SyncMultipleProductsDocument(int page, int pageSize);

        //logic to make single product synced with product document
        void SyncSingleProductDocument(tblProduct product);

        //Save changes
        void SaveProduct();
    }
}
