/****** Object:  StoredProcedure [dbo].[GetSupplierDetail_USP]    Script Date: 10/09/2015 11:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 28Sept 2015
-- Description:	Get supplier all deatail to fill form on edit
-- =============================================
ALTER PROCEDURE [dbo].[GetSupplierDetail_USP] 
	(
	@SupplierID int
	)
AS
BEGIN
	SELECT sup.SupplieriD,sup.CompanyName,sup.ModeOfTransport,sup.PriceType,sup.[Address],sup.ContactPerson,sup.ContactNo,ct.CityID,sup.Area,COALESCE(sup.OpeningBalance,0.00) AS 'OpeningBalance',
	st.StateID,cou.CountryID
	FROM Supplier sup
	
	INNER JOIN City ct
	ON ct.CityID=sup.SupplierID
	
	INNER JOIN [State] st
	ON st.StateID=ct.StateID
	
	INNER JOIN Country cou
	ON st.CountryID=cou.CountryID
	
	WHERE sup.SupplierID LIKE CASE WHEN @SupplierID<>0 THEN @SupplierID ELSE CONVERT (nvarchar(50),sup.SupplierID)END
	
END
