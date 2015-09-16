USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[MedicalPayment]    Script Date: 09/16/2015 12:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalPayment](
	[MedicalPaymentID] [int] IDENTITY(1,1) NOT NULL,
	[SaleTransactionID] [int] NULL,
	[MedicalPaymentNo] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NULL,
	[PaidAmount] [decimal](18, 2) NULL,
	[AmountPaidDate] [date] NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_MedicalPayment] PRIMARY KEY CLUSTERED 
(
	[MedicalPaymentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
