USE [master]
GO
/****** Object:  Database [dpapptest]    Script Date: 10/8/2019 7:57:12 AM ******/
CREATE DATABASE [dpapptest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dpapptest', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.TESTSV\MSSQL\DATA\dpapptest.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dpapptest_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.TESTSV\MSSQL\DATA\dpapptest_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dpapptest] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dpapptest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dpapptest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dpapptest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dpapptest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dpapptest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dpapptest] SET ARITHABORT OFF 
GO
ALTER DATABASE [dpapptest] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dpapptest] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [dpapptest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dpapptest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dpapptest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dpapptest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dpapptest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dpapptest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dpapptest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dpapptest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dpapptest] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dpapptest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dpapptest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dpapptest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dpapptest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dpapptest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dpapptest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dpapptest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dpapptest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dpapptest] SET  MULTI_USER 
GO
ALTER DATABASE [dpapptest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dpapptest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dpapptest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dpapptest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [dpapptest]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 10/8/2019 7:57:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdBanHang] [int] NULL,
	[IdSanPham] [int] NULL,
	[GiaBan] [float] NULL,
	[SoLuong] [int] NULL,
	[TongTien] [float] NULL,
	[TrangThai] [int] NULL,
	[TongNhap] [float] NULL,
	[Lai] [float] NULL,
	[PhiKhac] [float] NULL,
 CONSTRAINT [PK_ChiTietBanHang] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietSuaChuaNoiBo]    Script Date: 10/8/2019 7:57:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietSuaChuaNoiBo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdSuaChua] [int] NULL,
	[IdPhuTung] [int] NULL,
	[SoLuong] [int] NULL,
	[GiaTien] [float] NULL,
	[ThanhTien] [float] NULL,
	[PhiKhac] [float] NULL,
	[GhiChu] [nvarchar](500) NULL,
 CONSTRAINT [PK_ChiTietSuaChuaNoiBo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CuaHang]    Script Date: 10/8/2019 7:57:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuaHang](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](500) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[GhiChu] [nvarchar](500) NULL,
 CONSTRAINT [PK_CuaHang] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CuaHangTraNo]    Script Date: 10/8/2019 7:57:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuaHangTraNo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NgayTra] [datetime] NULL,
	[SoTienTra] [float] NULL,
	[ConNo] [float] NULL,
	[NguoiTra] [nvarchar](500) NULL,
	[ChungTu] [nvarchar](500) NULL,
	[IdNhapHang] [int] NULL,
	[PhiKhac] [float] NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_CuaHangTraNo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DangKy]    Script Date: 10/8/2019 7:57:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangKy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Thue] [float] NULL,
	[PhiCongAn] [float] NULL,
	[HoaDon] [float] NULL,
	[PhiKhac] [float] NULL,
	[GhiChu] [ntext] NULL,
	[NguoiLam] [nvarchar](500) NULL,
	[NgayTraDK] [datetime] NULL,
	[NgayTraBien] [datetime] NULL,
	[IdXe] [int] NULL,
 CONSTRAINT [PK_DangKy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoiTac]    Script Date: 10/8/2019 7:57:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoiTac](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](500) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[GhiChu] [nvarchar](500) NULL,
	[SoDienThoai] [nvarchar](500) NULL,
	[SoTaiKhoan] [nvarchar](500) NULL,
	[KhachLe] [bit] NULL,
 CONSTRAINT [PK_DoiTac] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoiTra]    Script Date: 10/8/2019 7:57:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoiTra](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdDonHang] [int] NULL,
	[NoiDung] [ntext] NULL,
	[NgayThang] [datetime] NULL,
 CONSTRAINT [PK_DoiTra] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 10/8/2019 7:57:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NgayBan] [datetime] NULL,
	[NguoiBan] [nvarchar](500) NULL,
	[SoTien] [float] NOT NULL,
	[DaTra] [float] NULL,
	[ConNo] [float] NULL,
	[NgayHen] [datetime] NULL,
	[KhachHang] [int] NULL,
	[TrangThai] [int] NULL,
	[NgayTinhLai] [datetime] NULL,
	[GhiChu] [ntext] NULL,
	[TongNhap] [float] NULL,
	[Lai] [float] NULL,
 CONSTRAINT [PK_BanHang] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HangSanXuat]    Script Date: 10/8/2019 7:57:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangSanXuat](
	[Id] [int] NOT NULL,
	[TenHang] [nvarchar](500) NULL,
	[GhiChu] [nvarchar](500) NULL,
 CONSTRAINT [PK_HangSanXuat] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/8/2019 7:57:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](500) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[IdXa] [int] NULL,
	[SoDienThoai] [nvarchar](500) NULL,
	[Email] [nvarchar](500) NULL,
	[NgaySinh] [nvarchar](500) NULL,
	[CMND] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHangTraNo]    Script Date: 10/8/2019 7:57:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHangTraNo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NgayTra] [datetime] NULL,
	[SoTien] [float] NULL,
	[ConNo] [float] NULL,
	[NguoiNhan] [nvarchar](500) NULL,
	[PhiKhac] [float] NULL,
	[GhiChu] [nvarchar](500) NULL,
	[NgayHen] [datetime] NULL,
	[IdDonHang] [int] NULL,
	[NgayTinhLai] [datetime] NULL,
	[LoaiGiaoDich] [int] NULL,
 CONSTRAINT [PK_KhachHangTraNo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 10/8/2019 7:57:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](500) NULL,
	[IdCha] [int] NULL,
 CONSTRAINT [PK_LoaiXe] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhapHang]    Script Date: 10/8/2019 7:57:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhapHang](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NgayNhap] [datetime] NULL,
	[DoiTac] [int] NULL,
	[TongTien] [float] NULL,
	[DaTra] [float] NULL,
	[ConNo] [float] NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_NhapHang] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 10/8/2019 7:57:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdNhapHang] [int] NULL,
	[GiaNhap] [float] NULL,
	[SoLuongTon] [int] NULL,
	[IdLoai] [int] NULL,
	[IdCuaHang] [int] NULL,
	[GhiChu] [ntext] NULL,
	[SoKhung] [nvarchar](50) NULL,
	[SoMay] [nvarchar](50) NULL,
	[BienSo] [nvarchar](50) NULL,
	[MauSac] [nvarchar](50) NULL,
	[PhiKhac] [float] NULL,
	[SoLuongNhap] [int] NULL,
	[GiaBanDeXuat] [float] NULL,
	[Types] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SuaChuaNoiBo]    Script Date: 10/8/2019 7:57:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuaChuaNoiBo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SanPham] [int] NULL,
	[NgayThang] [datetime] NULL,
	[NguoiThucHien] [nvarchar](50) NULL,
	[TongTien] [float] NULL,
	[GhiChu] [nvarchar](500) NULL,
 CONSTRAINT [PK_SuaChuaNoiBo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Xa]    Script Date: 10/8/2019 7:57:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Xa](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](500) NULL,
 CONSTRAINT [PK_Xa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] ON 

INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (1128, 1140, 3198, 13500000, 0, 0, NULL, 8850000, 4650000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (1129, 1140, 3241, 0, 5, 0, NULL, 2375000, -2375000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (1130, 1141, 3274, 60000, 1, 60000, NULL, 50000, 10000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (1132, 1143, 3265, 13500000, 1, 13500000, NULL, 12500000, 1000000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (1133, 1145, 3206, 12500000, 1, 12500000, NULL, 10000000, 2500000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (1134, 1146, 3260, 7200000, 1, 7200000, NULL, 6200000, 1000000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (1135, 1147, 3258, 9000000, 1, 9000000, NULL, 6000000, 3000000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (1136, 1148, 3289, 80000, 1, 80000, NULL, 50000, 30000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (1137, 1148, 3288, 120000, 1, 120000, NULL, 50000, 70000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (1138, 1148, 3287, 150000, 1, 150000, NULL, 100000, 50000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (1144, 1153, 3284, 120000, 2, 240000, NULL, 100000, 140000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (1145, 1153, 3283, 120000, 3, 360000, NULL, 240000, 120000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (1146, 1154, 3287, 150000, 1, 150000, NULL, 100000, 50000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (1147, 1154, 3285, 150000, 1, 150000, NULL, 100000, 50000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (1148, 1154, 3283, 120000, 1, 120000, NULL, 80000, 40000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (1149, 1154, 3281, 450000, 1, 450000, NULL, 300000, 150000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (1150, 1154, 3286, 120000, 1, 120000, NULL, 50000, 70000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (1151, 1155, 3254, 8500000, 1, 8500000, NULL, 7500000, 1000000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (1152, 1156, 3228, 8000000, 1, 8000000, NULL, 6000000, 2000000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (1153, 1157, 3223, 17500000, 1, 17500000, NULL, 11900000, 5600000, NULL)
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] OFF
SET IDENTITY_INSERT [dbo].[ChiTietSuaChuaNoiBo] ON 

INSERT [dbo].[ChiTietSuaChuaNoiBo] ([Id], [IdSuaChua], [IdPhuTung], [SoLuong], [GiaTien], [ThanhTien], [PhiKhac], [GhiChu]) VALUES (1, 19, 3242, 4, 300000, 1200000, NULL, NULL)
INSERT [dbo].[ChiTietSuaChuaNoiBo] ([Id], [IdSuaChua], [IdPhuTung], [SoLuong], [GiaTien], [ThanhTien], [PhiKhac], [GhiChu]) VALUES (2, 20, 3242, 2, 300000, 600000, NULL, NULL)
INSERT [dbo].[ChiTietSuaChuaNoiBo] ([Id], [IdSuaChua], [IdPhuTung], [SoLuong], [GiaTien], [ThanhTien], [PhiKhac], [GhiChu]) VALUES (3, 23, 3246, 4, 520000, 2080000, NULL, NULL)
INSERT [dbo].[ChiTietSuaChuaNoiBo] ([Id], [IdSuaChua], [IdPhuTung], [SoLuong], [GiaTien], [ThanhTien], [PhiKhac], [GhiChu]) VALUES (4, 24, 3242, 1, 300000, 300000, NULL, NULL)
INSERT [dbo].[ChiTietSuaChuaNoiBo] ([Id], [IdSuaChua], [IdPhuTung], [SoLuong], [GiaTien], [ThanhTien], [PhiKhac], [GhiChu]) VALUES (5, 29, 3242, 1, 300000, 300000, NULL, NULL)
INSERT [dbo].[ChiTietSuaChuaNoiBo] ([Id], [IdSuaChua], [IdPhuTung], [SoLuong], [GiaTien], [ThanhTien], [PhiKhac], [GhiChu]) VALUES (6, 30, 3242, 1, 300000, 300000, NULL, NULL)
INSERT [dbo].[ChiTietSuaChuaNoiBo] ([Id], [IdSuaChua], [IdPhuTung], [SoLuong], [GiaTien], [ThanhTien], [PhiKhac], [GhiChu]) VALUES (7, 31, 3242, 2, 300000, 600000, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ChiTietSuaChuaNoiBo] OFF
SET IDENTITY_INSERT [dbo].[CuaHang] ON 

INSERT [dbo].[CuaHang] ([Id], [Ten], [DiaChi], [GhiChu]) VALUES (1, N'Cơ sở 1', NULL, NULL)
INSERT [dbo].[CuaHang] ([Id], [Ten], [DiaChi], [GhiChu]) VALUES (2, N'Cơ Sở 2', NULL, NULL)
SET IDENTITY_INSERT [dbo].[CuaHang] OFF
SET IDENTITY_INSERT [dbo].[CuaHangTraNo] ON 

INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1023, CAST(0x0000AA5D00000000 AS DateTime), 100000, 0, NULL, NULL, 3033, NULL, NULL)
INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1024, CAST(0x0000AA5D00000000 AS DateTime), 100000, 0, NULL, NULL, 3034, NULL, NULL)
INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1025, CAST(0x0000AA5D00000000 AS DateTime), 100000, 0, NULL, NULL, 3035, NULL, NULL)
INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1026, CAST(0x0000AADD00000000 AS DateTime), 1000000, 99000000, NULL, NULL, 3036, NULL, NULL)
INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1027, CAST(0x0000AADD00000000 AS DateTime), 90000000, 9000000, N'sdfdsfsd', N'Giấy chuyển tiền', 3036, 100000, N'Phí chuyển tiền 100k')
INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1028, CAST(0x0000AADD00000000 AS DateTime), 5000000, 4000000, N'phương', N'giấy chuyển tiền', 3036, 1000000, N'sdfdsf')
SET IDENTITY_INSERT [dbo].[CuaHangTraNo] OFF
SET IDENTITY_INSERT [dbo].[DoiTac] ON 

INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1021, N'Xe cũ tồn', NULL, N'Xe cũ tồn trước khi sử dụng phần mềm', NULL, NULL, 0)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1022, N'Bình xe điện tồn', NULL, N'Bình cũ trước khi sử dụng phần mềm', NULL, NULL, 0)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1023, N'Phụ tùng xe điện tồn', NULL, N'Phụ tùng xe điện tồn', NULL, NULL, 0)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1024, N'bbbbbb', NULL, NULL, N'2423432', NULL, 1)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1025, N'bbaaa', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1026, N'khach le', N'sdf dsfdsfsd', NULL, N'234234', NULL, 1)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1027, N'đối 1', N'sdf dsfdsfsd', NULL, N'234234', NULL, 0)
SET IDENTITY_INSERT [dbo].[DoiTac] OFF
SET IDENTITY_INSERT [dbo].[DoiTra] ON 

INSERT [dbo].[DoiTra] ([Id], [IdDonHang], [NoiDung], [NgayThang]) VALUES (1, 1140, N'sdfds dsfdsf ', CAST(0x0000AADA00000000 AS DateTime))
INSERT [dbo].[DoiTra] ([Id], [IdDonHang], [NoiDung], [NgayThang]) VALUES (2, 1150, N'sfssd dsf', CAST(0x0000AADA00000000 AS DateTime))
INSERT [dbo].[DoiTra] ([Id], [IdDonHang], [NoiDung], [NgayThang]) VALUES (3, 1151, N'không thích', CAST(0x0000AADA00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[DoiTra] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (1140, CAST(0x0000AA5D00000000 AS DateTime), N'Phương', 0, 10500000, 3000000, CAST(0x0000AA6800000000 AS DateTime), 1074, 1, CAST(0x0000AA5D011970BB AS DateTime), N'Có đk thanh toán', 10875000, 2625000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (1141, CAST(0x0000AA5D00000000 AS DateTime), N'Phương', 60000, 60000, 0, CAST(0x0000AA5D0165651F AS DateTime), 1075, 1, CAST(0x0000AA5D0165651F AS DateTime), N'', 50000, 10000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (1143, CAST(0x0000AAD500000000 AS DateTime), N'Phương', 13500000, 13500000, 0, CAST(0x0000AAD500E8A498 AS DateTime), 1077, 1, CAST(0x0000AAD500E8A498 AS DateTime), N'', 12500000, 1000000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (1144, CAST(0x0000AAD500000000 AS DateTime), N'Phương', 20000, 20000, 0, CAST(0x0000AAD500F7AA32 AS DateTime), 1078, 1, CAST(0x0000AAD500F7AA32 AS DateTime), N'', 0, 20000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (1145, CAST(0x0000AAD600000000 AS DateTime), N'Phương', 11000000, 11000000, 0, CAST(0x0000AAD60147B700 AS DateTime), 1079, 1, CAST(0x0000AAD60147B700 AS DateTime), N'', 10000000, 2500000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (1146, CAST(0x0000AAD600000000 AS DateTime), N'Phương', 8000000, 8000000, 0, CAST(0x0000AAD6014C4C80 AS DateTime), 1080, 1, CAST(0x0000AAD6014C4C80 AS DateTime), N'', 6200000, 1000000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (1147, CAST(0x0000AAD600000000 AS DateTime), N'Phương', 9000000, 9000000, 0, CAST(0x0000AAD6014C85A4 AS DateTime), 1081, 1, CAST(0x0000AAD6014C85A4 AS DateTime), N'', 6000000, 3000000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (1148, CAST(0x0000AAD800000000 AS DateTime), N'Phương', 350000, 350000, 0, CAST(0x0000AAD800B5282E AS DateTime), 1074, 1, CAST(0x0000AAD800B5282E AS DateTime), N'', 200000, 150000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (1153, CAST(0x0000AADA00000000 AS DateTime), N'Phương', 600000, 600000, 0, CAST(0x0000AADA012FD2EF AS DateTime), 1083, 1, CAST(0x0000AADA012FD2EF AS DateTime), N'', 340000, 260000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (1154, CAST(0x0000AADA00000000 AS DateTime), N'Phương', 990000, 990000, 0, CAST(0x0000AADA01712579 AS DateTime), 1085, 1, CAST(0x0000AADA01712579 AS DateTime), N'', 630000, 360000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (1155, CAST(0x0000AADA00000000 AS DateTime), N'Phương', 8500000, 8700000, 0, CAST(0x0000AADD00000000 AS DateTime), 1086, 1, CAST(0x0000AADD00000000 AS DateTime), N'', 7500000, 1000000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (1156, CAST(0x0000AADD00000000 AS DateTime), N'Phương', 8000000, 5000000, 3000000, CAST(0x0000AAF700000000 AS DateTime), 1087, 1, CAST(0x0000AADD00000000 AS DateTime), N'swfwerv wrewr', 6000000, 2000000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (1157, CAST(0x0000AADD00000000 AS DateTime), N'Phương', 17500000, 14500000, 3000000, CAST(0x0000AB1A00000000 AS DateTime), 1088, 1, CAST(0x0000AADD01119A58 AS DateTime), N'không tính lãi', 11900000, 5600000)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1074, N'Phạm Văn Hoàn', N'Thôn đồng tâm', 18, N'0363897223', NULL, NULL, N'ssssss sdfdsf')
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1075, N'Khách Lẻ', N'sdfsd', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1076, N'Phạn thị thắm', N'Thôn gốc mít ', 4, N'0374354577', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1077, N'dfsfds', N'wer wer ewr', 27, N'23423423456', NULL, N'27/09/2019', N'234234')
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1078, N'khach', N'sdfds dsfdsfds', 28, N'23424', NULL, N'27/09/2019', N'23423432')
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1079, N'234324', N'2342b sdfdsf', 4, N'234234', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1080, N'rewrewr', N'sdfds dsfdsfd', 23, N'23423423', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1081, N'sdfdsfds', N'wrwer werwe', 8, N'234234', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1082, N'nguyễn thị hương', N'đập róm', 9, N'0393937231', NULL, NULL, N'xxxxx')
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1083, N'Phương', N'sdfds dsfds', 27, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1084, N'Trần văn R', N'sdfdsf dsfds', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1085, N'chị ly', N'sdf sdf sdf', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1086, N'test', N'sdaf sdf', 28, N'223423', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1087, N'tesst22', N'sdf sdfds fdsf', 4, N'2134234', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1088, N'triệu quốc lịch', N'thôn quyết tiến', 6, N'0868792684', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[KhachHangTraNo] ON 

INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai], [LoaiGiaoDich]) VALUES (1161, CAST(0x0000AA5D00000000 AS DateTime), 10500000, 3000000, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AA6800000000 AS DateTime), 1140, CAST(0x0000AA5D011970C1 AS DateTime), NULL)
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai], [LoaiGiaoDich]) VALUES (1162, CAST(0x0000AA5D00000000 AS DateTime), 60000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AA5D0165652D AS DateTime), 1141, CAST(0x0000AA5D0165652D AS DateTime), NULL)
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai], [LoaiGiaoDich]) VALUES (1164, CAST(0x0000AAD500000000 AS DateTime), 13500000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AAD500E8A4A6 AS DateTime), 1143, CAST(0x0000AAD500E8A4A6 AS DateTime), NULL)
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai], [LoaiGiaoDich]) VALUES (1165, CAST(0x0000AAD500000000 AS DateTime), 20000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AAD500F7AA40 AS DateTime), 1144, CAST(0x0000AAD500F7AA40 AS DateTime), NULL)
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai], [LoaiGiaoDich]) VALUES (1166, CAST(0x0000AAD600000000 AS DateTime), 11000000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AAD60147B713 AS DateTime), 1145, CAST(0x0000AAD60147B713 AS DateTime), NULL)
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai], [LoaiGiaoDich]) VALUES (1167, CAST(0x0000AAD600000000 AS DateTime), 8000000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AAD6014C4C92 AS DateTime), 1146, CAST(0x0000AAD6014C4C92 AS DateTime), NULL)
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai], [LoaiGiaoDich]) VALUES (1168, CAST(0x0000AAD600000000 AS DateTime), 9000000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AAD6014C85AD AS DateTime), 1147, CAST(0x0000AAD6014C85AD AS DateTime), NULL)
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai], [LoaiGiaoDich]) VALUES (1169, CAST(0x0000AAD800000000 AS DateTime), 350000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AAD800B52878 AS DateTime), 1148, CAST(0x0000AAD800B52878 AS DateTime), NULL)
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai], [LoaiGiaoDich]) VALUES (1174, CAST(0x0000AADA00000000 AS DateTime), 600000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AADA012FD2F6 AS DateTime), 1153, CAST(0x0000AADA012FD2F6 AS DateTime), NULL)
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai], [LoaiGiaoDich]) VALUES (1175, CAST(0x0000AADA00000000 AS DateTime), 990000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AADA01712587 AS DateTime), 1154, CAST(0x0000AADA01712587 AS DateTime), NULL)
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai], [LoaiGiaoDich]) VALUES (1176, CAST(0x0000AADA00000000 AS DateTime), 4000000, 4500000, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AADD00000000 AS DateTime), 1155, CAST(0x0000AADA00000000 AS DateTime), NULL)
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai], [LoaiGiaoDich]) VALUES (1177, CAST(0x0000AADD00000000 AS DateTime), 200000, 4500000, N'sdfds', 9000, N'sdfdsf ', NULL, 1155, NULL, NULL)
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai], [LoaiGiaoDich]) VALUES (1178, CAST(0x0000AADD00000000 AS DateTime), 2000000, 2500000, N'qwerew', 0, N'degdfgdgdfg dgd', NULL, 1155, NULL, NULL)
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai], [LoaiGiaoDich]) VALUES (1179, CAST(0x0000AADD00000000 AS DateTime), 500000, 2000000, N'sdfsdf', 50000, N'lai 50k', NULL, 1155, NULL, NULL)
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai], [LoaiGiaoDich]) VALUES (1180, CAST(0x0000AADD00000000 AS DateTime), 2000000, 0, N'dssdfds', 100000, N'dfsdsfds', NULL, 1155, NULL, NULL)
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai], [LoaiGiaoDich]) VALUES (1181, CAST(0x0000AADD00000000 AS DateTime), 3000000, 5000000, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AAF700000000 AS DateTime), 1156, CAST(0x0000AADD00000000 AS DateTime), NULL)
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai], [LoaiGiaoDich]) VALUES (1182, CAST(0x0000AADD00000000 AS DateTime), 2000000, 3000000, N'sdfsdf wr', 100000, N'sdfdsfdsf', NULL, 1156, NULL, NULL)
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai], [LoaiGiaoDich]) VALUES (1183, CAST(0x0000AADD00000000 AS DateTime), 14500000, 3000000, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AB1A00000000 AS DateTime), 1157, CAST(0x0000AADD01119A5F AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[KhachHangTraNo] OFF
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 

INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1, N'Vespa Roma S', 1008)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (2, N'X Man', 1008)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (3, N'133M - Bò Điên 12A', 1008)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (4, N'133S - Bò Điên 20A', 1008)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (5, N'Xe Đạp Điện', 1008)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (6, N'Nija', 1008)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (7, N'Bình Ac quy to 20A', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (8, N'Bình Ac quy nhỏ 12A', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (9, N'Săm', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (10, N'Lốp', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (11, N'Má phanh', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (12, N'Bình Ac quy cũ 12A', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (13, N'Bình Ac quy cũ 20A', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1007, N'Xe Máy Cũ', NULL)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1008, N'Xe Máy Điện', NULL)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1009, N'Xe Máy 50cc (Mới)', NULL)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1010, N'Phụ Tùng Xe Máy', NULL)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1011, N'Phụ Tùng Xe Điện', NULL)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1017, N'Sirius', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1018, N'Sirus RC', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1019, N'Vespa', 1009)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1020, N'Nan Hoa Trước', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1021, N'Exciter 135', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1022, N'Sơn Pha Sẵn', NULL)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1023, N'Exciter 150', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1024, N'Ariblade 110', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1025, N'Wave Alpha 100', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1026, N'Wave Alpha 110', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1027, N'Blade 110', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1028, N'Ware S 100', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1029, N'RSX 110', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1030, N'Ware S 110', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1031, N'Jupiter', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1032, N'Sirius FI', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1034, N'Win detech', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1036, N'SH Mode', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1037, N'Lead 110', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1038, N'Ariblade 125', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1039, N'Lead 125', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1040, N'Vision', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1041, N'Future', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1042, N'Nhông xích ', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1043, N'Ware alpha', 1009)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1044, N'Cup', 1009)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1045, N'Dream', 1009)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1046, N'Sirius', 1009)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1047, N'Exciter', 1009)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1048, N'Săm 2.75 - 17', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1049, N'Săm 2.50 - 17', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1050, N'Trục Trước', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1051, N'Trục sau', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1052, N'Tai tăng sích', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1053, N'Cần phanh', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1054, N'Cần số', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1055, N'Cần khởi động', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1056, N'Bình ắc quy cao', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1057, N'Bình ắc quy thấp', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1058, N'Gương', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1059, N'Gương cán búa', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1060, N'Tay nắm thời trang', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1061, N'Hộp sích', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1062, N'Lốp', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1063, N'Tay phanh', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1064, N'Nan hoa sau', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1065, N'Ốc hộp xích', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1066, N'V5', 1008)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1067, N'V9', 1008)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1068, N'Jeek', 1008)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1069, N'Vespa Mới', 1008)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1070, N'Dream', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1071, N'Winner', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1072, N'VP79', 1008)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1073, N'Vespa', 1008)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1074, N'Future 125Fi', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1075, N'Future X', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1076, N'Future Neo', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1077, N'Ware tàu', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1078, N'Dream tàu', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1081, N'Wave RS', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1084, N'Xe Điện Cũ', NULL)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1085, N'Xe máy 50cc Cũ', NULL)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1086, N'Dream tàu', 1085)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1087, N'Dream detech', 1085)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1088, N'Vespa', 1084)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1089, N'Cup', 1085)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1090, N'Ware tàu', 1085)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1091, N'RSX đầu to', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1092, N'EZ 100', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1094, N'Gogo', 1008)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1095, N'NVX', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1096, N'Scoopy', 1009)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1097, N'Dây phanh', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1098, N'Để chân sau x-men', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1099, N'Để chân sau v5', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1100, N'Xinh an 133', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1101, N'Tay ga thời trang', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1102, N'Cụm tay phanh dầu', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1103, N'Bộ khóa 133', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1104, N'Tay phanh ', 1011)
GO
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1105, N'Cụm công tắc x men', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1106, N'Cụm công tắc 133', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1107, N'Dè sau 133s', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1108, N'Sạc 48v 20a', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1109, N'Sạc 48v 12a', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1110, N'Sạc 60v 20a', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1111, N'IC 800W', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1112, N'Còi 48v', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1113, N'Bóng 48v', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1114, N'Đổi nguồn', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1115, N'Săm 300-10', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1116, N'Săm 16x3.0', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1117, N'Săm 18x2.125', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1118, N'Săm 16x2.125', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1119, N'Săm 18x2.50', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1120, N'Dè trước 133s', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1121, N'Ốp cổ 133', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1122, N'Mặt nạ 133', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1123, N'Ốp càng vespa ', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1124, N'Ốp càng x men', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1125, N'Ốp ắc quy 133m', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1126, N'Ốp ắc quy 133s', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1127, N'Dè trước vespa', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1128, N'Giảm sóc sau bình dầu', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1129, N'Ốp sườn x men', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1130, N'Dè sau x men', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1131, N'Mặt nạ x men', 1011)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1132, N'Dè trước x men', 1011)
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
SET IDENTITY_INSERT [dbo].[NhapHang] ON 

INSERT [dbo].[NhapHang] ([Id], [NgayNhap], [DoiTac], [TongTien], [DaTra], [ConNo], [GhiChu]) VALUES (3033, CAST(0x0000AA5D00000000 AS DateTime), 1021, 100000, 100000, 0, NULL)
INSERT [dbo].[NhapHang] ([Id], [NgayNhap], [DoiTac], [TongTien], [DaTra], [ConNo], [GhiChu]) VALUES (3034, CAST(0x0000AA5D00000000 AS DateTime), 1022, 100000, 100000, 0, N'Bình cũ trước khi sử dụng phần mềm')
INSERT [dbo].[NhapHang] ([Id], [NgayNhap], [DoiTac], [TongTien], [DaTra], [ConNo], [GhiChu]) VALUES (3035, CAST(0x0000AA2C00000000 AS DateTime), 1023, 100000, 100000, 0, N'sdfsdsdfds')
INSERT [dbo].[NhapHang] ([Id], [NgayNhap], [DoiTac], [TongTien], [DaTra], [ConNo], [GhiChu]) VALUES (3036, CAST(0x0000AADD00000000 AS DateTime), 1026, 100000000, 96000000, 4000000, N'23423 sdfs dsfsd')
SET IDENTITY_INSERT [dbo].[NhapHang] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3160, 3033, 6750000, 1, 4, 1, N'Htc', N'201883', NULL, NULL, N'Đen', NULL, 1, 11000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3161, 3033, 6750000, 1, 4, 1, N'Htc', N'201515', NULL, NULL, N'Trắng', NULL, 1, 11000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3162, 3033, 6750000, 1, 4, 1, N'Htc', N'201953', NULL, NULL, N'Đỏ ', NULL, 1, 11000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3163, 3033, 6750000, 1, 4, 1, N'Htc', N'201885', NULL, NULL, N'Đen', NULL, 1, 11000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3164, 3033, 6000000, 1, 4, 1, N'Nioshima', N'100115', NULL, NULL, N'Đỏ', NULL, 1, 10000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3165, 3033, 5300000, 1, 3, 1, N'Cmv', N'0404758', NULL, NULL, N'Xanh', NULL, 1, 6800000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3166, 3033, 5300000, 1, 3, 1, N'Htc', N'07675', NULL, NULL, N'Đen', NULL, 1, 8500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3167, 3033, 5000000, 1, 3, 1, N'Th bike', NULL, NULL, NULL, N'Trắng', NULL, 1, 7500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3168, 3033, 5000000, 1, 3, 1, N'Th bike', NULL, NULL, NULL, N'Đen', NULL, 1, 7500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3169, 3033, 4700000, 1, 3, 1, N'Zu bike', NULL, NULL, NULL, N'Đỏ', NULL, 1, 8000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3170, 3033, 4700000, 1, 3, 1, NULL, NULL, NULL, NULL, N'Trắng', NULL, 1, 8000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3171, 3033, 8000000, 1, 2, 1, N'X men 2 đèn', NULL, N'70706215', NULL, N'Trắng', NULL, 1, 12000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3172, 3033, 8000000, 1, 2, 1, NULL, NULL, N'19200', NULL, N'Trắng xám', NULL, 1, 12500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3173, 3033, 8000000, 1, 2, 1, N'Ltp', NULL, N'065018', NULL, N'Xám', NULL, 1, 12500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3174, 3033, 7400000, 1, 2, 1, NULL, NULL, N'00779', NULL, N'Đỏ', NULL, 1, 12000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3175, 3033, 7400000, 1, 2, 1, NULL, NULL, N'01405', NULL, N'Đỏ', NULL, 1, 12000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3176, 3033, 8800000, 1, 2, 1, NULL, N'600156', NULL, NULL, N'Đen xám', NULL, 1, 14500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3177, 3033, 8800000, 1, 2, 1, N'Htc', N'600357', NULL, NULL, N'Đo đen', NULL, 1, 14500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3178, 3033, 7800000, 1, 2, 1, NULL, N'900369', NULL, NULL, N'Đỏ đen', NULL, 1, 12500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3179, 3033, 7800000, 1, 2, 1, NULL, N'900369', NULL, NULL, N'Xanh đen', NULL, 1, 12500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3180, 3033, 9000000, 1, 1066, 1, NULL, N'1001682', NULL, NULL, N'Xanh', NULL, 1, 15500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3181, 3033, 9000000, 1, 1066, 1, NULL, N'101619', NULL, NULL, N'Đỏ đen', NULL, 1, 15500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3182, 3033, 13800000, 1, 1025, 1, NULL, NULL, NULL, N'21E1-18364', N'Đỏ', NULL, 1, 14500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3183, 3033, 9000000, 1, 1066, 1, NULL, N'01613', NULL, NULL, N'Đỏ đen', NULL, 1, 15500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3184, 3033, 0, 1, 1025, 1, N'(Quyết)', NULL, NULL, N'21E1-17457', N'Đỏ', NULL, 1, 0, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3185, 3033, 12000000, 1, 1027, 1, NULL, NULL, NULL, N'21E1-28953', N'Đen', NULL, 1, 13500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3186, 3033, 8000000, 1, 1073, 1, NULL, N'00030', NULL, NULL, N'Xám', NULL, 1, 12500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3187, 3033, 9500000, 1, 1069, 1, NULL, N'01719', NULL, NULL, N'Đỏ', NULL, 1, 15500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3188, 3033, 11500000, 1, 1018, 1, N'(Ngân ht)', NULL, NULL, N'21E1-12910', N'Đỏ đen', NULL, 1, 13000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3189, 3033, 9000000, 1, 1066, 1, NULL, N'101697', NULL, NULL, N'Xanh', NULL, 1, 15500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3190, 3033, 8000000, 1, 1030, 1, N'(B.Thắng)', NULL, NULL, N'21B1-81309', N'Đen', NULL, 1, 9000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3191, 3033, 8000000, 1, 1, 1, NULL, N'00387', NULL, NULL, N'Xám', NULL, 1, 12500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3192, 3033, 8000000, 1, 1030, 1, N'(Tỵ)', NULL, NULL, N'21E1-01870', N'Đen', NULL, 1, 9000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3193, 3033, 7000000, 1, 1092, 1, NULL, NULL, NULL, N'21E1-00449', N'Đỏ đen', NULL, 1, 7800000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3194, 3033, 16500000, 1, 1074, 1, NULL, NULL, NULL, N'21L1-02338', N'Cafe', NULL, 1, 16500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3195, 3033, 8850000, 1, 1073, 1, NULL, N'01862', NULL, NULL, N'Hồng', NULL, 1, 14500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3196, 3033, 8850000, 1, 1073, 1, NULL, N'01190', NULL, NULL, N'Đỏ', NULL, 1, 14500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3197, 3033, 13500000, 1, 1025, 1, NULL, NULL, NULL, N'21E1-14044', N'Xanh', NULL, 1, 14500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3198, 3033, 8850000, 1, 1073, 1, NULL, N'02620', NULL, NULL, N'Trắng sữa', 500000, 1, 14500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3199, 3033, 12800000, 1, 1025, 1, NULL, NULL, NULL, N'21B1-09523', N'Xanh', NULL, 1, 13800000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3200, 3033, 8850000, 1, 1073, 1, NULL, N'800116', NULL, NULL, N'Xanh', NULL, 1, 14500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3201, 3033, 10500000, 1, 1029, 1, N'(Dự ht)', NULL, NULL, N'21E1-06595', N'Đỏ đen', NULL, 1, 12500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3202, 3033, 9500000, 1, 1029, 1, NULL, NULL, NULL, N'21E1-03491', N'Trắng đen', NULL, 1, 10500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3203, 3033, 8000000, 1, 1073, 1, NULL, N'01966', NULL, NULL, N'Trắng', NULL, 1, 12000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3204, 3033, 11900000, 1, 1018, 1, NULL, NULL, NULL, N'21E1-04045', N'Trắng', NULL, 1, 13000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3205, 3033, 8900000, 1, 1073, 1, NULL, N'00677', NULL, NULL, N'Đen', NULL, 1, 15000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3206, 3033, 10000000, 0, 1017, 1, NULL, NULL, NULL, N'21E1-29197', N'Đen', NULL, 1, 12500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3207, 3033, 6000000, 1, 5, 1, N'Jvc', NULL, NULL, NULL, NULL, NULL, 1, 7500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3208, 3033, 13700000, 1, 1026, 1, NULL, NULL, NULL, N'21B1-66653', NULL, NULL, 1, 14500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3209, 3033, 6000000, 1, 6, 1, NULL, NULL, NULL, NULL, N'Trắng', NULL, 1, 6000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3210, 3033, 6000000, 1, 6, 1, NULL, NULL, NULL, NULL, N'Đen', NULL, 1, 6000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3211, 3033, 12400000, 1, 1027, 1, NULL, NULL, NULL, N'21E1-30694', N'Đỏ đen', NULL, 1, 13500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3212, 3033, 5400000, 1, 1090, 1, NULL, NULL, NULL, N'21FA-00489', N'Đỏ', NULL, 1, 6500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3213, 3033, 20000000, 1, 1070, 1, NULL, NULL, NULL, N'21V5-2102', N'Nâu', NULL, 1, 21500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3214, 3033, 9600000, 1, 1094, 1, NULL, N'706221', NULL, NULL, N'Trắng', NULL, 1, 15500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3215, 3033, 16000000, 1, 1070, 1, NULL, NULL, NULL, N'21B1-48814', N'Nâu', NULL, 1, 17500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3216, 3033, 9600000, 1, 1094, 1, NULL, N'31643', NULL, NULL, N'Đỏ', NULL, 1, 15500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3217, 3033, 8800000, 1, 2, 1, NULL, N'600202', NULL, NULL, N'Cafe', NULL, 1, 14500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3218, 3033, 19200000, 1, 1070, 1, NULL, NULL, NULL, N'21E1-07990', N'Nâu', NULL, 1, 21000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3219, 3033, 10500000, 1, 1030, 1, NULL, NULL, NULL, N'21E1-11013', N'Đen', NULL, 1, 11000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3220, 3033, 11900000, 1, 1068, 1, NULL, N'00511', NULL, NULL, N'Đen xanh', NULL, 1, 17200000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3221, 3033, 6000000, 1, 1018, 1, NULL, NULL, NULL, N'21E1-13097', N'Đen', NULL, 1, 7500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3222, 3033, 25300000, 1, 1095, 1, NULL, NULL, NULL, N'21B1-61881', N'Đỏ đen', NULL, 1, 27500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3223, 3033, 11900000, 0, 1068, 1, NULL, N'00441', NULL, NULL, N'Xanh đen', 600000, 1, 17200000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3224, 3033, 8500000, 1, 1068, 1, NULL, N'02206', NULL, NULL, N'Đỏ đen', NULL, 1, 14500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3225, 3033, 10000000, 1, 1030, 1, NULL, NULL, NULL, N'21E1-07596', N'Đen', NULL, 1, 11000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3226, 3033, 9500000, 1, 1067, 1, NULL, N'00302', NULL, NULL, N'Đỏ', NULL, 1, 16000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3227, 3033, 9000000, 1, 1066, 1, NULL, N'101635', NULL, NULL, N'Đỏ đen', NULL, 1, 15500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3228, 3033, 6000000, 0, 1017, 1, NULL, NULL, NULL, N'21F1-4842', N'Trắng đen', NULL, 1, 8000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3229, 3033, 13500000, 1, 1047, 1, NULL, NULL, NULL, NULL, N'Trắng xám', NULL, 1, 14500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3230, 3033, 14300000, 1, 1029, 1, NULL, NULL, NULL, N'21E1-22130', N'Trắng', NULL, 1, 15500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3231, 3033, 9750000, 1, 1043, 1, NULL, NULL, NULL, NULL, N'Trắng', NULL, 1, 11500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3232, 3033, 73, 1, 1091, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3233, 3033, 7200000, 1, 1091, 1, NULL, NULL, NULL, N'21E1-06808', N'Đen đỏ', NULL, 1, 8500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3234, 3033, 9750000, 1, 1045, 1, NULL, NULL, N'2180', NULL, NULL, NULL, 1, 11500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3235, 3033, 19500000, 1, 1024, 1, NULL, NULL, NULL, N'21E1-04499', N'3D', NULL, 1, 21000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3236, 3033, 15200000, 1, 1096, 1, NULL, N'000409', NULL, NULL, N'Xanh', NULL, 1, 19000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3237, 3033, 32000000, 1, 1038, 1, NULL, NULL, NULL, N'21E1-29217', N'Trắng', NULL, 1, 33500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3238, 3033, 28500000, 1, 1038, 1, NULL, NULL, NULL, N'21E1-27436', N'Đỏ đen', NULL, 1, 30500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3239, 3033, 23700000, 1, 1038, 1, NULL, NULL, NULL, N'21E1-18543', N'Trắng xám', NULL, 1, 26500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3240, 3033, 12000000, 1, 1029, 1, NULL, NULL, NULL, N'21E1-16744', N'Cafe', NULL, 1, 14000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3241, 3034, 475000, 42, 7, 1, NULL, NULL, NULL, NULL, N'Vàng', NULL, 47, 550000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3242, 3034, 300000, 13, 8, 1, NULL, NULL, NULL, NULL, N'Vàng', NULL, 24, 450000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3243, 3033, 12000000, 1, 1029, 1, NULL, NULL, NULL, N'21E1-20821', N'Đỏ đen', NULL, 1, 14000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3244, 3033, 30000000, 1, 1023, 1, NULL, NULL, NULL, N'21E1-23728', N'Xanh', NULL, 1, 33000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3245, 3033, 29500000, 1, 1023, 1, NULL, NULL, NULL, N'21C1-13647', N'Trắng đỏ', NULL, 1, 33000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3246, 3034, 520000, 6, 7, 1, N'Bình theo xe anbico', NULL, NULL, NULL, N'Trắng ', NULL, 10, 0, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3247, 3033, 30000000, 1, 1023, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 33000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3248, 3033, 30000000, 1, 1023, 1, NULL, NULL, NULL, N'21B1-50909', N'Xanh', NULL, 1, 33000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3249, 3035, 30000, 14, 1097, 1, NULL, NULL, NULL, NULL, NULL, NULL, 14, 50000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3250, 3033, 13600000, 1, 1025, 1, NULL, NULL, NULL, N'21B1-38455', N'Đỏ', 2180000, 1, 14500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3251, 3033, 6200000, 1, 1081, 1, NULL, NULL, NULL, N'21V3-0700', N'Đỏ', NULL, 1, 7500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3252, 3033, 4500000, 1, 1034, 1, NULL, NULL, NULL, N'21E1-24560', N'Đen', NULL, 1, 5500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3253, 3035, 50000, 6, 1098, 1, NULL, NULL, NULL, NULL, NULL, NULL, 6, 100000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3254, 3033, 7500000, 0, 1025, 1, NULL, NULL, NULL, N'21D1-06145', N'Đỏ', 900000, 1, 8500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3255, 3035, 50000, 3, 1099, 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, 100000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3256, 3033, 5200000, 1, 1089, 1, NULL, NULL, NULL, N'21BA-02600', N'Xanh', NULL, 1, 6500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3257, 3035, 30000, 7, 1099, 1, NULL, NULL, NULL, NULL, NULL, NULL, 7, 70000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3258, 3033, 6000000, 0, 1088, 1, NULL, NULL, NULL, N'21MD4-00153', N'Xanh', 1200000, 1, 7800000, NULL)
GO
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3259, 3035, 30000, 7, 1100, 1, NULL, NULL, NULL, NULL, NULL, NULL, 7, 50000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3260, 3033, 6200000, 0, 1034, 1, NULL, NULL, NULL, N'21E1-32643', N'Đen', NULL, 1, 7200000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3261, 3035, 80000, 4, 1103, 1, NULL, NULL, NULL, NULL, NULL, NULL, 4, 200000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3262, 3033, 9000000, 1, 1018, 1, NULL, NULL, NULL, N'21E1-20916', N'Đen', NULL, 1, 10000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3263, 3035, 35000, 10, 1101, 1, NULL, NULL, NULL, NULL, NULL, NULL, 10, 100000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3264, 3033, 12400000, 1, 1029, 1, NULL, NULL, NULL, N'21E1-21871', N'Đen đỏ', NULL, 1, 14000000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3265, 3033, 12500000, 0, 1032, 1, NULL, NULL, NULL, N'21E1-29181', N'Trắng', 2000000, 1, 13500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3266, 3035, 150000, 3, 1102, 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, 200000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3267, 3035, 50000, 13, 1104, 1, NULL, NULL, NULL, NULL, NULL, NULL, 13, 100000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3268, 3035, 50000, 4, 1105, 1, NULL, NULL, NULL, NULL, NULL, NULL, 4, 150000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3269, 3035, 50000, 2, 1106, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, 120000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3270, 3035, 70000, 6, 1107, 1, NULL, NULL, NULL, NULL, NULL, NULL, 6, 150000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3271, 3035, 150000, 24, 1108, 1, NULL, NULL, NULL, NULL, NULL, NULL, 24, 300000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3272, 3035, 150000, 5, 1110, 1, NULL, NULL, NULL, NULL, NULL, NULL, 5, 300000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3273, 3035, 300000, 3, 1111, 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, 500000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3274, 3035, 50000, 4, 1112, 1, NULL, NULL, NULL, NULL, NULL, NULL, 5, 80000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3275, 3035, 30000, 5, 1113, 1, NULL, NULL, NULL, NULL, NULL, NULL, 5, 80000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3276, 3035, 40000, 1, 1115, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 50000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3277, 3035, 30000, 4, 1118, 1, NULL, NULL, NULL, NULL, NULL, NULL, 4, 50000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3278, 3035, 40000, 4, 1116, 1, NULL, NULL, NULL, NULL, NULL, NULL, 4, 70000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3279, 3035, 40000, 2, 1117, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, 70000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3280, 3035, 40000, 3, 1119, 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, 70000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3281, 3035, 300000, 0, 1128, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 450000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3282, 3035, 80000, 4, 1123, 1, NULL, NULL, NULL, NULL, NULL, 1100233, 4, 120000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3283, 3035, 80000, 3, 1129, 1, NULL, NULL, NULL, NULL, NULL, NULL, 7, 120000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3284, 3035, 50000, 2, 1130, 1, NULL, NULL, NULL, NULL, NULL, NULL, 4, 120000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3285, 3035, 100000, 3, 1125, 1, NULL, NULL, NULL, NULL, NULL, NULL, 4, 150000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3286, 3035, 50000, 0, 1131, 1, NULL, NULL, NULL, NULL, N'Trắng', NULL, 1, 120000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3287, 3035, 100000, 2, 1126, 1, NULL, NULL, NULL, NULL, NULL, 1500000, 4, 150000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3288, 3035, 50000, 0, 1132, 1, NULL, NULL, NULL, NULL, N'Trắng', NULL, 1, 120000, NULL)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3289, 3035, 50000, 4, 1114, 1, NULL, NULL, NULL, NULL, NULL, 7500000, 5, 80000, NULL)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[SuaChuaNoiBo] ON 

INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (16, 3198, CAST(0x0000AA5F00000000 AS DateTime), N'Thủy TH', 500000, N'Làm đăng ký')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (17, 3265, CAST(0x0000AAD500000000 AS DateTime), N'werewr', 1000000, N'234234')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (18, 3265, CAST(0x0000AAD500000000 AS DateTime), N'werewr', 1000000, N'dfdsfjkds')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (19, 3258, CAST(0x0000AAD700000000 AS DateTime), N'thợ', 1200000, N'Lắp bình bán xe mới')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (20, 3254, CAST(0x0000AADC00000000 AS DateTime), N'sfsdfd', 900000, N'2423')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (21, 3223, CAST(0x0000AADD00000000 AS DateTime), N'', 600000, N'đăng kí')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (22, 3250, CAST(0x0000AADE00000000 AS DateTime), N'werewa ', 100000, N'sdf sfds')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (23, 3250, CAST(0x0000AAF200000000 AS DateTime), N'thợ', 2080000, N'234234')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (24, 3287, CAST(0x0000AADF00000000 AS DateTime), N'WREWR', 300000, N'WEREW')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (25, 3287, CAST(0x0000AADF00000000 AS DateTime), N'frewfr', 1200000, N' werwe')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (26, 3282, CAST(0x0000AADF00000000 AS DateTime), N'XCFSD', 100000, N'WEREWR')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (27, 3282, CAST(0x0000AADA00000000 AS DateTime), N'wrwe', 1000000, N'sdfs')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (28, 3282, CAST(0x0000AADF00000000 AS DateTime), N'sdfs', 233, N'wer')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (29, 3289, CAST(0x0000AADF00000000 AS DateTime), N'werew', 3300000, N'23sdfsd dsfds')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (30, 3289, CAST(0x0000AADF00000000 AS DateTime), N'werew', 3600000, N'23sdfsd dsfds')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (31, 3289, CAST(0x0000AADF00000000 AS DateTime), N'erww we', 600000, N'234234')
SET IDENTITY_INSERT [dbo].[SuaChuaNoiBo] OFF
SET IDENTITY_INSERT [dbo].[Xa] ON 

INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (1, N'An Thịnh')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (2, N'Đại Sơn')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (3, N'Mậu A')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (4, N'Đông An')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (6, N'Hoàng Thắng')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (8, N'Đông Cuông')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (9, N'An Bình')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (10, N'Yên Hưng')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (11, N'Yên Thái')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (12, N'Yên hợp')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (13, N'Ngòi A')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (14, N'Mậu Đông')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (16, N'Lăng Thíp')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (17, N'Lâm Giang')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (18, N'Nà Hẩu')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (19, N'Mỏ Vàng')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (20, N'Xuân Ái')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (22, N'Tân Hợp')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (23, N'Đại Phác')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (25, N'Phong Dụ Thượng')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (26, N'Phong Dụ Hạ')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (27, N'Châu Quế Hạ')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (28, N'Châu Quế Thượng')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (29, N'Quang Minh')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (30, N'Viễn Sơn')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (31, N'Xuân Tầm')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (32, N'Yên Phú')
INSERT [dbo].[Xa] ([Id], [Ten]) VALUES (33, N'Z Không Thuộc Văn Yên')
SET IDENTITY_INSERT [dbo].[Xa] OFF
USE [master]
GO
ALTER DATABASE [dpapptest] SET  READ_WRITE 
GO
