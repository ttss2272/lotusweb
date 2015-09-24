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
-- Author:		PriTesh D.Sortee
-- Create date: 24 Sept 2015
-- Description:	get All Medicalshop for Bind Dropdown on ShopType
-- =============================================
ALTER PROCEDURE BindMedicalShopOnShopType_USP --2
(
@ShopTypeID int
)
AS
BEGIN
SELECT MedicalShopID,ShopName FROM MedicalShop
	WHERE ShopTypeID LIKE CASE WHEN @ShopTypeID<>0 THEN @ShopTypeID ELSE CONVERT (nvarchar(50),ShopTypeID)END
	AND IsActive=1
	Order by  ShopName asc
END
GO
