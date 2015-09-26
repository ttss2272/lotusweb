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
-- Create date: 26 sept 2015
-- Description:	Save DMPLinking Details
-- =============================================
CREATE PROCEDURE SaveDMPLinking_USP 
	(
	@DMPID int,
	@DoctorID int,
	@MedicalShopID int,
	@ProductID int,
	@PriceTypeID int,
	@Price decimal(18,2),
	@UpdatedByUserID int,
	@IsActive int
	)
AS
DECLARE @msg nvarchar(MAX)
BEGIN
	
	IF (@DMPID=0)--Check For New Entry or Update Entry
		BEGIN--New Entry
			INSERT INTO DMPLinking (DoctorID,MedicalShopID,ProductID,PriceTypeID,Price,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate,IsActive)
			VALUES(@DoctorID,@MedicalShopID,@ProductID,@PriceTypeID,@Price,@UpdatedByUserID,@UpdatedByUserID,CONVERT(DATETIME,GETDATE(),103),CONVERT(DATETIME,GETDATE(),103),@ISActive)
			
			IF(@@ROWCOUNT=1)--CHECK whether Row InsertedOr NOt
				BEGIN--Row Effected
					SET @msg=(SELECT [Message] FROM [Message] WHERE MessageID=36) --'DMPLinking Created Sucessfully...!!!'
					SELECT @msg
				END
			ELSE
				BEGIN--Row Not Effected
					SET @msg=(SELECT [Message] FROM [Message] WHERE MessageID=37)--'Error To Create DMPLinking.'
					SELECT @msg
				END
		END
	ELSE
		BEGIN--Update Entry
			UPDATE DMPLinking SET DoctorID=@DoctorID,MedicalShopID=@MedicalShopID,ProductID=@ProductID,PriceTypeID=@PriceTypeID,Price=@Price,UpdatedByUserID=@UpdatedByUserID,UpdatedDate=CONVERT(DATETIME,GETDATE(),103)
			WHERE DMPID=@DMPID
			
			IF(@@ROWCOUNT=1)--CHEKC whether Row InsertedOr NOt
				BEGIN--Row Effected
					SET @msg=(SELECT [Message] FROM [Message] WHERE MessageID=38)--'DMPLinking Updated Sucessfully...!!!'
					SELECT @msg
				END
			ELSE
				BEGIN--Row Not Effected
					SET @msg=(SELECT [Message] FROM [Message] WHERE MessageID=39)--'Error To Update DMPLinking.'
					SELECT @msg
				END
		END
END
GO
