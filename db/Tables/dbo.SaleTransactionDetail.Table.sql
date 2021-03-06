USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[SaleTransactionDetail]    Script Date: 10/10/2015 12:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleTransactionDetail](
	[SaleTransactionDetailID] [int] IDENTITY(1,1) NOT NULL,
	[SaleTransactionID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [decimal](18, 2) NULL,
	[SellingPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_SaleTransactionDetail] PRIMARY KEY CLUSTERED 
(
	[SaleTransactionDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
