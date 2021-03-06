USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[SalesReturn]    Script Date: 10/10/2015 12:02:57 ******/
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
	[SaleRetID] [int] NULL,
 CONSTRAINT [PK_SalesReturn] PRIMARY KEY CLUSTERED 
(
	[SalesReturnID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
