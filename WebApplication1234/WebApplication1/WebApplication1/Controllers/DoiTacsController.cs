using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class DoiTacsController : Controller
    {
        private dpappEntities db = new dpappEntities();

        // GET: /DoiTacs/
        public ActionResult Index()
        {
            return View(db.DoiTacs.ToList());
        }

        // GET: /DoiTacs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DoiTac doiTac = db.DoiTacs.Find(id);
            if (doiTac == null)
            {
                return HttpNotFound();
            }
            return View(doiTac);
        }

        // GET: /DoiTacs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /DoiTacs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "Id,Ten,DiaChi,GhiChu,SoDienThoai,SoTaiKhoan,KhachLe")] DoiTac doiTac)
        {
            if (ModelState.IsValid)
            {
                db.DoiTacs.Add(doiTac);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(doiTac);
        }

        // GET: /DoiTacs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DoiTac doiTac = db.DoiTacs.Find(id);
            if (doiTac == null)
            {
                return HttpNotFound();
            }
            return View(doiTac);
        }

        // POST: /DoiTacs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "Id,Ten,DiaChi,GhiChu,SoDienThoai,SoTaiKhoan,KhachLe")] DoiTac doiTac)
        {
            if (ModelState.IsValid)
            {
                db.Entry(doiTac).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(doiTac);
        }

        // GET: /DoiTacs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DoiTac doiTac = db.DoiTacs.Find(id);
            if (doiTac == null)
            {
                return HttpNotFound();
            }
            return View(doiTac);
        }

        // POST: /DoiTacs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DoiTac doiTac = db.DoiTacs.Find(id);
            db.DoiTacs.Remove(doiTac);
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

        public ActionResult AddPartnerDialog()
        {
            return PartialView();
        }
        [HttpPost]
        public string AddPartnerDialog(DoiTac data)
        {
            db.DoiTacs.Add(data);
            db.SaveChanges();
            var json = new JavaScriptSerializer().Serialize(data);
            return json;
        }
        public ActionResult AutoSearchPartner(string q)
        {
            if (string.IsNullOrWhiteSpace(q) || string.IsNullOrWhiteSpace(q))
            {
                return PartialView();
            }
            var data = (from d in db.DoiTacs
                        where d.Ten.Contains(q) || d.SoDienThoai.Contains(q) || d.DiaChi.Contains(q)
                        select d).ToList();
            return PartialView(data);
        }
        public ActionResult SearchDialog()
        {
            return PartialView();
        }
        public ActionResult FullSearchResult(string q)
        {
            if (string.IsNullOrEmpty(q) || string.IsNullOrWhiteSpace(q))
            {
                return PartialView();
            }
            var data = (from d in db.DoiTacs
                        where d.Ten.Contains(q) || d.SoDienThoai.Contains(q) || d.DiaChi.Contains(q)
                        select d).ToList();
            return PartialView(data);
        }
        public string GetNameById(int id)
        {
            string name = (from d in db.DoiTacs where d.Id == id select d.Ten).FirstOrDefault();
            return name;
        }
        public PartialViewResult TraNoNhapHang(int id)
        {
            CuaHangTraNo ch = new CuaHangTraNo();
            ch.IdNhapHang = id;
            return PartialView(ch);
        }
        [HttpPost]
        public string TraNoNhapHang(FormCollection forms, CuaHangTraNo model)
        {
            string id = forms.Get("idnhaphang");
            string ngaytra = forms.Get("ngaytra");
            string sotien = forms.Get("sotien");
            string conno = forms.Get("conno");
            string nguoitra = forms.Get("nguoitra");
            string chungtu = forms.Get("chungtu");
            string phikhac = forms.Get("phikhac");
            string ghichu = forms.Get("ghichu");
            //CuaHangTraNo model = new CuaHangTraNo();
            //model.IdNhapHang = int.Parse(id);
            model.NgayTra = DateTime.ParseExact(ngaytra, "dd/MM/yyyy", null);
            model.SoTienTra = double.Parse(sotien);
            model.ConNo = double.Parse(conno);
            model.PhiKhac = double.Parse(phikhac);
            model.NguoiTra = nguoitra;
            model.ChungTu = chungtu;
            model.GhiChu = ghichu;
            db.CuaHangTraNoes.Add(model);
            db.SaveChanges();

            var nh = (from n in db.NhapHangs where n.Id == model.IdNhapHang select n).FirstOrDefault();
            nh.DaTra += model.SoTienTra;
            nh.ConNo -= model.SoTienTra;
            db.SaveChanges();
            return "";
        }
        public ActionResult ImportPayHistory(int id)
        {
            var data = (from h in db.CuaHangTraNoes orderby h.NgayTra descending where h.IdNhapHang == id select h).ToList();
            return PartialView(data);
        }
        [HttpGet]
        public ActionResult TimKiemDoiTac(string q)
        {
            if (string.IsNullOrEmpty(q) || string.IsNullOrWhiteSpace(q))
            {
                return View();
            }
            var data = (from d in db.DoiTacs
                        where d.Ten.Contains(q) || d.SoDienThoai.Contains(q) || d.DiaChi.Contains(q)
                        select d).ToList();
            return View(data);
        }
        public ActionResult ChiTietDoiTac(int id)
        {
            var data = (from d in db.DoiTacs where d.Id == id select d).FirstOrDefault();
            var totalitem = db.NhapHangs.Where(m => m.DoiTac == id).ToList().Count;
            var totalpage = 0;
            if (totalitem % 30 == 0)
            {
                totalpage = totalitem / 30;
            }
            else
            {
                totalpage = (totalitem / 30) + 1;
            }
            ViewBag.totalpage = totalpage;
            return View(data);
        }
        [HttpGet]
        public ActionResult ReportImport(string f, string t)
        {
            DateTime fromdate = string.IsNullOrEmpty(f) ? DateTime.MinValue : DateTime.ParseExact(f, "dd/MM/yyyy", null);
            DateTime todate = string.IsNullOrEmpty(t) ? DateTime.Now : DateTime.ParseExact(t, "dd/MM/yyyy", null);
            if (!string.IsNullOrEmpty(f) && !string.IsNullOrEmpty(t))
            {
                var data = (from n in db.NhapHangs
                            where n.NgayNhap >= fromdate && n.NgayNhap <= todate
                            orderby n.Id descending
                            select n).ToList();
                return View(data);
            }
            return View();
        }
        public ActionResult ReportPartnerDebt()
        {
            var data = (from n in db.NhapHangs
                        where n.ConNo > 0
                        orderby n.Id descending
                        select n).ToList();
            return View(data);
        }
        [HttpGet]
        public ActionResult ReportPartnerPay(string f, string t)
        {
            DateTime fromdate = string.IsNullOrEmpty(f) ? DateTime.MinValue : DateTime.ParseExact(f, "dd/MM/yyyy", null);
            DateTime todate = string.IsNullOrEmpty(t) ? DateTime.Now : DateTime.ParseExact(t, "dd/MM/yyyy", null);

            if (!string.IsNullOrEmpty(f) && !string.IsNullOrEmpty(t))
            {
                var data = (from n in db.CuaHangTraNoes
                            where n.NgayTra >= fromdate && n.NgayTra <= todate
                            orderby n.Id descending
                            select n).ToList();
                ViewBag.f = f;
                ViewBag.t = t;
                return View(data);
            }

            return View();
        }
        public string DoiTacTheoIdNhapHang(int id)
        {
            var data = (from l in db.DoiTacs
                        join n in db.NhapHangs on l.Id equals n.DoiTac
                        where n.Id == id
                        select l.Ten).FirstOrDefault();
            return data;
        }
        public ActionResult DonHangDoiTacTheoSoNo()
        {
            return PartialView();
        }
        public string NgayNhapTheoId(int id)
        {
            DateTime data = (DateTime)(from n in db.NhapHangs where n.Id == id select n.NgayNhap).FirstOrDefault();
            return data.ToString("dd/MM/yyyy");
        }
    }
}
