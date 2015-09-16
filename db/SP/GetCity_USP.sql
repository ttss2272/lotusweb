-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 15 Sept 2015
-- Description:	Get City
-- =============================================
CREATE PROCEDURE GetCity_USP 
(
@CityID int,
@IsActive bit
)
AS
BEGIN
	Select CityID,CityName from City Where 
	CityID Like CASE WHEN @CityID <> 0 THEN @CityID ELSE Convert(nvarchar(50),CityID) END
	AND IsActive Like CASE WHEN @IsActive<>2 THEN @IsActive Else Convert(NVARCHAR(50),IsActive)END
	
END
GO
