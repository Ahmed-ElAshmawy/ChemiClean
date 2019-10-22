using ChemiClean.Core.Models;
using ChemiClean.Repository.Interfaces;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;

namespace ChemiClean.Repository.Repositories
{
    public abstract class BaseRepository<T> : IBaseRepository<T> where T : class
    {
        private readonly ChemiCleanDBEntities _dbContext;
        private readonly DbSet<T> dbSet;

        public BaseRepository(ChemiCleanDBEntities dbContext)
        {
            _dbContext = dbContext;
            dbSet = dbContext.Set<T>();
        }

        #region Implementation

        // get all records
        public virtual IEnumerable<T> GetAll()
        {
            return dbSet.ToList();
        }

        // get record by id, while including navigation properties as an option
        public virtual T GetById(Expression<Func<T, bool>> where, List<string> includes = null)
        {
            IQueryable<T> Query = dbSet.AsQueryable<T>();

            if (includes != null)
            {
                foreach (string include in includes)
                {
                    Query = Query.Include(include);
                }
            }

            if (where != null)
            {
                Query = Query.Where(where);
            }

            return Query.FirstOrDefault();
        }

        // get all records paged, while including navigation properties as an option
        public virtual IPagedList<T> GetAll(int PageNumber, int PageSize, List<string> includes, string SortBy = "", string SortDirection = "")
        {
            IQueryable<T> Query = dbSet.AsQueryable<T>();

            if (includes != null)
            {
                foreach (string include in includes)
                {
                    Query = Query.Include(include);
                }
            }

            string SortByParam = "Id";
            string SortDirectionParam = "ASC";

            if (!string.IsNullOrEmpty(SortBy))
            {
                SortByParam = SortBy;
            }
            if (!string.IsNullOrEmpty(SortDirection))
            {
                SortDirectionParam = SortDirection;
            }

            Expression parent = GetParentEntity<T>(SortByParam);

            Type typeToConvertTo = parent.Type;

            Query = BuilSortingQuery(Query, SortByParam, SortDirectionParam, typeToConvertTo);

            return Query.ToPagedList(PageNumber, PageSize);
        }

        // get all records paged and filtered, while including navigation properties as an option
        public virtual IPagedList<T> GetAll(int PageNumber, int PageSize, List<string> includes, Expression<Func<T, bool>> filter = null, string SortBy = "", string SortDirection = "")
        {
            IQueryable<T> Query = dbSet.AsQueryable<T>();

            foreach (string include in includes)
            {
                Query = Query.Include(include);
            }

            string SortByParam = "Id";
            string SortDirectionParam = "ASC";

            if (!string.IsNullOrEmpty(SortBy))
            {
                SortByParam = SortBy;
            }

            if (!string.IsNullOrEmpty(SortDirection))
            {
                SortDirectionParam = SortDirection;
            }

            if (filter != null)
            {
                Query = Query.Where(filter);
            }

            Expression parent = GetParentEntity<T>(SortByParam);

            Type typeToConvertTo = parent.Type;

            Query = BuilSortingQuery(Query, SortByParam, SortDirectionParam, typeToConvertTo);

            return Query.ToPagedList(PageNumber, PageSize);
        }

        // get many records filtered, while including navigation properties as an option
        public virtual IEnumerable<T> GetMany(List<string> includes, Expression<Func<T, bool>> where = null)
        {
            IQueryable<T> Query = dbSet.AsQueryable<T>();

            if (includes != null)
            {
                foreach (string include in includes)
                {
                    Query = Query.Include(include);
                }
            }

            string SortByParam = "Id";
            string SortDirectionParam = "ASC";

            if (where != null)
            {
                Query = Query.Where(where);
            }

            Expression parent = GetParentEntity<T>(SortByParam);

            Type typeToConvertTo = parent.Type;

            Query = BuilSortingQuery(Query, SortByParam, SortDirectionParam, typeToConvertTo);

            return Query.ToList();
        }

        // get single record filtered
        public T GetSingleByExpression(Expression<Func<T, bool>> where)
        {
            return dbSet.Where(where).FirstOrDefault();
        }

        //add entity to dbSet
        public virtual T Add(T entity)
        {
            return dbSet.Add(entity);
        }

        //mark entity as modified
        public virtual void Update(Expression<Func<T, bool>> where, T entity)
        {
            var local = GetById(where);

            if (local != null)
            {
                _dbContext.Entry(local).State = EntityState.Detached;
            }

            dbSet.Attach(entity);
            _dbContext.Entry(entity).State = EntityState.Modified;
        }

        //remove entity from dbSet
        public virtual void Delete(T entity)
        {
            dbSet.Remove(entity);
        }

        //remove many entities from dbSet
        public virtual void Delete(Expression<Func<T, bool>> where)
        {
            IEnumerable<T> objects = dbSet.Where<T>(where).AsEnumerable();
            dbSet.RemoveRange(objects);
        }

        #endregion

        #region Sorting Generic Query

        private IQueryable<T> BuilSortingQuery(IQueryable<T> Query, string SortByParam, string SortDirectionParam, Type typeToConvertTo)
        {
            switch (Type.GetTypeCode(typeToConvertTo))
            {
                case TypeCode.Int32:
                    if (SortDirectionParam == "ASC")
                    {
                        Query = Query.OrderBy(GetExpression<T, int>(SortByParam));
                    }
                    else
                    {
                        Query = Query.OrderByDescending(GetExpression<T, int>(SortByParam));
                    }
                    break;
                case TypeCode.Boolean:
                    if (SortDirectionParam == "ASC")
                    {
                        Query = Query.OrderBy(GetExpression<T, bool>(SortByParam));
                    }
                    else
                    {
                        Query = Query.OrderByDescending(GetExpression<T, bool>(SortByParam));
                    }
                    break;
                case TypeCode.Double:
                    if (SortDirectionParam == "ASC")
                    {
                        Query = Query.OrderBy(GetExpression<T, Double>(SortByParam));
                    }
                    else
                    {
                        Query = Query.OrderByDescending(GetExpression<T, Double>(SortByParam));
                    }
                    break;
                case TypeCode.Decimal:
                    if (SortDirectionParam == "ASC")
                    {
                        Query = Query.OrderBy(GetExpression<T, decimal>(SortByParam));
                    }
                    else
                    {
                        Query = Query.OrderByDescending(GetExpression<T, decimal>(SortByParam));
                    }
                    break;
                case TypeCode.DateTime:
                    if (SortDirectionParam == "ASC")
                    {
                        Query = Query.OrderBy(GetExpression<T, DateTime>(SortByParam));
                    }
                    else
                    {
                        Query = Query.OrderByDescending(GetExpression<T, DateTime>(SortByParam));
                    }
                    break;
                case TypeCode.Object://mainly for nullable datetime
                    if (SortDirectionParam == "ASC")
                    {
                        Query = Query.OrderBy(GetExpression<T, DateTime?>(SortByParam));
                    }
                    else
                    {
                        Query = Query.OrderByDescending(GetExpression<T, DateTime?>(SortByParam));
                    }
                    break;
                default:
                    if (SortDirectionParam == "ASC")
                    {
                        Query = Query.OrderBy(GetExpression<T, string>(SortByParam));
                    }
                    else
                    {
                        Query = Query.OrderByDescending(GetExpression<T, string>(SortByParam));
                    }
                    break;
            }
            return Query;
        }

        private Expression<Func<TEntity, TResult>> GetExpression<TEntity, TResult>(string prop)
        {
            var param = Expression.Parameter(typeof(TEntity), "p");
            var parts = prop.Split('.');

            Expression parent = parts.Aggregate<string, Expression>(param, Expression.Property);
            Expression conversion = Expression.Convert(parent, parent.Type);

            return Expression.Lambda<Func<TEntity, TResult>>(conversion, param);

        }

        private Expression GetParentEntity<TEntity>(string prop)
        {
            var param = Expression.Parameter(typeof(TEntity), "p");
            var parts = prop.Split('.');

            Expression parent = parts.Aggregate<string, Expression>(param, Expression.Property);
            return parent;
        }

        #endregion
    }
}
