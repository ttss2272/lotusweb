/****** Object:  StoredProcedure [dbo].[BindMedicalProduct_USP]    Script Date: 10/09/2015 17:04:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 25 Sept 2015
-- Description:	get Product List of Medical Shop (Bind Drop Down)
-- =============================================
ALTER PROCEDURE [dbo].[BindMedicalProduct_USP] 
	(
	@MedicalShopID int
	)
AS
BEGIN
	SELECT p.ProductID,p.ProductName FROM Product p

		INNER JOIN SaleTransactionDetail std
		ON std.ProductID = p.ProductID

		INNER JOIN SaleTransaction st
		ON st.SaleTransactionID=std.SaleTransactionID

		INNER JOIN MedicalShop m
		ON m.MedicalShopID = st.MedicalShopID
		WHERE m.MedicalShopID LIKE CASE WHEN @MedicalShopID <>0 THEN @MedicalShopID ELSE CONVERT(nvarchar(50),m.MedicalShopID) END
		
		GROUP BY p.ProductID,p.ProductName,m.MedicalShopID
		ORDER BY p.ProductName

END
