USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[DMPLinking]    Script Date: 10/10/2015 12:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMPLinking](
	[DMPID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NULL,
	[MedicalShopID] [int] NULL,
	[ProductID] [int] NULL,
	[PriceTypeID] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_DMPLinking] PRIMARY KEY CLUSTERED 
(
	[DMPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
