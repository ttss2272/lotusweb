USE [MedicalShop_DB_Web]
GO
/****** Object:  StoredProcedure [dbo].[SaveWarehouse_USP]    Script Date: 09/23/2015 12:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		PriTesh D. Sortee
-- Create date: 23 sept 2015
-- Description:	Save Warehouse
-- =============================================
ALTER PROCEDURE [dbo].[SaveWarehouse_USP] 
(
@WarehouseID int,
@WarehouseName nvarchar(50),
@Location nvarchar(50),
@UpdatedByUserID int,
@IsActive bit
)
AS
DECLARE @msg nvarchar(50)
BEGIN
	SET @WarehouseName=LTRIM(RTRIM(@WarehouseName))
	SET @Location=LTRIM(RTRIM(@Location))
	
	IF (@WarehouseName<>'' OR @WarehouseName<> NULL)--Check whetther Warehouse Name null or empty
		BEGIN--Warehouse name is not Empty or null
			IF (@Location<>'' OR @Location<> NULL)--Check whetther Location null or empty
				BEGIN-- Location not null or empty
					IF (@WarehouseID=0)--Check for new Entry
						BEGIN--New Entry
							IF Not Exists(SELECT WarehouseID FROM Warehouse where WarehouseName=@WarehouseName)--Warehouse Name Exists or Not
								BEGIN
									INSERT INTO Warehouse (WarehouseName,WarehouseLocation,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate,IsActive)
									VALUES (@WarehouseName,@Location,@UpdatedByUserID,@UpdatedByUserID,convert(datetime,getdate(),103),convert(datetime,getdate(),103),@IsActive)
									IF (@@RowCount=1)
										BEGIN
											SET @msg ='Warehouse Created Sucessfully....!!!'
											SELECT @msg 
										END
									ELSE
										BEGIN
											SET @msg ='Error to Create Warehouse'
											SELECT @msg 
										END
								END
							ELSE
								BEGIN--Warehouse Name Already Exists
									SET @msg='This Warehouse Name Already Exists Please Enter Another Name'
									SELECT @msg
								END
							END
					ELSE
						BEGIN--Update Warehouse
							IF Not Exists(SELECT WarehouseID FROM Warehouse where WarehouseName=@WarehouseName AND WarehouseID<>@WarehouseID)--Warehouse Name Exists or Not
								BEGIN
									UPDATE warehouse set WarehouseName=@WarehouseName,WarehouseLocation=@Location,UpdatedByUserID=@UpdatedByUserID,UpdatedDate=CONVERT(DATETIME,GETDATE(),103)
									WHERE WarehouseID=@WarehouseID
									IF (@@RowCount=1)
										BEGIN
											SET @msg ='Warehouse Updated Sucessfully....!!!'
											SELECT @msg 
										END
									ELSE
										BEGIN
											SET @msg ='Error to Update Warehouse'
											SELECT @msg 
										END
								END
							ELSE
								BEGIN--Warehouse Name Already Exists
									SET @msg='This Warehouse Name Already Exists Please Enter Another Name'
									SELECT @msg
									
								END
						END
				END
			ELSE
				BEGIN-- Location  null or empty
					SET @msg='Please Enter Location'
					SELECt @msg
				END
		END
	ELSE
		BEGIN--Warehouse name is Empty or Null
			set @msg='Please Insert Watrehouse Name'
			Select @msg
		END
END
