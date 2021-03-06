/****** Object:  StoredProcedure [dbo].[GetAllSupplierDetail_USP]    Script Date: 10/09/2015 11:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 28 Sept 2015
-- Description:	Bind Gridview of Supplier
-- =============================================
ALTER PROCEDURE [dbo].[GetAllSupplierDetail_USP] 
(
@SupplierID int
)
AS
BEGIN
	SELECT sup.SupplierID,sup.CompanyName,sup.ContactPerson,sup.ContactNo,sup.[Address],sup.Area,ct.CityName,sup.ModeOfTransport,sup.PriceType,coalesce(sup.OpeningBalance,0.00) AS 'OpeningBalance'
	FROM Supplier sup
	INNER JOIN City ct
	ON ct.CityID=sup.CityID
	
	WHERE sup.SupplierID LIKE CASE WHEN @SupplierID<>0 THEN @SupplierID ELSE CONVERT(nvarchar(50),sup.SupplierID) END
	AND sup.IsActive=1
	Order By sup.CompanyName
	
END
