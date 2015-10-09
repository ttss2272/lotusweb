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
-- Create date: 08 OCT 2015
-- Description:	Set Supplier Payment Reciept No
-- =============================================
CREATE PROCEDURE SetSupplierPaymentRecieptNo_USP 
	
AS
BEGIN
	DECLARE @Output nvarchar(50)
DECLARE @no nvarchar(50)
--DECLARE @Initial nvarchar(50)='InvoiceNo'
BEGIN
	set @no= (select COUNT(*)from SupplierPayment)
	
	set @no=@no+1
	
	set @Output='Sup Pay 00'+@no
	
	select @Output 	
END
END
GO
