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
-- Create date: 25 Sept 2015
-- Description:	check user login correct or invalid
-- =============================================
Alter PROCEDURE UserLogin_USP --'PriTesh','pritesh@123'
(
@LoginName nvarchar(MAX),
@Password nvarchar(MAX)
)
AS
DECLARE @msg nvarchar(MAX)
BEGIN

  IF(EXISTS(SELECT UserID from [User] where BINARY_CHECKSUM(LoginName)=BINARY_CHECKSUM(@LoginName)))
	BEGIN
		IF(EXISTS(SELECT UserID from [User] where (BINARY_CHECKSUM(LoginName)=BINARY_CHECKSUM(@LoginName)) AND (BINARY_CHECKSUM([Password])=BINARY_CHECKSUM(@Password))))
			BEGIN
			IF(EXISTS(SELECT UserID from [User] where (BINARY_CHECKSUM(LoginName)=BINARY_CHECKSUM(@LoginName)) AND (BINARY_CHECKSUM([Password])=BINARY_CHECKSUM(@Password))AND IsActive=1))
			BEGIN
				Select WarehouseID as 'WarehouseID',LoginName AS 'LoginName' from [User]where (BINARY_CHECKSUM(LoginName)=BINARY_CHECKSUM(@LoginName)) AND (BINARY_CHECKSUM([Password])=BINARY_CHECKSUM(@Password))
			END
			ELSE
				BEGIN
				   SET @msg='User Is Deleted'
				   Select @msg AS msg
				   
				END
			END
		ELSE
			BEGIN
				SET @msg='Invalid Password'
				SELECT @msg AS msg
			END
	END
  ELSE
	BEGIN
		SET @msg='Invalid Login Name'
		SELECT @msg AS msg
	END

END
GO
