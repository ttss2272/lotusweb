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
-- Create date: 22 sept 2015
-- Description:	Get shop type for bind drop down
-- =============================================
Alter PROCEDURE GetsShopType_USP 

AS
BEGIN
SELECT ShopTypeID,ShopTypeName FROM ShopType
where IsActive=1
END
GO
