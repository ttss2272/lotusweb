USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[WarehouseID] [int] IDENTITY(1,1) NOT NULL,
	[WarehouseName] [nvarchar](max) NULL,
	[WarehouseLocation] [nvarchar](max) NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
	[WarehouseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Warehouse] ON
INSERT [dbo].[Warehouse] ([WarehouseID], [WarehouseName], [WarehouseLocation], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (1, N'dwnin', N'pune', 0, 0, CAST(0x0000A51C00D00265 AS DateTime), CAST(0x0000A51C00D00265 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Warehouse] OFF
/****** Object:  Table [dbo].[UserType]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[UserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeName] [nvarchar](50) NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserType] ON
INSERT [dbo].[UserType] ([UserTypeID], [UserTypeName], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (1, N'Admin', 1, 1, CAST(0x0000A51C011C48AA AS DateTime), CAST(0x0000A51C011C48AA AS DateTime), 1)
INSERT [dbo].[UserType] ([UserTypeID], [UserTypeName], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (2, N'Manager', 1, 1, CAST(0x0000A51C011C543E AS DateTime), CAST(0x0000A51C011C543E AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[UserType] OFF
/****** Object:  Table [dbo].[SupplierPayment]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierPayment](
	[SupplierPaymentID] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseTransactionID] [int] NULL,
	[PaidAmount] [decimal](18, 2) NULL,
	[AmountPaidDate] [date] NULL,
	[PaymentReceiptNo] [nvarchar](50) NULL,
	[BalaneAmount] [decimal](18, 2) NULL,
	[Comment] [nvarchar](max) NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_SupplierPayment] PRIMARY KEY CLUSTERED 
(
	[SupplierPaymentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](max) NULL,
	[CountryID] [int] NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[State] ON
INSERT [dbo].[State] ([StateID], [StateName], [CountryID], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (1, N'Maharashtra', 1, 1, 1, CAST(0x0000A51B00C25644 AS DateTime), CAST(0x0000A51B00C25644 AS DateTime), 1)
INSERT [dbo].[State] ([StateID], [StateName], [CountryID], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (2, N'Panjab', 1, 1, 1, CAST(0x0000A51B00C4E98C AS DateTime), CAST(0x0000A51B00C4E98C AS DateTime), 1)
INSERT [dbo].[State] ([StateID], [StateName], [CountryID], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (3, N'Kerala', 1, 1, 1, CAST(0x0000A51B00C7A443 AS DateTime), CAST(0x0000A51B00C7A443 AS DateTime), 1)
INSERT [dbo].[State] ([StateID], [StateName], [CountryID], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (4, N'Uttar Pradesh', 1, 1, 1, CAST(0x0000A51B00C7D4DC AS DateTime), CAST(0x0000A51B00C7D4DC AS DateTime), 1)
INSERT [dbo].[State] ([StateID], [StateName], [CountryID], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (5, N'Gorgia', 2, 1, 1, CAST(0x0000A51C013A6B3F AS DateTime), CAST(0x0000A51C013A6B3F AS DateTime), 1)
INSERT [dbo].[State] ([StateID], [StateName], [CountryID], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (6, N'West Australia', 3, 1, 1, CAST(0x0000A51C013A84A3 AS DateTime), CAST(0x0000A51C013A84A3 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[State] OFF
/****** Object:  Table [dbo].[ShopType]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopType](
	[ShopTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ShopTypeName] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ShopType] PRIMARY KEY CLUSTERED 
(
	[ShopTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ShopType] ON
INSERT [dbo].[ShopType] ([ShopTypeID], [ShopTypeName], [IsActive], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate]) VALUES (1, N'Retailer', 1, 1, 1, CAST(0x0000A51B00FE83E6 AS DateTime), CAST(0x0000A51B00FE83E6 AS DateTime))
INSERT [dbo].[ShopType] ([ShopTypeID], [ShopTypeName], [IsActive], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate]) VALUES (2, N'Whole Seller', 1, 1, 1, CAST(0x0000A51B00FE9DF9 AS DateTime), CAST(0x0000A51B00FE9DF9 AS DateTime))
INSERT [dbo].[ShopType] ([ShopTypeID], [ShopTypeName], [IsActive], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate]) VALUES (3, N'Sub Whole Seller', 1, 1, 1, CAST(0x0000A51B00FEB266 AS DateTime), CAST(0x0000A51B00FEB266 AS DateTime))
SET IDENTITY_INSERT [dbo].[ShopType] OFF
/****** Object:  Table [dbo].[MedicalPayment]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalPayment](
	[MedicalPaymentID] [int] IDENTITY(1,1) NOT NULL,
	[SaleTransactionID] [int] NULL,
	[MedicalPaymentNo] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NULL,
	[PaidAmount] [decimal](18, 2) NULL,
	[AmountPaidDate] [date] NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_MedicalPayment] PRIMARY KEY CLUSTERED 
(
	[MedicalPaymentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorPayment]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorPayment](
	[DoctorPaymentID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NULL,
	[ReceiptNo] [nvarchar](max) NULL,
	[PaidAmountDate] [date] NULL,
	[PaymentAmount] [decimal](18, 2) NULL,
	[Comment] [nvarchar](max) NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
 CONSTRAINT [PK_DoctorPayment] PRIMARY KEY CLUSTERED 
(
	[DoctorPaymentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[DoctorID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorName] [nvarchar](max) NULL,
	[Specialization] [nvarchar](max) NULL,
	[DOB] [date] NULL,
	[CityID] [int] NULL,
	[Area] [nvarchar](50) NULL,
	[MobileNo] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[OpeningBalance] [decimal](18, 2) NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Doctor] ON
INSERT [dbo].[Doctor] ([DoctorID], [DoctorName], [Specialization], [DOB], [CityID], [Area], [MobileNo], [Address], [OpeningBalance], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (4, N'Pravin', N'MBBS', CAST(0x26080B00 AS Date), 2, N'Pune', N'9876543214', N'New Sangavi', CAST(10000.00 AS Decimal(18, 2)), 1, 1, CAST(0x0000A51D00CC4BDE AS DateTime), CAST(0x0000A51D00CC4BDE AS DateTime), 1)
INSERT [dbo].[Doctor] ([DoctorID], [DoctorName], [Specialization], [DOB], [CityID], [Area], [MobileNo], [Address], [OpeningBalance], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (5, N'Sahil', N'Family Doctor', CAST(0x97FF0A00 AS Date), 3, N'sjhsfd', N'9887464435', N'sdfsdf', CAST(100.00 AS Decimal(18, 2)), 1, 1, CAST(0x0000A51D00CDA6BD AS DateTime), CAST(0x0000A51D00CDA6BD AS DateTime), 1)
INSERT [dbo].[Doctor] ([DoctorID], [DoctorName], [Specialization], [DOB], [CityID], [Area], [MobileNo], [Address], [OpeningBalance], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (6, N'Mangesh Shinde', N'MBBS', CAST(0xE4000B00 AS Date), 2, N'Pune', N'9876543214', N'Pune', CAST(9000.00 AS Decimal(18, 2)), 1, 1, CAST(0x0000A51D00CFB7A0 AS DateTime), CAST(0x0000A51D00CFB7A0 AS DateTime), 1)
INSERT [dbo].[Doctor] ([DoctorID], [DoctorName], [Specialization], [DOB], [CityID], [Area], [MobileNo], [Address], [OpeningBalance], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (7, N'oio', N'jj', CAST(0x673A0B00 AS Date), 2, N'l;l;lk..;', N'6554', N'popop', CAST(500.00 AS Decimal(18, 2)), 1, 1, CAST(0x0000A51D00D0BBF0 AS DateTime), CAST(0x0000A51D00D0BBF0 AS DateTime), 1)
INSERT [dbo].[Doctor] ([DoctorID], [DoctorName], [Specialization], [DOB], [CityID], [Area], [MobileNo], [Address], [OpeningBalance], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (8, N'pds Shinde', N'MBBS', CAST(0xE4000B00 AS Date), 2, N'Pune', N'9876543214', N'Pune', CAST(9000.00 AS Decimal(18, 2)), 1, 1, CAST(0x0000A51D00D0FBCC AS DateTime), CAST(0x0000A51D00D0FBCC AS DateTime), 1)
INSERT [dbo].[Doctor] ([DoctorID], [DoctorName], [Specialization], [DOB], [CityID], [Area], [MobileNo], [Address], [OpeningBalance], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (9, N'DG', N'DG', CAST(0x613A0B00 AS Date), 2, N'DFGDG', N'32131315465', N'DFGDG', CAST(64646.00 AS Decimal(18, 2)), 1, 1, CAST(0x0000A51D00D19840 AS DateTime), CAST(0x0000A51D00D19840 AS DateTime), 1)
INSERT [dbo].[Doctor] ([DoctorID], [DoctorName], [Specialization], [DOB], [CityID], [Area], [MobileNo], [Address], [OpeningBalance], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (10, N'Bharat', N'erergf', CAST(0x26080B00 AS Date), 2, N'dfdgg', N'654646464', N'dfgdfgfd', CAST(0.00 AS Decimal(18, 2)), 1, 1, CAST(0x0000A51D00D26765 AS DateTime), CAST(0x0000A51D00D26765 AS DateTime), 1)
INSERT [dbo].[Doctor] ([DoctorID], [DoctorName], [Specialization], [DOB], [CityID], [Area], [MobileNo], [Address], [OpeningBalance], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (11, N'dggd', N'dgdg', CAST(0x673A0B00 AS Date), 2, N'rtrt', N'9876543215', N'gfghf', CAST(10000.00 AS Decimal(18, 2)), 1, 1, CAST(0x0000A51D00D2BC5D AS DateTime), CAST(0x0000A51D00D2BC5D AS DateTime), 1)
INSERT [dbo].[Doctor] ([DoctorID], [DoctorName], [Specialization], [DOB], [CityID], [Area], [MobileNo], [Address], [OpeningBalance], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (12, N'34324', N'sdf', CAST(0x663A0B00 AS Date), 2, N'Pune', N'234234', N'sdfsdf', CAST(12212.00 AS Decimal(18, 2)), 1, 1, CAST(0x0000A51D0101CF74 AS DateTime), CAST(0x0000A51D0101CF74 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Doctor] OFF
/****** Object:  Table [dbo].[DMPLinking]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMPLinking](
	[DMPID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NULL,
	[MedicalShopID] [int] NULL,
	[ProductID] [int] NULL,
	[PriceTypeID] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_DMPLinking] PRIMARY KEY CLUSTERED 
(
	[DMPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](max) NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Country] ON
INSERT [dbo].[Country] ([CountryID], [CountryName], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (1, N'India', 1, 1, CAST(0x0000A51501100B43 AS DateTime), CAST(0x0000A51501100B43 AS DateTime), 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (2, N'America', 1, 1, CAST(0x0000A515011CC55F AS DateTime), CAST(0x0000A515011CC55F AS DateTime), 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (3, N'Australia', 1, 1, CAST(0x0000A515011D35DE AS DateTime), CAST(0x0000A515011D35DE AS DateTime), 1)
INSERT [dbo].[Country] ([CountryID], [CountryName], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (4, N'Great Britan', 1, 1, CAST(0x0000A515011E15A1 AS DateTime), CAST(0x0000A515011E15A1 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Country] OFF
/****** Object:  Table [dbo].[CommissionDetail]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommissionDetail](
	[CommissionDetailID] [int] IDENTITY(1,1) NOT NULL,
	[CommissionID] [int] NULL,
	[DoctorName] [int] NULL,
	[CommissionPer] [decimal](18, 2) NULL,
	[CommissionAmount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_CommissionDetail] PRIMARY KEY CLUSTERED 
(
	[CommissionDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commission]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commission](
	[CommissionID] [int] IDENTITY(1,1) NOT NULL,
	[MedicalShopID] [int] NULL,
	[ProductID] [int] NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Commission] PRIMARY KEY CLUSTERED 
(
	[CommissionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](max) NULL,
	[StateID] [int] NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (1, N'Pune', -1, 1, 1, CAST(0x0000A51B00E39D78 AS DateTime), CAST(0x0000A51B00E39D78 AS DateTime), 1)
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (2, N'Pune', 1, 1, 1, CAST(0x0000A51B00E3B848 AS DateTime), CAST(0x0000A51B00E3B848 AS DateTime), 1)
INSERT [dbo].[City] ([CityID], [CityName], [StateID], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (3, N'Jalna', 1, 1, 1, CAST(0x0000A51B00E7F187 AS DateTime), CAST(0x0000A51B00E7F187 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[City] OFF
/****** Object:  Table [dbo].[SaleTransactionDetail]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleTransactionDetail](
	[SaleTransactionDetailID] [int] IDENTITY(1,1) NOT NULL,
	[SaleTransactionID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [decimal](18, 4) NULL,
	[SellingPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_SaleTransactionDetail] PRIMARY KEY CLUSTERED 
(
	[SaleTransactionDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleTransaction]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleTransaction](
	[SaleTransactionID] [int] IDENTITY(1,1) NOT NULL,
	[SaleTransactionNo] [nvarchar](max) NULL,
	[WarehouseID] [int] NULL,
	[MedicalShopID] [int] NULL,
	[SellingDate] [date] NULL,
	[DiscountAmount] [decimal](18, 2) NULL,
	[BalanceAmount] [decimal](18, 2) NULL,
	[Comment] [nvarchar](max) NULL,
	[CreatedByuserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_SaleTransaction] PRIMARY KEY CLUSTERED 
(
	[SaleTransactionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesReturnDetail]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesReturnDetail](
	[SalesReturnDetailID] [int] IDENTITY(1,1) NOT NULL,
	[SalesReturnID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [decimal](18, 4) NULL,
	[Reason] [nvarchar](max) NULL,
	[Rate] [decimal](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesReturn]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesReturn](
	[SalesReturnID] [int] IDENTITY(1,1) NOT NULL,
	[ReturnInvoiceNo] [nvarchar](max) NULL,
	[MedicalShopID] [int] NULL,
	[ReturnDate] [date] NULL,
	[WarehouseID] [int] NULL,
	[Comment] [nvarchar](max) NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_SalesReturn] PRIMARY KEY CLUSTERED 
(
	[SalesReturnID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseTransactionDetail]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseTransactionDetail](
	[PurchaseTransactionDetailID] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseTransactionID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [decimal](18, 4) NULL,
	[PurchaseRate] [decimal](18, 2) NULL,
	[BatchNo] [nvarchar](max) NULL,
	[ExpiryDate] [date] NULL,
 CONSTRAINT [PK_PurchaseTransactionDetail] PRIMARY KEY CLUSTERED 
(
	[PurchaseTransactionDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseTransaction]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseTransaction](
	[PurchaseTransactionID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NULL,
	[WarehouseID] [int] NULL,
	[PurchaseDate] [date] NULL,
	[ModeOfPayment] [nvarchar](50) NULL,
	[SupplierReciptNo] [nvarchar](max) NULL,
	[BalanceAmount] [decimal](18, 2) NULL,
	[Comment] [nvarchar](max) NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_PurchaseTransaction] PRIMARY KEY CLUSTERED 
(
	[PurchaseTransactionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeName] [nvarchar](50) NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NULL,
	[ProductCode] [nvarchar](50) NULL,
	[SallingPrice] [decimal](18, 2) NULL,
	[ProductTypeID] [int] NULL,
	[PurchasePrice] [decimal](18, 2) NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceType]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceType](
	[PriceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[PriceTypeName] [nvarchar](max) NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_PriceType] PRIMARY KEY CLUSTERED 
(
	[PriceTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Message] ON
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (1, N'Country Already Exsits')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (2, N'Country Saved Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (3, N'Country Updated Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (4, N'Please Enter State Name')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (5, N'Please Select Country')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (6, N'Same Name State is Available in Country')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (7, N'State Saved Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (8, N'State Updated Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (9, N'Please Enter City Name')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (10, N'City Saved Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (11, N'City Updated Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (12, N'Please Insert Shop Name')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (13, N'Please Insert Owner Name')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (14, N'Medical Shop Saved Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (15, N'Medical Shop Updated Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (16, N'Error To Save Medical Shop.')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (17, N'Error To Update Medical Shop.')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (18, N'Please Insert Doctor Name')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (19, N'Please Insert Spcialization')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (20, N'Error To Update Doctor Details')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (21, N'Doctor Details Updated  Successfully...!!!')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (22, N'Error To Save Doctor Details.')
INSERT [dbo].[Message] ([MessageID], [Message]) VALUES (23, N'Doctor Details Saved Successfully...!!!')
SET IDENTITY_INSERT [dbo].[Message] OFF
/****** Object:  Table [dbo].[MedicalStockLog]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalStockLog](
	[MedicalStockLogID] [int] IDENTITY(1,1) NOT NULL,
	[MedicalStockID] [int] NULL,
	[Stock] [decimal](18, 2) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_MedicalStockLog] PRIMARY KEY CLUSTERED 
(
	[MedicalStockLogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalStock]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalStock](
	[MedicalStockID] [int] IDENTITY(1,1) NOT NULL,
	[MedicalShopID] [int] NULL,
	[ProductID] [int] NULL,
	[Stock] [decimal](18, 2) NULL,
	[StockEntryDate] [date] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
 CONSTRAINT [PK_MedicalStock] PRIMARY KEY CLUSTERED 
(
	[MedicalStockID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalShop]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalShop](
	[MedicalShopID] [int] IDENTITY(1,1) NOT NULL,
	[OwnerName] [nvarchar](max) NULL,
	[ContactNo] [nvarchar](50) NULL,
	[CityID] [int] NOT NULL,
	[Area] [nvarchar](50) NULL,
	[ShopName] [nvarchar](max) NULL,
	[ShopTypeID] [int] NOT NULL,
	[OpeningBalance] [decimal](18, 2) NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[Address] [nvarchar] (MAX)Null
 CONSTRAINT [PK_MedicalShop] PRIMARY KEY CLUSTERED 
(
	[MedicalShopID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MedicalShop] ON
INSERT [dbo].[MedicalShop] ([MedicalShopID], [OwnerName], [ContactNo], [CityID], [Area], [ShopName], [ShopTypeID], [OpeningBalance], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (1, N'PriTesh Sortee', N'9028905504', 1, N'Old Jalna', N'PriTesh Medico', 1, CAST(9000.00 AS Decimal(18, 2)), 1, 1, CAST(0x0000A51B0144D21E AS DateTime), CAST(0x0000A51B0144D21E AS DateTime), 1)
INSERT [dbo].[MedicalShop] ([MedicalShopID], [OwnerName], [ContactNo], [CityID], [Area], [ShopName], [ShopTypeID], [OpeningBalance], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (2, N'gigi', N'67789', 2, N'jhjgyujg', N'sed', 1, CAST(200.00 AS Decimal(18, 2)), 1, 1, CAST(0x0000A51C00C897C3 AS DateTime), CAST(0x0000A51C00C897C3 AS DateTime), 1)
INSERT [dbo].[MedicalShop] ([MedicalShopID], [OwnerName], [ContactNo], [CityID], [Area], [ShopName], [ShopTypeID], [OpeningBalance], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive]) VALUES (3, N'PriTesh Sortee', N'9028905504', 1, N'Old Jalna', N'PriTesh Medico', 1, CAST(9000.00 AS Decimal(18, 2)), 1, 1, CAST(0x0000A51D00CF98AA AS DateTime), CAST(0x0000A51D00CF98AA AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[MedicalShop] OFF
/****** Object:  StoredProcedure [dbo].[BindWarehouse_USP]    Script Date: 09/24/2015 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 23 Sept 2015
-- Description:	Bind Dropdown OF Warehouse
-- =============================================
CREATE PROCEDURE [dbo].[BindWarehouse_USP] 
(
@WarehouseID int, 
@IsActive int
)
AS
BEGIN
	SELECT WarehouseName AS 'Warehouse Name',WarehouseID from Warehouse
	
	where WarehouseID LIKE CASE WHEN @WarehouseID<>0 THEN @WarehouseID ELSE CONVERT(nvarchar(50),WarehouseID) END
	AND IsActive LIKE CASE WHEN @IsActive <>2 then @IsActive ELSE CONVERT (NVARCHAR(50),IsActive)END
	
END
GO
/****** Object:  StoredProcedure [dbo].[BindUserType_USP]    Script Date: 09/24/2015 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 23 Sept 2015
-- Description:	Bind User type to Dropdown
-- =============================================
CREATE PROCEDURE [dbo].[BindUserType_USP] 
AS
BEGIN
SELECT UserTypeID,UserTypeName FROM UserType
Where IsActive=1

END
GO
/****** Object:  StoredProcedure [dbo].[BindState_USP]    Script Date: 09/24/2015 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 22 Sept 2015
-- Description:	Get StateId And State Name to Bind DropDown
-- =============================================
CREATE PROCEDURE [dbo].[BindState_USP] 
(
@CountryID int=0
)
AS
BEGIN
	Select s.StateID,s.StateName AS 'State Name'from [State] s
 Where 
	s.CountryID LIKE CASE WHEN @CountryID<>0 THEN @CountryID ELSE Convert(nvarchar(50),s.CountryID) END


END
GO
/****** Object:  StoredProcedure [dbo].[GetWarehouse_USP]    Script Date: 09/24/2015 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 23 Sept @015
-- Description:	Get wre house Details for bind warehouse
-- =============================================
CREATE PROCEDURE [dbo].[GetWarehouse_USP] 
(
@WarehouseID int, 
@IsActive int
)
AS
BEGIN

	SELECT WarehouseName AS 'Warehouse Name',WarehouseLocation AS 'Location' from Warehouse
	
	where WarehouseID LIKE CASE WHEN @WarehouseID<>0 THEN @WarehouseID ELSE CONVERT(nvarchar(50),WarehouseID) END
	AND IsActive LIKE CASE WHEN @IsActive <>2 then @IsActive ELSE CONVERT (NVARCHAR(50),IsActive)END
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetState_USP]    Script Date: 09/24/2015 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 15 Sept 2015
-- Description:	Get State Details
-- =============================================
CREATE PROCEDURE [dbo].[GetState_USP] 
(
@StateID int=0,
@IsActive bit
)
AS
BEGIN
Select s.StateID,s.StateName AS 'State Name',c.CountryName AS 'Country Name'from [State] s
INNER JOIN Country c
on c.CountryID=s.CountryID
 Where 
	s.StateID LIKE CASE WHEN @StateID<>0 THEN @StateID ELSE Convert(nvarchar(50),s.StateID) END
AND s.IsActive LIKE CASE WHEN @IsActive<>2 THEN @IsActive ELSE CONVERT(nvarchar(50),s.IsActive)END
END
GO
/****** Object:  StoredProcedure [dbo].[GetsShopType_USP]    Script Date: 09/24/2015 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 22 sept 2015
-- Description:	Get shop type for bind drop down
-- =============================================
CREATE PROCEDURE [dbo].[GetsShopType_USP] 

AS
BEGIN
SELECT ShopTypeID,ShopTypeName FROM ShopType
where IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[SaveWarehouse_USP]    Script Date: 09/24/2015 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 23 sept 2015
-- Description:	Save Warehouse
-- =============================================
CREATE PROCEDURE [dbo].[SaveWarehouse_USP] 
(
@WarehouseID int,
@WarehouseName nvarchar(50),
@Location nvarchar(50),
@UpdatedByUserID int,
@IsActive bit
)
AS
DECLARE @msg nvarchar(50)
BEGIN
	SET @WarehouseName=LTRIM(RTRIM(@WarehouseName))
	SET @Location=LTRIM(RTRIM(@Location))
	
	IF (@WarehouseName<>'' OR @WarehouseName<> NULL)--Check whetther Warehouse Name null or empty
		BEGIN--Warehouse name is not Empty or null
			IF (@Location<>'' OR @Location<> NULL)--Check whetther Location null or empty
				BEGIN-- Location not null or empty
					IF (@WarehouseID=0)--Check for new Entry
						BEGIN--New Entry
							IF Not Exists(SELECT WarehouseID FROM Warehouse where WarehouseName=@WarehouseName)--Warehouse Name Exists or Not
								BEGIN
									INSERT INTO Warehouse (WarehouseName,WarehouseLocation,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate,IsActive)
									VALUES (@WarehouseName,@Location,@UpdatedByUserID,@UpdatedByUserID,convert(datetime,getdate(),103),convert(datetime,getdate(),103),@IsActive)
									IF (@@RowCount=1)
										BEGIN
											SET @msg ='Warehouse Created Sucessfully....!!!'
											SELECT @msg 
										END
									ELSE
										BEGIN
											SET @msg ='Error to Create Warehouse'
											SELECT @msg 
										END
								END
							ELSE
								BEGIN--Warehouse Name Already Exists
									SET @msg='This Warehouse Name Already Exists Please Enter Another Name'
									SELECT @msg
								END
							END
					ELSE
						BEGIN--Update Warehouse
							IF Not Exists(SELECT WarehouseID FROM Warehouse where WarehouseName=@WarehouseName AND WarehouseID<>@WarehouseID)--Warehouse Name Exists or Not
								BEGIN
									UPDATE warehouse set WarehouseName=@WarehouseName,WarehouseLocation=@Location,UpdatedByUserID=@UpdatedByUserID,UpdatedDate=CONVERT(DATETIME,GETDATE(),103)
									WHERE WarehouseID=@WarehouseID
									IF (@@RowCount=1)
										BEGIN
											SET @msg ='Warehouse Updated Sucessfully....!!!'
											SELECT @msg 
										END
									ELSE
										BEGIN
											SET @msg ='Error to Update Warehouse'
											SELECT @msg 
										END
								END
							ELSE
								BEGIN--Warehouse Name Already Exists
									SET @msg='This Warehouse Name Already Exists Please Enter Another Name'
									SELECT @msg
									
								END
						END
				END
			ELSE
				BEGIN-- Location  null or empty
					SET @msg='Please Enter Location'
					SELECt @msg
				END
		END
	ELSE
		BEGIN--Warehouse name is Empty or Null
			set @msg='Please Insert Watrehouse Name'
			Select @msg
		END
END
GO
/****** Object:  Table [dbo].[User]    Script Date: 09/24/2015 16:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[LoginName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[ContactNo] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[WarehouseID] [int] NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[UserTypeID] [int] NOT NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[CityID] [int] NULL,
	[Area] [nvarchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[User] ON
INSERT [dbo].[User] ([UserID], [UserName], [LoginName], [Password], [ContactNo], [Address], [WarehouseID], [EmailAddress], [UserTypeID], [CreatedByUserID], [UpdatedByUserID], [CreatedDate], [UpdatedDate], [IsActive], [CityID], [Area]) VALUES (1, N'PriTesh', N'PriTesh', N'pritesh@123', N'9028905504', N'lkjf', 1, N'pritesh@teratech-solutions.com', 1, 1, 1, CAST(0x0000A51C014D51E4 AS DateTime), CAST(0x0000A51C014D51E4 AS DateTime), 1, 2, N'akurdi')
SET IDENTITY_INSERT [dbo].[User] OFF
/****** Object:  StoredProcedure [dbo].[SaveDoctorDetails_USP]    Script Date: 09/24/2015 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sameer Shinde
-- Create date: 23 sept 2015
-- Description:	Save DoctorDetails Shop
-- =============================================
CREATE PROCEDURE [dbo].[SaveDoctorDetails_USP] --1,'Mangesh Shinde','MBBS','17/05/1975',2,'Pune','Pune','9876543214',9000,1,1
(
@DoctorID int,
@DoctorName	nvarchar(Max),
@Specialization	nvarchar(MAX),
@DOB nvarchar(MAX),
@CityID	int,
@Area	nvarchar(MAX),
@Address	nvarchar(MAX),
@MobileNo	nvarchar(MAX),
@OpeningBalance	decimal(18,2),
@UpdatedByUserID	int,
@IsActive	bit
)
AS
DECLARE @msg nvarchar(50)
BEGIN
	SET @DoctorName=LTRIM(RTRIM(@DoctorName))
	SET @MobileNo=LTRIM(RTRIM(@MobileNo))
	SET @Area =LTRIM(RTRIM(@Area))
	SET @DOB=LTRIM(RTRIM(@DOB))
	SET @OpeningBalance=LTRIM(RTRIM(@OpeningBalance))
	
	IF (@DoctorName<>'' OR @DoctorName<>NULL)--Check is shop name empty or null
		BEGIN
		IF (@Specialization<>'' OR @Specialization<>NULL)--Check is shop name empty or null
		BEGIN
			IF(@DoctorID=0)--ENTER New Show Or Update
						BEGIN--Enter New Shop
							INSERT INTO Doctor (DoctorName,Specialization,DOB,CityID,Area,MobileNo,[Address],OpeningBalance,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate,IsActive)
							VALUES(@DoctorName,@Specialization,convert(date,@DOB,103),@CityID,@Area,@MobileNo,@Address,@OpeningBalance,@UpdatedByUserID,@UpdatedByUserID,CONVERT(datetime,GETDATE(),103),CONVERT(datetime,GETDATE(),103),@IsActive)
							IF(@@rowcount=1)--Check whether row affected or not
								BEGIN--if row affected 14
									SET @msg = (SELECT [Message] FROM [Message] WHERE MessageID=23)
									SELECT @msg
								END
							ELSE
								BEGIN--If row not Affected 16
									SET @msg=(SELECT [Message] FROM [Message] WHERE MessageID=22)
									SELECT @msg
								END
						END
					ELSE
						BEGIN--Update Exsisting Shop
							UPDATE Doctor set DoctorName=@DoctorName,Specialization=@Specialization,DOB=convert(date,@DOB,103),CityID=@CityID,Area=@Area,[Address]=@Address,MobileNo=@MobileNo,UpdatedByUserID=@UpdatedByUserID,UpdatedDate=CONVERT(DATETIME,GETDATE())
							WHERE DoctorID=@DoctorID
							IF(@@rowcount=1)--Check whether row affected or not
								BEGIN--Update Sucessfully
									SET @msg = (SELECT [Message] FROM [Message] WHERE MessageID=21)
									SELECT @msg
								END
							ELSE
								BEGIN
									SET @msg=(SELECT [Message] FROM [Message] WHERE MessageID=20)
									SELECT @msg
								END
						END
				END
			ELSE--messge if shop name Empty Message no 13
				BEGIN
					SET @msg =(select [Message] from [Message] where MessageID=19)
					SELECT @msg
				END 
		END
	ELSE --messge if shop name Empty Message no 12
		BEGIN
			SET @msg =(select [Message] from [Message] where MessageID=18)
			SELECT @msg
		END

END
GO
/****** Object:  StoredProcedure [dbo].[SaveCounty_USP]    Script Date: 09/24/2015 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 15Sept 2015
-- Description:	Save Country
-- =============================================
CREATE PROCEDURE [dbo].[SaveCounty_USP] 
(
 @CountryID int =0,
 @CountryName nvarchar(MAX) =null,
 @UpdatedByUserID	int =0,
 @IsActive	bit =null

)
AS
Declare @msg nvarchar(max)
BEGIN
set @CountryName= LTRIM(RTRIM(@CountryName))


	IF(@CountryID=0)
		BEGIN
			IF Not Exists(Select CountryID from Country where CountryName=@CountryName)
			BEGIN
				Insert into Country (CountryName,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate,IsActive)
				Values (@CountryName,@UpdatedByUserID,@UpdatedByUserID,convert(datetime,getdate(),103),convert(datetime,getdate(),103),@IsActive)
				
				set @msg = (Select [Message] from Message where MessageID=2)
				select @msg
			END
			Else
			BEGIN
				Set @msg = (Select [Message] from Message where MessageID=1)
				select @msg
			END
		END 
	ELSE
	BEGIN
		if Not Exists ( Select CountryID from Country where CountryName=@CountryName AND CountryID<>@CountryID)
			BEGIN
				UPDATE Country SET CountryName=@CountryName,UpdatedByUserID=@UpdatedByUserID,UpdatedDate=convert(datetime,getdate(),103)
				where CountryID=@CountryID
				(Select [Message] from Message where MessageID=3)
			END
		ELSE
			BEGIN
				Set @msg = (Select [Message] from Message where MessageID=1)
					select @msg
			END
	END

END
GO
/****** Object:  StoredProcedure [dbo].[SaveCity_USP]    Script Date: 09/24/2015 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 15 Sept 2015
-- Description:	Save City
-- =============================================
CREATE PROCEDURE [dbo].[SaveCity_USP] 
(
@CityID int,
@CityName nvarchar(50),
@StateID int,
@UpdatedByUserID int,
@IsActive bit
)
AS
DECLARE @msg nvarchar(50)
BEGIN
SET @CityName= LTRIM(RTRIM(@CityName))

IF(@CityName<>'' OR @CityName<>Null)--Check City name is null or Empty
	BEGIN
		IF(@CityID=0)--Check New entry or Update entry
			BEGIN--Save City
				INSERT INTO City (CityName,StateID,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate,IsActive)
				VALUES (@CityName,@StateID,@UpdatedByUserID,@UpdatedByUserID,convert(datetime,getdate(),103),convert(datetime,getdate(),103),@IsActive)
				set @msg =(SELECT [Message] from [Message] Where MessageID=10)		
				Select @Msg
			END
		ELSE
			BEGIN--Update City INfo
				UPDATE City set CityName=@CityName,StateID=@StateID,UpdatedByUserID=@UpdatedByUserID,UpdatedDate=convert(datetime,getdate(),103)
				WHERE CityID=CityID
				set @msg =(SELECT [Message] from [Message] Where MessageID=11)		
				Select @Msg
			END
	END
ELSE
	BEGIN--Message when City name is null or Empty
		SELECT [Message] from [Message] Where MessageID=9
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetCountry_USP]    Script Date: 09/24/2015 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 15 Sept 2015
-- Description:	Get Country
-- =============================================
CREATE PROCEDURE [dbo].[GetCountry_USP] 
(
@CountryID int,
@IsActive bit
)
AS
BEGIN
 	   SELECT CountryID,CountryName AS 'Country Name' from Country Where 
	   IsActive LIKE CASE WHEN @IsActive <>2 then @IsActive ELSE CONVERT (NVARCHAR(50),IsActive)END
	   AND CountryID Like CASE WHEN  @CountryID<>0 then @countryID ELSE CONVERT(NVARCHAR(50),CountryID) END

 
END
GO
/****** Object:  StoredProcedure [dbo].[GetCity_USP]    Script Date: 09/24/2015 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 15 Sept 2015
-- Description:	Get City to bind GriDVIEW
-- =============================================
CREATE PROCEDURE [dbo].[GetCity_USP] 
(
@CityID int,
@IsActive bit
)
AS
BEGIN
	Select c.CityID,c.CityName as 'City Name',s.StateName AS 'State Name',cou.CountryName AS 'Country Name'  from City c
	INNER JOIN [State] s
	ON s.StateID=c.StateID
	INNER JOIN Country cou
	ON cou.CountryID=s.CountryID
	Where 
	c.CityID Like CASE WHEN @CityID <> 0 THEN @CityID ELSE Convert(nvarchar(50),c.CityID) END
	AND c.IsActive Like CASE WHEN @IsActive<>2 THEN @IsActive Else Convert(NVARCHAR(50),c.IsActive)END
	
END
GO
/****** Object:  StoredProcedure [dbo].[BindCity_USP]    Script Date: 09/24/2015 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 22 Sept 2015
-- Description:	Bind Dropdown City
-- =============================================
CREATE PROCEDURE [dbo].[BindCity_USP] 
(
@StateID int=0
)
AS
BEGIN
	Select c.CityID,c.CityName as 'City Name'  from City c
	WHERE
	c.StateID Like CASE WHEN @StateID <> 0 THEN @StateID ELSE Convert(nvarchar(50),c.StateID) END
	AND IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[SaveState_USP]    Script Date: 09/24/2015 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 15 Sept 2015
-- Description:	Save State
-- =============================================
CREATE PROCEDURE [dbo].[SaveState_USP] --0,'Maharashtra',1,1,1
(
@StateID	int,
@StateName	nvarchar(50),
@CountryID	int,
@UpdatedByUserID	int,
@IsActive	bit
)
AS
DECLARE @msg nvarchar(max)=null
BEGIN
SET @StateName = LTRIM(RTRIM(@StateName))

IF (@StateName<>'' or @StateName <> null)--Check Whether State name is not null or empty
	BEGIN
		IF(@CountryID <>0)
			BEGIN
				IF (@StateID=0)
					BEGIN
						IF NOT EXISTS (Select StateID from [State] where StateName=@StateName AND CountryID= @CountryID)--Check whether same name state available in same country
							BEGIN--Save State
								Insert Into State (StateName,CountryID,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate,IsActive)
								Values(@StateName,@CountryID,@UpdatedByUserID,@UpdatedByUserID,convert(datetime,getdate(),103),convert(datetime,getdate(),103),@IsActive)
								set @Msg = (SELECT [Message] from Message where MessageID = 7)
								SELECT @Msg
							END
						ELSE
							BEGIN--Message same name state available in same country
							set @Msg = (SELECT [Message] from Message where MessageID = 6)
							SELECT @Msg								
							END
					END
					ELSE
						BEGIN
						IF NOT EXISTS (Select StateID from [State] where StateName=@StateName AND CountryID= @CountryID)--Check whether same name state available in same country
							BEGIN--Update State
								UPDATE [State] set StateName=@StateName,CountryID=@CountryID,UpdatedByUserID=@UpdatedByUserID,UpdatedDate=convert(datetime,getdate(),103)
								WHERE StateID=@StateID
								set @Msg = (SELECT [Message] from Message where MessageID = 8)
								SELECT @Msg
							END
						ELSE
							BEGIN--Message same name state available in same country
								set @Msg = (SELECT [Message] from Message where MessageID = 6)
							SELECT @Msg	
							END
						END
						
			END
		ELSE
			BEGIN
				set @Msg = (SELECT [Message] from Message where MessageID = 5)
				SELECT @Msg
			END
	END
ELSE
	BEGIN
		set @Msg = (SELECT [Message] from Message where MessageID = 4)
		SELECT @Msg
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SaveMedicalShop_USP]    Script Date: 09/24/2015 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 22 sept 2015
-- Description:	Save Medical Shop
-- =============================================
CREATE PROCEDURE [dbo].[SaveMedicalShop_USP] --0,'PriTesh Sortee','9028905504',1,'Old Jalna','PriTesh Medico',1,9000,1,1
(
@MedicalShopID	int,
@OwnerName	nvarchar(Max),
@ContactNo	nvarchar(MAX),
@CityID	int,
@Area	nvarchar(MAX),
@ShopName	nvarchar(MAX),
@ShopTypeID	int,
@OpeningBalance	decimal(18,2),
@UpdatedByUserID	int,
@IsActive	bit,
@Address nvarchar(MAX)
)
AS
DECLARE @msg nvarchar(50)
BEGIN
	SET @ShopName=LTRIM(RTRIM(@ShopName))
	SET @ContactNo=LTRIM(RTRIM(@ContactNo))
	SET @Area =LTRIM(RTRIM(@Area))
	SET @OwnerName=LTRIM(RTRIM(@OwnerName))
	SET @OpeningBalance=LTRIM(RTRIM(@OpeningBalance))
	
	IF (@ShopName<>'' OR @ShopName<>NULL)--Check is shop name empty or null
		BEGIN
			IF (@OwnerName<>'' OR @OwnerName<>Null)--Check is Owner name empty or null
				BEGIN
					IF(@MedicalShopID=0)--ENTER New Show Or Update
						BEGIN--Enter New Shop
							INSERT INTO MedicalShop (OwnerName,ContactNo,CityID,Area,ShopName,ShopTypeID,OpeningBalance,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate,IsActive,[Address])
							VALUES(@OwnerName,@ContactNo,@CityID,@Area,@ShopName,@ShopTypeID,@OpeningBalance,@UpdatedByUserID,@UpdatedByUserID,CONVERT(datetime,GETDATE(),103),CONVERT(datetime,GETDATE(),103),@IsActive,@Address)
							IF(@@rowcount=1)--Check whether row affected or not
								BEGIN--if row affected 14
									SET @msg = (SELECT [Message] FROM [Message] WHERE MessageID=14)
									SELECT @msg
								END
							ELSE
								BEGIN--If row not Affected 16
									SET @msg=(SELECT [Message] FROM [Message] WHERE MessageID=16)
									SELECT @msg
								END
						END
					ELSE
						BEGIN--Update Exsisting Shop
							UPDATE MedicalShop set OwnerName=@OwnerName,ContactNo=@ContactNo,CityID=@CityID,Area=@Area,ShopName=@ShopName,ShopTypeID=@ShopTypeID,UpdatedByUserID=@UpdatedByUserID,UpdatedDate=CONVERT(DATETIME,GETDATE(),103),IsActive=@IsActive,[Address]=@Address
							WHERE MedicalShopID=@MedicalShopID
							IF(@@rowcount=1)--Check whether row affected or not
								BEGIN--Update Sucessfully
									SET @msg = (SELECT [Message] FROM [Message] WHERE MessageID=15)
									SELECT @msg
								END
							ELSE
								BEGIN
									SET @msg=(SELECT [Message] FROM [Message] WHERE MessageID=17)
									SELECT @msg
								END
						END
				END
			ELSE--messge if shop name Empty Message no 13
				BEGIN
					SET @msg =(select [Message] from [Message] where MessageID=13)
					SELECT @msg
				END 
		END
	ELSE--messge if shop name Empty Message no 12
		BEGIN
			SET @msg =(select [Message] from [Message] where MessageID=12)
			SELECT @msg
		END

END
GO
/****** Object:  UserDefinedFunction [dbo].[ufunCheckUserName]    Script Date: 09/24/2015 16:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create FUNCTION [dbo].[ufunCheckUserName](@LoginName nvarchar(50))
RETURNS nvarchar(50)
AS 

BEGIN
    DECLARE @ret nvarchar(50);
    --DECLARE @return nvarchar;
    SELECT @ret = UserID
    FROM [User]
    WHERE LoginName = @LoginName 
        
     IF (@ret IS NULL) 
        SET @ret = 'User Login Name is Available';
     ELSE
       SET @ret ='User Login Name is Not Available';   
    RETURN @ret;
END;
GO
/****** Object:  StoredProcedure [dbo].[SaveUser_USP]    Script Date: 09/24/2015 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 23 Sept 2015
-- Description:	Save User
-- =============================================
CREATE PROCEDURE [dbo].[SaveUser_USP] 
(
@UserID	int,
@UserName	nvarchar(MAX),
@LoginName	nvarchar(MAX),
@Password	nvarchar(MAX),
@ContactNo	nvarchar(MAX),
@Address	nvarchar(MAX),
@WarehouseID	int,
@EmailAddress	nvarchar(MAX),
@UserTypeID	int,
@UpdatedByUserID	int,
@IsActive	bit,
@CityID	int,
@Area nvarchar(MAX)

)
AS
DECLARE @msg nvarchar(max)
BEGIN
SET @UserName=LTRIM(RTRIM(@UserName))
SET @LoginName=LTRIM(RTRIM(@LoginName))
SET @Password=LTRIM(RTRIM(@Password))
SET @ContactNo=LTRIM(RTRIM(@ContactNo))
SET @Address=LTRIM(RTRIM(@Address))
SET @EmailAddress=LTRIM(RTRIm(@EmailAddress))

IF (@UserID=0)--Check for New Entry
BEGIN--New Entry
	INSERT INTO [User] (UserName,LoginName,[Password],ContactNo,[Address],WarehouseID,EmailAddress,UserTypeID,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate,IsActive,CityID,Area)
	VALUES(@UserName,@LoginName,@Password,@ContactNo,@Address,@WarehouseID,@EmailAddress,@UserTypeID,@UpdatedByUserID,@UpdatedByUserID,CONVERT(DATETIME,GETDATE(),103),CONVERT(DATETIME,GETDATE(),103),@IsActive,@CityID,@Area)

	IF(@@ROWCOUNT=1)
		BEGIN
			SET @msg='User Created Sucessfully...!!!'
			Select @msg
		END
	ELSE
		BEGIN
			SET @msg='Error To Create User'
			Select @msg
		END	
END
ELSE
BEGIN--Update Entry
	UPDATE [User] SET  	UserName=@UserName,ContactNo=@ContactNo,[Address]=@Address,WarehouseID=@WarehouseID,EmailAddress=@EmailAddress,UserTypeID=@UserTypeID,UpdatedByUserID=@UpdatedByUserID,UpdatedDate=CONVERT(DATETIME,GETDATE(),103),IsActive=IsActive,CityID=@CityID,Area=@Area
	WHERE UserID=@UserID
	IF(@@ROWCOUNT=1)
		BEGIN
			SET @msg='User Update Sucessfully...!!!'
			Select @msg
		END
	ELSE
		BEGIN
			SET @msg='Error To Update User'
			Select @msg
		END	
END


END
GO
/****** Object:  StoredProcedure [dbo].[GetMedicalShopOnShopType_USP]    Script Date: 09/24/2015 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 24 Sept 2015
-- Description:	get medical shop detail on shoptype and shop id
-- =============================================
CREATE PROCEDURE [dbo].[GetMedicalShopOnShopType_USP] --2,2
(
@MedicalShopID int,
@ShopTypeID int
)
AS
BEGIN

SELECT med.MedicalShopID,med.OwnerName,med.ContactNo,med.Area,med.ShopName,med.ShopTypeID,shType.ShopTypeName,med.OpeningBalance,med.CityID,ct.CityName
	from MedicalShop med
	INNER JOIN City ct
	ON ct.CityID=med.CityID
	INNER JOIN ShopType shtype
	ON shtype.ShopTypeID=med.ShopTypeID
	WHERE med.MedicalShopID LIKE CASE WHEN @MedicalShopID<>0 THEN @MedicalShopID ELSE CONVERT (nvarchar(50),med.MedicalShopID)END
	AND med.ShopTypeID LIKE CASE WHEN @ShopTypeID<>0 THEN @ShopTypeID ELSE CONVERT(nvarchar(50),med.ShopTypeID) END
	AND med.IsActive=1
	order by med.ShopName asc
END
GO
/****** Object:  StoredProcedure [dbo].[GetMedicalShop_USP]    Script Date: 09/24/2015 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 24Sept 2015
-- Description:	get medical shop Detail on medical shop id for form binding
-- =============================================
create PROCEDURE [dbo].[GetMedicalShop_USP] 
(
@MedicalShopID int
)
AS
BEGIN
	SELECT med.MedicalShopID,med.OwnerName,med.ContactNo,med.Area,med.ShopName,med.ShopTypeID,med.OpeningBalance,med.CityID,
	st.StateID,cou.CountryID
	from MedicalShop med
	INNER JOIN City ct
	ON ct.CityID=med.CityID
	INNER JOIN [State] st
	ON st.StateID=ct.StateID
	INNER JOIN Country cou
	ON cou.CountryID=st.CountryID
	WHERE med.MedicalShopID LIKE CASE WHEN @MedicalShopID<>0 THEN @MedicalShopID ELSE CONVERT (nvarchar(50),med.MedicalShopID)END
END
GO
/****** Object:  StoredProcedure [dbo].[BindMedicalShopOnShopType_USP]    Script Date: 09/24/2015 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D.Sortee
-- Create date: 24 Sept 2015
-- Description:	get All Medicalshop for Bind Dropdown on ShopType
-- =============================================
CREATE PROCEDURE [dbo].[BindMedicalShopOnShopType_USP] --2
(
@ShopTypeID int
)
AS
BEGIN
SELECT MedicalShopID,ShopName FROM MedicalShop
	WHERE ShopTypeID LIKE CASE WHEN @ShopTypeID<>0 THEN @ShopTypeID ELSE CONVERT (nvarchar(50),ShopTypeID)END
	AND IsActive=1
	Order by  ShopName asc
END
GO
/****** Object:  StoredProcedure [dbo].[BindMedicalShop_USP]    Script Date: 09/24/2015 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 24 Sept 2015
-- Description:	get medical Shop ot bind drop down only Active
-- =============================================
CREATE PROCEDURE [dbo].[BindMedicalShop_USP] 
(
@MedicalShopID int
)
AS
BEGIN
	SELECT MedicalShopID,ShopName FROM MedicalShop
	WHERE MedicalShopID LIKE CASE WHEN @MedicalShopID<>0 THEN @MedicalShopID ELSE CONVERT (nvarchar(50),MedicalShopID)END
	AND IsActive=1
END
GO
/****** Object:  StoredProcedure [dbo].[CheckLoginName_USP]    Script Date: 09/24/2015 16:01:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 4July2015
-- Description:	Get Login Name form tbl Login
-- =============================================
CREATE PROCEDURE [dbo].[CheckLoginName_USP]
(	@LoginName nvarchar(50))
AS
BEGIN
	SET @LoginName=LTRIM(RTRIM(@LoginName))
	
	IF (@LoginName<>'' OR @LoginName <> NULL)
		BEGIN
			select [dbo].[ufunCheckUserName] (@LoginName) 
		END 
	ELSE
		BEGIN
			SELECT 'Please Enter Proper User Login Name'
		END
    
	
END
GO
/****** Object:  ForeignKey [FK_MedicalShop_City]    Script Date: 09/24/2015 16:01:39 ******/
ALTER TABLE [dbo].[MedicalShop]  WITH CHECK ADD  CONSTRAINT [FK_MedicalShop_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[MedicalShop] CHECK CONSTRAINT [FK_MedicalShop_City]
GO
/****** Object:  ForeignKey [FK_MedicalShop_ShopType]    Script Date: 09/24/2015 16:01:39 ******/
ALTER TABLE [dbo].[MedicalShop]  WITH CHECK ADD  CONSTRAINT [FK_MedicalShop_ShopType] FOREIGN KEY([ShopTypeID])
REFERENCES [dbo].[ShopType] ([ShopTypeID])
GO
ALTER TABLE [dbo].[MedicalShop] CHECK CONSTRAINT [FK_MedicalShop_ShopType]
GO
/****** Object:  ForeignKey [FK_User_City]    Script Date: 09/24/2015 16:01:39 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_City]
GO
/****** Object:  ForeignKey [FK_User_UserType]    Script Date: 09/24/2015 16:01:39 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserType] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserType] ([UserTypeID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserType]
GO
/****** Object:  ForeignKey [FK_User_Warehouse]    Script Date: 09/24/2015 16:01:39 ******/
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Warehouse] FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[Warehouse] ([WarehouseID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Warehouse]
GO
