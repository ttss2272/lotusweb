USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[MedicalShop]    Script Date: 10/10/2015 12:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalShop](
	[MedicalShopID] [int] IDENTITY(1,1) NOT NULL,
	[OwnerName] [nvarchar](max) NULL,
	[ContactNo] [nvarchar](50) NULL,
	[CityID] [int] NOT NULL,
	[Area] [nvarchar](50) NULL,
	[ShopName] [nvarchar](max) NULL,
	[ShopTypeID] [int] NOT NULL,
	[OpeningBalance] [decimal](18, 2) NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_MedicalShop] PRIMARY KEY CLUSTERED 
(
	[MedicalShopID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MedicalShop]  WITH CHECK ADD  CONSTRAINT [FK_MedicalShop_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[MedicalShop] CHECK CONSTRAINT [FK_MedicalShop_City]
GO
ALTER TABLE [dbo].[MedicalShop]  WITH CHECK ADD  CONSTRAINT [FK_MedicalShop_ShopType] FOREIGN KEY([ShopTypeID])
REFERENCES [dbo].[ShopType] ([ShopTypeID])
GO
ALTER TABLE [dbo].[MedicalShop] CHECK CONSTRAINT [FK_MedicalShop_ShopType]
GO
