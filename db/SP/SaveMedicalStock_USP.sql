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
-- Author:		PriTesh D. Sortee
-- Create date: 25 Sept 2015
-- Description:	save or update medical stock of product
-- =============================================
CREATE PROCEDURE SaveMedicalStock_USP
(
@MedicalStockID int,
@DateOfStock nvarchar(50),
@CurrentStock decimal(18,2),
@MedicalShopID int,
@ProductID int,
@UpdatedByUserID int
)
AS
declare @temp int
DECLARE @msg nvarchar(50)
DECLARE @tmpMedStockID int
BEGIN
	if not exists (select MedicalStockID from MedicalStock where MedicalShopID=@MedicalShopID and ProductID=@ProductID)
	BEGIN
		insert into MedicalProduct (MedicalShopID,ProductID,Stock,StockEntryDate,CreatedDate,UpdatedDate,CreatedByUserID,UpdatedByUserID)
		         values(@MedicalShopID,@ProductID,@CurrentStock,CONVERT(date,@DateOfStock,103),convert(DATETIME,GETDATE()),CONVERT(DATETIME,GETDATE()),@UpdatedByUserID,@UpdatedByUserID)
		       IF (@@ROWCOUNT =1)
		       BEGIN
					set @temp = (select MAX (MedicalStockID) from MedicalProduct)
					 insert  into MedicalStockLog (MedicalStockID,StockEntryDate,Stock,CreatedDate,EntryDescription,UpdatedByUserID)
					  values (@temp,convert(date,@DateOfStock,103),@CurrentStock,CONVERT(date,getdate()),'Stock Entry',@UpdatedByUserID)
					  IF(@@ROWCOUNT=1)
						BEGIN
							SET @msg='Medical Stock Inserted SucessFully...!!!'
							SELECT @msg
						END
					  ELSE
						BEGIN
							SET @msg='Log Not Updated'
							SELECT @msg
						END
	           END
	           ELSE
	             BEGIN
					SET @msg='Error To Save Stock'
					Select @Msg
	             END
	END
  else
BEGIN
SET @tmpMedStockID=(select MedicalStockID from MedicalStock where MedicalShopID=@MedicalShopID and ProductID=@ProductID)
   
   
	update MedicalProduct set Stock=@CurrentStock,StockEntryDate=convert(DATE,@DateOfStock,103),UpdatedByUserID=@UpdatedByUserID,UpdatedDate=(CONVERT (date,GETDATE(),103)) 
	where MedicalStockID=@tmpMedStockID
	IF (@@ROWCOUNT =1)
		       BEGIN
					
					 insert  into MedicalStockLog (MedicalStockID,StockEntryDate,Stock,CreatedDate,EntryDescription,UpdatedByUserID)
					  values (@tmpMedStockID,convert(date,@DateOfStock,103),@CurrentStock,CONVERT(date,getdate()),'Stock Entry',@UpdatedByUserID)
					  IF(@@ROWCOUNT=1)
						BEGIN
							SET @msg='Medical Stock Update SucessFully...!!!'
							SELECT @msg
						END
					  ELSE
						BEGIN
							SET @msg='Log Not Updated'
							SELECT @msg
						END
	           END
	           ELSE
	             BEGIN
					 SET @msg='Error To Update Stock'
					Select @Msg
	             END
	
	END
END
GO
