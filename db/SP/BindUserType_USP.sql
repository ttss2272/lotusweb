/****** Object:  StoredProcedure [dbo].[BindUserType_USP]    Script Date: 09/24/2015 17:49:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 23 Sept 2015
-- Description:	Bind User type to Dropdown
-- =============================================
ALTER PROCEDURE [dbo].[BindUserType_USP] 
AS
BEGIN
SELECT UserTypeID,UserTypeName FROM UserType
Where IsActive=1
Order By UserTypeName ASC

END
