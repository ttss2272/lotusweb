/****** Object:  StoredProcedure [dbo].[BindWarehouse_USP]    Script Date: 09/24/2015 17:50:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 23 Sept 2015
-- Description:	Bind Dropdown OF Warehouse
-- =============================================
ALTER PROCEDURE [dbo].[BindWarehouse_USP] 
(
@WarehouseID int, 
@IsActive int
)
AS
BEGIN
	SELECT WarehouseName AS 'Warehouse Name',WarehouseID from Warehouse
	
	where WarehouseID LIKE CASE WHEN @WarehouseID<>0 THEN @WarehouseID ELSE CONVERT(nvarchar(50),WarehouseID) END
	AND IsActive LIKE CASE WHEN @IsActive <>2 then @IsActive ELSE CONVERT (NVARCHAR(50),IsActive)END
	Order By WarehouseName ASC
	
END
