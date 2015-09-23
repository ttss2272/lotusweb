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
-- Create date: 23 Sept 2015
-- Description:	Save User
-- =============================================
CREATE PROCEDURE SaveUser_USP 
(
@UserID	int,
@UserName	nvarchar(50),
@LoginName	nvarchar(50),
@Password	nvarchar(50),
@ContactNo	nvarchar(50),
@Address	nvarchar(50),
@WarehouseID	int,
@EmailAddress	nvarchar(50),
@UserTypeID	int,
@UpdatedByUserID	int,
@IsActive	bit,
@CityID	int
)
AS
DECLARE @msg nvarchar(max)
BEGIN
SET @UserName=LTRIM(RTRIM(@UserName))
SET @LoginName=LTRIM(RTRIM(@LoginName))
SET @Password=LTRIM(RTRIM(@Password))
SET @ContactNo=LTRIM(RTRIM(@ContactNo))
SET @Address=LTRIM(RTRIM(@Address))
SET @EmailAddress=LTRIM(RTRIm(@EmailAddress))

IF (@UserID=0)--Check for New Entry
BEGIN--New Entry
	INSERT INTO [User] (UserName,LoginName,[Password],ContactNo,[Address],WarehouseID,EmailAddress,UserTypeID,CreatedByUserID,UpdatedByUserID,CreatedDate,UpdatedDate,IsActive,CityID)
	VALUES(@UserName,@LoginName,@Password,@ContactNo,@Address,@WarehouseID,@EmailAddress,@UserTypeID,@UpdatedByUserID,@UpdatedByUserID,CONVERT(DATETIME,GETDATE(),103),CONVERT(DATETIME,GETDATE(),103),@IsActive,@CityID)

	IF(@@ROWCOUNT=1)
		BEGIN
			SET @msg='User Created Sucessfully...!!!'
			Select @msg
		END
	ELSE
		BEGIN
			SET @msg='Error To Create User'
			Select @msg
		END	
END
ELSE
BEGIN--Update Entry
	UPDATE [User] SET  	UserName=@UserName,ContactNo=@ContactNo,[Address]=@Address,WarehouseID=@WarehouseID,EmailAddress=@EmailAddress,UserTypeID=@UserTypeID,UpdatedByUserID=@UpdatedByUserID,UpdatedDate=CONVERT(DATETIME,GETDATE(),103),IsActive=IsActive,CityID=@CityID
	WHERE UserID=@UserID
	IF(@@ROWCOUNT=1)
		BEGIN
			SET @msg='User Update Sucessfully...!!!'
			Select @msg
		END
	ELSE
		BEGIN
			SET @msg='Error To Update User'
			Select @msg
		END	
END


END
GO
