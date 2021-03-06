USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[MedicalStockLog]    Script Date: 10/10/2015 12:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalStockLog](
	[MedicalStockLogID] [int] IDENTITY(1,1) NOT NULL,
	[MedicalStockID] [int] NULL,
	[Stock] [decimal](18, 2) NULL,
	[EntryDescription] [nvarchar](max) NULL,
	[UpdatedByUserID] [int] NULL,
	[StockEntryDate] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_MedicalStockLog] PRIMARY KEY CLUSTERED 
(
	[MedicalStockLogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
