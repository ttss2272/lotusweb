USE [MedicalShop_DB_Web]
GO
/****** Object:  StoredProcedure [dbo].[SaveCounty_USP]    Script Date: 09/16/2015 16:14:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 15Sept 2015
-- Description:	Save Country
-- =============================================
ALTER PROCEDURE [dbo].[SaveCounty_USP] 
(
 @CountryID int =0,
 @CountryName nvarchar(MAX) =null,
 @UpdatedByUserID	int =0,
 @IsActive	bit =null

)
AS
Declare @msg nvarchar(max)
BEGIN
set @CountryName= LTRIM(RTRIM(@CountryName))


	IF(@CountryID=0)
		BEGIN
			IF Not Exists(Select CountryID from Country where CountryName=@CountryName)
			BEGIN
				Insert into Country (CountryName,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate,IsActive)
				Values (@CountryName,@UpdatedByUserID,@UpdatedByUserID,convert(datetime,getdate(),103),convert(datetime,getdate(),103),@IsActive)
				
				set @msg = (Select [Message] from Message where MessageID=2)
				select @msg
			END
			Else
			BEGIN
				Set @msg = (Select [Message] from Message where MessageID=1)
				select @msg
			END
		END 
	ELSE
	BEGIN
		if Not Exists ( Select CountryID from Country where CountryName=@CountryName AND CountryID<>@CountryID)
			BEGIN
				UPDATE Country SET CountryName=@CountryName,UpdatedByUserID=@UpdatedByUserID,UpdatedDate=convert(datetime,getdate(),103)
				where CountryID=@CountryID
				(Select [Message] from Message where MessageID=3)
			END
		ELSE
			BEGIN
				Set @msg = (Select [Message] from Message where MessageID=1)
					select @msg
			END
	END

END
