USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[Commission]    Script Date: 09/25/2015 19:53:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commission](
	[CommissionID] [int] IDENTITY(1,1) NOT NULL,
	[MedicalShopID] [int] NULL,
	[ProductID] [int] NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Commission] PRIMARY KEY CLUSTERED 
(
	[CommissionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
