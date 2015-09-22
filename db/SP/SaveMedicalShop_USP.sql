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
-- Create date: 22 sept 2015
-- Description:	Save Medical Shop
-- =============================================
ALTER PROCEDURE SaveMedicalShop_USP --0,'PriTesh Sortee','9028905504',1,'Old Jalna','PriTesh Medico',1,9000,1,1
(
@MedicalShopID	int,
@OwnerName	nvarchar(Max),
@ContactNo	nvarchar(MAX),
@CityID	int,
@Area	nvarchar(MAX),
@ShopName	nvarchar(MAX),
@ShopTypeID	int,
@OpeningBalance	decimal(18,2),
@UpdatedByUserID	int,
@IsActive	bit
)
AS
DECLARE @msg nvarchar(50)
BEGIN
	SET @ShopName=LTRIM(RTRIM(@ShopName))
	SET @ContactNo=LTRIM(RTRIM(@ContactNo))
	SET @Area =LTRIM(RTRIM(@Area))
	SET @OwnerName=LTRIM(RTRIM(@OwnerName))
	SET @OpeningBalance=LTRIM(RTRIM(@OpeningBalance))
	
	IF (@ShopName<>'' OR @ShopName<>NULL)--Check is shop name empty or null
		BEGIN
			IF (@OwnerName<>'' OR @OwnerName<>Null)--Check is Owner name empty or null
				BEGIN
					IF(@MedicalShopID=0)--ENTER New Show Or Update
						BEGIN--Enter New Shop
							INSERT INTO MedicalShop (OwnerName,ContactNo,CityID,Area,ShopName,ShopTypeID,OpeningBalance,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate,IsActive)
							VALUES(@OwnerName,@ContactNo,@CityID,@Area,@ShopName,@ShopTypeID,@OpeningBalance,@UpdatedByUserID,@UpdatedByUserID,CONVERT(datetime,GETDATE()),CONVERT(datetime,GETDATE()),@IsActive)
							IF(@@rowcount=1)--Check whether row affected or not
								BEGIN--if row affected 14
									SET @msg = (SELECT [Message] FROM [Message] WHERE MessageID=14)
									SELECT @msg
								END
							ELSE
								BEGIN--If row not Affected 16
									SET @msg=(SELECT [Message] FROM [Message] WHERE MessageID=16)
									SELECT @msg
								END
						END
					ELSE
						BEGIN--Update Exsisting Shop
							UPDATE MedicalShop set OwnerName=@OwnerName,ContactNo=@ContactNo,CityID=@CityID,Area=@Area,ShopName=@ShopName,ShopTypeID=@ShopTypeID,UpdatedByUserID=@UpdatedByUserID,UpdatedDate=CONVERT(DATETIME,GETDATE()),IsActive=@IsActive
							WHERE MedicalShopID=@MedicalShopID
							IF(@@rowcount=1)--Check whether row affected or not
								BEGIN--Update Sucessfully
									SET @msg = (SELECT [Message] FROM [Message] WHERE MessageID=15)
									SELECT @msg
								END
							ELSE
								BEGIN
									SET @msg=(SELECT [Message] FROM [Message] WHERE MessageID=17)
									SELECT @msg
								END
						END
				END
			ELSE--messge if shop name Empty Message no 13
				BEGIN
					SET @msg =(select [Message] from [Message] where MessageID=13)
					SELECT @msg
				END 
		END
	ELSE--messge if shop name Empty Message no 12
		BEGIN
			SET @msg =(select [Message] from [Message] where MessageID=12)
			SELECT @msg
		END

END
GO
