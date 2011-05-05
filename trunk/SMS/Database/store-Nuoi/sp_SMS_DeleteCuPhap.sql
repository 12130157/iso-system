/***********************************************************
* Purpose : Delete Cu Phap
* Author : NGUYEN VAN NUOI
* Date: 9-3-2011
* Description: Delete Loai Cu Phap
*/

IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_SMS_DeleteCuPhap')

BEGIN
	Drop Proc sp_SMS_DeleteCuPhap
End
Go
Create PROC sp_SMS_DeleteCuPhap
	@ID INT
AS
BEGIN
	IF EXISTS (SELECT * FROM CuPhap WHERE ID = @ID)
	BEGIN	
		DELETE FROM CuPhap  
		WHERE ID = @ID
	END

END
