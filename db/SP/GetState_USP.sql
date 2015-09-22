/****** Object:  StoredProcedure [dbo].[GetState_USP]    Script Date: 09/22/2015 12:37:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 15 Sept 2015
-- Description:	Get State Details for bindGridview
-- =============================================
ALTER PROCEDURE [dbo].[GetState_USP] 
(
@StateID int=0,
@IsActive bit
)
AS
BEGIN
Select s.StateID,s.StateName AS 'State Name',c.CountryName AS 'Country Name'from [State] s
INNER JOIN Country c
on c.CountryID=s.CountryID
 Where 
	s.StateID LIKE CASE WHEN @StateID<>0 THEN @StateID ELSE Convert(nvarchar(50),s.StateID) END
AND s.IsActive LIKE CASE WHEN @IsActive<>2 THEN @IsActive ELSE CONVERT(nvarchar(50),s.IsActive)END
END
