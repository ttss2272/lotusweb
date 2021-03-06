/****** Object:  StoredProcedure [dbo].[SaveCity_USP]    Script Date: 09/22/2015 12:51:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 15 Sept 2015
-- Description:	Save City
-- =============================================
ALTER PROCEDURE [dbo].[SaveCity_USP] 
(
@CityID int,
@CityName nvarchar(50),
@StateID int,
@UpdatedByUserID int,
@IsActive bit
)
AS
DECLARE @msg nvarchar(50)
BEGIN
SET @CityName= LTRIM(RTRIM(@CityName))

IF(@CityName<>'' OR @CityName<>Null)--Check City name is null or Empty
	BEGIN
		IF(@CityID=0)--Check New entry or Update entry
			BEGIN--Save City
				INSERT INTO City (CityName,StateID,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate,IsActive)
				VALUES (@CityName,@StateID,@UpdatedByUserID,@UpdatedByUserID,convert(datetime,getdate(),103),convert(datetime,getdate(),103),@IsActive)
				set @msg =(SELECT [Message] from [Message] Where MessageID=10)		
				Select @Msg
			END
		ELSE
			BEGIN--Update City INfo
				UPDATE City set CityName=@CityName,StateID=@StateID,UpdatedByUserID=@UpdatedByUserID,UpdatedDate=convert(datetime,getdate(),103)
				WHERE CityID=CityID
				set @msg =(SELECT [Message] from [Message] Where MessageID=11)		
				Select @Msg
			END
	END
ELSE
	BEGIN--Message when City name is null or Empty
		SELECT [Message] from [Message] Where MessageID=9
	END
END
