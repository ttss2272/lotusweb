/****** Object:  StoredProcedure [dbo].[GetDMPDetail_USP]    Script Date: 09/26/2015 17:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 26 Sept 2015
-- Description:	Get DMp Details on doctor id to bind grid view
-- =============================================
ALTER PROCEDURE [dbo].[GetDMPDetail_USP] 
(
@DoctorID int
)	
AS
BEGIN
	SELECT dmp.DMPID, med.ShopName,pr.ProductName,dmp.Price,pricetype.PriceTypeName
	FROM DMPLinking dmp
	
	INNER JOIN PriceType pricetype
	ON pricetype.PriceTypeID=dmp.PriceTypeID
	
	INNER JOIN MedicalShop med
	ON med.MedicalShopID=dmp.MedicalShopID
	
	INNER JOIN Product pr
	ON pr.ProductID=dmp.ProductID
	
	Where dmp.DoctorID LIKE CASE WHEN @DoctorID<>0 THEN @DoctorID ELSE CONVERT (nvarchar(50),dmp.DoctorID) END
	
END
