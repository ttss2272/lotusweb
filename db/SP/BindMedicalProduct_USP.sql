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
-- Create date: 25 Sept 2015
-- Description:	get Product List of Medical Shop (Bind Drop Down)
-- =============================================
ALTER PROCEDURE BindMedicalProduct_USP 
	(
	@MedicalShopID int
	)
AS
BEGIN
	SELECT p.ProductID,p.ProductName FROM Products p

		INNER JOIN SaleTransactionDetails std
		ON std.ProductID = p.ProductID

		INNER JOIN SaleTransaction st
		ON st.SaleTansactionID=std.SaleTansactionID

		INNER JOIN MedicalShop m
		ON m.MedicalShopID = st.MedicalShopID
		WHERE m.MedicalShopID LIKE CASE WHEN @MedicalShopID <>0 THEN @MedicalShopID ELSE CONVERT(nvarchar(50),m.MedicalShopID) END
		
		GROUP BY p.ProductID,p.ProductName,m.MedicalShopID
		ORDER BY p.ProductName

END
GO
