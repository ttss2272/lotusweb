USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[ShopType]    Script Date: 10/10/2015 12:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopType](
	[ShopTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ShopTypeName] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_ShopType] PRIMARY KEY CLUSTERED 
(
	[ShopTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
