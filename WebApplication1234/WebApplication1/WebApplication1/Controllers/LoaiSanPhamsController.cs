using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class LoaiSanPhamsController : Controller
    {
        private dpappEntities db = new dpappEntities();

        // GET: /LoaiSanPhams/
        public ActionResult Index()
        {
            return View(db.LoaiSanPhams.ToList());
        }

        // GET: /LoaiSanPhams/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiSanPham loaiSanPham = db.LoaiSanPhams.Find(id);
            if (loaiSanPham == null)
            {
                return HttpNotFound();
            }
            return View(loaiSanPham);
        }

        // GET: /LoaiSanPhams/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /LoaiSanPhams/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "Id,Ten,IdCha")] LoaiSanPham loaiSanPham)
        {
            if (ModelState.IsValid)
            {
                db.LoaiSanPhams.Add(loaiSanPham);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(loaiSanPham);
        }

        // GET: /LoaiSanPhams/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiSanPham loaiSanPham = db.LoaiSanPhams.Find(id);
            if (loaiSanPham == null)
            {
                return HttpNotFound();
            }
            return View(loaiSanPham);
        }

        // POST: /LoaiSanPhams/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "Id,Ten,IdCha")] LoaiSanPham loaiSanPham)
        {
            if (ModelState.IsValid)
            {
                db.Entry(loaiSanPham).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(loaiSanPham);
        }

        // GET: /LoaiSanPhams/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiSanPham loaiSanPham = db.LoaiSanPhams.Find(id);
            if (loaiSanPham == null)
            {
                return HttpNotFound();
            }
            return View(loaiSanPham);
        }

        // POST: /LoaiSanPhams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LoaiSanPham loaiSanPham = db.LoaiSanPhams.Find(id);
            db.LoaiSanPhams.Remove(loaiSanPham);
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
        public ActionResult SelectParent()
        {
            var data = (from d in db.LoaiSanPhams orderby d.Ten where d.IdCha == null select d).ToList();
            return PartialView(data);
        }
        public ActionResult SelectChild(int id)
        {
            var data = (from d in db.LoaiSanPhams orderby d.Ten where d.IdCha == id select d).ToList();
            return PartialView("SelectParent", data);
        }

        public string LoaiSanPhamById(int id)
        {
            var data = db.LoaiSanPhams.Where(m => m.Id == id).FirstOrDefault();
            return data.Ten;
        }
        public string LoaiSanPhamByIdSanPham(int id)
        {
            var data = (from l in db.LoaiSanPhams
                        join s in db.SanPhams on l.Id equals s.IdLoai
                        where s.Id == id
                        select l).FirstOrDefault();
            return data.Ten;
        }
        public ActionResult ListParent()
        {
            var data = (from d in db.LoaiSanPhams orderby d.Ten where d.IdCha == null select d).ToList();
            return PartialView(data);
        }
        public ActionResult ListChild(int id)
        {
            var data = (from d in db.LoaiSanPhams orderby d.Ten where d.IdCha == id select d).ToList();
            return PartialView("ListParent", data);
        }
    }
}
