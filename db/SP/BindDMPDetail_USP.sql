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
-- Create date: 26 Sept 2015
-- Description:	Get details of DMP to Fill Form for edit
-- =============================================
CREATE PROCEDURE BindDMPDetail_USP 
	(
	@DMPID int
	)
AS
BEGIN
	
	SELECT DoctorID,MedicalShopID,ProductID,PriceTypeID,price
	From DMPLinking
	Where DMPID LIKE CASE WHEN @DMPID <>0 THEN @DMPID ELSE(CONVERT(nvarchar(50),DMPID )END
	
END
GO
