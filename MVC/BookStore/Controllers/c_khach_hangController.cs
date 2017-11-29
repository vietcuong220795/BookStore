using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BookStore.Models;
using System.Data.Sql;
using System.Data.SqlClient;

namespace BookStore.Controllers
{
    public class c_khach_hangController : Controller
    {
        private BESTBOOKVNEntities3 db = new BESTBOOKVNEntities3();

        // GET: /c_khach_hang/
        public ActionResult dang_nhap()
        {
            return View(db.khach_hang.ToList());
        }
    
       

        [HttpPost]
        public ActionResult dang_nhap(string username, string pass)
        {
            //string name = Request.Form["username"];
            //string password = Request.Form["mat_khau"];
            ViewBag.Mess = username;
            return RedirectToAction("Index","c_san_pham");
            //var kh = db.khach_hang.ToList();
            //var kh = db.sp_dang_nhap(usr, pass);
            //if (kh != null)
            //{
            //    foreach (var item in kh)
            //    {

            //        {
            //            Session["ma_khach_hang"] = item[0];
            //            ViewBag.thongbao = "Chao" + item.ten_khach_hang + "Vui long nhan nut tiep...";
            //        }
            //    }
            //}


            //if (Session["ma_khach_hang"] != null)
            //{
            //    return RedirectToAction("Create", "c_khach_hang");
            //}
            //else return RedirectToAction("Index", "c_khach_hang");

            
        }
        [HttpPost]
      
        // GET: /c_khach_hang/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            khach_hang khach_hang = db.khach_hang.Find(id);
            if (khach_hang == null)
            {
                return HttpNotFound();
            }
            return View(khach_hang);
        }

        // GET: /c_khach_hang/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /c_khach_hang/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="ma_khach_hang,ten_khach_hang,phai,dia_chi,dien_thoai,email,ghi_chu")] khach_hang khach_hang)
        {
            if (ModelState.IsValid)
            {
                db.khach_hang.Add(khach_hang);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(khach_hang);
        }

        // GET: /c_khach_hang/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            khach_hang khach_hang = db.khach_hang.Find(id);
            if (khach_hang == null)
            {
                return HttpNotFound();
            }
            return View(khach_hang);
        }

        // POST: /c_khach_hang/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="ma_khach_hang,ten_khach_hang,phai,dia_chi,dien_thoai,email,ghi_chu")] khach_hang khach_hang)
        {
            if (ModelState.IsValid)
            {
                db.Entry(khach_hang).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(khach_hang);
        }

        // GET: /c_khach_hang/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            khach_hang khach_hang = db.khach_hang.Find(id);
            if (khach_hang == null)
            {
                return HttpNotFound();
            }
            return View(khach_hang);
        }

        // POST: /c_khach_hang/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            khach_hang khach_hang = db.khach_hang.Find(id);
            db.khach_hang.Remove(khach_hang);
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
