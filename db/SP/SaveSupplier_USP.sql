USE [MedicalShop_DB_Web]
GO
/****** Object:  StoredProcedure [dbo].[SaveDoctorDetails_USP]    Script Date: 09/25/2015 10:28:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Sameer Shinde
-- Create date: 25 sept 2015
-- Description:	Save Supplier Details
-- =============================================
Create PROCEDURE [dbo].[SaveSupplier_USP] --1,'Mangesh Shinde','MBBS','17/05/1975',2,'Pune','Pune','9876543214',9000,1,1
(
@SupplierID int,
@CompanyName	nvarchar(Max),
@ModeOfTransport	nvarchar(MAX),
@PriceType nvarchar(MAX),
@Address	nvarchar(MAX),
@ContactPerson nvarchar(MAX),
@ContactNo	nvarchar(MAX),
@CityID	int,
@Area	nvarchar(MAX),
@UpdatedByUserID	int,
@IsActive	bit
)
AS
DECLARE @msg nvarchar(50)
BEGIN
	SET @CompanyName=LTRIM(RTRIM(@CompanyName))
	SET @ContactNo=LTRIM(RTRIM(@ContactNo))
	SET @Area =LTRIM(RTRIM(@Area))
	SET @ContactPerson=LTRIM(RTRIM(@ContactPerson))
	
	
	IF (@CompanyName<>'' OR @CompanyName<>NULL)--Check is shop name empty or null
		BEGIN
		IF (@ContactPerson<>'' OR @ContactPerson<>NULL)--Check is shop name empty or null
		BEGIN
			IF(@SupplierID=0)--ENTER New Show Or Update
						BEGIN--Enter New Shop
							INSERT INTO Supplier (CompanyName,ModeOfTransport,PriceType,[Address],ContactPerson,ContactNo,CityID,Area,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate,IsActive)
							VALUES(@CompanyName,@ModeOfTransport,@PriceType,@Address,@ContactPerson,@ContactNo,@CityID,@Area,@UpdatedByUserID,@UpdatedByUserID,CONVERT(datetime,GETDATE(),103),CONVERT(datetime,GETDATE(),103),@IsActive)
							IF(@@rowcount=1)--Check whether row affected or not
								BEGIN--if row affected 14
									SET @msg = (SELECT [Message] FROM [Message] WHERE MessageID=29)
									SELECT @msg
								END
							ELSE
								BEGIN--If row not Affected 16
									SET @msg=(SELECT [Message] FROM [Message] WHERE MessageID=28)
									SELECT @msg
								END
						END
					ELSE
						BEGIN--Update Exsisting Shop
							UPDATE Supplier set CompanyName=@CompanyName,ModeOfTransport=@ModeOfTransport,PriceType=@PriceType,[Address]=@Address,ContactPerson=@ContactPerson,ContactNo=@ContactNo,CityID=@CityID,Area=@Area,UpdatedByUserID=@UpdatedByUserID,UpdatedDate=CONVERT(DATETIME,GETDATE())
							WHERE SupplierID=@SupplierID
							IF(@@rowcount=1)--Check whether row affected or not
								BEGIN--Update Sucessfully
									SET @msg = (SELECT [Message] FROM [Message] WHERE MessageID=27)
									SELECT @msg
								END
							ELSE
								BEGIN
									SET @msg=(SELECT [Message] FROM [Message] WHERE MessageID=26)
									SELECT @msg
								END
						END
				END
			ELSE--messge if shop name Empty Message no 13
				BEGIN
					SET @msg =(select [Message] from [Message] where MessageID=25)
					SELECT @msg
				END 
		END
	ELSE --messge if shop name Empty Message no 12
		BEGIN
			SET @msg =(select [Message] from [Message] where MessageID=24)
			SELECT @msg
		END

END

