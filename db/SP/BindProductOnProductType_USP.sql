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
-- Description:	Bind Product To DropDown On Product Type
-- =============================================
CREATE PROCEDURE BindProductOnProductType_USP 
(
@ProductTypeID int
)
AS
BEGIN
	SELECT ProductID,ProductName FROM Product
	WHERE ProductTypeID LIKE CASE WHEN @ProductTypeID <>0 THEN @ProductTypeID ELSE CONVERT(NVARCHAR(50),ProductTypeID)END
	AND IsActive=1
	ORDER BY ProductName ASC
END
GO
