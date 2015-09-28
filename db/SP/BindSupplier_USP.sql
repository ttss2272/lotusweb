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
-- Create date: 28 Sept 2015
-- Description:	Bind Supplier to Dropdown
-- =============================================
ALter PROCEDURE BindSupplier_USP 
(
@SupplierID int
)
AS
BEGIN
	SELECT SupplierID,CompanyName FROM Supplier
	WHERE SupplierID LIKE CASE WHEN @SupplierID <> 0 Then @SupplierID ELSE CONVERT (NVARCHAR(50),SupplierID)END
	AND IsActive=1
	Order By CompanyName
END
GO
