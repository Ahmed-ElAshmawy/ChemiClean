using Autofac;
using Autofac.Integration.Mvc;
using ChemiClean.Core.Models;
using ChemiClean.Repository;
using ChemiClean.Repository.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ChemiClean.Web.Configurations
{
    public static class IOCConfiguration
    {
        //Configure Dependency Resolver container
        public static void ConfigureServices()
        {
            var builder = new ContainerBuilder();

            builder.RegisterControllers(typeof(MvcApplication).Assembly);

            builder.RegisterType<UnitOfWork>().As<IUnitOfWork>().InstancePerRequest();

            builder.RegisterType<ChemiCleanDBEntities>().InstancePerRequest();

            //Register all reflected Repositories As Implemented Interfaces eg: builder.RegisterType<ProductRepository>().As<IProductRepository>().InstancePerRequest();
            builder.RegisterAssemblyTypes(System.Reflection.Assembly.Load("ChemiClean.Repository"))
                           .Where(t => t.Name.EndsWith("Repository"))
                           .AsImplementedInterfaces();

            //Register all reflected Services As Implemented Interfaces eg: builder.RegisterType<ProductService>().As<IProductService>().InstancePerRequest();
            builder.RegisterAssemblyTypes(System.Reflection.Assembly.Load("ChemiClean.Services"))
                           .Where(t => t.Name.EndsWith("Service"))
                           .AsImplementedInterfaces();

            IContainer container = builder.Build();
            DependencyResolver.SetResolver(new AutofacDependencyResolver(container));
        }
    }
}