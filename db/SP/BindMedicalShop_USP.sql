USE [MedicalShop_DB_Web]
GO
/****** Object:  StoredProcedure [dbo].[BindMedicalShop_USP]    Script Date: 09/24/2015 17:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 24 Sept 2015
-- Description:	get medical Shop ot bind drop down only Active
-- =============================================
ALTER PROCEDURE [dbo].[BindMedicalShop_USP] 
(
@MedicalShopID int
)
AS
BEGIN
	SELECT MedicalShopID,ShopName FROM MedicalShop
	WHERE MedicalShopID LIKE CASE WHEN @MedicalShopID<>0 THEN @MedicalShopID ELSE CONVERT (nvarchar(50),MedicalShopID)END
	AND IsActive=1
	ORDER By ShopName ASC
END
