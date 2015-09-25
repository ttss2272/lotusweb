USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[MedicalStock]    Script Date: 09/25/2015 19:53:35 ******/
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
