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
-- Create date: 23 Sept 2015
-- Description:	Bind User type to Dropdown
-- =============================================
CREATE PROCEDURE BindUserType_USP 
AS
BEGIN
SELECT UserTypeID,UserTypeName FROM UserType
Where IsActive=1

END
GO