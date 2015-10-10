USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[Temp_Sale]    Script Date: 10/10/2015 12:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Sale](
	[TempSaleID] [int] NULL,
	[SaleTransactionID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [decimal](18, 2) NULL,
	[SalePrice] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
