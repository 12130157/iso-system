/***********************************************************
* Purpose : Delete HOP THU DI
* Author : NGUYEN VAN NUOI
* Date: 9-3-2011
* Description: Delete HOP THU DI
*/

IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_SMS_DeleteHopThuDi')

BEGIN
	Drop Proc sp_SMS_DeleteHopThuDi
End
Go
Create PROC sp_SMS_DeleteHopThuDi
	@ID INT,
	@RESULT INT OUTPUT
AS
BEGIN
	IF EXISTS (SELECT * FROM HopThuDi WHERE ID = @ID)
	BEGIN	
		DELETE FROM HopThuDi  
		WHERE ID = @ID
		SET @RESULT = 1 -- DELETE PAGE SUCCESSFULL !!!!
	END
	ELSE
	BEGIN
		SET  @RESULT = 0 -- DELETE PAGE NOT SUCCESSFULL !!!!
	END
END
