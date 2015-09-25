USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[SalesReturnDetail]    Script Date: 09/25/2015 19:53:35 ******/
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
