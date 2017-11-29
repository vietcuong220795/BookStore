using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BookStore.Models;

namespace BookStore.Areas.admin.Controllers
{
    public class c_loai_san_phamADController : Controller
    {
        private BESTBOOKVNEntities3 db = new BESTBOOKVNEntities3();

        // GET: /admin/c_loai_san_phamAD/
        public ActionResult Index()
        {
            return View(db.loai_san_pham.ToList());
        }

        // GET: /admin/c_loai_san_phamAD/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            loai_san_pham loai_san_pham = db.loai_san_pham.Find(id);
            if (loai_san_pham == null)
            {
                return HttpNotFound();
            }
            return View(loai_san_pham);
        }

        // GET: /admin/c_loai_san_phamAD/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /admin/c_loai_san_phamAD/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="ma_loai,ten_loai,mo_ta,hinh")] loai_san_pham loai_san_pham)
        {
            if (ModelState.IsValid)
            {
                db.loai_san_pham.Add(loai_san_pham);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(loai_san_pham);
        }

        // GET: /admin/c_loai_san_phamAD/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            loai_san_pham loai_san_pham = db.loai_san_pham.Find(id);
            if (loai_san_pham == null)
            {
                return HttpNotFound();
            }
            return View(loai_san_pham);
        }

        // POST: /admin/c_loai_san_phamAD/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="ma_loai,ten_loai,mo_ta,hinh")] loai_san_pham loai_san_pham)
        {
            if (ModelState.IsValid)
            {
                db.Entry(loai_san_pham).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(loai_san_pham);
        }

        // GET: /admin/c_loai_san_phamAD/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            loai_san_pham loai_san_pham = db.loai_san_pham.Find(id);
            if (loai_san_pham == null)
            {
                return HttpNotFound();
            }
            return View(loai_san_pham);
        }

        // POST: /admin/c_loai_san_phamAD/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            loai_san_pham loai_san_pham = db.loai_san_pham.Find(id);
            db.loai_san_pham.Remove(loai_san_pham);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
