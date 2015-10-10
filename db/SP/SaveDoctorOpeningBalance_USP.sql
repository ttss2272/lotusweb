-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D .Sortee
-- Create date: 10 OCT 2015
-- Description:	Save Doctor Opening Balnce in  Doctor payment
-- =============================================
CREATE PROCEDURE SaveDoctorOpeningBalance_USP 
	(
	@DoctorID int,
	@OpeningBalance decimal(18,2),
	@UpdatedByUserID int
	)
AS
DECLARE @DoctorPaymentID int
DECLARE @OpeningBalanceRecieptNo nvarchar(50)

DECLARE @No nvarchar(50)
DECLARE @NewDate nvarchar(50)
BEGIN
	
	set @no= (CONVERT(NVARCHAR(50),@DoctorID))	
	      
			  --set @no=@no+1
			  
			  set @OpeningBalanceRecieptNo= 'Doc OPBal00'+@no
			  
			  set @NewDate = Convert(nvarchar(50),getdate(),103)
			  
			 
			  INSERT INTO DoctorPayment (DoctorID,ReceiptNo,PaidAmountDate,PaymentAmount,CreatedDate,UpdatedDate,CreatedByUserID,UpdatedByUserID)
			     VALUES(@DoctorID,@OpeningBalanceRecieptNo,CONVERT(DATE,GETDATE(),103),@OpeningBalance,CONVERT(DATETIME,GETDATE(),103),CONVERT(DATETIME,GETDATE(),103),@UpdatedByUserID,@UpdatedByUserID)
			  
			  	
END
GO
