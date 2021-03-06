USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[DoctorPayment]    Script Date: 10/10/2015 12:02:57 ******/
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
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
 CONSTRAINT [PK_DoctorPayment] PRIMARY KEY CLUSTERED 
(
	[DoctorPaymentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
