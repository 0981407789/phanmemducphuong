using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class BanHangController : Controller
    {
        private dpappEntities db = new dpappEntities();
        //
        // GET: /BanHang/
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult CreateOrder()
        {
            return View();
        }
        public string AddOrderDetail(int id)
        {
            List<ChiTietDonHang> list = (List<ChiTietDonHang>)Session["OrderDetail"];
            var pro = (from p in db.SanPhams where p.Id == id select p).FirstOrDefault();
            if (list == null)
            {
                list = new List<ChiTietDonHang>();

                ChiTietDonHang ct = new ChiTietDonHang();
                ct.IdSanPham = id;
                ct.SoLuong = 1;
                ct.GiaBan = pro.GiaBanDeXuat;
                ct.TongTien = pro.GiaBanDeXuat;
                ct.TongNhap = pro.GiaNhap;
                ct.Lai = ct.TongTien - ct.TongNhap;
                list.Add(ct);
                Session["OrderDetail"] = list;
                ReturnMessage ms1 = new ReturnMessage();
                ms1.code = "1";
                ms1.message = "Thêm 1 sản phẩm";
                string json = JsonConvert.SerializeObject(ms1);
                return json;
            }
            else
            {
                foreach (var item in list)
                {
                    if (item.IdSanPham == id)
                    {
                        ReturnMessage ms = new ReturnMessage();
                        ms.code = "0";
                        ms.message = "Sản phẩm đã tồn tại trong giỏ hàng";
                        string json1 = JsonConvert.SerializeObject(ms);
                        return json1;
                        //return "Sản phẩm đã tồn tại trong giỏ hàng";
                    }

                }

                ChiTietDonHang ct = new ChiTietDonHang();
                ct.IdSanPham = id;
                ct.SoLuong = 1;
                ct.GiaBan = pro.GiaBanDeXuat;
                ct.TongTien = pro.GiaBanDeXuat;
                ct.TongNhap = pro.GiaNhap;
                ct.Lai = ct.TongTien - ct.TongNhap;
                list.Add(ct);
                Session["OrderDetail"] = list;
                //return "Thêm 1 sản phẩm";
                ReturnMessage ms1 = new ReturnMessage();
                ms1.code = "1";
                ms1.message = "Thêm 1 sản phẩm";
                string json = JsonConvert.SerializeObject(ms1);
                return json;
            }
        }
        public ActionResult OrderDetail()
        {
            //list = new List<ChiTietDonHang>();
            List<ChiTietDonHang> list = (List<ChiTietDonHang>)Session["OrderDetail"];
            if (list != null)
            {
                ViewBag.totalmoney = list.Sum(m => m.TongTien);
                ViewBag.totalimport = list.Sum(m => m.TongNhap);
                return View(list);
            }
            return View();

        }
        public string UpdateOrderDetail(int id, double saleprice, int quality, double amount)
        {
            List<ChiTietDonHang> list = new List<ChiTietDonHang>();
            list = (List<ChiTietDonHang>)Session["OrderDetail"];
            var pro = (from p in db.SanPhams where p.Id == id select p).FirstOrDefault();
            foreach (var item in list)
            {
                if (item.IdSanPham == id)
                {
                    item.GiaBan = saleprice;
                    item.SoLuong = quality;
                    item.TongTien = amount;
                    item.TongNhap = pro.GiaNhap * quality;
                    item.Lai = item.TongTien - item.TongNhap;
                    break;
                }
            }
            Session["OrderDetail"] = list;
            var totalmoney = list.Sum(m => m.TongTien);
            List<ReturnMessage> message = new List<ReturnMessage>();
            ReturnMessage ms = new ReturnMessage();
            ms.code = "totalproductmoney";
            ms.message = totalmoney + "";
            message.Add(ms);
            var improtprice = list.Sum(m => m.TongNhap);
            ReturnMessage ms1 = new ReturnMessage();
            ms1.code = "totalimportprice";
            ms1.message = improtprice + "";
            message.Add(ms1);

            string json = JsonConvert.SerializeObject(message);
            return json;
        }
        public string DeleteOrderItem(int id)
        {
            List<ChiTietDonHang> list = new List<ChiTietDonHang>();
            list = (List<ChiTietDonHang>)Session["OrderDetail"];
            foreach (var item in list)
            {
                if (item.IdSanPham == id)
                {
                    list.Remove(item);
                    break;
                }
            }
            Session["OrderDetail"] = list;
            var totalmoney = list.Sum(m => m.TongTien);
            List<ReturnMessage> message = new List<ReturnMessage>();

            ReturnMessage ms = new ReturnMessage();
            ms.code = "totalproductmoney";
            ms.message = totalmoney + "";
            message.Add(ms);
            var improtprice = list.Sum(m => m.TongNhap);
            ReturnMessage ms1 = new ReturnMessage();
            ms1.code = "totalimportprice";
            ms1.message = improtprice + "";
            message.Add(ms1);

            string json = JsonConvert.SerializeObject(message);
            return json;
        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult ProcessOrders(FormCollection forms)
        {
            string customerId = forms.Get("idcustomer");
            string amount = forms.Get("amount");
            string pay = forms.Get("pay");
            string debt = forms.Get("debt");
            string nextdate = forms.Get("nextdate");
            string deadline = forms.Get("deadline");
            string buydate = forms.Get("buydate");
            string note = forms.Get("note");

            List<ChiTietDonHang> list = new List<ChiTietDonHang>();
            list = (List<ChiTietDonHang>)Session["OrderDetail"];

            DonHang dh = new DonHang();
            dh.KhachHang = int.Parse(customerId);
            dh.NgayBan = string.IsNullOrEmpty(buydate) ? DateTime.Now : DateTime.ParseExact(buydate, "dd/MM/yyyy", null);
            dh.NgayHen = string.IsNullOrEmpty(nextdate) ? DateTime.Now : DateTime.ParseExact(nextdate, "dd/MM/yyyy", null);
            dh.NgayTinhLai = string.IsNullOrEmpty(deadline) ? DateTime.Now : DateTime.ParseExact(deadline, "dd/MM/yyyy", null);

            dh.SoTien = double.Parse(amount);
            dh.DaTra = double.Parse(pay);
            dh.ConNo = double.Parse(debt);
            dh.NguoiBan = "Phương";
            dh.TrangThai = 1;
            dh.GhiChu = note;

            if (list != null && list.Count > 0)
            {
                dh.TongNhap = list.Sum(m => m.TongNhap);

                dh.Lai = list.Sum(m => m.Lai);
            }
            else
            {
                dh.TongNhap = 0;
                dh.Lai = double.Parse(amount);
            }
            db.DonHangs.Add(dh);
            db.SaveChanges();
            if (dh.DaTra > 0)
            {
                KhachHangTraNo kht = new KhachHangTraNo();
                kht.NgayTra = String.IsNullOrEmpty(buydate) ? DateTime.Now : DateTime.ParseExact(buydate, "dd/MM/yyyy", null);
                kht.NguoiNhan = "Phương";
                kht.SoTien = double.Parse(pay);
                kht.ConNo = double.Parse(debt);
                kht.IdDonHang = dh.Id;
                kht.NgayHen = String.IsNullOrEmpty(nextdate) ? DateTime.Now : DateTime.ParseExact(nextdate, "dd/MM/yyyy", null);
                kht.PhiKhac = 0;
                kht.NgayTinhLai = String.IsNullOrEmpty(deadline) ? DateTime.Now : DateTime.ParseExact(deadline, "dd/MM/yyyy", null);
                kht.GhiChu = "Thanh toán khi mua hàng";
                db.KhachHangTraNoes.Add(kht);
                db.SaveChanges();
            }
            if (list != null && list.Count > 0)
            {
                foreach (var item in list)
                {
                    ChiTietDonHang ct = item;
                    ct.IdBanHang = dh.Id;
                    db.ChiTietDonHangs.Add(ct);
                    var product = (from p in db.SanPhams where p.Id == item.IdSanPham select p).FirstOrDefault();
                    product.SoLuongTon -= item.SoLuong;
                    db.SaveChanges();
                }
            }
            Session["OrderDetail"] = null;
            ViewBag.idkh = customerId;
            ViewBag.dh = dh;
            ViewBag.sp = list;
            return View();
        }
        public ActionResult TotalItemIcon()
        {
            List<ChiTietDonHang> list = new List<ChiTietDonHang>();
            list = (List<ChiTietDonHang>)Session["OrderDetail"];
            if (list == null)
            {
                ViewBag.totalitem = 0;
                return PartialView();
            }
            ViewBag.totalitem = list.Sum(m => m.SoLuong);
            return PartialView();
        }

        [HttpGet]
        public ActionResult ReportSale(string f, string t)
        {

            DateTime fromdate = string.IsNullOrEmpty(f) ? DateTime.MinValue : DateTime.ParseExact(f, "dd/MM/yyyy", null);
            DateTime todate = string.IsNullOrEmpty(t) ? DateTime.Now : DateTime.ParseExact(t, "dd/MM/yyyy", null);
            if (!string.IsNullOrEmpty(f) && !string.IsNullOrEmpty(t))
            {
                var data = (from d in db.DonHangs
                            where d.NgayBan >= fromdate && d.NgayBan <= todate
                            orderby d.Id descending
                            select d).ToList();
                ViewBag.f = f;
                ViewBag.t = t;
                return View(data);
            }
            return View();
        }
        public ActionResult OrderDetailByOrderId(int id)
        {
            var data = (from d in db.ChiTietDonHangs where d.IdBanHang == id select d).ToList();
            return PartialView(data);
        }
        [HttpGet]
        public ActionResult ReportCutomerPay(string f, string t)
        {
            DateTime fromdate = string.IsNullOrEmpty(f) ? DateTime.MinValue : DateTime.ParseExact(f, "dd/MM/yyyy", null);
            DateTime todate = string.IsNullOrEmpty(t) ? DateTime.Now : DateTime.ParseExact(t, "dd/MM/yyyy", null);
            if (!string.IsNullOrEmpty(f) && !string.IsNullOrEmpty(t))
            {
                var data = (from n in db.KhachHangTraNoes
                            where n.NgayTra >= fromdate && n.NgayTra <= todate
                            orderby n.Id descending
                            select n).ToList();
                return View(data);
            }
            ViewBag.f = f;
            ViewBag.t = t;
            return View();
        }
        public ActionResult ReportDebt()
        {
            var data = (from n in db.DonHangs
                        where n.ConNo > 0
                        orderby n.Id descending
                        select n).ToList();
            return View(data);
        }
        public string Upload(string imageData)
        {
            string filename = DateTime.Now.ToString().Replace("/", "-").Replace(" ", "- ").Replace(":", "") + ".png";
            string fileNameWitPath = Server.MapPath("~/Uploads/") + filename;

            using (FileStream fs = new FileStream(fileNameWitPath, FileMode.Create))
            {
                using (BinaryWriter bw = new BinaryWriter(fs))
                {
                    byte[] data = Convert.FromBase64String(imageData);
                    bw.Write(data);
                    bw.Close();
                    return filename;
                }
            }
        }
        public ActionResult CancelOrder()
        {
            Session["OrderDetail"] = null;
            return Redirect("~");
        }
        public ActionResult DoiTra(int id)
        {
            ViewBag.id = id;
            return View();
        }
        public ActionResult ChiTetDonHangById(int id)
        {
            var ct = (from c in db.ChiTietDonHangs where c.Id == id select c).FirstOrDefault();
            return PartialView(ct);
        }
        [HttpPost]
        public ActionResult DoiTra(FormCollection forms)
        {
            string ngaythang = forms.Get("ngaythang");
            string lydo = forms.Get("lydo");
            string soluongtra = forms.Get("soluong");
            //cập nhật chi tiết đơn hàng
            int idchitietdonhang = int.Parse(forms.Get("idchitietdonhang"));

            var dh = (from h in db.ChiTietDonHangs where h.Id == idchitietdonhang select h).FirstOrDefault();
            dh.SoLuong -= int.Parse(soluongtra);
            dh.TongTien -= int.Parse(soluongtra) * dh.GiaBan;
            //cập nhật đơn hàng
            var donhang = (from d in db.DonHangs where d.Id == dh.IdBanHang select d).FirstOrDefault();
            double giaban = int.Parse(soluongtra) * dh.GiaBan.Value;
            if (donhang.SoTien > 0)
            {
                donhang.SoTien -= giaban;
            }
            //cập nhật số lượng sản phẩm
            var product = (from p in db.SanPhams where p.Id == dh.IdSanPham select p).FirstOrDefault();
            product.SoLuongTon += int.Parse(soluongtra);
            var dt = new DoiTra();
            dt.IdDonHang = dh.IdBanHang;
            dt.NgayThang = DateTime.ParseExact(ngaythang, "dd/MM/yyyy", null);
            dt.NoiDung = lydo;
            db.DoiTras.Add(dt);
            db.SaveChanges();


            return RedirectToAction("ChiTietDonHang", "KhachHangs", new { id = dh.IdBanHang });
        }

        public ActionResult CancelSaledOrder(int id)
        {
            var donhang = (from d in db.DonHangs where d.Id == id select d).FirstOrDefault();
            var chitietdonhang = (from ct in db.ChiTietDonHangs where ct.IdBanHang == donhang.Id select ct).ToList();
            var khtrano = (from k in db.KhachHangTraNoes where k.IdDonHang == donhang.Id select k).ToList();
            //var product = from p in db.SanPhams where p.Id=chitietdonhang.s
            //cập nhật số lượng sản phẩm
            foreach (var item in chitietdonhang)
            {
                var product = (from p in db.SanPhams where p.Id == item.IdSanPham select p).FirstOrDefault();
                product.SoLuongTon += item.SoLuong;
                db.SaveChanges();
            }
            //xóa phiếu sửa chữa nội bộ

            db.KhachHangTraNoes.RemoveRange(khtrano);
            db.ChiTietDonHangs.RemoveRange(chitietdonhang);
            db.DonHangs.Remove(donhang);
            db.SaveChanges();
            return RedirectToAction("ChiTietKh", "KhachHangs", new { id = donhang.KhachHang });
        }
        public ActionResult CanSaledOrderConfirm(int id)
        {
            ViewBag.id = id;
            return PartialView();
        }
    }
}