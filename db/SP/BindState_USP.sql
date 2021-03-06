/****** Object:  StoredProcedure [dbo].[BindState_USP]    Script Date: 09/24/2015 17:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 22 Sept 2015
-- Description:	Get StateId And State Name to Bind DropDown
-- =============================================
ALTER PROCEDURE [dbo].[BindState_USP] 
(
@CountryID int=0
)
AS
BEGIN
	Select s.StateID,s.StateName AS 'State Name'from [State] s
 Where 
	s.CountryID LIKE CASE WHEN @CountryID<>0 THEN @CountryID ELSE Convert(nvarchar(50),s.CountryID) END
	AND IsActive=1
Order By StateName ASC

END

