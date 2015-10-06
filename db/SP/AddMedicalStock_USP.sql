/****** Object:  StoredProcedure [dbo].[AddMedicalStock_USP]    Script Date: 06/10/2015 13:06:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sameer A. Shinde
-- Create date: 06-Oct-2015
-- Description:	Add Sales product To Medical Stock 
-- =============================================
Alter PROCEDURE [dbo].[AddMedicalStock_USP] --'03/09/2015',100,1,1
(
  
	@DateOfStock  nvarchar(50),
	@CurrentStock float ,
	@MedicalShopID int,
	@ProductID int
)
AS
DECLARE @TempCurrentStock float =0
Declare @temp int
Declare @MedicalStockID int
BEGIN
set @TempCurrentStock=(SELECT coalesce(Stock,0) from MedicalStock where MedicalShopID=@MedicalShopID and ProductID=@ProductID)
Set @CurrentStock=  coalesce(@TempCurrentStock,0)+ @CurrentStock

if not exists (select MedicalStockID from MedicalStock where MedicalShopID=@MedicalShopID and ProductID=@ProductID)
	BEGIN
		insert into MedicalStock (MedicalShopID,ProductID,Stock,StockEntryDate,CreatedDate)
		         values(@MedicalShopID,@ProductID,@CurrentStock,(CONVERT (date,GETDATE())),convert (date,@DateOfStock,103))
		       set @temp = (select MAX (MedicalStockID) from MedicalStock)
		         insert  into MedicalStockLog (MedicalStockID,StockEntryDate,Stock,CreatedDate,EntryDescription)
	              values (@temp,convert(date,@DateOfStock,103),@CurrentStock,CONVERT(date,getdate()),'Purchase Product')
	END
  else
BEGIN
  
	update MedicalStock set Stock=@CurrentStock,StockEntryDate=convert(date,@DateOfStock,103),CreatedDate=(CONVERT (date,GETDATE())) where MedicalShopID=@MedicalShopID AND ProductID=@ProductID
	set @MedicalStockID =(select MedicalStockID from MedicalStock where  MedicalShopID=@MedicalShopID AND ProductID=@ProductID)
	insert  into MedicalStockLog (MedicalStockID,CreatedDate,Stock,EntryDescription)
	              values (@MedicalStockID,convert(date,@DateOfStock,103),@CurrentStock,'Purchase Product')
	
	END

	
END