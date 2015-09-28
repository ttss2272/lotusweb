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
-- Create date: 28Sept 2015
-- Description:	Get supplier all deatail to fill form on edit
-- =============================================
CREATE PROCEDURE GetSupplierDetail_USP 
	(
	@SupplierID int
	)
AS
BEGIN
	SELECT sup.SupplieriD,sup.CompanyName,sup.ModeOfTransport,sup.PriceType,sup.[Address],sup.ContactPerson,sup.ContactNo,ct.CityID,sup.Area,sup.OpeningBalance,
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
GO
