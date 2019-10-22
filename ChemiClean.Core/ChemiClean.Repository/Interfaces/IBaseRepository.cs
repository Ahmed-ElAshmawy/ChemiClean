using PagedList;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace ChemiClean.Repository.Interfaces
{
    public interface IBaseRepository<T> where T : class
    {
        // Gets all entities of type T
        IEnumerable<T> GetAll();

        //Gets all entities with paging with type T
        IPagedList<T> GetAll(int PageNumber, int PageSize, List<string> includes, string SortBy, string SortDirection);

        //Gets Filtered Entities with paging and sorting
        IPagedList<T> GetAll(int PageNumber, int PageSize, List<string> includes, Expression<Func<T, bool>> filter = null, string SortBy = "", string SortDirection = "");

        // Get an entity by int using delegate
        T GetById(Expression<Func<T, bool>> where, List<string> includes = null);

        // Get an entity using delegate
        T GetSingleByExpression(Expression<Func<T, bool>> where);

        // Gets entities using delegate
        IEnumerable<T> GetMany(List<string> includes, Expression<Func<T, bool>> where = null);

        // Marks an entity as new
        T Add(T entity);

        // Marks an entity as modified
        void Update(Expression<Func<T, bool>> where, T entity);

        // Marks an entity to be removed
        void Delete(T entity);

        // Marks many entities to be removed
        void Delete(Expression<Func<T, bool>> where);
    }
}