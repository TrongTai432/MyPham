USE [master]
GO
/****** Object:  Database [BeautyGarden]    Script Date: 06/03/2024 2:53:33 PM ******/
CREATE DATABASE [BeautyGarden]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BeautyGarden', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BeautyGarden.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BeautyGarden_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BeautyGarden_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BeautyGarden] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BeautyGarden].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BeautyGarden] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BeautyGarden] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BeautyGarden] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BeautyGarden] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BeautyGarden] SET ARITHABORT OFF 
GO
ALTER DATABASE [BeautyGarden] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BeautyGarden] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BeautyGarden] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BeautyGarden] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BeautyGarden] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BeautyGarden] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BeautyGarden] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BeautyGarden] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BeautyGarden] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BeautyGarden] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BeautyGarden] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BeautyGarden] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BeautyGarden] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BeautyGarden] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BeautyGarden] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BeautyGarden] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BeautyGarden] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BeautyGarden] SET RECOVERY FULL 
GO
ALTER DATABASE [BeautyGarden] SET  MULTI_USER 
GO
ALTER DATABASE [BeautyGarden] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BeautyGarden] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BeautyGarden] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BeautyGarden] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BeautyGarden] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BeautyGarden] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BeautyGarden', N'ON'
GO
ALTER DATABASE [BeautyGarden] SET QUERY_STORE = OFF
GO
USE [BeautyGarden]
GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 06/03/2024 2:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[mahoadon] [bigint] IDENTITY(1,1) NOT NULL,
	[makhachhang] [bigint] NULL,
	[ngaymua] [date] NULL,
	[damua] [bit] NULL,
 CONSTRAINT [PK_hoadon] PRIMARY KEY CLUSTERED 
(
	[mahoadon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sanpham]    Script Date: 06/03/2024 2:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanpham](
	[masanpham] [nvarchar](50) NOT NULL,
	[tensanpham] [nvarchar](255) NULL,
	[soluong] [bigint] NULL,
	[gia] [bigint] NULL,
	[anh] [nvarchar](255) NULL,
	[ngaynhap] [date] NULL,
	[tomtat] [nvarchar](max) NULL,
	[thongtinsanpham] [nvarchar](max) NULL,
	[maloai] [nvarchar](50) NULL,
 CONSTRAINT [PK_sanpham] PRIMARY KEY CLUSTERED 
(
	[masanpham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chitiethoadon]    Script Date: 06/03/2024 2:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chitiethoadon](
	[machitiethoadon] [bigint] IDENTITY(1,1) NOT NULL,
	[masanpham] [nvarchar](50) NULL,
	[soluongmua] [int] NULL,
	[mahoadon] [bigint] NULL,
	[damua] [bit] NULL,
 CONSTRAINT [PK_chitiethoadon] PRIMARY KEY CLUSTERED 
(
	[machitiethoadon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khachhang]    Script Date: 06/03/2024 2:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khachhang](
	[makhachhang] [bigint] IDENTITY(1,1) NOT NULL,
	[hotenkh] [nvarchar](50) NOT NULL,
	[diachikh] [nvarchar](255) NULL,
	[sodienthoaikh] [nvarchar](50) NULL,
	[emailkh] [nvarchar](50) NULL,
	[tendangnhapkh] [nvarchar](50) NOT NULL,
	[matkhaukh] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_khachhang] PRIMARY KEY CLUSTERED 
(
	[makhachhang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VXacnhan]    Script Date: 06/03/2024 2:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VXacnhan]
AS
SELECT        dbo.khachhang.makhachhang, dbo.khachhang.hotenkh, dbo.sanpham.tensanpham, dbo.sanpham.gia, dbo.hoadon.ngaymua, dbo.chitiethoadon.soluongmua, dbo.chitiethoadon.damua, 
                         dbo.chitiethoadon.soluongmua * dbo.sanpham.gia AS thanhtien, dbo.chitiethoadon.machitiethoadon
FROM            dbo.chitiethoadon INNER JOIN
                         dbo.hoadon ON dbo.chitiethoadon.mahoadon = dbo.hoadon.mahoadon INNER JOIN
                         dbo.khachhang ON dbo.hoadon.makhachhang = dbo.khachhang.makhachhang INNER JOIN
                         dbo.sanpham ON dbo.chitiethoadon.masanpham = dbo.sanpham.masanpham
WHERE        (dbo.chitiethoadon.damua = 0)
GO
/****** Object:  View [dbo].[VLichsumuahang]    Script Date: 06/03/2024 2:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VLichsumuahang]
AS
SELECT        dbo.sanpham.masanpham, dbo.sanpham.tensanpham, dbo.sanpham.anh, dbo.sanpham.gia, dbo.chitiethoadon.soluongmua, dbo.chitiethoadon.damua, dbo.hoadon.ngaymua, dbo.khachhang.makhachhang, 
                         dbo.sanpham.gia * dbo.chitiethoadon.soluongmua AS thanhtien
FROM            dbo.chitiethoadon INNER JOIN
                         dbo.hoadon ON dbo.chitiethoadon.mahoadon = dbo.hoadon.mahoadon INNER JOIN
                         dbo.khachhang ON dbo.hoadon.makhachhang = dbo.khachhang.makhachhang INNER JOIN
                         dbo.sanpham ON dbo.chitiethoadon.masanpham = dbo.sanpham.masanpham
GO
/****** Object:  Table [dbo].[loai]    Script Date: 06/03/2024 2:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai](
	[maloai] [nvarchar](50) NOT NULL,
	[tenloai] [nvarchar](50) NULL,
 CONSTRAINT [PK_loai] PRIMARY KEY CLUSTERED 
(
	[maloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhanvien]    Script Date: 06/03/2024 2:53:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhanvien](
	[manhanvien] [bigint] IDENTITY(1,1) NOT NULL,
	[hotennv] [nvarchar](50) NULL,
	[diachinv] [nvarchar](255) NULL,
	[sodienthoainv] [nvarchar](50) NULL,
	[emailnv] [nvarchar](50) NULL,
	[tendangnhapnv] [nvarchar](50) NULL,
	[matkhaunv] [nvarchar](50) NULL,
	[quyen] [bit] NULL,
 CONSTRAINT [PK_nhanvien] PRIMARY KEY CLUSTERED 
(
	[manhanvien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[chitiethoadon] ON 

INSERT [dbo].[chitiethoadon] ([machitiethoadon], [masanpham], [soluongmua], [mahoadon], [damua]) VALUES (1, N'SP3', 2, 1, 1)
INSERT [dbo].[chitiethoadon] ([machitiethoadon], [masanpham], [soluongmua], [mahoadon], [damua]) VALUES (2, N'SP2', 1, 1, 1)
INSERT [dbo].[chitiethoadon] ([machitiethoadon], [masanpham], [soluongmua], [mahoadon], [damua]) VALUES (3, N'SP2', 1, 2, 0)
INSERT [dbo].[chitiethoadon] ([machitiethoadon], [masanpham], [soluongmua], [mahoadon], [damua]) VALUES (4, N'SP1', 1, 2, 1)
INSERT [dbo].[chitiethoadon] ([machitiethoadon], [masanpham], [soluongmua], [mahoadon], [damua]) VALUES (5, N'SP7', 1, 3, 0)
INSERT [dbo].[chitiethoadon] ([machitiethoadon], [masanpham], [soluongmua], [mahoadon], [damua]) VALUES (6, N'SP6', 1, 3, 0)
INSERT [dbo].[chitiethoadon] ([machitiethoadon], [masanpham], [soluongmua], [mahoadon], [damua]) VALUES (7, N'SP15', 2, 4, 0)
INSERT [dbo].[chitiethoadon] ([machitiethoadon], [masanpham], [soluongmua], [mahoadon], [damua]) VALUES (8, N'SP16', 1, 4, 0)
INSERT [dbo].[chitiethoadon] ([machitiethoadon], [masanpham], [soluongmua], [mahoadon], [damua]) VALUES (10002, N'SP1', 1, 10002, 0)
INSERT [dbo].[chitiethoadon] ([machitiethoadon], [masanpham], [soluongmua], [mahoadon], [damua]) VALUES (10003, N'SP10', 1, 10002, 0)
INSERT [dbo].[chitiethoadon] ([machitiethoadon], [masanpham], [soluongmua], [mahoadon], [damua]) VALUES (10004, N'SP16', 1, 10002, 0)
INSERT [dbo].[chitiethoadon] ([machitiethoadon], [masanpham], [soluongmua], [mahoadon], [damua]) VALUES (10005, N'SP12', 1, 10003, 0)
INSERT [dbo].[chitiethoadon] ([machitiethoadon], [masanpham], [soluongmua], [mahoadon], [damua]) VALUES (10006, N'SP12', 2, 10004, 0)
INSERT [dbo].[chitiethoadon] ([machitiethoadon], [masanpham], [soluongmua], [mahoadon], [damua]) VALUES (10007, N'SP15', 1, 10004, 0)
INSERT [dbo].[chitiethoadon] ([machitiethoadon], [masanpham], [soluongmua], [mahoadon], [damua]) VALUES (20002, N'SP16', 1, 20002, 0)
INSERT [dbo].[chitiethoadon] ([machitiethoadon], [masanpham], [soluongmua], [mahoadon], [damua]) VALUES (20003, N'SP15', 2, 20002, 0)
INSERT [dbo].[chitiethoadon] ([machitiethoadon], [masanpham], [soluongmua], [mahoadon], [damua]) VALUES (20004, N'SP17', 1, 20002, 0)
INSERT [dbo].[chitiethoadon] ([machitiethoadon], [masanpham], [soluongmua], [mahoadon], [damua]) VALUES (20005, N'SP11', 1, 20003, 0)
INSERT [dbo].[chitiethoadon] ([machitiethoadon], [masanpham], [soluongmua], [mahoadon], [damua]) VALUES (30002, N'SP1', 2, 30002, 0)
INSERT [dbo].[chitiethoadon] ([machitiethoadon], [masanpham], [soluongmua], [mahoadon], [damua]) VALUES (30003, N'SP13', 1, 30002, 0)
INSERT [dbo].[chitiethoadon] ([machitiethoadon], [masanpham], [soluongmua], [mahoadon], [damua]) VALUES (30004, N'SP11', 2, 30003, 0)
INSERT [dbo].[chitiethoadon] ([machitiethoadon], [masanpham], [soluongmua], [mahoadon], [damua]) VALUES (30005, N'SP15', 1, 30003, 0)
SET IDENTITY_INSERT [dbo].[chitiethoadon] OFF
GO
SET IDENTITY_INSERT [dbo].[hoadon] ON 

INSERT [dbo].[hoadon] ([mahoadon], [makhachhang], [ngaymua], [damua]) VALUES (1, 1, CAST(N'2023-12-23' AS Date), 0)
INSERT [dbo].[hoadon] ([mahoadon], [makhachhang], [ngaymua], [damua]) VALUES (2, 1, CAST(N'2023-12-23' AS Date), 0)
INSERT [dbo].[hoadon] ([mahoadon], [makhachhang], [ngaymua], [damua]) VALUES (3, 1, CAST(N'2023-12-23' AS Date), 0)
INSERT [dbo].[hoadon] ([mahoadon], [makhachhang], [ngaymua], [damua]) VALUES (4, 1, CAST(N'2023-12-23' AS Date), 0)
INSERT [dbo].[hoadon] ([mahoadon], [makhachhang], [ngaymua], [damua]) VALUES (10002, 1, CAST(N'2023-12-25' AS Date), 0)
INSERT [dbo].[hoadon] ([mahoadon], [makhachhang], [ngaymua], [damua]) VALUES (10003, 1, CAST(N'2023-12-25' AS Date), 0)
INSERT [dbo].[hoadon] ([mahoadon], [makhachhang], [ngaymua], [damua]) VALUES (10004, 1, CAST(N'2023-12-25' AS Date), 0)
INSERT [dbo].[hoadon] ([mahoadon], [makhachhang], [ngaymua], [damua]) VALUES (20002, 1, CAST(N'2023-12-25' AS Date), 0)
INSERT [dbo].[hoadon] ([mahoadon], [makhachhang], [ngaymua], [damua]) VALUES (20003, 1, CAST(N'2023-12-25' AS Date), 0)
INSERT [dbo].[hoadon] ([mahoadon], [makhachhang], [ngaymua], [damua]) VALUES (30002, 1, CAST(N'2023-12-26' AS Date), 0)
INSERT [dbo].[hoadon] ([mahoadon], [makhachhang], [ngaymua], [damua]) VALUES (30003, 1, CAST(N'2023-12-26' AS Date), 0)
SET IDENTITY_INSERT [dbo].[hoadon] OFF
GO
SET IDENTITY_INSERT [dbo].[khachhang] ON 

INSERT [dbo].[khachhang] ([makhachhang], [hotenkh], [diachikh], [sodienthoaikh], [emailkh], [tendangnhapkh], [matkhaukh]) VALUES (1, N'Trong Tai', N'TT Hue', N'0123456789', N'duongtrtai43@gmail.com', N'Tai', N'123456')
INSERT [dbo].[khachhang] ([makhachhang], [hotenkh], [diachikh], [sodienthoaikh], [emailkh], [tendangnhapkh], [matkhaukh]) VALUES (2, N'nguyen van a', N'hue', N'09876543', N'a@gmail.com', N'abc', N'123')
SET IDENTITY_INSERT [dbo].[khachhang] OFF
GO
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'1', N'Son')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'2', N'Serum')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'3', N'Xịt')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'4', N'Phấn')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'5', N'Mặt nạ')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'6', N'Bông tẩy trang')
GO
SET IDENTITY_INSERT [dbo].[nhanvien] ON 

INSERT [dbo].[nhanvien] ([manhanvien], [hotennv], [diachinv], [sodienthoainv], [emailnv], [tendangnhapnv], [matkhaunv], [quyen]) VALUES (1, N'nguyen van a', N'hue', N'0987654321', N'a@gmail.com', N'vana', N'123', NULL)
SET IDENTITY_INSERT [dbo].[nhanvien] OFF
GO
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [anh], [ngaynhap], [tomtat], [thongtinsanpham], [maloai]) VALUES (N'SP1', N'Serum K Lady', 7, 100000, N'img/Serum-K-Lady-Care-Retinol-Bakuchiol-50ml.jpg', CAST(N'2023-11-23' AS Date), N'giúp sáng da', N'từ nhà cung cấp lớn', N'2')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [anh], [ngaynhap], [tomtat], [thongtinsanpham], [maloai]) VALUES (N'SP10', N'Serum Dr Sunmi', 9, 300000, N'img/Serum-Dr_Sunmi-care-HA-plus.jpg', CAST(N'2023-11-21' AS Date), N'serum chống bong tróc da', N'làm đẹp', N'2')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [anh], [ngaynhap], [tomtat], [thongtinsanpham], [maloai]) VALUES (N'SP11', N'Xịt khoáng Kyung', 8, 400000, N'img/Xịt-khoang-Kyung-Lab-PDRN-Therapy-Mist-150ml.jpg', CAST(N'2023-11-22' AS Date), N'xịt khoáng cấp ẩm cho da', N'tốt cho da', N'3')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [anh], [ngaynhap], [tomtat], [thongtinsanpham], [maloai]) VALUES (N'SP12', N'Xịt khoáng nghệ hưng yên', 9, 500000, N'img/Xịt-Khoáng-Nghệ-Hưng-Yên-Cocoon-Hung-Yen-Turmeric-Face-Mist-130ml.jpg', CAST(N'2023-11-24' AS Date), N'xịt khoáng cung cấp độ ẩm cho da', N'chăm sóc da', N'3')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [anh], [ngaynhap], [tomtat], [thongtinsanpham], [maloai]) VALUES (N'SP13', N'Phấn má hồng', 12, 999000, N'img/Phấn-Má-Hồng-Etude-House-Lovely-Cookie-Blusher-7gr.jpg', CAST(N'2023-11-25' AS Date), N'phấn làm má hồng', N'trang điểm', N'4')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [anh], [ngaynhap], [tomtat], [thongtinsanpham], [maloai]) VALUES (N'SP14', N'Mặt nạ narukho', 9, 123000, N'img/mat-na-naruko1.jpg', CAST(N'2023-11-26' AS Date), N'mặt nạ chống mụn', N'chăm sóc da mặt', N'5')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [anh], [ngaynhap], [tomtat], [thongtinsanpham], [maloai]) VALUES (N'SP15', N'Bông tẩy trang', 5, 35000, N'img/bong-tay-trang-ipek-cotton-pads-120-mieng-beauty-garden-1.jpg', CAST(N'2023-11-27' AS Date), N'bông tẩy trang ipek', N'rẻ chất lượng', N'6')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [anh], [ngaynhap], [tomtat], [thongtinsanpham], [maloai]) VALUES (N'SP16', N'Mặt nạ Kyung', 9, 300000, N'img/Mat-na-Kyung-Lab-Retinol-Peptide-Complex-Mask-25ml.jpg', CAST(N'2023-11-28' AS Date), N'mặt nạ chống nhờn', N'từ hãng complex', N'5')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [anh], [ngaynhap], [tomtat], [thongtinsanpham], [maloai]) VALUES (N'SP17', N'Phấn mắt Habaria', 4, 700000, N'img/phan-mat-habaria-Professional-10.jpg', CAST(N'2023-11-11' AS Date), N'phấn mắt trang điểm mắt', N'tôn mắt', N'4')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [anh], [ngaynhap], [tomtat], [thongtinsanpham], [maloai]) VALUES (N'SP18', N'Bông tẩy trang Miniso', 8, 40000, N'img/Bông-tẩy-trang-Miniso-180-miếng.jpg', CAST(N'2023-11-01' AS Date), N'bông tẩy lớp trang điểm', N'chất lượng uy tín', N'6')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [anh], [ngaynhap], [tomtat], [thongtinsanpham], [maloai]) VALUES (N'SP2', N'Son 3CE Deep', 8, 150000, N'img/Son-3CE-Deep-Under-Soft-Matte-Lipstick-3_5gr.jpg', CAST(N'2023-11-20' AS Date), N'tôn da', N'sản phẩm có uy tín', N'1')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [anh], [ngaynhap], [tomtat], [thongtinsanpham], [maloai]) VALUES (N'sp20', N'son', 43, 400000, N'img/nuoc-tay-trang-Loreal-paris-Revitalift-Hyauronic-Acid-Micellar-Water-95ml.jpg', CAST(N'2023-12-26' AS Date), N'<p>son l&igrave; l&acirc;u tr&ocirc;i</p>
', N'<p>tá»« nsx</p>
', N'1')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [anh], [ngaynhap], [tomtat], [thongtinsanpham], [maloai]) VALUES (N'SP3', N'xịt gội khô', 3, 80000, N'img/Xịt-gội-khô-Íssy-Dry-Shampoo-150ml.jpg', CAST(N'2023-11-19' AS Date), N'gội đầu khô', N'từ nsx issy', N'3')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [anh], [ngaynhap], [tomtat], [thongtinsanpham], [maloai]) VALUES (N'SP4', N'Son Black Rouge', 5, 200000, N'img/Son-Black-Rouge-Double-Layer-Over-Velvet.jpg', CAST(N'2023-11-17' AS Date), N'giúp môi sáng hơn', N'từ nsx black rouge', N'1')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [anh], [ngaynhap], [tomtat], [thongtinsanpham], [maloai]) VALUES (N'SP5', N'Son kem FOIF', 8, 135000, N'img/SON-KEM-FOIF-Daily-Velvet-Tint.jpg', CAST(N'2023-11-11' AS Date), N'mịn da', N'từ nsx Velvet', N'1')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [anh], [ngaynhap], [tomtat], [thongtinsanpham], [maloai]) VALUES (N'SP6', N'Son kem lì Mac Love', 5, 125000, N'img/Son-kem-lì-Mac-Love-Me-Liquid-Lipcolour-3_1ml.jpg', CAST(N'2023-11-12' AS Date), N'lâu trôi', N'sản phẩm có tính lì', N'1')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [anh], [ngaynhap], [tomtat], [thongtinsanpham], [maloai]) VALUES (N'SP7', N'Son kem lì Romand', 6, 200000, N'img/Son-kem-lì-Romand-Blur-Fudge-Tint-5gr.jpg', CAST(N'2023-11-13' AS Date), N'khó trôi son', N'sản phẩm có tính lì', N'1')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [anh], [ngaynhap], [tomtat], [thongtinsanpham], [maloai]) VALUES (N'SP8', N'Son thỏi Real', 5, 99000, N'img/Son-thoi-AprilSkin-Ultra-Real-Matte-Lipstick.jpg', CAST(N'2023-11-09' AS Date), N'son thỏi', N'tiện dụng', N'1')
INSERT [dbo].[sanpham] ([masanpham], [tensanpham], [soluong], [gia], [anh], [ngaynhap], [tomtat], [thongtinsanpham], [maloai]) VALUES (N'SP9', N'Serum Loreal', 9, 200000, N'img/serum-LOreal-Paris-Hyaluronic-Acid.jpg', CAST(N'2023-11-20' AS Date), N'serum chống khô da', N'chống lão hoá', N'2')
GO
ALTER TABLE [dbo].[chitiethoadon]  WITH CHECK ADD  CONSTRAINT [FK_chitiethoadon_hoadon] FOREIGN KEY([mahoadon])
REFERENCES [dbo].[hoadon] ([mahoadon])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[chitiethoadon] CHECK CONSTRAINT [FK_chitiethoadon_hoadon]
GO
ALTER TABLE [dbo].[chitiethoadon]  WITH CHECK ADD  CONSTRAINT [FK_chitiethoadon_sanpham] FOREIGN KEY([masanpham])
REFERENCES [dbo].[sanpham] ([masanpham])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[chitiethoadon] CHECK CONSTRAINT [FK_chitiethoadon_sanpham]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_khachhang] FOREIGN KEY([makhachhang])
REFERENCES [dbo].[khachhang] ([makhachhang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_khachhang]
GO
ALTER TABLE [dbo].[sanpham]  WITH CHECK ADD  CONSTRAINT [FK_sanpham_loai] FOREIGN KEY([maloai])
REFERENCES [dbo].[loai] ([maloai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sanpham] CHECK CONSTRAINT [FK_sanpham_loai]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[41] 2[3] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "chitiethoadon"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 7
               Left = 304
               Bottom = 170
               Right = 498
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "khachhang"
            Begin Extent = 
               Top = 7
               Left = 546
               Bottom = 170
               Right = 744
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sanpham"
            Begin Extent = 
               Top = 7
               Left = 792
               Bottom = 170
               Right = 1003
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 4470
         Alias = 1935
         Table = 1875
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VLichsumuahang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VLichsumuahang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[44] 2[3] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "chitiethoadon"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 7
               Left = 304
               Bottom = 192
               Right = 498
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "khachhang"
            Begin Extent = 
               Top = 7
               Left = 546
               Bottom = 250
               Right = 744
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sanpham"
            Begin Extent = 
               Top = 7
               Left = 792
               Bottom = 170
               Right = 1003
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 4620
         Alias = 2115
         Table = 1680
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VXacnhan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VXacnhan'
GO
USE [master]
GO
ALTER DATABASE [BeautyGarden] SET  READ_WRITE 
GO
