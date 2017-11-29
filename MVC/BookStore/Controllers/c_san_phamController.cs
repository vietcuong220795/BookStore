using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BookStore.Models;
using PagedList.Mvc;
using PagedList;

namespace BookStore.Controllers
{
    public class c_san_phamController : Controller
    {
        private BESTBOOKVNEntities3 db = new BESTBOOKVNEntities3();

        // GET: /c_san_pham/
        
        public ActionResult Index(int? page)
        {
           // return View(db.san_pham.ToList());

            int pageSize=8;
            int pageNumber=(page ?? 1);
           
            return View(db.v_san_pham_moi.ToList().ToPagedList(pageNumber,pageSize));
        }

        // GET: /c_san_pham/Details/5

        public ActionResult tieu_thuyet(int? page)
        {
            // return View(db.san_pham.ToList());

            int pageSize = 4;
            int pageNumber = (page ?? 1);
            return View(db.v_tieu_thuyet.ToList().OrderBy(n => n.don_gia).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult tieng_anh(int? page)
        {
            // return View(db.san_pham.ToList());

            int pageSize = 4;
            int pageNumber = (page ?? 1);
            return View(db.v_tieng_anh.ToList().OrderBy(n => n.don_gia).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult manga_comic(int? page)
        {
            // return View(db.san_pham.ToList());

            int pageSize = 4;
            int pageNumber = (page ?? 1);
            return View(db.v_manga_comic.ToList().OrderBy(n => n.don_gia).ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            san_pham san_pham = db.san_pham.Find(id);
            if (san_pham == null)
            {
                return HttpNotFound();
            }
            return View(san_pham);
        }
    }
}
