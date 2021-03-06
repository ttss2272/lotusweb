
/****** Object:  StoredProcedure [dbo].[GetWarehouse_USP]    Script Date: 09/24/2015 17:54:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 23 Sept @015
-- Description:	Get wre house Details for bind warehouse
-- =============================================
ALTER PROCEDURE [dbo].[GetWarehouse_USP] 
(
@WarehouseID int, 
@IsActive int
)
AS
BEGIN

	SELECT WarehouseName AS 'Warehouse Name',WarehouseLocation AS 'Location' from Warehouse
	
	where WarehouseID LIKE CASE WHEN @WarehouseID<>0 THEN @WarehouseID ELSE CONVERT(nvarchar(50),WarehouseID) END
	AND IsActive LIKE CASE WHEN @IsActive <>2 then @IsActive ELSE CONVERT (NVARCHAR(50),IsActive)END
	
	Order By WarehouseName Asc
	
END
