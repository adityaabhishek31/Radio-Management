CREATE TRIGGER trgAfterUpdate ON LoggedInUsers
After Insert
AS
declare @user_id int;
select @user_id=i.user_id from inserted i;
UPDATE UserProfile 
SET last_logged_in=getdate()
WHERE user_id=@user_id;
GO



 DELETE From LoggedInUsers;

 INSERT INTO LoggedInUsers Values(2,'a2');
 INSERT INTO LoggedInUsers Values(3,'a3');
 INSERT INTO LoggedInUsers Values(4,'a4');
 INSERT INTO LoggedInUsers Values(5,'a5');
 INSERT INTO LoggedInUsers Values(6,'a6');