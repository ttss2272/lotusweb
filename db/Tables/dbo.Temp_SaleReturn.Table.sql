USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[Temp_SaleReturn]    Script Date: 10/10/2015 12:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_SaleReturn](
	[Temp_ReturnID] [int] NULL,
	[SalesReturnID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [decimal](18, 2) NULL,
	[Rate] [decimal](18, 2) NULL,
	[RemainingQuantity] [decimal](18, 2) NULL,
	[Reason] [nvarchar](max) NULL
) ON [PRIMARY]
GO
