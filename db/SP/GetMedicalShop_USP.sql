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
-- Create date: 24Sept 2015
-- Description:	get medical shop Detail on medical shop id for form binding
-- =============================================
ALter PROCEDURE GetMedicalShop_USP 
(
@MedicalShopID int
)
AS
BEGIN
	SELECT med.MedicalShopID,med.OwnerName,med.ContactNo,med.Area,med.ShopName,med.ShopTypeID,med.OpeningBalance,med.CityID,
	st.StateID,cou.CountryID
	from MedicalShop med
	INNER JOIN City ct
	ON ct.CityID=med.CityID
	INNER JOIN [State] st
	ON st.StateID=ct.StateID
	INNER JOIN Country cou
	ON cou.CountryID=st.CountryID
	WHERE med.MedicalShopID LIKE CASE WHEN @MedicalShopID<>0 THEN @MedicalShopID ELSE CONVERT (nvarchar(50),med.MedicalShopID)END
END
GO
