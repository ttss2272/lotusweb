USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[DoctorPayment]    Script Date: 09/16/2015 12:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorPayment](
	[DoctorPaymentID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NULL,
	[ReceiptNo] [nvarchar](max) NULL,
	[PaidAmountDate] [date] NULL,
	[PaymentAmount] [decimal](18, 2) NULL,
	[Comment] [nvarchar](max) NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
 CONSTRAINT [PK_DoctorPayment] PRIMARY KEY CLUSTERED 
(
	[DoctorPaymentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
