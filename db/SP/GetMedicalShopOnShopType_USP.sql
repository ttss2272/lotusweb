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
-- Description:	get medical shop detail on shoptype and shop id
-- =============================================
CREATE PROCEDURE GetMedicalShopOnShopType_USP --2,2
(
@MedicalShopID int,
@ShopTypeID int
)
AS
BEGIN

SELECT med.MedicalShopID,med.OwnerName,med.ContactNo,med.Area,med.ShopName,med.ShopTypeID,shType.ShopTypeName,med.OpeningBalance,med.CityID,ct.CityName
	from MedicalShop med
	INNER JOIN City ct
	ON ct.CityID=med.CityID
	INNER JOIN ShopType shtype
	ON shtype.ShopTypeID=med.ShopTypeID
	WHERE med.MedicalShopID LIKE CASE WHEN @MedicalShopID<>0 THEN @MedicalShopID ELSE CONVERT (nvarchar(50),med.MedicalShopID)END
	AND med.ShopTypeID LIKE CASE WHEN @ShopTypeID<>0 THEN @ShopTypeID ELSE CONVERT(nvarchar(50),med.ShopTypeID) END
	AND med.IsActive=1
END
GO
