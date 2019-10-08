using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class XasController : Controller
    {
        private dpappEntities db = new dpappEntities();

        // GET: /Xas/
        public ActionResult Index()
        {
            return View(db.Xas.OrderBy(m => m.Ten).ToList());
        }

        // GET: /Xas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Xa xa = db.Xas.Find(id);
            if (xa == null)
            {
                return HttpNotFound();
            }
            return View(xa);
        }

        // GET: /Xas/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /Xas/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "Id,Ten")] Xa xa)
        {
            if (ModelState.IsValid)
            {
                db.Xas.Add(xa);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(xa);
        }

        // GET: /Xas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Xa xa = db.Xas.Find(id);
            if (xa == null)
            {
                return HttpNotFound();
            }
            return View(xa);
        }

        // POST: /Xas/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "Id,Ten")] Xa xa)
        {
            if (ModelState.IsValid)
            {
                db.Entry(xa).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(xa);
        }

        // GET: /Xas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Xa xa = db.Xas.Find(id);
            if (xa == null)
            {
                return HttpNotFound();
            }
            return View(xa);
        }

        // POST: /Xas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Xa xa = db.Xas.Find(id);
            db.Xas.Remove(xa);
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
        public string GetTenXa(int id)
        {
            var data = (from x in db.Xas where x.Id == id select x).FirstOrDefault();
            return string.IsNullOrEmpty(data.Ten) ? "Không xác định" : data.Ten;
        }
        public ActionResult SelectXa()
        {
            var data = (from x in db.Xas orderby x.Ten select x).ToList();
            return PartialView(data);
        }
    }
}
