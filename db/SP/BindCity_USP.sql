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
-- Create date: 22 Sept 2015
-- Description:	Bind Dropdown City
-- =============================================
CREATE PROCEDURE BindCity_USP 
(
@StateID int=0
)
AS
BEGIN
	Select c.CityID,c.CityName as 'City Name'  from City c
	WHERE
	c.StateID Like CASE WHEN @StateID <> 0 THEN @StateID ELSE Convert(nvarchar(50),c.StateID) END
END
GO
