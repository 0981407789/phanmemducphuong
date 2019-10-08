USE [master]
GO
/****** Object:  Database [dpapp]    Script Date: 10/8/2019 7:55:54 AM ******/
CREATE DATABASE [dpapp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dpapp', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\dpapp.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dpapp_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\dpapp_log.ldf' , SIZE = 1856KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dpapp] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dpapp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dpapp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dpapp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dpapp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dpapp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dpapp] SET ARITHABORT OFF 
GO
ALTER DATABASE [dpapp] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dpapp] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [dpapp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dpapp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dpapp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dpapp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dpapp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dpapp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dpapp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dpapp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dpapp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dpapp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dpapp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dpapp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dpapp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dpapp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dpapp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dpapp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dpapp] SET RECOVERY FULL 
GO
ALTER DATABASE [dpapp] SET  MULTI_USER 
GO
ALTER DATABASE [dpapp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dpapp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dpapp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dpapp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [dpapp]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 10/8/2019 7:55:54 AM ******/
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
/****** Object:  Table [dbo].[ChiTietSuaChuaNoiBo]    Script Date: 10/8/2019 7:55:54 AM ******/
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
/****** Object:  Table [dbo].[CuaHang]    Script Date: 10/8/2019 7:55:54 AM ******/
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
/****** Object:  Table [dbo].[CuaHangTraNo]    Script Date: 10/8/2019 7:55:54 AM ******/
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
/****** Object:  Table [dbo].[DangKy]    Script Date: 10/8/2019 7:55:54 AM ******/
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
/****** Object:  Table [dbo].[DoiTac]    Script Date: 10/8/2019 7:55:54 AM ******/
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
/****** Object:  Table [dbo].[DonHang]    Script Date: 10/8/2019 7:55:54 AM ******/
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
/****** Object:  Table [dbo].[HangSanXuat]    Script Date: 10/8/2019 7:55:54 AM ******/
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
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/8/2019 7:55:54 AM ******/
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
/****** Object:  Table [dbo].[KhachHangTraNo]    Script Date: 10/8/2019 7:55:54 AM ******/
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
 CONSTRAINT [PK_KhachHangTraNo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 10/8/2019 7:55:54 AM ******/
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
/****** Object:  Table [dbo].[NhapHang]    Script Date: 10/8/2019 7:55:54 AM ******/
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
/****** Object:  Table [dbo].[SanPham]    Script Date: 10/8/2019 7:55:54 AM ******/
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
/****** Object:  Table [dbo].[SuaChuaNoiBo]    Script Date: 10/8/2019 7:55:54 AM ******/
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
/****** Object:  Table [dbo].[Xa]    Script Date: 10/8/2019 7:55:54 AM ******/
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

INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (2139, 2154, 3329, 36000000, 1, 36000000, NULL, 29000000, 7000000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (2140, 2155, 3334, 27800000, 1, 27800000, NULL, 22500000, 5000000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (2141, 2156, 3342, 7800000, 1, 7800000, NULL, 4600000, 3200000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (2142, 2157, 3412, 8850000, 1, 8850000, NULL, 8200000, 650000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (2143, 2158, 3320, 27000000, 1, 27000000, NULL, 26000000, 2000000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (2144, 2159, 3382, 6500000, 1, 6500000, NULL, 4200000, 2300000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (2145, 2159, 3414, 0, 4, 0, NULL, 1220000, -1220000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (2146, 2160, 3383, 7800000, 1, 7800000, NULL, 5650000, 2150000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (2148, 2162, 3418, 6050000, 1, 6050000, NULL, 5500000, 550000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (2149, 2163, 3417, 35500000, 1, 35500000, NULL, 35000000, 500000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (2150, 2164, 3346, 8300000, 1, 8300000, NULL, 5000000, 3300000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (2151, 2164, 3414, 0, 4, 0, NULL, 1220000, -1220000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (2152, 2165, 3300, 14500000, 1, 14500000, NULL, 13700000, 800000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (2153, 2166, 3409, 12400000, 1, 12400000, NULL, 10250000, 2150000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (2154, 2167, 3327, 7000000, 1, 7000000, NULL, 6500000, 500000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (2155, 2168, 3419, 37000000, 1, 37000000, NULL, 34500000, 2500000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (2156, 2169, 3415, 550000, 5, 2700000, NULL, 2400000, 300000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (2157, 2170, 3415, 400000, 4, 1600000, NULL, 1920000, -320000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (2158, 2171, 3317, 27500000, 1, 27500000, NULL, 21900000, 5600000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (2159, 2172, 3425, 13450000, 1, 13450000, NULL, 8750000, 4700000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (2160, 2173, 3367, 17500000, 1, 17500000, NULL, 14600000, 2900000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (3160, 3173, 3354, 13500000, 1, 13500000, NULL, 8600000, 4900000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (3161, 3174, 3405, 12500000, 1, 12500000, NULL, 11300000, 1200000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (3166, 3178, 3344, 8000000, 1, 8000000, NULL, 4600000, 3400000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (3167, 3178, 3414, 0, 4, 0, NULL, 1220000, -1220000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (3168, 3179, 3325, 12000000, 1, 12000000, NULL, 7500000, 4500000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (3169, 3180, 3343, 8000000, 1, 8000000, NULL, 4600000, 3400000, NULL)
INSERT [dbo].[ChiTietDonHang] ([Id], [IdBanHang], [IdSanPham], [GiaBan], [SoLuong], [TongTien], [TrangThai], [TongNhap], [Lai], [PhiKhac]) VALUES (3170, 3180, 3414, 0, 4, 0, NULL, 1220000, -1220000, NULL)
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] OFF
SET IDENTITY_INSERT [dbo].[ChiTietSuaChuaNoiBo] ON 

INSERT [dbo].[ChiTietSuaChuaNoiBo] ([Id], [IdSuaChua], [IdPhuTung], [SoLuong], [GiaTien], [ThanhTien], [PhiKhac], [GhiChu]) VALUES (1, 21, 3414, 4, 305000, 1220000, NULL, NULL)
INSERT [dbo].[ChiTietSuaChuaNoiBo] ([Id], [IdSuaChua], [IdPhuTung], [SoLuong], [GiaTien], [ThanhTien], [PhiKhac], [GhiChu]) VALUES (2, 24, 3415, 5, 480000, 2400000, NULL, NULL)
INSERT [dbo].[ChiTietSuaChuaNoiBo] ([Id], [IdSuaChua], [IdPhuTung], [SoLuong], [GiaTien], [ThanhTien], [PhiKhac], [GhiChu]) VALUES (4, 1029, 3434, 1, 40000, 40000, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ChiTietSuaChuaNoiBo] OFF
SET IDENTITY_INSERT [dbo].[CuaHang] ON 

INSERT [dbo].[CuaHang] ([Id], [Ten], [DiaChi], [GhiChu]) VALUES (1, N'Cơ sở 1', NULL, NULL)
INSERT [dbo].[CuaHang] ([Id], [Ten], [DiaChi], [GhiChu]) VALUES (2, N'Cơ Sở 2', NULL, NULL)
SET IDENTITY_INSERT [dbo].[CuaHang] OFF
SET IDENTITY_INSERT [dbo].[CuaHangTraNo] ON 

INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1026, CAST(0x0000AAD400000000 AS DateTime), 100000000, 0, NULL, NULL, 3036, NULL, NULL)
INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1027, CAST(0x0000AAD500000000 AS DateTime), 100000000, 0, NULL, NULL, 3037, NULL, NULL)
INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1028, CAST(0x0000AAD500000000 AS DateTime), 100000000, 0, NULL, NULL, 3038, NULL, NULL)
INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1029, CAST(0x0000AAD600000000 AS DateTime), 21500000, 0, NULL, NULL, 3039, NULL, NULL)
INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1030, CAST(0x0000AAD700000000 AS DateTime), 10000000, 0, NULL, NULL, 3040, NULL, NULL)
INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1031, CAST(0x0000AAD700000000 AS DateTime), 2500000, 0, NULL, NULL, 3041, NULL, NULL)
INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1032, CAST(0x0000AAD800000000 AS DateTime), 35000000, 0, NULL, NULL, 3042, NULL, NULL)
INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1033, CAST(0x0000AAD800000000 AS DateTime), 5500000, 0, NULL, NULL, 3043, NULL, NULL)
INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1034, CAST(0x0000AADA00000000 AS DateTime), 34000000, 0, NULL, NULL, 3044, NULL, NULL)
INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1035, CAST(0x0000AAD900000000 AS DateTime), 35000000, 0, NULL, NULL, 3045, NULL, NULL)
INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1036, CAST(0x0000AADB00000000 AS DateTime), 28300000, 0, NULL, NULL, 3046, NULL, NULL)
INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1037, CAST(0x0000AADE00000000 AS DateTime), 1120000, 0, NULL, NULL, 3048, NULL, NULL)
INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1038, CAST(0x0000AADE00000000 AS DateTime), 100000, 0, NULL, NULL, 3049, NULL, NULL)
INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1039, CAST(0x0000AADE00000000 AS DateTime), 29500000, 0, NULL, NULL, 3051, NULL, NULL)
INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1040, CAST(0x0000AADE00000000 AS DateTime), 5000000, 0, NULL, NULL, 3052, NULL, NULL)
INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1041, CAST(0x0000AADE00000000 AS DateTime), 4500000, 0, NULL, NULL, 3053, NULL, NULL)
INSERT [dbo].[CuaHangTraNo] ([Id], [NgayTra], [SoTienTra], [ConNo], [NguoiTra], [ChungTu], [IdNhapHang], [PhiKhac], [GhiChu]) VALUES (1042, CAST(0x0000AADD00000000 AS DateTime), 13000000, 0, NULL, NULL, 3054, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CuaHangTraNo] OFF
SET IDENTITY_INSERT [dbo].[DoiTac] ON 

INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1021, N'Xe cũ tồn', NULL, N'Xe cũ tồn trước khi sử dụng phần mềm', NULL, NULL, 0)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1022, N'Bình xe điện tồn', NULL, N'Bình cũ trước khi sử dụng phần mềm', NULL, NULL, 0)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1023, N'Phụ tùng xe điện tồn', NULL, N'Phụ tùng xe điện tồn', NULL, NULL, 0)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1024, N'Xe điện tồn', NULL, N'Xe điện tồn trước khi sử dụng phần mềm', N'32423423', NULL, 0)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1025, N'Xe máy mới tồn', NULL, N'Xe tồn trước khi sử dụng phần mềm', N'238472389', NULL, 0)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1026, N'Phú làng mỉnh', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1027, N'Ắc quy Tồn', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1028, N'Đặng thị nhị', N'TDP Số 4 Mậu A', NULL, N'0363378243', NULL, 1)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1029, N'Tiêu ngọc tâm', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1030, N'Khách lẻ', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1031, N'Nguyễn Văn Hà', N'An Thịnh', NULL, NULL, NULL, 1)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1032, N'Thế - Thắng Yên', N'Mậu A', NULL, NULL, NULL, 0)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1033, N'Công Ty Cổ Phần LD HTC', N'Hưng Yên', NULL, NULL, NULL, 0)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1034, N'Phụ Tùng Hà Nga', N'Yên Bái', NULL, NULL, NULL, 0)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1035, N'Phụ tùng tồn', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1036, N'Viên', NULL, N'Tháng 10', NULL, NULL, 0)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1037, N'nguyễn minh đức', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1038, N'Đối tác test', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1039, N'Nguyễn Văn Thảo', N'Lắc Mường-phong dụ hạ', NULL, N'0973405428', NULL, 1)
INSERT [dbo].[DoiTac] ([Id], [Ten], [DiaChi], [GhiChu], [SoDienThoai], [SoTaiKhoan], [KhachLe]) VALUES (1040, N'La Thị Luyến', N'phong dụ thượng -văn yên', N'đổi xe', N'0986261578', NULL, 1)
SET IDENTITY_INSERT [dbo].[DoiTac] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (2154, CAST(0x0000AAD500000000 AS DateTime), N'Phương', 36000000, 36000000, 0, CAST(0x0000AAD500DA9F43 AS DateTime), 2085, 1, CAST(0x0000AAD500DA9F43 AS DateTime), N'', 29000000, 7000000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (2155, CAST(0x0000AAD600000000 AS DateTime), N'Phương', 27800000, 27800000, 0, CAST(0x0000AAD6003397BA AS DateTime), 2086, 1, CAST(0x0000AAD6003397BA AS DateTime), N'', 22500000, 5000000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (2156, CAST(0x0000AAD600000000 AS DateTime), N'Phương', 7800000, 7800000, 0, CAST(0x0000AAD600660C38 AS DateTime), 2088, 1, CAST(0x0000AAD600660C38 AS DateTime), N'', 4600000, 3200000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (2157, CAST(0x0000AAD600000000 AS DateTime), N'Phương', 8850000, 8850000, 0, CAST(0x0000AAD6006714DE AS DateTime), 2089, 1, CAST(0x0000AAD6006714DE AS DateTime), N'', 8200000, 650000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (2158, CAST(0x0000AAD700000000 AS DateTime), N'Phương', 27000000, 27000000, 0, CAST(0x0000AAD6013FE4C0 AS DateTime), 2091, 1, CAST(0x0000AAD6013FE4C0 AS DateTime), N'', 26000000, 2000000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (2159, CAST(0x0000AAD700000000 AS DateTime), N'Phương', 6500000, 6500000, 0, CAST(0x0000AAD60143A3A1 AS DateTime), 2092, 1, CAST(0x0000AAD60143A3A1 AS DateTime), N'', 5420000, 1080000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (2160, CAST(0x0000AAD700000000 AS DateTime), N'Phương', 7800000, 7800000, 0, CAST(0x0000AAD7002C1146 AS DateTime), 2094, 1, CAST(0x0000AAD7002C1146 AS DateTime), N'', 5650000, 2150000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (2162, CAST(0x0000AAD800000000 AS DateTime), N'Phương', 6050000, 6050000, 0, CAST(0x0000AAD801326038 AS DateTime), 2096, 1, CAST(0x0000AAD801326038 AS DateTime), N'', 5500000, 550000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (2163, CAST(0x0000AAD800000000 AS DateTime), N'Phương', 35500000, 35500000, 0, CAST(0x0000AAD8015F7E16 AS DateTime), 2097, 1, CAST(0x0000AAD8015F7E16 AS DateTime), N'Khách chuộc lại xe', 35000000, 500000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (2164, CAST(0x0000AADA00000000 AS DateTime), N'Phương', 8300000, 8300000, 0, CAST(0x0000AADA012D7D92 AS DateTime), 2098, 1, CAST(0x0000AADA012D7D92 AS DateTime), N'', 6220000, 2080000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (2165, CAST(0x0000AAD900000000 AS DateTime), N'Phương', 14500000, 10500000, 4000000, CAST(0x0000AADD00000000 AS DateTime), 2095, 1, CAST(0x0000AADA0132936A AS DateTime), N'Giữ đăng ký xe + Chụp CMND', 13700000, 800000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (2166, CAST(0x0000AADB00000000 AS DateTime), N'Phương', 12400000, 12400000, 0, CAST(0x0000AADC00818BF8 AS DateTime), 2099, 1, CAST(0x0000AADC00818BF8 AS DateTime), N'', 10250000, 2150000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (2167, CAST(0x0000AADC00000000 AS DateTime), N'Phương', 7000000, 7000000, 0, CAST(0x0000AADC0107BF18 AS DateTime), 2100, 1, CAST(0x0000AADC0107BF18 AS DateTime), N'', 6500000, 500000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (2168, CAST(0x0000AADC00000000 AS DateTime), N'Phương', 37000000, 37000000, 0, CAST(0x0000AADC0108D639 AS DateTime), 2101, 1, CAST(0x0000AADC0108D639 AS DateTime), N'', 34500000, 2500000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (2169, CAST(0x0000AADC00000000 AS DateTime), N'Phương', 2700000, 2700000, 0, CAST(0x0000AADC011B4F1E AS DateTime), 2102, 1, CAST(0x0000AADC011B4F1E AS DateTime), N'', 2400000, 300000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (2170, CAST(0x0000AADC00000000 AS DateTime), N'Phương', 1600000, 1600000, 0, CAST(0x0000AADC011C2CE5 AS DateTime), 2103, 1, CAST(0x0000AADC011C2CE5 AS DateTime), N'', 1920000, -320000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (2171, CAST(0x0000AADC00000000 AS DateTime), N'Phương', 27500000, 19500000, 8000000, CAST(0x0000AAFB00000000 AS DateTime), 2104, 1, CAST(0x0000AADC012E4F93 AS DateTime), N'', 21900000, 5600000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (2172, CAST(0x0000AADD00000000 AS DateTime), N'Phương', 13450000, 13450000, 0, CAST(0x0000AADD008ADC75 AS DateTime), 2105, 1, CAST(0x0000AADD008ADC75 AS DateTime), N'', 8750000, 4700000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (2173, CAST(0x0000AADD00000000 AS DateTime), N'Phương', 17500000, 14500000, 3000000, CAST(0x0000AB2400000000 AS DateTime), 2106, 1, CAST(0x0000AADD00000000 AS DateTime), N'', 14600000, 2900000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (3173, CAST(0x0000AADE00000000 AS DateTime), N'Phương', 13500000, 13500000, 0, CAST(0x0000AADE0094FEEE AS DateTime), 3106, 1, CAST(0x0000AADE0094FEEE AS DateTime), N'', 8600000, 4900000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (3174, CAST(0x0000AADE00000000 AS DateTime), N'Phương', 12500000, 12500000, 0, CAST(0x0000AADE00FE2B9B AS DateTime), 3107, 1, CAST(0x0000AADE00FE2B9B AS DateTime), N'', 11300000, 1200000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (3178, CAST(0x0000AADE00000000 AS DateTime), N'Phương', 8000000, 8000000, 0, CAST(0x0000AADE0134D233 AS DateTime), 3108, 1, CAST(0x0000AADE0134D233 AS DateTime), N'', 5820000, 2180000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (3179, CAST(0x0000AADD00000000 AS DateTime), N'Phương', 12000000, 8000000, 4000000, CAST(0x0000AADD00000000 AS DateTime), 3111, 1, CAST(0x0000AADD00000000 AS DateTime), N'', 7500000, 4500000)
INSERT [dbo].[DonHang] ([Id], [NgayBan], [NguoiBan], [SoTien], [DaTra], [ConNo], [NgayHen], [KhachHang], [TrangThai], [NgayTinhLai], [GhiChu], [TongNhap], [Lai]) VALUES (3180, CAST(0x0000AADE00000000 AS DateTime), N'Phương', 8000000, 8000000, 0, CAST(0x0000AADE016BF452 AS DateTime), 3112, 1, CAST(0x0000AADE016BF452 AS DateTime), N'', 5820000, 2180000)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1074, N'Phạm Văn Hoàn', N'Thôn đồng tâm', 1, N'0363897223', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1075, N'Khách Lẻ', N'sdfsd', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1076, N'Phạn thị thắm', N'Thôn gốc mít ', 4, N'0374354577', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1077, N'khach le', N'dsf sd', 27, N'09810101014', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1078, N'khach le', N'dfsdf werewrew', 27, N'234234', NULL, N'24/09/2019', NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1079, N'Anh B', N'Tổ dân phố 10', 3, N'23423', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1080, N'Anh C', N'ừds sdfdsf ', 23, N'239847', NULL, N'25/09/2019', N'234234')
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1081, N'Anh B', N'sdf dsf dfsf saf', 1, N'234234', NULL, N'25/09/2019', N'23423432')
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (1082, N'Khach le', N'Cau 1341289', 8, N'324234', NULL, N'25/09/2019', N'234234234')
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2081, N'Anh Chi abcv', N'ewrwev werew ', 3, N'423423', NULL, N'25/09/2019', N'234234')
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2082, N'va sam', N'sdfdsfds', 2, N'23423423456', NULL, N'25/09/2019', N'23452323')
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2083, N'Nguyễn Thị Ly', N'Thôn 1', 20, N'23423423499', NULL, N'26/09/2019', N'234234234')
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2084, N'Nguyễn Văn C', N'Thôn 100', 26, N'0911222333', NULL, N'26/09/2019', N'345345222')
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2085, N'Lê Thành Đạt', N'Thôn 3b Việt cường Trấn Yên', 33, NULL, NULL, N'22/12/1993', N'060999292')
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2086, N'nguyễn thị giang', NULL, 10, NULL, NULL, N'06/03/1982', N'060835313')
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2087, N'nguyễn thị giang', NULL, 10, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2088, N'Đinh thị hồng loan', N'xx', 28, N'0982087180', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2089, N'Mr Sơn Yên Bái', N'TP Yên Bái', 33, N'0913399160', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2090, N'phạm thanh quyết', NULL, NULL, N'0392626260', NULL, NULL, N'060952646')
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2091, N'phạm thanh quyết', N'TDPS6', 3, N'0392626260', NULL, NULL, N'060952646')
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2092, N'Đặng thị nhị', N'TDP Số 4', 3, N'0363378243', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2093, N'trần hạ vy', N'thôn 3', 12, N'0856745564', NULL, N'15/08/2008', NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2094, N'trần hạ vy', N'thôn 3', 12, N'0856745564', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2095, N'bàn tòn kiều', N'tháp con 1', 30, N'0344164602', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2096, N'Hưng - Lục Yên', N'Lục Yên', 33, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2097, N'Tâm', N'Ngã tư công an', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2098, N'Nguyễn thị hương', N'Đập róm', 4, N'0393937231', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2099, N'Phạm Quang Vinh', N'Cổng Trào', 1, N'0387046993', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2100, N'nguyễn văn a', N'thôn a', 27, N'0123456798', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2101, N'bàn tòn chảy', N'thôn khe qué', 30, N'0398321051', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2102, N'Trà pege', N'hà nội', 33, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2103, N'khách lẻ', N'sdf dsfds', 27, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2104, N'vũ đình hoàng', N'quyết tiến', 6, N'096475661', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2105, N'trần thị hoa', N'phố nhoi', 10, N'0334803140', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (2106, N'triệu quốc lịch', N'Thôn quyết tiến', 6, N'0868792684', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (3106, N'Nguyễn Thị Vân', N'thôn Vĩ Lâm', 17, N'0977395640', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (3107, N'Nguyễn Văn Thảo', N'Lắc Mường', 26, N'0973405428', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (3108, N'Phạm Thị Liên', N'Thôn An Phú', 1, N'0393508595', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (3111, N'La Thị Luyến', N'thôn 1', 25, N'0986261578', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([Id], [Ten], [DiaChi], [IdXa], [SoDienThoai], [Email], [NgaySinh], [CMND]) VALUES (3112, N'Nguyễn Thị Hoài', N'Cổng Trào', 1, N'0375738105', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[KhachHangTraNo] ON 

INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (2175, CAST(0x0000AAD500000000 AS DateTime), 36000000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AAD500DA9F4B AS DateTime), 2154, CAST(0x0000AAD500DA9F4B AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (2176, CAST(0x0000AAD600000000 AS DateTime), 27800000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AAD6003397BE AS DateTime), 2155, CAST(0x0000AAD6003397BE AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (2177, CAST(0x0000AAD600000000 AS DateTime), 7800000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AAD600660C3D AS DateTime), 2156, CAST(0x0000AAD600660C3D AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (2178, CAST(0x0000AAD600000000 AS DateTime), 8850000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AAD6006714DE AS DateTime), 2157, CAST(0x0000AAD6006714DE AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (2179, CAST(0x0000AAD700000000 AS DateTime), 27000000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AAD6013FE4C4 AS DateTime), 2158, CAST(0x0000AAD6013FE4C4 AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (2180, CAST(0x0000AAD700000000 AS DateTime), 6500000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AAD60143A3A5 AS DateTime), 2159, CAST(0x0000AAD60143A3A5 AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (2181, CAST(0x0000AAD700000000 AS DateTime), 7800000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AAD7002C114A AS DateTime), 2160, CAST(0x0000AAD7002C114A AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (2183, CAST(0x0000AAD800000000 AS DateTime), 6050000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AAD80132603D AS DateTime), 2162, CAST(0x0000AAD80132603D AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (2184, CAST(0x0000AAD800000000 AS DateTime), 35500000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AAD8015F7E1F AS DateTime), 2163, CAST(0x0000AAD8015F7E1F AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (2185, CAST(0x0000AADA00000000 AS DateTime), 8300000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AADA012D7D92 AS DateTime), 2164, CAST(0x0000AADA012D7D92 AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (2186, CAST(0x0000AAD900000000 AS DateTime), 10500000, 4000000, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AADD00000000 AS DateTime), 2165, CAST(0x0000AADA01329378 AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (2187, CAST(0x0000AADB00000000 AS DateTime), 12400000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AADC00818BFD AS DateTime), 2166, CAST(0x0000AADC00818BFD AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (2188, CAST(0x0000AADC00000000 AS DateTime), 7000000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AADC0107BF1D AS DateTime), 2167, CAST(0x0000AADC0107BF1D AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (2189, CAST(0x0000AADC00000000 AS DateTime), 37000000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AADC0108D63D AS DateTime), 2168, CAST(0x0000AADC0108D63D AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (2190, CAST(0x0000AADC00000000 AS DateTime), 2700000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AADC011B4F22 AS DateTime), 2169, CAST(0x0000AADC011B4F22 AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (2191, CAST(0x0000AADC00000000 AS DateTime), 1600000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AADC011C2CEA AS DateTime), 2170, CAST(0x0000AADC011C2CEA AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (2192, CAST(0x0000AADC00000000 AS DateTime), 19500000, 8000000, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AAFB00000000 AS DateTime), 2171, CAST(0x0000AADC012E4F98 AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (2193, CAST(0x0000AADD00000000 AS DateTime), 13450000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AADD008ADC89 AS DateTime), 2172, CAST(0x0000AADD008ADC89 AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (2194, CAST(0x0000AADD00000000 AS DateTime), 14500000, 3000000, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AB2400000000 AS DateTime), 2173, CAST(0x0000AADD00000000 AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (3194, CAST(0x0000AADE00000000 AS DateTime), 13500000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AADE0094FEF7 AS DateTime), 3173, CAST(0x0000AADE0094FEF7 AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (3195, CAST(0x0000AADE00000000 AS DateTime), 12500000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AADE00FE2B9B AS DateTime), 3174, CAST(0x0000AADE00FE2B9B AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (3199, CAST(0x0000AADE00000000 AS DateTime), 8000000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AADE0134D241 AS DateTime), 3178, CAST(0x0000AADE0134D241 AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (3200, CAST(0x0000AADD00000000 AS DateTime), 8000000, 4000000, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AADD00000000 AS DateTime), 3179, CAST(0x0000AADD00000000 AS DateTime))
INSERT [dbo].[KhachHangTraNo] ([Id], [NgayTra], [SoTien], [ConNo], [NguoiNhan], [PhiKhac], [GhiChu], [NgayHen], [IdDonHang], [NgayTinhLai]) VALUES (3201, CAST(0x0000AADE00000000 AS DateTime), 8000000, 0, N'Phương', 0, N'Thanh toán khi mua hàng', CAST(0x0000AADE016BF452 AS DateTime), 3180, CAST(0x0000AADE016BF452 AS DateTime))
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
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1029, N'RSX 110 (2016)', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1030, N'Ware S 110', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1031, N'Jupiter', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1032, N'Sirius FI', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1034, N'Win detech', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1036, N'SH Mode', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1037, N'Lead 110', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1038, N'Ariblade 125 (2014)', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1039, N'Lead 125', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1040, N'Vision', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1041, N'Future', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1042, N'Nhông xích ', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1043, N'Wave nam anh', 1009)
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
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1133, N'RSX 2010', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1134, N'Ariblade 125 (2016)', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1135, N'Không Rõ', 1007)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1136, N'Aura 9', 1008)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1137, N'Exter 165 (X men mini)', 1008)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1138, N'HTC J7 (Xe bàn đạp)', 1008)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1139, N'X men 9 (Trans)', 1008)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1140, N'Wave victorya', 1009)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1141, N'Xe máy mới', NULL)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1142, N'Win detech 110', 1141)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1143, N'Win detech 120', 1141)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1144, N'Win detech 130', 1141)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1145, N'Win detech 140', 1141)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1146, N'Winindo 125', 1141)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1147, N'Samurai', 1008)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1148, N'M133', 1084)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1149, N'Cánh ngoài Phải Sirius', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1150, N'Nắp Hậu Si', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1151, N'Bát côn sau Ju Si VĐ', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1152, N'Ổ Khoá Sirius', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1153, N'Lá côn Ju', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1154, N'Vỏ Yên SH mode', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1155, N'Săm 90/90-14', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1156, N'Vistra số', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1158, N'Castrol 800 ga', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1159, N'Castrol 1 lít', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1160, N'Gama', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1161, N'Dầu AB', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1162, N'Zin 100', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1163, N'Dầu honda ga', 1010)
INSERT [dbo].[LoaiSanPham] ([Id], [Ten], [IdCha]) VALUES (1164, N'Dầu honda số', 1010)
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
SET IDENTITY_INSERT [dbo].[NhapHang] ON 

INSERT [dbo].[NhapHang] ([Id], [NgayNhap], [DoiTac], [TongTien], [DaTra], [ConNo], [GhiChu]) VALUES (3036, CAST(0x0000AAD400000000 AS DateTime), 1021, 100000000, 100000000, 0, N'Xe trước khi sử dụng phần mềm')
INSERT [dbo].[NhapHang] ([Id], [NgayNhap], [DoiTac], [TongTien], [DaTra], [ConNo], [GhiChu]) VALUES (3037, CAST(0x0000AAD500000000 AS DateTime), 1024, 100000000, 100000000, 0, N'Xe điện tồn trước khi sử dụng phần mềm')
INSERT [dbo].[NhapHang] ([Id], [NgayNhap], [DoiTac], [TongTien], [DaTra], [ConNo], [GhiChu]) VALUES (3038, CAST(0x0000AAD500000000 AS DateTime), 1025, 100000000, 100000000, 0, N'Xe trước khi sử dụng phần mềm')
INSERT [dbo].[NhapHang] ([Id], [NgayNhap], [DoiTac], [TongTien], [DaTra], [ConNo], [GhiChu]) VALUES (3039, CAST(0x0000AAD600000000 AS DateTime), 1026, 21500000, 21500000, 0, NULL)
INSERT [dbo].[NhapHang] ([Id], [NgayNhap], [DoiTac], [TongTien], [DaTra], [ConNo], [GhiChu]) VALUES (3040, CAST(0x0000AAD700000000 AS DateTime), 1027, 10000000, 10000000, 0, N'Ắc quy tồn')
INSERT [dbo].[NhapHang] ([Id], [NgayNhap], [DoiTac], [TongTien], [DaTra], [ConNo], [GhiChu]) VALUES (3041, CAST(0x0000AAD700000000 AS DateTime), 1028, 2500000, 2500000, 0, N'Đổi các xe')
INSERT [dbo].[NhapHang] ([Id], [NgayNhap], [DoiTac], [TongTien], [DaTra], [ConNo], [GhiChu]) VALUES (3042, CAST(0x0000AAD800000000 AS DateTime), 1029, 35000000, 35000000, 0, NULL)
INSERT [dbo].[NhapHang] ([Id], [NgayNhap], [DoiTac], [TongTien], [DaTra], [ConNo], [GhiChu]) VALUES (3043, CAST(0x0000AAD800000000 AS DateTime), 1030, 5500000, 5500000, 0, NULL)
INSERT [dbo].[NhapHang] ([Id], [NgayNhap], [DoiTac], [TongTien], [DaTra], [ConNo], [GhiChu]) VALUES (3044, CAST(0x0000AADA00000000 AS DateTime), 1031, 34000000, 34000000, 0, NULL)
INSERT [dbo].[NhapHang] ([Id], [NgayNhap], [DoiTac], [TongTien], [DaTra], [ConNo], [GhiChu]) VALUES (3045, CAST(0x0000AAD900000000 AS DateTime), 1029, 35000000, 35000000, 0, NULL)
INSERT [dbo].[NhapHang] ([Id], [NgayNhap], [DoiTac], [TongTien], [DaTra], [ConNo], [GhiChu]) VALUES (3046, CAST(0x0000AADB00000000 AS DateTime), 1032, 28300000, 28300000, 0, NULL)
INSERT [dbo].[NhapHang] ([Id], [NgayNhap], [DoiTac], [TongTien], [DaTra], [ConNo], [GhiChu]) VALUES (3047, CAST(0x0000AADB00000000 AS DateTime), 1033, 10000000, 0, 10000000, NULL)
INSERT [dbo].[NhapHang] ([Id], [NgayNhap], [DoiTac], [TongTien], [DaTra], [ConNo], [GhiChu]) VALUES (3048, CAST(0x0000AADE00000000 AS DateTime), 1034, 1120000, 1120000, 0, NULL)
INSERT [dbo].[NhapHang] ([Id], [NgayNhap], [DoiTac], [TongTien], [DaTra], [ConNo], [GhiChu]) VALUES (3049, CAST(0x0000AADE00000000 AS DateTime), 1035, 100000, 100000, 0, NULL)
INSERT [dbo].[NhapHang] ([Id], [NgayNhap], [DoiTac], [TongTien], [DaTra], [ConNo], [GhiChu]) VALUES (3050, CAST(0x0000AADE00000000 AS DateTime), 1036, 100000, 0, 100000, N'Tháng 10')
INSERT [dbo].[NhapHang] ([Id], [NgayNhap], [DoiTac], [TongTien], [DaTra], [ConNo], [GhiChu]) VALUES (3051, CAST(0x0000AADE00000000 AS DateTime), 1037, 29500000, 29500000, 0, NULL)
INSERT [dbo].[NhapHang] ([Id], [NgayNhap], [DoiTac], [TongTien], [DaTra], [ConNo], [GhiChu]) VALUES (3053, CAST(0x0000AADE00000000 AS DateTime), 1039, 4500000, 4500000, 0, NULL)
INSERT [dbo].[NhapHang] ([Id], [NgayNhap], [DoiTac], [TongTien], [DaTra], [ConNo], [GhiChu]) VALUES (3054, CAST(0x0000AADD00000000 AS DateTime), 1040, 13000000, 13000000, 0, NULL)
SET IDENTITY_INSERT [dbo].[NhapHang] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3290, 3036, 13800000, 1, 1025, 1, N'Sơn trắng Yên bái', NULL, NULL, N'21E1 - 183.64', N'Đỏ', NULL, 1, 14000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3291, 3036, 11800000, 1, 1025, 1, NULL, NULL, NULL, N'21E1 174.57', N'Đỏ', NULL, 1, 13000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3292, 3036, 4000000, 1, 1017, 1, NULL, NULL, NULL, N'21F1 4842', N'Trắng đen', NULL, 1, 9000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3293, 3036, 10000000, 1, 1133, 1, NULL, NULL, NULL, N'21B1 169.04', N'Đỏ', NULL, 1, 12000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3294, 3036, 16500000, 1, 1074, 1, NULL, NULL, NULL, N'21L1 023.38', N'Vàng', NULL, 1, 16500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3295, 3036, 13600000, 1, 1025, 1, N'Bán lỗ', NULL, NULL, N'21B1 384.55', N'Đỏ', NULL, 1, 13600000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3296, 3036, 7500000, 1, 1030, 1, NULL, NULL, NULL, N'21F1 4013', N'Đỏ', NULL, 1, 9500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3297, 3036, 19200000, 1, 1070, 1, NULL, NULL, NULL, N'21V5 2102', NULL, NULL, 1, 22000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3298, 3036, 9500000, 1, 1017, 1, N'2017', NULL, NULL, N'21E1 291.97', N'Đen', NULL, 1, 11500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3299, 3036, 12400000, 1, 1027, 1, NULL, NULL, NULL, N'21E1 306.94', N'Đỏ', NULL, 1, 13500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3300, 3036, 13700000, 0, 1026, 1, N'Bán lỗ', NULL, NULL, N'21B1 666.53', N'Đỏ', NULL, 1, 14000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3301, 3036, 10500000, 1, 1030, 1, NULL, NULL, NULL, N'21E1 11013', N'Đen', NULL, 1, 11000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3302, 3036, 7200000, 1, 1030, 1, NULL, NULL, NULL, N'21B1 813.09', N'Đen', NULL, 1, 9000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3303, 3036, 10000000, 1, 1030, 1, NULL, NULL, NULL, N'21E1  075.96', N'Đen', NULL, 1, 11000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3304, 3036, 9800000, 1, 1025, 1, NULL, NULL, NULL, N'21V2 6056', N'Đỏ', NULL, 1, 11500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3305, 3036, 31000000, 1, 1134, 1, NULL, NULL, NULL, N'21E1 292.17', N'Trắng', NULL, 1, 31500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3306, 3036, 29500000, 1, 1023, 1, NULL, NULL, NULL, N'21E1 237.28', N'Xanh', NULL, 1, 33000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3307, 3036, 8700000, 1, 1025, 1, NULL, NULL, NULL, N'21V7 9875', N'Trắng', NULL, 1, 11500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3308, 3036, 10500000, 1, 1025, 1, NULL, NULL, NULL, N'21E1 116.90', N'Trắng', NULL, 1, 12500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3309, 3036, 12800000, 1, 1029, 1, NULL, NULL, NULL, N'21E1 218.64', N'Đen', NULL, 1, 15000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3310, 3036, 12000000, 1, 1029, 1, NULL, NULL, NULL, N'21E1 208.21', N'Đỏ đen ', NULL, 1, 15000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3311, 3036, 12000000, 1, 1029, 1, NULL, NULL, NULL, N'21E1 167.44', N'Vàng', NULL, 1, 14000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3312, 3036, 14300000, 1, 1029, 1, NULL, NULL, NULL, N'21E1 221.30', N'Trắng', NULL, 1, 15000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3313, 3036, 7200000, 1, 1091, 1, NULL, NULL, NULL, N'21E1 068.08', N'Đen', NULL, 1, 8500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3314, 3036, 6500000, 1, 1092, 1, NULL, NULL, NULL, N'21E1 004.99', NULL, NULL, 1, 7000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3315, 3036, 19500000, 1, 1024, 1, NULL, NULL, NULL, N'21E1 044.99', N'Đồng', NULL, 1, 20000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3316, 3036, 11900000, 1, 1018, 1, NULL, NULL, NULL, N'21E1 040.45', N'Trắng', NULL, 1, 12000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3317, 3036, 21900000, 0, 1038, 1, NULL, NULL, NULL, N'21E1 124.67', N'Đen', 1000000, 1, 27000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3318, 3036, 29000000, 1, 1095, 1, NULL, NULL, NULL, N'21B1 683.83', N'Xám đen', NULL, 1, 35000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3319, 3036, 8000000, 1, 1017, 1, NULL, NULL, NULL, N'21B1-28281', N'Trắng', NULL, 1, 10000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3320, 3036, 26000000, 0, 1134, 1, NULL, NULL, NULL, N'99B1-28914', N'Đen', NULL, 1, 28000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3321, 3036, 4500000, 1, 1089, 1, NULL, NULL, NULL, N'21FA-00060', N'vàng', NULL, 1, 6000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3322, 3036, 6000000, 1, 1088, 1, NULL, NULL, NULL, NULL, N'xanh', NULL, 1, 7000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3323, 3036, 11000000, 1, 1018, 1, NULL, NULL, NULL, N'21E1-29181', N'trắng', NULL, 1, 12500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3324, 3036, 8000000, 1, 1032, 1, NULL, NULL, NULL, N'21E1-20916', N'đen đỏ', NULL, 1, 9500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3325, 3036, 7500000, 0, 1025, 1, N'wave rồng', NULL, NULL, N'21F1-1831', NULL, 2000000, 1, 9000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3326, 3036, 7200000, 1, 1030, 1, NULL, NULL, NULL, N'21E1-01783', N'đỏ', NULL, 1, 9000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3327, 3036, 6500000, 0, 1034, 1, NULL, NULL, NULL, N'21E1-34181', N'đen', NULL, 1, 7200000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3328, 3036, 4500000, 1, 1034, 1, NULL, NULL, NULL, N'21E1-24560', N'đen', NULL, 1, 5500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3329, 3036, 29000000, 0, 1023, 1, NULL, NULL, NULL, N'xxxxxxx', N'xanh', 2000000, 1, 35000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3330, 3036, 21000000, 1, 1038, 1, NULL, NULL, NULL, N'21E1-08698', N'đỏ trắng', NULL, 1, 26000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3331, 3036, 29000000, 1, 1023, 1, NULL, NULL, NULL, N'21E1-23166', N'tem trùm', NULL, 1, 32000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3332, 3036, 8000000, 1, 1025, 1, N'wave rồng', NULL, NULL, N'21B1-12430', N'xanh', NULL, 1, 10000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3333, 3036, 13000000, 1, 1029, 1, NULL, NULL, NULL, N'21E1-35677', N'đỏ đen', NULL, 1, 15500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3334, 3036, 22500000, 0, 1071, 1, NULL, NULL, NULL, N'21E1-27035', N'trắng', 800000, 1, 27500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3335, 3036, 6500000, 1, 1028, 1, NULL, NULL, NULL, N'21V4-2047', N'đen', NULL, 1, 8000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3336, 3036, 6000000, 1, 1081, 1, NULL, NULL, NULL, N'21V1 1646', N'Xanh', NULL, 1, 8000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3337, 3036, 4500000, 1, 1135, 1, N'Xe mink', NULL, NULL, N'21T2 3535', NULL, NULL, 1, 5000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3338, 3036, 6500000, 1, 1034, 1, NULL, NULL, NULL, N'21E1 353.29', NULL, NULL, 1, 7000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3339, 3037, 6800000, 1, 4, 1, N'Htc', N'201515', NULL, NULL, N'Trắng', NULL, 1, 11000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3340, 3037, 6000000, 1, 4, 1, N'Nioshima', N'100115', NULL, NULL, N'Đỏ', NULL, 1, 9500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3341, 3037, 4600000, 1, 3, 1, N'Zu bike', NULL, NULL, NULL, N'Xanh', NULL, 1, 8500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3342, 3037, 4600000, 0, 3, 1, NULL, NULL, NULL, NULL, N'Đen', 1200000, 1, 8500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3343, 3037, 4600000, 0, 3, 1, NULL, NULL, NULL, NULL, N'Đỏ', NULL, 1, 8500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3344, 3037, 4600000, 0, 3, 1, NULL, NULL, NULL, NULL, N'Xanh', NULL, 1, 8500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3345, 3037, 4600000, 1, 3, 1, NULL, NULL, NULL, NULL, N'Trắng', NULL, 1, 8500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3346, 3037, 5000000, 0, 3, 1, N'Th bike', NULL, NULL, NULL, N'Trắng', NULL, 1, 8500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3347, 3037, 4200000, 1, 3, 1, NULL, NULL, NULL, NULL, N'Đỏ', NULL, 1, 6500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3348, 3037, 4200000, 1, 3, 1, NULL, NULL, NULL, NULL, N'Xanh', NULL, 1, 6500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3349, 3037, 7000000, 1, 1147, 1, NULL, NULL, NULL, NULL, N'Trắng', NULL, 1, 9000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3350, 3037, 7800000, 1, 1137, 1, NULL, N'900184', NULL, NULL, N'Xanh', NULL, 1, 12500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3351, 3037, 7800000, 1, 1137, 1, NULL, N'900934', NULL, NULL, N'Cam', NULL, 1, 12500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3352, 3037, 7800000, 1, 1137, 1, NULL, N'900249', NULL, NULL, N'Đỏ', NULL, 1, 12500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3353, 3037, 7800000, 1, 1137, 1, NULL, N'900218', NULL, NULL, N'Xanh', NULL, 1, 12500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3354, 3037, 8600000, 0, 2, 1, NULL, N'600849', NULL, NULL, N'Cafe', 3000000, 1, 14500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3355, 3037, 8600000, 1, 2, 1, NULL, N'600624', NULL, NULL, N'Xanh', NULL, 1, 14500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3356, 3037, 8600000, 1, 2, 1, NULL, N'600629', NULL, NULL, N'Xanh', NULL, 1, 14500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3357, 3037, 7800000, 1, 2, 1, N'LTP', N'00967', NULL, NULL, N'Đỏ', NULL, 1, 14500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3358, 3037, 7800000, 1, 2, 1, N'Ltp', N'00499', NULL, NULL, N'Trắng', NULL, 1, 12500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3359, 3037, 5000000, 1, 6, 1, NULL, NULL, NULL, NULL, N'Đen', NULL, 1, 6500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3360, 3037, 7800000, 1, 1137, 1, NULL, N'901226', NULL, NULL, N'Bạc', NULL, 1, 12500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3361, 3037, 13000000, 1, 1139, 1, NULL, N'001142', NULL, NULL, N'Xanh đỏ', NULL, 1, 15500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3362, 3037, 9250000, 1, 1067, 1, NULL, N'500390', NULL, NULL, N'Đỏ', NULL, 1, 16000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3363, 3037, 9250000, 1, 1067, 1, NULL, N'500465', NULL, NULL, N'Xanh', NULL, 1, 16000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3364, 3037, 8850000, 1, 1066, 1, NULL, N'101545', NULL, NULL, N'Đỏ', NULL, 1, 15500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3365, 3037, 8850000, 1, 1066, 1, NULL, N'101697', NULL, NULL, N'Xanh', NULL, 1, 15500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3366, 3037, 8500000, 1, 1068, 1, N'Th bike', N'02206', NULL, NULL, N'Đỏ', NULL, 1, 14000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3367, 3037, 14600000, 0, 1068, 1, NULL, N'00441', NULL, NULL, N'Xanh', 600000, 1, 17200000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3368, 3037, 9000000, 1, 1069, 1, NULL, N'01719', NULL, NULL, N'Đỏ', NULL, 1, 15000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3369, 3037, 7900000, 1, 1073, 1, NULL, N'01966', NULL, NULL, N'Trắng', NULL, 1, 12500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3370, 3037, 8500000, 1, 1, 1, NULL, N'00378', NULL, NULL, N'Xanh', NULL, 1, 12500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3371, 3037, 8750000, 1, 1072, 1, NULL, N'800511', NULL, NULL, N'Xanh', NULL, 1, 14500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3372, 3037, 8750000, 1, 1072, 1, NULL, N'01862', NULL, NULL, N'Hồng', NULL, 1, 14500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3373, 3037, 8750000, 1, 1072, 1, NULL, N'800638', NULL, NULL, N'Đỏ', NULL, 1, 14500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3374, 3037, 9600000, 1, 1094, 1, NULL, N'706221', NULL, NULL, N'Trắng', NULL, 1, 15500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3375, 3037, 9600000, 1, 1094, 1, NULL, N'31643', NULL, NULL, N'Đỏ', NULL, 1, 15500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3376, 3037, 8700000, 1, 1094, 1, NULL, N'800610', NULL, NULL, N'Đỏ mận', NULL, 1, 15500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3377, 3037, 12600000, 1, 1136, 1, NULL, N'001226', NULL, NULL, N'Trắng', NULL, 1, 15500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3378, 3037, 4200000, 1, 3, 1, NULL, NULL, NULL, NULL, N'Đỏ', NULL, 1, 6500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3379, 3037, 12600000, 1, 1136, 1, NULL, N'000921', NULL, NULL, N'Đỏ', NULL, 1, 15500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3380, 3037, 12600000, 1, 1136, 1, NULL, N'000923', NULL, NULL, N'Đỏ', NULL, 1, 15500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3381, 3037, 8700000, 1, 1094, 1, NULL, N'800536', NULL, NULL, N'Xanh', NULL, 1, 15500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3382, 3037, 4200000, 0, 3, 1, NULL, NULL, NULL, NULL, N'Đen', NULL, 1, 6500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3383, 3037, 5650000, 0, 1138, 1, NULL, NULL, NULL, NULL, N'Đỏ đen', 1220000, 1, 8000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3384, 3037, 5650000, 1, 1138, 1, NULL, NULL, NULL, NULL, N'Xanh', NULL, 1, 8000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3385, 3038, 11350000, 1, 1140, 1, NULL, N'03339', NULL, NULL, N'Xanh', NULL, 1, 13500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3386, 3038, 11350000, 1, 1140, 1, NULL, N'03436', NULL, NULL, N'Xanh', NULL, 1, 13500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3387, 3038, 11350000, 1, 1140, 1, NULL, N'03413', NULL, NULL, N'Xanh', NULL, 1, 13500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3388, 3038, 11350000, 1, 1140, 1, NULL, N'03428', NULL, NULL, N'Xanh', NULL, 1, 13500000, 1)
GO
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3389, 3038, 10700000, 1, 1043, 1, NULL, N'04667', NULL, NULL, N'Xanh', NULL, 1, 12500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3390, 3038, 10700000, 1, 1043, 1, NULL, N'04663', NULL, NULL, N'Xanh', NULL, 1, 12500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3391, 3038, 10700000, 1, 1043, 1, NULL, N'04753', NULL, NULL, N'Xám', NULL, 1, 12500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3392, 3038, 10700000, 1, 1043, 1, NULL, N'04738', NULL, NULL, N'Xanh', NULL, 1, 12500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3393, 3038, 10700000, 1, 1043, 1, NULL, N'04929', NULL, NULL, N'Xanh', NULL, 1, 12500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3394, 3038, 11350000, 1, 1140, 1, NULL, N'03416', NULL, NULL, N'Trắng', NULL, 1, 13500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3395, 3038, 15300000, 1, 1096, 1, NULL, N'000409', NULL, NULL, N'Xanh', NULL, 1, 18000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3396, 3038, 11350000, 1, 1140, 1, NULL, N'03331', NULL, NULL, N'Đen', NULL, 1, 13500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3397, 3038, 11350000, 1, 1140, 1, NULL, N'03364', NULL, NULL, N'Đen', NULL, 1, 13500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3398, 3038, 10700000, 1, 1043, 1, NULL, N'04799', NULL, NULL, N'Xanh', NULL, 1, 12500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3399, 3038, 10700000, 1, 1043, 1, NULL, N'04785', NULL, NULL, N'Đỏ', NULL, 1, 12500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3400, 3037, 6700000, 1, 4, 1, NULL, N'201885', NULL, NULL, N'Đen', NULL, 1, 11000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3401, 3038, 10250000, 1, 1146, 1, NULL, N'01158', NULL, NULL, NULL, NULL, 1, 12500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3402, 3038, 12400000, 1, 1145, 1, NULL, N'404212', NULL, NULL, NULL, NULL, 1, 13500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3403, 3038, 10700000, 1, 1142, 1, NULL, N'206572', NULL, NULL, NULL, NULL, 1, 11500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3404, 3038, 10700000, 1, 1142, 1, NULL, N'206561', NULL, NULL, NULL, NULL, 1, 11500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3405, 3038, 11300000, 0, 1143, 1, NULL, N'109600', NULL, NULL, NULL, 730000, 1, 12100000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3406, 3038, 0, 1, 1143, 1, NULL, N'109600', NULL, NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3407, 3038, 11900000, 1, 1144, 1, NULL, N'323024', NULL, NULL, NULL, NULL, 1, 12700000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3408, 3038, 11900000, 1, 1144, 1, NULL, N'323025', NULL, NULL, NULL, NULL, 1, 12700000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3409, 3038, 10250000, 0, 1146, 1, NULL, N'01049', NULL, NULL, NULL, 730000, 1, 12500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3410, 3038, 10250000, 1, 1146, 1, NULL, N'01070', NULL, NULL, NULL, NULL, 1, 12500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3411, 3036, 28000000, 1, 1134, 1, NULL, NULL, NULL, N'21c 210.53', N'Đỏ đen', NULL, 1, 29500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3412, 3036, 8200000, 0, 1030, 1, NULL, NULL, NULL, N'21E1 113.31', NULL, NULL, 1, 9000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3413, 3039, 21500000, 1, 1038, 1, NULL, NULL, NULL, N'21E1 136.34', N'Vàng đen trắng', NULL, 1, 26000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3414, 3040, 305000, 9, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, 29, 400000, 0)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3415, 3040, 480000, 35, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, 49, 550000, 0)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3416, 3041, 2500000, 1, 1148, 1, NULL, NULL, NULL, NULL, N'Đỏ', NULL, 1, 3500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3417, 3042, 35000000, 0, 1036, 1, NULL, NULL, NULL, N'21B1 277.68', N'Vàng Nâu', 440000, 1, 40000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3418, 3043, 5500000, 0, 1030, 1, NULL, NULL, NULL, N'xxxxxxx', NULL, NULL, 1, 6050000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3419, 3044, 34500000, 0, 1023, 1, NULL, NULL, NULL, N'21B1 815.93', N'Xanh', NULL, 1, 34500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3420, 3045, 35000000, 1, 1036, 1, NULL, NULL, NULL, N'21B1 277.68', N'Vàng Nâu', NULL, 1, 40000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3421, 3046, 28300000, 1, 1134, 1, NULL, NULL, NULL, N'21B1 476.19', N'Cam đen', NULL, 1, 30500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3422, 3047, 8750000, 1, 1072, 1, NULL, N'800268', N'181000266', NULL, N'Xanh', NULL, 1, 14500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3423, 3047, 8750000, 1, 1072, 1, NULL, N'800275', N'181000273', NULL, N'Xanh', NULL, 1, 14500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3424, 3047, 8750000, 1, 1072, 1, NULL, N'800352', N'181000350', NULL, N'Đỏ', NULL, 1, 14500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3425, 3047, 8750000, 0, 1072, 1, NULL, N'800840', N'190400328', NULL, N'Đen', 3000000, 1, 14500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3426, 3047, 8750000, 1, 1072, 1, NULL, N'800894', N'190400383', NULL, N'Xám', NULL, 1, 14500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3427, 3047, 9250000, 1, 1067, 1, NULL, N'500512', N'06269', NULL, N'Đen', NULL, 1, 16000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3428, 3047, 5650000, 1, 1138, 1, NULL, NULL, NULL, NULL, N'Đỏ', NULL, 1, 8000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3429, 3048, 125000, 1, 1149, 2, NULL, NULL, NULL, NULL, N'Trắng', NULL, 1, 150000, 0)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3430, 3048, 52000, 1, 1150, 2, NULL, NULL, NULL, NULL, N'Trắng', NULL, 1, 80000, 0)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3431, 3048, 235000, 1, 1151, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 250000, 0)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3432, 3048, 160000, 1, 1152, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 200000, 0)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3433, 3048, 120000, 1, 1153, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 150000, 0)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3434, 3048, 40000, 1, 1154, 2, NULL, NULL, NULL, NULL, N'Đen', NULL, 2, 80000, 0)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3435, 3048, 35000, 10, 1048, 2, NULL, NULL, NULL, NULL, NULL, NULL, 10, 80000, 0)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3436, 3049, 30000, 13, 1048, 2, NULL, NULL, NULL, NULL, NULL, NULL, 13, 80000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3437, 3049, 30000, 11, 1049, 2, NULL, NULL, NULL, NULL, NULL, NULL, 11, 70000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3438, 3049, 40000, 5, 1155, 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, 90000, 0)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3439, 3049, 65000, 14, 1156, 2, NULL, NULL, NULL, NULL, N'Xanh', NULL, 14, 80000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3440, 3049, 65000, 10, 1164, 2, NULL, NULL, NULL, NULL, NULL, NULL, 10, 80000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3441, 3051, 29500000, 1, 1023, 1, N'xe trả góp ', NULL, NULL, N'21B1-65434', N'trắng đỏ', NULL, 1, 32000000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3444, 3053, 4500000, 1, 1034, 1, NULL, NULL, NULL, N'21E1-32115', N'Đen', NULL, 1, 5500000, 1)
INSERT [dbo].[SanPham] ([Id], [IdNhapHang], [GiaNhap], [SoLuongTon], [IdLoai], [IdCuaHang], [GhiChu], [SoKhung], [SoMay], [BienSo], [MauSac], [PhiKhac], [SoLuongNhap], [GiaBanDeXuat], [Types]) VALUES (3445, 3054, 13000000, 1, 1029, 1, NULL, NULL, NULL, N'21E1-19912', N'đen đỏ', NULL, 1, 14000000, 1)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[SuaChuaNoiBo] ON 

INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (17, 3329, CAST(0x0000AAD500000000 AS DateTime), N'Thợ', 1000000, N'Sơn Sửa')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (18, 3329, CAST(0x0000AAD500000000 AS DateTime), N'Thuê', 1000000, N'Sang tên ')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (19, 3334, CAST(0x0000AAD600000000 AS DateTime), N'Thuê', 800000, N'Sang tên')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (20, 3342, CAST(0x0000AAD600000000 AS DateTime), N'Phương', 1200000, N'1 bộ bình 12a')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (21, 3383, CAST(0x0000AAD700000000 AS DateTime), N'Thợ', 1220000, N'Lắp bình bán xe mới')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (22, 3317, CAST(0x0000AADC00000000 AS DateTime), N'aa', 1000000, N'')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (23, 3325, CAST(0x0000AADC00000000 AS DateTime), N'thợ', 1000000, N'sơn sửa')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (24, 3425, CAST(0x0000AADD00000000 AS DateTime), N'', 2400000, N'')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (25, 3425, CAST(0x0000AADD00000000 AS DateTime), N'', 600000, N'làm đăng kí')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (26, 3367, CAST(0x0000AADD00000000 AS DateTime), N'Thuê', 600000, N'Đăng ký')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (1027, 3354, CAST(0x0000AADE00000000 AS DateTime), N'', 2400000, N'')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (1029, 3417, CAST(0x0000AADE00000000 AS DateTime), N'Thợ nhà', 40000, N'')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (1030, 3417, CAST(0x0000AADE00000000 AS DateTime), N'Thợ nhà', 400000, N'Bộ côn bi côn bát côn tay nắm')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (1031, 3405, CAST(0x0000AADE00000000 AS DateTime), N'', 730000, N'làm đăng kí')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (1032, 3325, CAST(0x0000AADE00000000 AS DateTime), N'', 1000000, N'đăng kí-lên biển')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (1033, 3354, CAST(0x0000AADE00000000 AS DateTime), N'', 600000, N'làm đăng kí')
INSERT [dbo].[SuaChuaNoiBo] ([Id], [SanPham], [NgayThang], [NguoiThucHien], [TongTien], [GhiChu]) VALUES (1034, 3409, CAST(0x0000AADE00000000 AS DateTime), N'', 730000, N'làm đăng kí')
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
ALTER DATABASE [dpapp] SET  READ_WRITE 
GO
