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
-- Create date: 24 Sept 2015
-- Description:	get user deail to bind form and Gridview
-- =============================================
CREATE PROCEDURE GetUser_USP 
(
@UserID int
)
AS
BEGIN
	SELECT u.UserName,u.LoginName,u.[Password],u.ContactNo,u.[Address],u.EmailAddress,u.Area,u.WarehouseID,u.UserTypeID,u.CityID,
	ut.UserTypeName,ware.WarehouseID,ware.WarehouseName,st.StateID,cou.CountryID
	
	FROM [User] u

	INNER JOIN Warehouse ware
	ON ware.WarehouseID=u.WarehouseID
	INNER JOIN UserType ut
	ON ut.UserTypeID=u.UserID
	INNER JOIN City ct
	ON ct.CityID=u.CityID
	INNER JOIN [State] st
	ON st.StateID=ct.StateID
	INNER JOIN Country cou
	ON cou.CountryID=st.CountryID
	
	WHERE u.UserID LIKE CASE WHEN @UserID<>0 THEN @UserID ELSE CONVERT (nvarchar(50),u.UserID)END
	AND u.IsActive=1
	Order By u.UserName ASC
END
GO
