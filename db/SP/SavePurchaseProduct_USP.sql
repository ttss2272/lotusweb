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
-- Create date: 29 Sept 2015
-- Description:	Save Purchase Product
-- =============================================
CREATE PROCEDURE SavePurchaseProduct_USP 
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
			VALUES(@SupplierID,@WarehouseID,convert(datetime,@PurchaseDate,103),@ModeOfPayment,@SupplierReciptNo,@UpdatedByUserID,@UpdatedByUserID,CONVERT(datetime,GETDATE(),103),CONVERT(datetime,GETDATE(),103),@IsActive)
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
GO
