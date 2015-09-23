/****** Object:  StoredProcedure [dbo].[GetLoginName_SP]    Script Date: 09/23/2015 17:30:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 23Sept2015
-- Description:	Get Login Name form User
-- =============================================
Create PROCEDURE [dbo].[CheckLoginName_SP]
(	@LoginName nvarchar(50))
AS
BEGIN
	 
    select [dbo].[ufunCheckUserName] (@LoginName) 
	
END
