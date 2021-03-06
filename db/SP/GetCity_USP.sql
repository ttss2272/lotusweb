
/****** Object:  StoredProcedure [dbo].[GetCity_USP]    Script Date: 09/24/2015 17:51:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 15 Sept 2015
-- Description:	Get City to bind GriDVIEW
-- =============================================
ALTER PROCEDURE [dbo].[GetCity_USP] 
(
@CityID int,
@IsActive bit
)
AS
BEGIN
	Select c.CityID,c.CityName as 'City Name',s.StateName AS 'State Name',cou.CountryName AS 'Country Name'  from City c
	INNER JOIN [State] s
	ON s.StateID=c.StateID
	INNER JOIN Country cou
	ON cou.CountryID=s.CountryID
	Where 
	c.CityID Like CASE WHEN @CityID <> 0 THEN @CityID ELSE Convert(nvarchar(50),c.CityID) END
	AND c.IsActive Like CASE WHEN @IsActive<>2 THEN @IsActive Else Convert(NVARCHAR(50),c.IsActive)END
	
	Order By CityName ASC
	
END
