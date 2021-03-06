
/****** Object:  StoredProcedure [dbo].[GetCountry_USP]    Script Date: 09/24/2015 17:52:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 15 Sept 2015
-- Description:	Get Country
-- =============================================
ALTER PROCEDURE [dbo].[GetCountry_USP] 
(
@CountryID int,
@IsActive bit
)
AS
BEGIN
 	   SELECT CountryID,CountryName AS 'Country Name' from Country Where 
	   IsActive LIKE CASE WHEN @IsActive <>2 then @IsActive ELSE CONVERT (NVARCHAR(50),IsActive)END
	   AND CountryID Like CASE WHEN  @CountryID<>0 then @countryID ELSE CONVERT(NVARCHAR(50),CountryID) END
	   
	   Order By CountryName ASC

 
END
