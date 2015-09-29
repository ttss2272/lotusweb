USE [MedicalShop_DB_Web]
GO
/****** Object:  StoredProcedure [dbo].[GetDoctorName_USP]    Script Date: 09/28/2015 12:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sameer Shinde
-- Create date: 28 sept 2015
-- Description:	Get shop type for bind drop down
-- =============================================
ALTER PROCEDURE [dbo].[GetDoctorNames_USP] 

AS
BEGIN
SELECT DoctorID,DoctorName FROM Doctor
where IsActive=1

Order By DoctorName ASC
END
