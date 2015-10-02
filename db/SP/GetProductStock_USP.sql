/****** Object:  StoredProcedure [dbo].[GetProductStock_USP]    Script Date: 10/02/2015 13:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Sammer A. Shinde
-- Create date: 02 Oct 2015
-- Description:	Get Stock of Peritcular Product
-- =============================================
Create PROCEDURE [dbo].[GetProductStock_USP] --1,1
(	@WarehouseID int ,
	@ProductID int 
)	
AS
 declare @PurchaseQuantity float =0 
declare @SaleQuantity float=0
declare @SaleReturnQuantity float=0
BEGIN
          
   set @PurchaseQuantity = (select coalesce( sum (pwpd.Quantity),0) from PurchaseTransactionDetail pwpd
    
    inner join PurchaseTransaction pwp on
    pwp.PurchaseTransactionID=pwpd.PurchaseTransactionID
     where ProductID=@ProductID and pwp.WarehouseID=@WarehouseID)
    
    
    
    set @SaleQuantity = (select  coalesce( SUM(std.Quantity),0) from SaleTransactionDetail std
    
    inner join SaleTransaction st
    on st.SaleTransactionID=std.SaleTransactionID
    where ProductID =@ProductID and st.WarehouseID=@WarehouseID      )

	set @SaleReturnQuantity=(SELECT coalesce(SUM(rsd.Quantity),0 ) from SalesReturn rs
	inner join SalesReturnDetail rsd
	on rsd.SalesReturnID =rs.SalesReturnID
	where WarehouseID=@WarehouseID AND ProductID= @ProductID)
	
	
	select p.ProductID,@PurchaseQuantity as 'Purchase Quanttiy', p.ProductName,pwp.WarehouseID,w.WarehouseName,@SaleQuantity as 'Sale Quantity' ,@SaleReturnQuantity AS 'Sales Return Quantity',(@PurchaseQuantity-@SaleQuantity+@SaleReturnQuantity) As 'Stock' from Product p
	
	inner join PurchaseTransactionDetail pwpd
	on pwpd.ProductID =p.ProductID
	
	inner join PurchaseTransaction pwp
	on pwp.PurchaseTransactionID=pwpd.PurchaseTransactionID
	
	inner join Warehouse w
	on w.WarehouseID=pwp.WarehouseID
	
	left join SaleTransactionDetail std
	on std.ProductID=p.ProductID
	
	left join SaleTransaction st
	on st.SaleTransactionID=std.SaleTransactionID

	where w.WarehouseID=@WarehouseID and p.ProductID=@ProductID
	group by p.ProductID,p.ProductName,pwp.WarehouseID,w.WarehouseName
END
