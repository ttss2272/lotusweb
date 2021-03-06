USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[PurchaseTransaction]    Script Date: 10/10/2015 12:02:57 ******/
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
	[OPBalID] [int] NULL,
	[PurID] [int] NULL,
 CONSTRAINT [PK_PurchaseTransaction] PRIMARY KEY CLUSTERED 
(
	[PurchaseTransactionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
