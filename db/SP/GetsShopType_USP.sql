/****** Object:  StoredProcedure [dbo].[GetsShopType_USP]    Script Date: 09/24/2015 17:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 22 sept 2015
-- Description:	Get shop type for bind drop down
-- =============================================
ALTER PROCEDURE [dbo].[GetsShopType_USP] 

AS
BEGIN
SELECT ShopTypeID,ShopTypeName FROM ShopType
where IsActive=1

Order By ShopTypeName ASC
END
