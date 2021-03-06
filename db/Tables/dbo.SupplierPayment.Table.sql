USE [MedicalShop_DB_Web]
GO
/****** Object:  Table [dbo].[SupplierPayment]    Script Date: 10/10/2015 12:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierPayment](
	[SupplierPaymentID] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseTransactionID] [int] NULL,
	[PaidAmount] [decimal](18, 2) NULL,
	[AmountPaidDate] [date] NULL,
	[PaymentReceiptNo] [nvarchar](50) NULL,
	[BalaneAmount] [decimal](18, 2) NULL,
	[Comment] [nvarchar](max) NULL,
	[CreatedByUserID] [int] NULL,
	[UpdatedByUserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_SupplierPayment] PRIMARY KEY CLUSTERED 
(
	[SupplierPaymentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
