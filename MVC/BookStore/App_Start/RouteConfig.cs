using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace BookStore
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "san_pham",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "c_san_pham", action = "Index", id = UrlParameter.Optional }
            );
          
        }
    }
}
