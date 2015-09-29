USE [MedicalShop_DB_Web]
GO
/****** Object:  StoredProcedure [dbo].[GetProductType_USP]    Script Date: 09/25/2015 12:38:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sameer Shinde
-- Create date: 25 Sept 2015
-- Description:	Get Product Type Details
-- =============================================
create PROCEDURE [dbo].[GetProductType_USP] 
(
@ProductTypeID int,
@IsActive bit
)
AS
BEGIN
 	   SELECT ProductTypeID,ProductTypeName AS 'Product Type' from ProductType Where 
	   IsActive LIKE CASE WHEN @IsActive <>2 then @IsActive ELSE CONVERT (NVARCHAR(50),IsActive)END
	   AND ProductTypeID Like CASE WHEN  @ProductTypeID<>0 then ProductTypeID ELSE CONVERT(NVARCHAR(50),ProductTypeID) END
	   
	   Order By ProductTypeName ASC

 
END
