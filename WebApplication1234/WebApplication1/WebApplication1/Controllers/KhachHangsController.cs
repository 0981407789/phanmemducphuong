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
    public class KhachHangsController : Controller
    {
        private dpappEntities db = new dpappEntities();

        // GET: /KhachHangs/
        public ActionResult Index()
        {
            return View(db.KhachHangs.ToList());
        }

        // GET: /KhachHangs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KhachHang khachHang = db.KhachHangs.Find(id);
            if (khachHang == null)
            {
                return HttpNotFound();
            }
            return View(khachHang);
        }

        // GET: /KhachHangs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /KhachHangs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "Id,Ten,DiaChi,IdXa,SoDienThoai,Email,NgaySinh,CMND")] KhachHang khachHang)
        {
            if (ModelState.IsValid)
            {
                db.KhachHangs.Add(khachHang);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(khachHang);
        }

        // GET: /KhachHangs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KhachHang khachHang = db.KhachHangs.Find(id);
            if (khachHang == null)
            {
                return HttpNotFound();
            }
            return View(khachHang);
        }

        // POST: /KhachHangs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "Id,Ten,DiaChi,IdXa,SoDienThoai,Email,NgaySinh,CMND")] KhachHang khachHang)
        {
            if (ModelState.IsValid)
            {
                db.Entry(khachHang).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(khachHang);
        }

        // GET: /KhachHangs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KhachHang khachHang = db.KhachHangs.Find(id);
            if (khachHang == null)
            {
                return HttpNotFound();
            }
            return View(khachHang);
        }

        // POST: /KhachHangs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            KhachHang khachHang = db.KhachHangs.Find(id);
            db.KhachHangs.Remove(khachHang);
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
        public ActionResult AddCustomer()
        {
            return PartialView();
        }
        [HttpPost]
        public string AddCustomer(KhachHang model)
        {
            db.KhachHangs.Add(model);
            db.SaveChanges();
            var json = new JavaScriptSerializer().Serialize(model);
            return json;
        }
        public ActionResult AutoCompleteCustomer(string q)
        {
            if (string.IsNullOrEmpty(q))
            {
                return View();
            }
            var data = (from k in db.KhachHangs
                        where k.Ten.Contains(q) || k.SoDienThoai.Contains(q)
                        select k).Take(10).ToList();
            return PartialView(data);
        }
        public ActionResult FullSearch()
        {
            return PartialView();
        }
        [HttpPost]
        public ActionResult FullSearchResult()
        {
            string q = Request["q"];
            if (string.IsNullOrEmpty(q))
            {
                return PartialView();
            }
            var data = (from k in db.KhachHangs
                        where k.Ten.Contains(q) || k.SoDienThoai.Contains(q)
                        select k).ToList();
            return PartialView(data);
        }
        public ActionResult GetCustomerById(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KhachHang khachHang = db.KhachHangs.Find(id);
            if (khachHang == null)
            {
                return HttpNotFound();
            }
            return PartialView(khachHang);
        }
        [HttpGet]
        public ActionResult SearchCustomer(string q)
        {
            ViewBag.q = q;
            if (!string.IsNullOrEmpty(q))
            {
                var data = (from k in db.KhachHangs
                            join x in db.Xas on k.IdXa equals x.Id
                            where k.Ten.Contains(q) || k.SoDienThoai.Contains(q)
                            || k.DiaChi.Contains(q) || x.Ten.Contains(q) || k.CMND.Contains(q)
                            orderby k.Id descending
                            select k).ToList();
                return View(data);
            }
            else
            {
                return View();
            }
        }
        public ActionResult ChiTietKh(int id)
        {
            var data = (from k in db.KhachHangs where k.Id == id select k).FirstOrDefault();
            return View(data);
        }
        public ActionResult DonHangTheoKh(int id)
        {
            var data = (from d in db.DonHangs orderby d.Id descending where d.KhachHang == id select d).ToList();
            return PartialView(data);
        }
        public ActionResult ChiTietDonHang(int id)
        {
            var data = (from d in db.ChiTietDonHangs where d.IdBanHang == id select d).ToList();
            var donhangtheokh = (from d in db.DonHangs where d.Id == id select d).FirstOrDefault();
            ViewBag.lai = donhangtheokh.Lai;
            ViewBag.conno = donhangtheokh.ConNo;
            ViewBag.datra = donhangtheokh.DaTra;
            ViewBag.totalmoney = donhangtheokh.SoTien;
            ViewBag.tongnhap = donhangtheokh.TongNhap;
            return View(data);
        }
        public ActionResult CustomerPay(int id)
        {
            var donhang = (from dh in db.DonHangs where dh.Id == id select dh).FirstOrDefault();
            return PartialView(donhang);
        }
        [HttpPost]
        public int CustomerPay(FormCollection forms)
        {
            string ngaytra = forms.Get("ngaytra");
            string sotien = forms.Get("sotien");
            string conno = forms.Get("conno");
            string phikhac = forms.Get("phikhac");
            string nguoinhan = forms.Get("nguoinhan");
            string iddonhang = forms.Get("iddonhang");
            string ghichu = forms.Get("ghichu");

            KhachHangTraNo kh = new KhachHangTraNo();
            kh.NgayTra = string.IsNullOrEmpty(ngaytra) ? DateTime.Now : DateTime.ParseExact(ngaytra, "dd/MM/yyyy", null);
            kh.SoTien = string.IsNullOrEmpty(sotien) ? 0 : double.Parse(sotien);
            kh.ConNo = string.IsNullOrEmpty(conno) ? 0 : double.Parse(conno);
            kh.PhiKhac = string.IsNullOrEmpty(phikhac) ? 0 : double.Parse(phikhac);
            kh.NguoiNhan = nguoinhan;
            kh.IdDonHang = int.Parse(iddonhang);
            kh.GhiChu = ghichu;
            db.KhachHangTraNoes.Add(kh);

            var donhang = (from dh in db.DonHangs where dh.Id == kh.IdDonHang select dh).FirstOrDefault();
            donhang.ConNo = string.IsNullOrEmpty(conno) ? 0 : double.Parse(conno);
            donhang.DaTra = donhang.DaTra + kh.SoTien;
            donhang.NgayTinhLai = kh.NgayTra;
            db.SaveChanges();
            return donhang.Id;
        }
        public ActionResult CustomerPayHistory(int id)
        {
            var data = (from k in db.KhachHangTraNoes orderby k.Id descending where k.IdDonHang == id select k).ToList();
            return PartialView(data);
        }
        public ActionResult CustomerByIdReport(int id)
        {
            var data = (from k in db.KhachHangs where k.Id == id select k).FirstOrDefault();
            return PartialView(data);
        }
        public ActionResult GetCustomerByOrder(int id)
        {
            var data = (from c in db.KhachHangs
                        join d in db.DonHangs on c.Id
                        equals d.KhachHang
                        where d.Id == id
                        select c).FirstOrDefault();

            return PartialView("CustomerByIdReport", data);
        }
        public ActionResult GetCustomerByProductId(int id)
        {
            var data = (from c in db.KhachHangs
                        join d in db.DonHangs on c.Id equals d.KhachHang
                        join ct in db.ChiTietDonHangs on d.Id equals ct.IdBanHang
                        where ct.IdSanPham == id
                        select c).FirstOrDefault();
            return PartialView(data);
        }
        [HttpPost]
        public ActionResult ChiTietKh([Bind(Include = "Id,Ten,DiaChi,IdXa,SoDienThoai,Email,NgaySinh,CMND")] KhachHang data)
        {
            db.Entry(data).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("ChiTietKh", new { id = data.Id });
        }
    }
}
