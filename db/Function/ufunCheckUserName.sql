Create FUNCTION [dbo].[ufunCheckUserName](@LoginName nvarchar(50))
RETURNS nvarchar(50)
AS 

BEGIN
    DECLARE @ret nvarchar(50);
    --DECLARE @return nvarchar;
    SELECT @ret = UserID
    FROM [User]
    WHERE LoginName = @LoginName 
        
     IF (@ret IS NULL) 
        SET @ret = 'User Login Name is Available';
     ELSE
       SET @ret ='User Login Name is Not Available';   
    RETURN @ret;
END;