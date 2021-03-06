USE [MedicalShop_DB_Web]
GO
/****** Object:  StoredProcedure [dbo].[SavePurchaseProduct_USP]    Script Date: 10/09/2015 10:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 29 Sept 2015
-- Description:	Save Purchase Product
-- =============================================
ALTER PROCEDURE [dbo].[SavePurchaseProduct_USP] 
(
@PurchaseTransactionID int,
@WarehouseID int,
@SupplierID int,
@PurchaseDate nvarchar(MAX),
@ModeOfPayment nvarchar(MAX),
@SupplierReciptNo nvarchar(MAX),
@UpdatedByUserID int,
@IsActive int

)
AS
DECLARE @msg nvarchar(MAX)
BEGIN
	IF (@PurchaseTransactionID=0)
		BEGIN
			INSERT INTO PurchaseTransaction (SupplierID,WarehouseID,PurchaseDate,ModeOfPayment,SupplierReciptNo,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate,IsActive)
			VALUES(@SupplierID,@WarehouseID,convert(date,@PurchaseDate,103),@ModeOfPayment,@SupplierReciptNo,@UpdatedByUserID,@UpdatedByUserID,CONVERT(datetime,GETDATE(),103),CONVERT(datetime,GETDATE(),103),@IsActive)
			IF (@@ROWCOUNT=1)
				BEGIN
					SET @msg= (SELECT MAX(PurchaseTransactionID)FROM PurchaseTransaction)
				END
			ELSE
				BEGIN
				    SET @msg='0'
				END
		END
	ELSE
		BEGIN
			UPDATE PurchaseTransaction SET SupplierID=@SupplierID,WarehouseID=@WarehouseID,PurchaseDate=convert(datetime,@PurchaseDate,103),ModeOfPayment=@ModeOfPayment,SupplierReciptNo=@SupplierReciptNo,UpdatedByUserID=@UpdatedByUserID,UpdatedDate=CONVERT(datetime,GETDATE(),103),IsActive=@IsActive
			WHERE PurchaseTransactionID=@PurchaseTransactionID
			
			IF (@@ROWCOUNT=1)
				BEGIN
					SET @msg=( SELECT PurchaseTransactionID FROM PurchaseTransaction WHERE PurchaseTransactionID=@PurchaseTransactionID)
				END
			ELSE
				BEGIN
				    SET @msg='0'
				END
		END
		
	SELECT @msg
END
