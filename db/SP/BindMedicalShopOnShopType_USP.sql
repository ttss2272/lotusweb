/****** Object:  StoredProcedure [dbo].[BindMedicalShopOnShopType_USP]    Script Date: 09/24/2015 17:48:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D.Sortee
-- Create date: 24 Sept 2015
-- Description:	get All Medicalshop for Bind Dropdown on ShopType
-- =============================================
ALTER PROCEDURE [dbo].[BindMedicalShopOnShopType_USP] --2
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
