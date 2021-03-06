USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[Temp_Purchase]    Script Date: 10/10/2015 12:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Purchase](
	[TempID] [int] NULL,
	[ProductID] [int] NULL,
	[PurchaseRate] [decimal](18, 2) NULL,
	[SaleRate] [decimal](18, 2) NULL,
	[Quantity] [decimal](18, 2) NULL,
	[BatchNo] [nvarchar](max) NULL,
	[ExpiryDate] [date] NULL,
	[PurchaseTransactionID] [int] NULL
) ON [PRIMARY]
GO
