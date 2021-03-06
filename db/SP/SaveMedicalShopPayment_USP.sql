/****** Object:  StoredProcedure [dbo].[SaveMedicalShopPayment_USP]    Script Date: 10/10/2015 15:04:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SaveMedicalShopPayment_USP] 	
(
	@SaleTransactionID int,
	@PaidAmount decimal(18,2),
	@AmountPaidDate nvarchar(50),
	@UpdatedByUserID int,
	@MedicalPaymentNo nvarchar(MAX),
	@BalanceAmount decimal(18,2),
	@Comment nvarchar(MAX)
)
AS
DECLARE @TransactionTotal float= 0
DECLARE @msg nvarchar(50)

DECLARE @Output nvarchar(50)
DECLARE @no nvarchar(50)
--DECLARE @BalanceAmount float=0
BEGIN
--if(@SaleTransactionID<>'')
 -- Begin
 
 set @no= (select COUNT(*)from MedicalPayment)
	
	set @no=@no+1
	
	set @Output='Med Pay 00'+@no
	SET @MedicalPaymentNo =@Output
	
	insert into MedicalPayment (SaleTransactionID,PaidAmount,AmountPaidDate,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate, MedicalPaymentNo,Comment)
				values (@SaleTransactionID,@PaidAmount,convert(date,@AmountPaidDate,103),@UpdatedByUserID,@UpdatedByUserID,convert(datetime,GETDATE()),convert(datetime,GETDATE()),@MedicalPaymentNo,@Comment)
	         --  BEGIN--if row affected 14
			---		SET @msg = (SELECT [Message] FROM [Message] WHERE MessageID=23)
			--		SELECT @msg
			--	END			
			set	@TransactionTotal=( select BalanceAmount from SaleTransaction where SaleTransactionID=@SaleTransactionID)
			--set @BalanceAmount = @TransactionTotal-@PaidAmount
				exec UpdateBalanceAmount_USP 0,@BalanceAmount,@SaleTransactionID,@UpdatedByUserID
				
				IF(@@ROWCOUNT<>0)
					BEGIN
						SET @msg= (SELECT [Message] FROM [Message] WHERE MessageID=48)--'Medical Payment Save Sucessfully...!!!'
						Select @msg
					END
				ELSE
					BEGIN
						SET @msg= (SELECT [Message] FROM [Message] WHERE MessageID=49)--'Medical Payment not Saved.'
						Select @msg
					END
END
