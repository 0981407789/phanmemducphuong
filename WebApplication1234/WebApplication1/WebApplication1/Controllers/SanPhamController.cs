using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class SanPhamController : Controller
    {
        private dpappEntities db = new dpappEntities();
        //
        // GET: /SanPham/
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult NhapLo()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult NhapLo(NhapHang data, FormCollection forms)
        {
            double tongtien = string.IsNullOrEmpty(forms.Get("tongtien")) ? 0 : double.Parse(forms.Get("tongtien"));
            double conno = string.IsNullOrEmpty(forms.Get("conno")) ? 0 : double.Parse(forms.Get("conno"));
            double datra = string.IsNullOrEmpty(forms.Get("datra")) ? 0 : double.Parse(forms.Get("datra"));
            data.ConNo = conno;
            data.DaTra = datra;
            data.TongTien = tongtien;
            db.NhapHangs.Add(data);
            db.SaveChanges();
            if (data.ConNo.HasValue && datra > 0)
            {
                CuaHangTraNo ch = new CuaHangTraNo();
                ch.IdNhapHang = data.Id;
                ch.NgayTra = data.NgayNhap;
                ch.SoTienTra = data.DaTra;
                ch.ConNo = data.ConNo;
                db.CuaHangTraNoes.Add(ch);
                db.SaveChanges();
            }
            return View();
        }
        public ActionResult ListNhapHang()
        {
            var totalitem = db.NhapHangs.ToList().Count;
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
            return PartialView();
        }
        public ActionResult ListNhapHangPage(int page)
        {
            var products = db.NhapHangs
                .OrderByDescending(m => m.Id)
                .Skip(30 * (page - 1))
                .Take(30).ToList();
            return PartialView(products);

        }
        public ActionResult LoHangTheoId(int id)
        {
            var data = db.NhapHangs.Find(id);
            return PartialView(data);
        }
        public ActionResult NhapSanPhamVaoLo(int id)
        {
            ViewBag.IdLo = id;
            return View();
        }
        public ActionResult NhapThongTinSanPham(int id)
        {
            SanPham sanPham = new SanPham();
            sanPham.IdNhapHang = id;
            return PartialView(sanPham);
        }
        [HttpPost]
        public int NhapThongTinSanPham(SanPham data, FormCollection forms)
        {
            int xept = string.IsNullOrEmpty(forms.Get("xephutung")) ? 0 : int.Parse(forms.Get("xephutung"));
            double gianhap = string.IsNullOrEmpty(Request["gianhap"]) ? 0 : double.Parse(Request["gianhap"]);
            double giaban = string.IsNullOrEmpty(Request["giaban"]) ? 0 : double.Parse(Request["giaban"]);
            data.GiaBanDeXuat = giaban;
            data.GiaNhap = gianhap;
            data.SoLuongTon = data.SoLuongNhap;
            data.Types = xept;
            db.SanPhams.Add(data);
            db.SaveChanges();
            return data.IdNhapHang.Value;
        }
        public ActionResult ListSanPhamTheoLo(int id)
        {
            var data = (from s in db.SanPhams
                        orderby s.Id descending
                        where s.IdNhapHang == id
                        select s).ToList();
            return PartialView(data);
        }
        public ActionResult TimKiemSanPham(string q)
        {
            q = string.IsNullOrEmpty(q) ? string.Empty : q.Trim();

            var data = (from s in db.SanPhams
                        where
                        s.SoKhung.Contains(q)
                        || s.SoMay.Contains(q)
                        || s.BienSo.Contains(q)
                        || s.Id.ToString().Contains(q)
                        select s).ToList();
            return PartialView(data);
        }
        public ActionResult GetProductByParentId(int id)
        {
            var data = (from s in db.SanPhams
                        join l in db.LoaiSanPhams on s.IdLoai equals l.Id
                        where l.IdCha == id && s.SoLuongTon > 0
                        select s).ToList();
            return PartialView("TimKiemSanPham", data);
        }
        public ActionResult GetProductByChildId(int id)
        {
            var data = (from s in db.SanPhams
                        where s.IdLoai == id && s.SoLuongTon > 0
                        select s).ToList();
            return PartialView("TimKiemSanPham", data);
        }

        public ActionResult GetProductByDepartment(int id)
        {
            var data = (from s in db.SanPhams
                        where s.IdCuaHang == id && s.SoLuongTon > 0
                        select s).ToList();
            return PartialView("TimKiemSanPham", data);
        }
        public ActionResult Top30ProductForOrder()
        {
            var data = (from s in db.SanPhams
                        where s.SoLuongTon > 0
                        orderby s.Id descending
                        select s).Take(30).ToList();
            return PartialView("TimKiemSanPham", data);
        }
        [HttpPost]
        public ActionResult XeDangKy()
        {
            var data = (from s in db.SanPhams
                        join c in db.ChiTietDonHangs
                        on s.Id equals c.IdSanPham
                        where s.SoLuongTon == 0
                        orderby c.Id descending
                        select s).ToList();
            return PartialView("TimKiemSanPham", data);
        }

        public ActionResult DonHangTheoDoiTacPage(int page, int id)
        {
            var products = db.NhapHangs.Where(m => m.DoiTac == id)
                .OrderByDescending(m => m.Id)
                .Skip(30 * (page - 1))
                .Take(30).ToList();
            return PartialView("ListNhapHangPage", products);
        }
        public ActionResult GetProductById(int id)
        {
            var product = (from p in db.SanPhams where p.Id == id select p).FirstOrDefault();
            return PartialView(product);
        }
        public ActionResult SanPhamById(int id)
        {
            var product = (from p in db.SanPhams where p.Id == id select p).FirstOrDefault();
            return PartialView(product);
        }
        public ActionResult GetProductReport(int id)
        {
            var data = (from p in db.SanPhams where p.Id == id select p).FirstOrDefault();
            return PartialView(data);
        }
        public string GetProductMenufactory(int id)
        {
            var data = (from l in db.DoiTacs
                        join n in db.NhapHangs on l.Id equals n.DoiTac
                        where n.Id == id
                        select l.Ten).FirstOrDefault();
            return data;
        }
        public ActionResult InstockReport()
        {
            return View();
        }
        public string GetDateInput(int id)
        {
            DateTime date = (DateTime)(from d in db.NhapHangs where d.Id == id select d.NgayNhap).FirstOrDefault();
            string a = date.ToString("dd/MM/yyyy");
            return a;
        }
        public ActionResult InstockReportResult()
        {
            var data = (from p in db.SanPhams where p.SoLuongTon > 0 select p).ToList();
            return PartialView(data);
        }
        public ActionResult ReportProductByParentId(int id)
        {
            var data = (from s in db.SanPhams
                        join l in db.LoaiSanPhams on s.IdLoai equals l.Id
                        where l.IdCha == id && s.SoLuongTon > 0
                        select s).ToList();
            return PartialView("InstockReportResult", data);
        }
        public ActionResult ReportProductByChildId(int id)
        {
            var data = (from s in db.SanPhams
                        where s.IdLoai == id && s.SoLuongTon > 0
                        select s).ToList();
            return PartialView("InstockReportResult", data);
        }
        public ActionResult UpdateProductPrice(int id)
        {
            var data = (from p in db.SanPhams where p.Id == id select p).FirstOrDefault();

            return View(data);
        }
        [HttpPost]
        public ActionResult UpdateProductPrice(SanPham data)
        {
            var sp = (from p in db.SanPhams where p.Id == data.Id select p).FirstOrDefault();
            sp.GiaNhap = data.GiaNhap;
            sp.GhiChu = data.GhiChu;
            sp.BienSo = data.BienSo;
            sp.GiaBanDeXuat = data.GiaBanDeXuat;
            sp.MauSac = data.MauSac;
            sp.SoKhung = data.SoKhung;
            sp.SoMay = data.SoMay;
            sp.IdCuaHang = data.IdCuaHang;
            sp.SoLuongNhap = data.SoLuongNhap;
            sp.SoLuongTon = data.SoLuongTon;
            sp.PhiKhac = data.PhiKhac;
            db.SaveChanges();
            return View(sp);
        }

        public ActionResult ListSanPhamSuaChuaNoiBo()
        {
            var data = (from s in db.SanPhams
                        where s.SoLuongTon > 0
                        && s.Types.Value == 0
                        orderby s.Id descending
                        select s).Take(30).ToList();
            return PartialView(data);
        }

        public ActionResult SuaChuaNoiBoDetailView()
        {
            List<ChiTietSuaChuaNoiBo> list = (List<ChiTietSuaChuaNoiBo>)Session["ListChiTietDonHang"];
            if (list != null)
            {
                return PartialView(list);
            }

            return PartialView(new List<ChiTietSuaChuaNoiBo>());
        }
        public string AddSuaChuaNoiBoDetail(int id)
        {
            List<ChiTietSuaChuaNoiBo> list = (List<ChiTietSuaChuaNoiBo>)Session["ListChiTietDonHang"];
            var pro = (from p in db.SanPhams where p.Id == id select p).FirstOrDefault();
            if (list == null)
            {
                list = new List<ChiTietSuaChuaNoiBo>();
                ChiTietSuaChuaNoiBo ct = new ChiTietSuaChuaNoiBo();
                ct.IdPhuTung = pro.Id;
                ct.SoLuong = 1;
                ct.GiaTien = pro.GiaNhap;
                ct.ThanhTien = pro.GiaNhap;
                list.Add(ct);
                Session["ListChiTietDonHang"] = list;
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
                    if (item.IdPhuTung == id)
                    {
                        if (pro.SoLuongTon <= item.SoLuong)
                        {
                            ReturnMessage mss = new ReturnMessage();
                            mss.code = "3";
                            mss.message = "Số lượng tồn không đủ";
                            string jsonn1 = JsonConvert.SerializeObject(mss);
                            return jsonn1;
                        }
                        item.SoLuong = item.SoLuong + 1;
                        item.ThanhTien += pro.GiaNhap;

                        Session["ListChiTietDonHang"] = list;
                        ReturnMessage ms = new ReturnMessage();
                        ms.code = "2";
                        ms.message = "Cập nhật số lượng";
                        string jsonn = JsonConvert.SerializeObject(ms);
                        return jsonn;
                    }

                }
                ChiTietSuaChuaNoiBo ct = new ChiTietSuaChuaNoiBo();
                ct.IdPhuTung = pro.Id;
                ct.SoLuong = 1;
                ct.GiaTien = pro.GiaNhap;
                ct.ThanhTien = pro.GiaNhap;
                list.Add(ct);
                Session["ListChiTietDonHang"] = list;
                ReturnMessage ms1 = new ReturnMessage();
                ms1.code = "1";
                ms1.message = "Thêm 1 sản phẩm";
                string json = JsonConvert.SerializeObject(ms1);
                return json;
            }
        }
        public double? DeleteItem(int id)
        {
            List<ChiTietSuaChuaNoiBo> list = (List<ChiTietSuaChuaNoiBo>)Session["ListChiTietDonHang"];
            foreach (var item in list)
            {
                if (item.IdPhuTung == id)
                {
                    list.Remove(item);
                    break;
                }
            }
            double? total = list.Sum(m => m.ThanhTien);
            return total;
        }
        public int UpdateSoLuongPhuTung(int id, int soluong)
        {
            var pro = (from p in db.SanPhams where p.Id == id select p).FirstOrDefault();
            List<ChiTietSuaChuaNoiBo> list = (List<ChiTietSuaChuaNoiBo>)Session["ListChiTietDonHang"];
            //var pt = (from ptt in list where ptt.IdPhuTung == id select ptt).FirstOrDefault();
            if (soluong <= pro.SoLuongTon)
            {
                //ok
                foreach (var item in list)
                {
                    if (item.IdPhuTung == id)
                    {
                        item.SoLuong = soluong;
                        item.ThanhTien = soluong * pro.GiaNhap;
                        Session["ListChiTietDonHang"] = list;
                        return 1;
                    }
                }
            }

            return 0;
        }
        public ActionResult SuaChuaNoiBoForms(int id)
        {
            List<ChiTietSuaChuaNoiBo> list = (List<ChiTietSuaChuaNoiBo>)Session["ListChiTietDonHang"];
            ViewBag.id = id;
            if (list != null)
            {
                double? total = list.Sum(m => m.ThanhTien);
                ViewBag.total = total;
            }
            return PartialView();
        }
        public string ThemSuaChuaNoiBo(FormCollection forms)
        {
            string ngaythang = forms.Get("ngaythang");
            string tongtien = forms.Get("tongtien");
            string nguoi = forms.Get("nguoi");
            string ghichu = forms.Get("ghichu");
            string id = forms.Get("id");
            //tạo phiếu
            SuaChuaNoiBo sc = new SuaChuaNoiBo();
            sc.NgayThang = string.IsNullOrEmpty(ngaythang) ? DateTime.Now : DateTime.ParseExact(ngaythang, "dd/MM/yyyy", null);
            sc.TongTien = string.IsNullOrEmpty(tongtien) ? 0 : double.Parse(tongtien);
            sc.NguoiThucHien = nguoi;
            sc.GhiChu = ghichu;
            sc.SanPham = int.Parse(id);
            db.SuaChuaNoiBoes.Add(sc);

            //update giá sản phẩm
            int proid = int.Parse(id);
            var pro = (from p in db.SanPhams where p.Id == proid select p).FirstOrDefault();
            if (pro.PhiKhac.HasValue)
            {
                pro.PhiKhac += double.Parse(tongtien);
            }
            else
            {
                pro.PhiKhac = double.Parse(tongtien);
            }
            //pro.PhiKhac = pro.PhiKhac.HasValue ? pro.PhiKhac 0 + (string.IsNullOrEmpty(tongtien) ? 0 : double.Parse(tongtien));

            db.SaveChanges();

            List<ChiTietSuaChuaNoiBo> list = (List<ChiTietSuaChuaNoiBo>)Session["ListChiTietDonHang"];
            // thêm chi tiết phiếu
            if (list != null)
            {
                foreach (var item in list)
                {
                    var sanpham = (from s in db.SanPhams where item.IdPhuTung == s.Id select s).FirstOrDefault();
                    sanpham.SoLuongTon -= item.SoLuong;
                    item.IdSuaChua = sc.Id;
                    db.ChiTietSuaChuaNoiBoes.Add(item);
                    db.SaveChanges();
                }
            }
            Session["ListChiTietDonHang"] = null;
            ReturnMessage ms1 = new ReturnMessage();
            ms1.code = "1";
            ms1.message = "Thao thác thành công";
            string json = JsonConvert.SerializeObject(ms1);
            return json;
        }
        public ActionResult LichSuSuaChuaNoiBo(int id)
        {
            var data = (from s in db.SuaChuaNoiBoes where s.SanPham == id select s).ToList();
            return PartialView(data);
        }
        public ActionResult ChiTietSuaChuaNoiBo(int id)
        {
            var data = (from c in db.ChiTietSuaChuaNoiBoes where c.IdSuaChua == id select c).ToList();
            return PartialView(data);
        }
        public ActionResult GetProductCustomerDetail(int id)
        {
            var product = (from p in db.SanPhams where p.Id == id select p).FirstOrDefault();
            return PartialView(product);
        }
        [HttpGet]
        public ActionResult ReportSuaChuaNoiBo(string f, string t)
        {
            DateTime fromdate = string.IsNullOrEmpty(f) ? DateTime.MinValue : DateTime.ParseExact(f, "dd/MM/yyyy", null);
            DateTime todate = string.IsNullOrEmpty(t) ? DateTime.Now : DateTime.ParseExact(t, "dd/MM/yyyy", null);
            ViewBag.f = f;
            ViewBag.t = t;
            if (!string.IsNullOrEmpty(f) && !string.IsNullOrEmpty(t))
            {
                var data = (from s in db.SuaChuaNoiBoes
                            where s.NgayThang >= fromdate && s.NgayThang <= todate
                            select s).ToList();
                return View(data);
            }

            return View();
        }
        public ActionResult ReportSuaChuNoiBoChiTiet(int id)
        {
            var data = (from c in db.ChiTietSuaChuaNoiBoes where c.IdSuaChua == id select c).ToList();
            return PartialView(data);
        }

        public ActionResult TimSanPhamSuaChuaNoibo(int id)
        {
            var data = (from s in db.SanPhams
                        where s.SoLuongTon > 0 && s.IdLoai == id
                        orderby s.Id descending
                        select s).Take(30).ToList();
            return PartialView("ListSanPhamSuaChuaNoiBo", data);
        }
        public ActionResult GetProductDoiTra(int id)
        {
            var product = (from p in db.SanPhams where p.Id == id select p).FirstOrDefault();
            return PartialView(product);
        }
        public string UpdateDonHang(NhapHang data, FormCollection forms)
        {
            var nhaphang = (from n in db.NhapHangs where n.Id == data.Id select n).FirstOrDefault();
            string ngaynhap = forms.Get("NgayNhap");
            DateTime date = DateTime.ParseExact(ngaynhap, "dd/MM/yyyy", null);
            nhaphang.NgayNhap = date;
            nhaphang.TongTien = data.TongTien;
            nhaphang.ConNo = data.ConNo;
            nhaphang.DaTra = data.DaTra;
            nhaphang.GhiChu = data.GhiChu;
            db.SaveChanges();
            //db.Entry(data).State = EntityState.Modified;
            //db.SaveChanges();

            return "";
        }
    }
}