USE [MedicalShop_DB_Web]
GO
/****** Object:  StoredProcedure [dbo].[SaveProducts_USP]    Script Date: 09/25/2015 13:21:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Sameer Shinde
-- Create date: 25 sept 2015
-- Description:	Save Products
-- =============================================
Create PROCEDURE [dbo].[SaveProducts_USP] 
(
@ProductID int,
@ProductName	nvarchar(Max),
@ProductCode	nvarchar(MAX),
@SallingPrice nvarchar(MAX),
@ProductTypeID	int,
@PurchasePrice	nvarchar(MAX),
@UpdatedByUserID	int,
@IsActive	bit
)
AS
DECLARE @msg nvarchar(50)
BEGIN
	SET @ProductName=LTRIM(RTRIM(@ProductName))
	SET @PurchasePrice=LTRIM(RTRIM(@PurchasePrice))
	SET @SallingPrice =LTRIM(RTRIM(@SallingPrice))
	SET @ProductCode=LTRIM(RTRIM(@ProductCode))
	
	
	IF (@ProductName<>'' OR @ProductName<>NULL)--Check is shop name empty or null
		BEGIN
		IF (@ProductTypeID<>'' OR @ProductTypeID<>NULL)--Check is shop name empty or null
		BEGIN
			IF(@ProductID=0)--ENTER New Show Or Update
						BEGIN--Enter New Shop
							INSERT INTO Product(ProductName,ProductCode,SallingPrice,ProductTypeID,PurchasePrice,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate,IsActive)
							VALUES(@ProductName,@ProductCode,@SallingPrice,@ProductTypeID,@PurchasePrice,@UpdatedByUserID,@UpdatedByUserID,CONVERT(datetime,GETDATE(),103),CONVERT(datetime,GETDATE(),103),@IsActive)
							IF(@@rowcount=1)--Check whether row affected or not
								BEGIN--if row affected 14
									SET @msg = (SELECT [Message] FROM [Message] WHERE MessageID=35)
									SELECT @msg
								END
							ELSE
								BEGIN--If row not Affected 16
									SET @msg=(SELECT [Message] FROM [Message] WHERE MessageID=34)
									SELECT @msg
								END
						END
					ELSE
						BEGIN--Update Exsisting Shop
							UPDATE Product set ProductName=@ProductName,ProductCode=@ProductCode,ProductTypeID=@ProductTypeID,PurchasePrice=@PurchasePrice,UpdatedByUserID=@UpdatedByUserID,UpdatedDate=CONVERT(DATETIME,GETDATE())
							WHERE ProductID=@ProductID
							IF(@@rowcount=1)--Check whether row affected or not
								BEGIN--Update Sucessfully
									SET @msg = (SELECT [Message] FROM [Message] WHERE MessageID=33)
									SELECT @msg
								END
							ELSE
								BEGIN
									SET @msg=(SELECT [Message] FROM [Message] WHERE MessageID=32)
									SELECT @msg
								END
						END
				END
			ELSE--messge if shop name Empty Message no 13
				BEGIN
					SET @msg =(select [Message] from [Message] where MessageID=31)
					SELECT @msg
				END 
		END
	ELSE --messge if shop name Empty Message no 12
		BEGIN
			SET @msg =(select [Message] from [Message] where MessageID=30)
			SELECT @msg
		END

END

