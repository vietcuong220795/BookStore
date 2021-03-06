USE [BESTBOOKVN]
GO
/****** Object:  Table [dbo].[hoa_don]    Script Date: 1/6/2017 11:44:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoa_don](
	[ma_hoa_don] [int] NOT NULL,
	[ngay_dat] [date] NULL,
	[so_luong] [int] NULL,
	[tong_tien] [float] NULL,
	[id_san_pham] [int] NULL,
	[ma_khach_hang] [int] NULL,
	[ghi_chu] [nvarchar](50) NULL,
	[tinh_trang] [int] NULL,
	[TempID] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[khach_hang]    Script Date: 1/6/2017 11:44:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khach_hang](
	[ma_khach_hang] [int] IDENTITY(1,1) NOT NULL,
	[ten_khach_hang] [nvarchar](100) NULL,
	[phai] [tinyint] NULL,
	[dia_chi] [nvarchar](200) NULL,
	[dien_thoai] [nvarchar](20) NULL,
	[email] [nvarchar](100) NULL,
	[ghi_chu] [nvarchar](50) NULL,
	[mat_khau] [nvarchar](100) NULL,
 CONSTRAINT [PK_khach_hang] PRIMARY KEY CLUSTERED 
(
	[ma_khach_hang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[loai_san_pham]    Script Date: 1/6/2017 11:44:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai_san_pham](
	[ma_loai] [int] NOT NULL,
	[ten_loai] [nvarchar](50) NULL,
	[mo_ta] [text] NULL,
	[hinh] [nvarchar](200) NULL,
 CONSTRAINT [PK_loai_san_pham] PRIMARY KEY CLUSTERED 
(
	[ma_loai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[san_pham]    Script Date: 1/6/2017 11:44:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[san_pham](
	[id_san_pham] [int] NOT NULL,
	[ma_san_pham] [nvarchar](50) NULL,
	[ten_san_pham] [nvarchar](100) NULL,
	[ma_loai] [int] NULL,
	[mo_ta_chi_tiet] [text] NULL,
	[don_gia] [int] NULL,
	[dvt] [nvarchar](20) NULL,
	[tinh_trang] [nvarchar](100) NULL,
	[hinh] [nvarchar](200) NULL,
	[san_pham_moi] [tinyint] NULL,
	[tac_gia] [nvarchar](100) NULL,
	[nxb] [nvarchar](50) NULL,
	[ngay_xuat_ban] [datetime] NULL,
	[so_trang] [int] NULL,
	[danh_muc] [int] NULL,
 CONSTRAINT [PK_san_pham_1] PRIMARY KEY CLUSTERED 
(
	[id_san_pham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[v_login]    Script Date: 1/6/2017 11:44:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_login]
AS
SELECT        email, mat_khau
FROM            dbo.khach_hang

GO
/****** Object:  View [dbo].[v_manga_comic]    Script Date: 1/6/2017 11:44:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_manga_comic]
AS
SELECT        id_san_pham, ma_san_pham, ten_san_pham, ma_loai, mo_ta_chi_tiet, don_gia, dvt, tinh_trang, hinh, san_pham_moi, tac_gia, nxb, ngay_xuat_ban, so_trang, 
                         danh_muc
FROM            dbo.san_pham
WHERE        (ma_loai = 2)

GO
/****** Object:  View [dbo].[v_san_pham_moi]    Script Date: 1/6/2017 11:44:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_san_pham_moi]
AS
SELECT        id_san_pham, ma_san_pham, ten_san_pham, ma_loai, mo_ta_chi_tiet, don_gia, dvt, tinh_trang, hinh, san_pham_moi, tac_gia, nxb, ngay_xuat_ban, so_trang, 
                         danh_muc
FROM            dbo.san_pham
WHERE        (san_pham_moi = 1)

GO
/****** Object:  View [dbo].[v_tieng_anh]    Script Date: 1/6/2017 11:44:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_tieng_anh]
AS
SELECT        id_san_pham, ma_san_pham, ten_san_pham, ma_loai, mo_ta_chi_tiet, don_gia, dvt, tinh_trang, hinh, san_pham_moi, tac_gia, nxb, ngay_xuat_ban, so_trang, 
                         danh_muc
FROM            dbo.san_pham
WHERE        (ma_loai = 3)

GO
/****** Object:  View [dbo].[v_tieu_thuyet]    Script Date: 1/6/2017 11:44:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_tieu_thuyet]
AS
SELECT        id_san_pham, ma_san_pham, ten_san_pham, ma_loai, mo_ta_chi_tiet, don_gia, dvt, tinh_trang, hinh, san_pham_moi, tac_gia, nxb, ngay_xuat_ban, so_trang, 
                         danh_muc
FROM            dbo.san_pham
WHERE        (ma_loai = 1)

GO
SET IDENTITY_INSERT [dbo].[hoa_don] ON 

INSERT [dbo].[hoa_don] ([ma_hoa_don], [ngay_dat], [so_luong], [tong_tien], [id_san_pham], [ma_khach_hang], [ghi_chu], [tinh_trang], [TempID]) VALUES (4, CAST(N'2017-01-05' AS Date), 1, 105000, 1, 4, N'', 1, 5)
INSERT [dbo].[hoa_don] ([ma_hoa_don], [ngay_dat], [so_luong], [tong_tien], [id_san_pham], [ma_khach_hang], [ghi_chu], [tinh_trang], [TempID]) VALUES (4, CAST(N'2017-01-05' AS Date), 2, 80000, 4, 4, N'', 1, 2)
INSERT [dbo].[hoa_don] ([ma_hoa_don], [ngay_dat], [so_luong], [tong_tien], [id_san_pham], [ma_khach_hang], [ghi_chu], [tinh_trang], [TempID]) VALUES (4, CAST(N'2017-01-05' AS Date), 1, 80000, 4, 4, N'', 1, 6)
INSERT [dbo].[hoa_don] ([ma_hoa_don], [ngay_dat], [so_luong], [tong_tien], [id_san_pham], [ma_khach_hang], [ghi_chu], [tinh_trang], [TempID]) VALUES (4, CAST(N'2017-01-05' AS Date), 1, 200000, 8, 4, N'', 1, 7)
INSERT [dbo].[hoa_don] ([ma_hoa_don], [ngay_dat], [so_luong], [tong_tien], [id_san_pham], [ma_khach_hang], [ghi_chu], [tinh_trang], [TempID]) VALUES (4, CAST(N'2017-01-05' AS Date), 1, 30000, 2, 4, N'', 1, 8)
SET IDENTITY_INSERT [dbo].[hoa_don] OFF
SET IDENTITY_INSERT [dbo].[khach_hang] ON 

INSERT [dbo].[khach_hang] ([ma_khach_hang], [ten_khach_hang], [phai], [dia_chi], [dien_thoai], [email], [ghi_chu], [mat_khau]) VALUES (4, N'', 0, N'Trần Hưng Đạo', N'0961827427', N'admin', N'', N'123')
INSERT [dbo].[khach_hang] ([ma_khach_hang], [ten_khach_hang], [phai], [dia_chi], [dien_thoai], [email], [ghi_chu], [mat_khau]) VALUES (1008, N'', 1, N'HCM', N'0935264625', N'vietcuong220795@gmail.com', N'', N'123')
INSERT [dbo].[khach_hang] ([ma_khach_hang], [ten_khach_hang], [phai], [dia_chi], [dien_thoai], [email], [ghi_chu], [mat_khau]) VALUES (1011, N'KU', 1, N'HCM', N'0935264625', N'bestbookvn', N'admin', N'123')
SET IDENTITY_INSERT [dbo].[khach_hang] OFF
INSERT [dbo].[loai_san_pham] ([ma_loai], [ten_loai], [mo_ta], [hinh]) VALUES (1, N'vanhoc_tieuthuyet', N'Bo suu tap van hoc tieu thuyet', NULL)
INSERT [dbo].[loai_san_pham] ([ma_loai], [ten_loai], [mo_ta], [hinh]) VALUES (2, N'truyentranh_manga_comic', N'Bo suu tap truyen tranh manga comic', NULL)
INSERT [dbo].[loai_san_pham] ([ma_loai], [ten_loai], [mo_ta], [hinh]) VALUES (3, N'tieng_anh', N'Bo suu tap sach tieng anh', NULL)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_san_pham], [ten_san_pham], [ma_loai], [mo_ta_chi_tiet], [don_gia], [dvt], [tinh_trang], [hinh], [san_pham_moi], [tac_gia], [nxb], [ngay_xuat_ban], [so_trang], [danh_muc]) VALUES (1, N'sp1', N'Ba trừ một bằng mấy?', 1, NULL, 105000, N'quyển', N'còn hàng', N'3-1_2.jpg', 1, N'Mỹ Chi', N'Hồng Bàng', CAST(N'2016-08-10 00:00:00.000' AS DateTime), 97, NULL)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_san_pham], [ten_san_pham], [ma_loai], [mo_ta_chi_tiet], [don_gia], [dvt], [tinh_trang], [hinh], [san_pham_moi], [tac_gia], [nxb], [ngay_xuat_ban], [so_trang], [danh_muc]) VALUES (2, N'sp2', N'Truyện cười tình yêu', 1, NULL, 30000, N'quyển', N'còn hàng', N'101truyencuoitinhyeu.jpg', 1, N'Trường Giang', N'Giáo dục', CAST(N'2016-08-10 00:00:00.000' AS DateTime), 69, NULL)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_san_pham], [ten_san_pham], [ma_loai], [mo_ta_chi_tiet], [don_gia], [dvt], [tinh_trang], [hinh], [san_pham_moi], [tac_gia], [nxb], [ngay_xuat_ban], [so_trang], [danh_muc]) VALUES (3, N'sp3', N'Biên giới không bóng người', 1, NULL, 200000, N'quyển', N'còn hàng', N'bia-ban-giao-huong.jpg', 0, N'Việt Cường', N'HBU', CAST(N'2016-08-10 00:00:00.000' AS DateTime), 1252, NULL)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_san_pham], [ten_san_pham], [ma_loai], [mo_ta_chi_tiet], [don_gia], [dvt], [tinh_trang], [hinh], [san_pham_moi], [tac_gia], [nxb], [ngay_xuat_ban], [so_trang], [danh_muc]) VALUES (4, N'sp4', N'Câu chuyện nghĩa địa', 1, NULL, 80000, N'quyển', N'còn hàng', N'cau_chuyen_nghia_dia.jpg', 0, N'Tấn Phát', N'KHTN', CAST(N'2016-08-10 00:00:00.000' AS DateTime), 2271, 1)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_san_pham], [ten_san_pham], [ma_loai], [mo_ta_chi_tiet], [don_gia], [dvt], [tinh_trang], [hinh], [san_pham_moi], [tac_gia], [nxb], [ngay_xuat_ban], [so_trang], [danh_muc]) VALUES (5, N'sp5', N'Cười xoà', 1, NULL, 80000, N'quyển', N'còn hàng', N'cuoi-xoa.jpg', 0, N'Tấn Phát', N'KHTN', NULL, 2271, 1)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_san_pham], [ten_san_pham], [ma_loai], [mo_ta_chi_tiet], [don_gia], [dvt], [tinh_trang], [hinh], [san_pham_moi], [tac_gia], [nxb], [ngay_xuat_ban], [so_trang], [danh_muc]) VALUES (6, N'sp6', N'Đào mộ bút kí', 1, NULL, 150000, N'quyển', N'cháy hàng', N'dao-mo-but-ky.jpg', 1, N'Mạnh Cường', N'T3H', CAST(N'2016-08-10 00:00:00.000' AS DateTime), 1252, NULL)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_san_pham], [ten_san_pham], [ma_loai], [mo_ta_chi_tiet], [don_gia], [dvt], [tinh_trang], [hinh], [san_pham_moi], [tac_gia], [nxb], [ngay_xuat_ban], [so_trang], [danh_muc]) VALUES (7, N'sp7', N'Đấu trường sinh tử', 1, NULL, 150000, N'quyển', N'cháy hàng', N'dau-truong-sinh-tu.jpg', 1, N'Vân Hà', N'T3H', CAST(N'2016-08-10 00:00:00.000' AS DateTime), 1252, NULL)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_san_pham], [ten_san_pham], [ma_loai], [mo_ta_chi_tiet], [don_gia], [dvt], [tinh_trang], [hinh], [san_pham_moi], [tac_gia], [nxb], [ngay_xuat_ban], [so_trang], [danh_muc]) VALUES (8, N'sp8', N'Đô Rê Mon tập 2', 2, NULL, 200000, N'bộ', N'cháy hàng', N'doraemon-2.jpg', 1, N'Nhất Duy', N'HBU', NULL, 5122, 1)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_san_pham], [ten_san_pham], [ma_loai], [mo_ta_chi_tiet], [don_gia], [dvt], [tinh_trang], [hinh], [san_pham_moi], [tac_gia], [nxb], [ngay_xuat_ban], [so_trang], [danh_muc]) VALUES (9, N'sp9', N'Nô Bi  Ta phiêu lưu mặt trăng', 2, NULL, 500000, N'bộ', N'còn hàng', N'nobita-va-truyen-thuyet-vua-mat-troi-tap-2.jpg', 1, N'Việt Cường', N'HBU', NULL, 212121, 1)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_san_pham], [ten_san_pham], [ma_loai], [mo_ta_chi_tiet], [don_gia], [dvt], [tinh_trang], [hinh], [san_pham_moi], [tac_gia], [nxb], [ngay_xuat_ban], [so_trang], [danh_muc]) VALUES (10, N'sp10', N'Drake', 3, NULL, 100000, N'quyển', N'còn hàng', N'darke.jpg', 0, N'Việt Cường HBU', N'HBU', NULL, NULL, NULL)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_san_pham], [ten_san_pham], [ma_loai], [mo_ta_chi_tiet], [don_gia], [dvt], [tinh_trang], [hinh], [san_pham_moi], [tac_gia], [nxb], [ngay_xuat_ban], [so_trang], [danh_muc]) VALUES (11, N'sp11', N'Electricity', 3, NULL, 300000, N'quyển', N'còn hàng ', N'electricity.jpg', 1, N'Việt Cường', N'HBU', NULL, NULL, NULL)
INSERT [dbo].[san_pham] ([id_san_pham], [ma_san_pham], [ten_san_pham], [ma_loai], [mo_ta_chi_tiet], [don_gia], [dvt], [tinh_trang], [hinh], [san_pham_moi], [tac_gia], [nxb], [ngay_xuat_ban], [so_trang], [danh_muc]) VALUES (12, N'sp12', N'Money and bank', 3, NULL, 200000, N'quyển', N'cháy hàng', N'money_and_bank.jpg', 1, N'Việt Cường', N'HBU', NULL, NULL, NULL)
/****** Object:  StoredProcedure [dbo].[insert_hoadon]    Script Date: 1/6/2017 11:44:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[insert_hoadon]
@ma_hoa_don int,
@ngay_dat date,
@so_luong int,
@tong_tien float,
@id_san_pham int,
@ma_khach_hang int,
@ghi_chu nvarchar(50),
@tinh_trang int

AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO hoa_don(ma_hoa_don,ngay_dat,so_luong,tong_tien,id_san_pham,ma_khach_hang,ghi_chu,tinh_trang)
VALUES (@ma_hoa_don,@ngay_dat,@so_luong,@tong_tien,@id_san_pham,@ma_khach_hang,@ghi_chu,@tinh_trang)
END
--ALTER TABLE hoa_don ADD TempID int IDENTITY(1, 1);
GO
/****** Object:  StoredProcedure [dbo].[insert_khachhang]    Script Date: 1/6/2017 11:44:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[insert_khachhang]
@ten_khach_hang nvarchar(100),
@phai int,
@dia_chi nvarchar(200),
@dien_thoai nvarchar(20),
@email nvarchar(100),

@ghi_chu nvarchar(50),
@mat_khau nvarchar(100)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO khach_hang(ten_khach_hang,phai,dia_chi,dien_thoai,email,ghi_chu,mat_khau)
VALUES (@ten_khach_hang,@phai,@dia_chi,@dien_thoai,@email,@ghi_chu,@mat_khau)
END
GO
/****** Object:  StoredProcedure [dbo].[insert_sanpham]    Script Date: 1/6/2017 11:44:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[insert_sanpham]
@id_san_pham int,
@ma_san_pham nvarchar(50),
@ten_san_pham nvarchar(100),
@ma_loai int,
@mo_ta_chi_tiet text,
@don_gia int,
@dvt nvarchar(20),
@tinh_trang nvarchar(100),
@hinh nvarchar(200),
@san_pham_moi int,
@tac_gia nvarchar(100),
@nxb nvarchar(50),
@ngay_xuat_ban datetime,
@so_trang int,
@danh_muc int
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO san_pham(id_san_pham,ma_san_pham,ten_san_pham,ma_loai,mo_ta_chi_tiet,don_gia,dvt,tinh_trang,hinh,san_pham_moi
	,tac_gia,nxb,ngay_xuat_ban,so_trang,danh_muc)
VALUES (@id_san_pham,@ma_san_pham,@ten_san_pham,@ma_loai,@mo_ta_chi_tiet,@don_gia,@dvt,@tinh_trang,@hinh,@san_pham_moi
	,@tac_gia,@nxb,@ngay_xuat_ban,@so_trang,@danh_muc)
END

--exec insert_sanpham 13,'sp13','test',2,'',2000,'cuốn',
GO
/****** Object:  StoredProcedure [dbo].[sp_dang_nhap]    Script Date: 1/6/2017 11:44:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_dang_nhap]
@usr nvarchar(100),
@pass nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select email, mat_khau from khach_hang where email=@usr and mat_khau=@pass
END


GO
/****** Object:  StoredProcedure [dbo].[sp_delete_khachhang]    Script Date: 1/6/2017 11:44:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_delete_khachhang]
@ma_khach_hang int
as
delete from khach_hang where ma_khach_hang=@ma_khach_hang
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_sanpham]    Script Date: 1/6/2017 11:44:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_delete_sanpham]
@id_san_pham int
as
delete from san_pham where id_san_pham=@id_san_pham
GO
/****** Object:  StoredProcedure [dbo].[sp_update_khachhang]    Script Date: 1/6/2017 11:44:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_update_khachhang]
@ma_khach_hang int,
@ten_khach_hang nvarchar(100),
@phai int,
@dia_chi nvarchar(200),
@dien_thoai nvarchar(20),
@email nvarchar(100),

@ghi_chu nvarchar(50),
@mat_khau nvarchar(100)
AS
BEGIN
UPDATE khach_hang 
SET 
	ten_khach_hang=@ten_khach_hang,
	phai=@phai,
	dia_chi=@dia_chi,
	dien_thoai=@dien_thoai,
	email=@email,
	ghi_chu=@ghi_chu,
	mat_khau=@mat_khau
WHERE ma_khach_hang=@ma_khach_hang
END

GO
/****** Object:  StoredProcedure [dbo].[sp_update_sanpham]    Script Date: 1/6/2017 11:44:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_update_sanpham]
@id_san_pham int,
@ma_san_pham nvarchar(50),
@ten_san_pham nvarchar(100),
@ma_loai int,
@mo_ta_chi_tiet text,
@don_gia int,
@dvt nvarchar(20),
@tinh_trang nvarchar(100),
@hinh nvarchar(200),
@san_pham_moi int,
@tac_gia nvarchar(100),
@nxb nvarchar(50),
@ngay_xuat_ban datetime,
@so_trang int,
@danh_muc int
AS
BEGIN
UPDATE san_pham 
SET 

	ma_san_pham=@ma_san_pham,
	ten_san_pham=@ten_san_pham,
	ma_loai=@ma_loai,
	mo_ta_chi_tiet=@mo_ta_chi_tiet,
	don_gia=@don_gia,
	dvt=@dvt,
	tinh_trang=@tinh_trang,
	hinh=@hinh,
	san_pham_moi=@san_pham_moi,
	tac_gia=@tac_gia,
	nxb=@nxb,
	ngay_xuat_ban=@ngay_xuat_ban,
	so_trang=@so_trang,
	danh_muc=@danh_muc

WHERE id_san_pham=@id_san_pham
END
--exec sp_update_sanpham 13,'sp13','test',2,'a',2000,'cuon','a','',1,'ku','nxb','7-5-16',12,1
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "khach_hang"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 213
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_login'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_login'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "san_pham"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_manga_comic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_manga_comic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[9] 2[22] 3) )"
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
         Begin Table = "san_pham"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_san_pham_moi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_san_pham_moi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "san_pham"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
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
         Column = 1440
         Alias = 900
         Table = 1170
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_tieng_anh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_tieng_anh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "san_pham"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_tieu_thuyet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_tieu_thuyet'
GO
