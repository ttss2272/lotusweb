/****** Object:  StoredProcedure [dbo].[GetState_USP]    Script Date: 09/24/2015 17:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 15 Sept 2015
-- Description:	Get State Details
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

Order By s.StateName ASC
END
