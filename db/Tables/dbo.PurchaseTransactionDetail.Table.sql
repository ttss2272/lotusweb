USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[PurchaseTransactionDetail]    Script Date: 10/10/2015 12:02:57 ******/
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
) ON [PRIMARY]
GO
