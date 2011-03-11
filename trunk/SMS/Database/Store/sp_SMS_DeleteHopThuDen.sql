/***********************************************************
* Purpose : Delete HopThuDen
* Author : NGUYEN VAN NUOI
* Date: 9-3-2011
* Description: Delete HopThuDen
*/

IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_SMS_DeleteHopThuDen')

BEGIN
	Drop Proc sp_SMS_DeleteHopThuDen
End
Go
Create PROC sp_SMS_DeleteHopThuDen
	@ID INT,
	@RESULT INT OUTPUT
AS
BEGIN
	IF EXISTS (SELECT * FROM HopThuDen WHERE ID = @ID)
	BEGIN	
		DELETE FROM HopThuDen  
		WHERE ID = @ID
		SET @RESULT = 1 -- DELETE PAGE SUCCESSFULL !!!!
	END
	ELSE
	BEGIN
		SET  @RESULT = 0 -- DELETE PAGE NOT SUCCESSFULL !!!!
	END
END
