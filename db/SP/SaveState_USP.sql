USE [MedicalShop_DB_Web]
GO
/****** Object:  StoredProcedure [dbo].[SaveState_USP]    Script Date: 09/22/2015 11:09:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 15 Sept 2015
-- Description:	Save State
-- =============================================
ALTER PROCEDURE [dbo].[SaveState_USP] --0,'Maharashtra',1,1,1
(
@StateID	int,
@StateName	nvarchar(50),
@CountryID	int,
@UpdatedByUserID	int,
@IsActive	bit
)
AS
DECLARE @msg nvarchar(max)=null
BEGIN
SET @StateName = LTRIM(RTRIM(@StateName))

IF (@StateName<>'' or @StateName <> null)--Check Whether State name is not null or empty
	BEGIN
		IF(@CountryID <>0)
			BEGIN
				IF (@StateID=0)
					BEGIN
						IF NOT EXISTS (Select StateID from [State] where StateName=@StateName AND CountryID= @CountryID)--Check whether same name state available in same country
							BEGIN--Save State
								Insert Into State (StateName,CountryID,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate,IsActive)
								Values(@StateName,@CountryID,@UpdatedByUserID,@UpdatedByUserID,convert(datetime,getdate(),103),convert(datetime,getdate(),103),@IsActive)
								set @Msg = (SELECT [Message] from Message where MessageID = 7)
								SELECT @Msg
							END
						ELSE
							BEGIN--Message same name state available in same country
							set @Msg = (SELECT [Message] from Message where MessageID = 6)
							SELECT @Msg								
							END
					END
					ELSE
						BEGIN
						IF NOT EXISTS (Select StateID from [State] where StateName=@StateName AND CountryID= @CountryID)--Check whether same name state available in same country
							BEGIN--Update State
								UPDATE [State] set StateName=@StateName,CountryID=@CountryID,UpdatedByUserID=@UpdatedByUserID,UpdatedDate=convert(datetime,getdate(),103)
								WHERE StateID=@StateID
								set @Msg = (SELECT [Message] from Message where MessageID = 8)
								SELECT @Msg
							END
						ELSE
							BEGIN--Message same name state available in same country
								set @Msg = (SELECT [Message] from Message where MessageID = 6)
							SELECT @Msg	
							END
						END
						
			END
		ELSE
			BEGIN
				set @Msg = (SELECT [Message] from Message where MessageID = 5)
				SELECT @Msg
			END
	END
ELSE
	BEGIN
		set @Msg = (SELECT [Message] from Message where MessageID = 4)
		SELECT @Msg
	END
END
