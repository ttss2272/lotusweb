/****** Object:  StoredProcedure [dbo].[BindCity_USP]    Script Date: 09/24/2015 17:47:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 22 Sept 2015
-- Description:	Bind Dropdown City
-- =============================================
ALTER PROCEDURE [dbo].[BindCity_USP] 
(
@StateID int=0
)
AS
BEGIN
	Select c.CityID,c.CityName as 'City Name'  from City c
	WHERE
	c.StateID Like CASE WHEN @StateID <> 0 THEN @StateID ELSE Convert(nvarchar(50),c.StateID) END
	AND IsActive=1
	Order By c.CityName ASC
END
