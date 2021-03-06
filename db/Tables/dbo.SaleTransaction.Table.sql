USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[SaleTransaction]    Script Date: 10/10/2015 12:02:57 ******/
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
	[OPBalID] [int] NULL,
	[SaleID] [int] NULL,
 CONSTRAINT [PK_SaleTransaction] PRIMARY KEY CLUSTERED 
(
	[SaleTransactionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
