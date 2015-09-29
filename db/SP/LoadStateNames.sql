

/****** Object:  StoredProcedure [dbo].[Usp_LoadStateNames]    Script Date: 09/23/2015 17:46:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Sameer>
-- Create date: <23/9/2015>
-- Description:	<For all form State Name bind >
-- =============================================
Create PROCEDURE [dbo].[Usp_LoadStateNames]
@CountryId int
AS
BEGIN
	select 0 as StateId,'Select' as StateName
	union
	select StateId,StateName from State  where CountryId=@CountryId and IsActive='Yes'

END

GO


