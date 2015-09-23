/****** Object:  StoredProcedure [dbo].[CheckLoginName_USP]    Script Date: 09/23/2015 17:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 4July2015
-- Description:	Get Login Name form tbl Login
-- =============================================
ALTER PROCEDURE [dbo].[CheckLoginName_USP]
(	@LoginName nvarchar(50))
AS
BEGIN
	SET @LoginName=LTRIM(RTRIM(@LoginName))
	
	IF (@LoginName<>'' OR @LoginName <> NULL)
		BEGIN
			select [dbo].[ufunCheckUserName] (@LoginName) 
		END 
	ELSE
		BEGIN
			SELECT 'Please Enter Proper User Login Name'
		END
    
	
END
