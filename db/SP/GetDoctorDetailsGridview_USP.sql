USE [MedicalShop_DB_Web]
GO
/****** Object:  StoredProcedure [dbo].[GetDoctorDetailsGridview_USP]    Script Date: 09/28/2015 12:36:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sameer Shinde
-- Create date: 25/09/2015
-- Description:	Get Dotor Details for Gridview
-- =============================================
ALTER PROCEDURE [dbo].[GetDoctorDetailsGridview_USP] 
@DoctorID int	
AS
BEGIN
	SELECT Dr.DoctorID,Dr.DoctorName,Dr.Specialization,CONVERT (nvarchar(50),Dr.DOB,103) AS DOB,Dr.CityID,Dr.Area,Dr.MobileNo,Dr.[Address],Dr.OpeningBalance,ct.CityName
	From Doctor Dr
	INNER JOIN City ct
	ON ct.CityID=Dr.CityID
	where Dr.DoctorID LIKE CASE WHEN @DoctorID<>0 Then @DoctorID ELSE CONVERT (nvarchar(50),Dr.DoctorID)END
	And Dr.IsActive=1
	order by DoctorName Asc
END
