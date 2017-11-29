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
    public class c_hoa_donADController : Controller
    {
        private BESTBOOKVNEntities3 db = new BESTBOOKVNEntities3();

        // GET: /admin/c_hoa_donAD/
        public ActionResult Index()
        {
            return View(db.hoa_don.ToList());
        }

        // GET: /admin/c_hoa_donAD/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            hoa_don hoa_don = db.hoa_don.Find(id);
            if (hoa_don == null)
            {
                return HttpNotFound();
            }
            return View(hoa_don);
        }

        // GET: /admin/c_hoa_donAD/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /admin/c_hoa_donAD/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="ma_hoa_don,ma_khach_hang,ngay_dat,tong_tien,ghi_chu,tinh_trang")] hoa_don hoa_don)
        {
            if (ModelState.IsValid)
            {
                db.hoa_don.Add(hoa_don);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(hoa_don);
        }

        // GET: /admin/c_hoa_donAD/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            hoa_don hoa_don = db.hoa_don.Find(id);
            if (hoa_don == null)
            {
                return HttpNotFound();
            }
            return View(hoa_don);
        }

        // POST: /admin/c_hoa_donAD/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="ma_hoa_don,ma_khach_hang,ngay_dat,tong_tien,ghi_chu,tinh_trang")] hoa_don hoa_don)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hoa_don).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(hoa_don);
        }

        // GET: /admin/c_hoa_donAD/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            hoa_don hoa_don = db.hoa_don.Find(id);
            if (hoa_don == null)
            {
                return HttpNotFound();
            }
            return View(hoa_don);
        }

        // POST: /admin/c_hoa_donAD/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            hoa_don hoa_don = db.hoa_don.Find(id);
            db.hoa_don.Remove(hoa_don);
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
