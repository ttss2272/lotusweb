USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[CommissionDetail]    Script Date: 09/25/2015 19:53:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommissionDetail](
	[CommissionDetailID] [int] IDENTITY(1,1) NOT NULL,
	[CommissionID] [int] NULL,
	[DoctorName] [int] NULL,
	[CommissionPer] [decimal](18, 2) NULL,
	[CommissionAmount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_CommissionDetail] PRIMARY KEY CLUSTERED 
(
	[CommissionDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
