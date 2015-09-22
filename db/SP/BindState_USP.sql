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
-- Description:	Get StateId And State Name to Bind DropDown
-- =============================================
Alter PROCEDURE BindState_USP 
(
@CountryID int=0
)
AS
BEGIN
	Select s.StateID,s.StateName AS 'State Name'from [State] s
 Where 
	s.CountryID LIKE CASE WHEN @CountryID<>0 THEN @CountryID ELSE Convert(nvarchar(50),s.CountryID) END


END
GO
