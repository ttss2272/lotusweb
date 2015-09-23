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
-- Create date: 23 Sept @015
-- Description:	Get wre house Details for bind warehouse
-- =============================================
CREATE PROCEDURE GetWarehouse_USP 
(
@WarehouseID int, 
@IsActive int
)
AS
BEGIN

	SELECT WarehouseName AS 'Warehouse Name',WarehouseLocation AS 'Location' from Warehouse
	
	where WarehouseID LIKE CASE WHEN @WarehouseID<>0 THEN @WarehouseID ELSE CONVERT(nvarchar(50),WarehouseID) END
	AND IsActive LIKE CASE WHEN @IsActive <>2 then @IsActive ELSE CONVERT (NVARCHAR(50),IsActive)END
	
END
GO
