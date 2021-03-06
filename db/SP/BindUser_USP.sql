/****** Object:  StoredProcedure [dbo].[BindUser_USP]    Script Date: 09/24/2015 18:07:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 24Sept 2015
-- Description:	Bind User To DropDown
-- =============================================
ALTER PROCEDURE [dbo].[BindUser_USP] --0
(
@UserID int 
)
AS
BEGIN

	SELECT UserID,UserName FROM [User]
	WHERE UserID LIKE CASE WHEN @UserID<>0 THEN @UserID ELSE CONVERT(nvarchar(50),UserID)END
	AND IsActive=1
	Order By UserName ASC
END
