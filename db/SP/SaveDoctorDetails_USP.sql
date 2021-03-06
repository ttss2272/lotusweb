/****** Object:  StoredProcedure [dbo].[SaveDoctorDetails_USP]    Script Date: 10/10/2015 11:48:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Sameer Shinde
-- Create date: 23 sept 2015
-- Description:	Save DoctorDetails Shop
-- =============================================
ALTER PROCEDURE [dbo].[SaveDoctorDetails_USP] --15,'AMAY','nnn','17/05/1975',2,'Pune','Pune','9876543214',9000,1,1
(
@DoctorID int,
@DoctorName	nvarchar(Max),
@Specialization	nvarchar(MAX),
@DOB nvarchar(MAX),
@CityID	int,
@Area	nvarchar(MAX),
@Address	nvarchar(MAX),
@MobileNo	nvarchar(MAX),
@OpeningBalance	decimal(18,2),
@UpdatedByUserID	int,
@IsActive	bit
)
AS
DECLARE @msg nvarchar(50)
DECLARE @MaxDocID int
BEGIN
	SET @DoctorName=LTRIM(RTRIM(@DoctorName))
	SET @MobileNo=LTRIM(RTRIM(@MobileNo))
	SET @Area =LTRIM(RTRIM(@Area))
	SET @DOB=LTRIM(RTRIM(@DOB))
	SET @OpeningBalance=LTRIM(RTRIM(@OpeningBalance))
	
	IF (@DoctorName<>'' OR @DoctorName<>NULL)--Check is Doctor name empty or null
		BEGIN
		IF (@Specialization<>'' OR @Specialization<>NULL)--Check is spliz empty or null
		BEGIN
			IF(@DoctorID=0)--ENTER New Doctor Or Update
						BEGIN--Enter New Doctor Entry
						  If NOT EXISTS(Select * from Doctor where DoctorName=@DoctorName)
						  Begin
							INSERT INTO Doctor (DoctorName,Specialization,DOB,CityID,Area,MobileNo,[Address],OpeningBalance,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate,IsActive)
							VALUES(@DoctorName,@Specialization,convert(date,@DOB,103),@CityID,@Area,@MobileNo,@Address,@OpeningBalance,@UpdatedByUserID,@UpdatedByUserID,CONVERT(datetime,GETDATE(),103),CONVERT(datetime,GETDATE(),103),@IsActive)
							
							IF(@@rowcount=1)--Check whether row affected or not
								BEGIN--if row affected 14
								  
								  SET @MaxDocID =(SELECT MAX(DoctorID)FROM Doctor)
								  EXEC SaveDoctorOpeningBalance_USP @MaxDocID,@OpeningBalance,@UpdatedByUserID
								  
									SET @msg = (SELECT [Message] FROM [Message] WHERE MessageID=23)
									SELECT @msg
								END
							ELSE
								BEGIN--If row not Affected 16
									SET @msg=(SELECT [Message] FROM [Message] WHERE MessageID=22)
									SELECT @msg
								END
						END
					ELSE -------------------Record Already Exisits
				BEGIN
				SET @msg =(select [Message] from [Message] where MessageID=41)
					SELECT @msg
				END 
				End
					ELSE
					
						BEGIN--Update Exsisting Doctor Details
							If NOT EXISTS(Select * from Doctor where DoctorName=@DoctorName)
						  Begin
							UPDATE Doctor set DoctorName=@DoctorName,Specialization=@Specialization,DOB=convert(date,@DOB,103),CityID=@CityID,Area=@Area,[Address]=@Address,MobileNo=@MobileNo,UpdatedByUserID=@UpdatedByUserID,UpdatedDate=CONVERT(DATETIME,GETDATE())
							WHERE DoctorID=@DoctorID
							IF(@@rowcount=1)--Check whether row affected or not
								BEGIN--Update Sucessfully
									SET @msg = (SELECT [Message] FROM [Message] WHERE MessageID=21)
									SELECT @msg
								END
							ELSE
								BEGIN
									SET @msg=(SELECT [Message] FROM [Message] WHERE MessageID=20)
									SELECT @msg
								END
							
						END
						ELSE ----Record Already Exisits When Record Updating
				BEGIN
				SET @msg =(select [Message] from [Message] where MessageID=41)
					SELECT @msg
				END 
				End
				End				
			
			ELSE--messge if Doctor name Empty Message no 19
				BEGIN
					SET @msg =(select [Message] from [Message] where MessageID=19)
					SELECT @msg
				END 
		END
		
	ELSE --messge if spliz Empty Message no 12
		BEGIN
			SET @msg =(select [Message] from [Message] where MessageID=18)
			SELECT @msg
		END

END

