/***********************************************************
* Purpose : Delete Loai tin nhan
* Author : NGUYEN VAN NUOI
* Date: 9-3-2011
* Description: Delete Loai tin nhan
*/

IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_SMS_DeleteLoaiTinNhan')

BEGIN
	Drop Proc sp_SMS_DeleteLoaiTinNhan
End
Go
Create PROC sp_SMS_DeleteLoaiTinNhan
	@ID INT,
	@RESULT INT OUTPUT
AS
BEGIN
	IF EXISTS (SELECT * FROM LoaiTinNhan WHERE ID = @ID)
	BEGIN	
		DELETE FROM LoaiTinNhan  
		WHERE ID = @ID
		SET @RESULT = 1 -- DELETE PAGE SUCCESSFULL !!!!
	END
	ELSE
	BEGIN
		SET  @RESULT = 0 -- DELETE PAGE NOT SUCCESSFULL !!!!
	END
END
