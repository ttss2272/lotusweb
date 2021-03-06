USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 10/10/2015 12:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[DoctorID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorName] [nvarchar](max) NULL,
	[Specialization] [nvarchar](max) NULL,
	[DOB] [date] NULL,
	[CityID] [int] NULL,
	[Area] [nvarchar](50) NULL,
	[MobileNo] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[OpeningBalance] [decimal](18, 2) NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
