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
-- Create date: 28 Sept 2015
-- Description:	Bind Gridview of Supplier
-- =============================================
CREATE PROCEDURE GetAllSupplierDetail_USP 
(
@SupplierID int
)
AS
BEGIN
	SELECT sup.SupplierID,sup.CompanyName,sup.ContactPerson,sup.ContactNo,sup.[Address],sup.Area,ct.CityName,sup.ModeOfTransport,sup.PriceType
	FROM Supplier sup
	INNER JOIN City ct
	ON ct.CityID=sup.CityID
	
	WHERE sup.SupplierID LIKE CASE WHEN @SupplierID<>0 THEN @SupplierID ELSE CONVERT(nvarchar(50),sup.SupplierID) END
	AND sup.IsActive=1
	Order By sup.CompanyName
	
END
GO
