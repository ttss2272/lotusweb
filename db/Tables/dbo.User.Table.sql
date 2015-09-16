USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[User]    Script Date: 09/16/2015 12:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[LoginName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[ContactNo] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[WarehouseID] [int] NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[UserTypeID] [int] NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
