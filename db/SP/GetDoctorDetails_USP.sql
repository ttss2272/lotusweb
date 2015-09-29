USE [MedicalShop_DB_Web]
GO
/****** Object:  StoredProcedure [dbo].[GetMedicalShop_USP]    Script Date: 09/28/2015 14:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sameer Shinde
-- Create date: 28Sept 2015
-- Description:	get Doctor details  on doctor id for form binding
-- =============================================
create PROCEDURE [dbo].[GetDoctorDetails_USP] --4
(
@DoctorID int
)
AS
select Dr.DoctorName,Dr.Specialization,CONVERT (nvarchar(50),Dr.DOB,103) As DOB,Dr.CityID,Dr.Area,Dr.MobileNo,Dr.[Address],Dr.OpeningBalance,
cun.CountryID,st.StateID,cit.CityID
from Doctor Dr
INNER JOIN City cit
ON cit.CityID=Dr.CityID
INNER JOIN [State] st
ON st.StateID=cit.StateID
INNER JOIN Country cun
ON cun.CountryID=st.CountryID
where Dr.DoctorID LIKE CASE WHEN @DoctorID<>0 THEN @DoctorID Else CONVERT (nvarchar(50),Dr.DoctorID)END

