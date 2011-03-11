/***********************************************************
* Purpose : Delete ChiTietTinNhanTuDong
* Author : NGUYEN VAN NUOI
* Date: 9-3-2011
* Description: Delete ChiTietTinNhanTuDong
*/

IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_SMS_DeleteChiTietTinNhanTuDong')

BEGIN
	Drop Proc sp_SMS_DeleteChiTietTinNhanTuDong
End
Go
Create PROC sp_SMS_DeleteChiTietTinNhanTuDong
	@ID INT,
	@RESULT INT OUTPUT
AS
BEGIN
	IF EXISTS (SELECT * FROM ChiTietTinNhanTuDong WHERE ID = @ID)
	BEGIN	
		DELETE FROM ChiTietTinNhanTuDong  
		WHERE ID = @ID
		SET @RESULT = 1 -- DELETE PAGE SUCCESSFULL !!!!
	END
	ELSE
	BEGIN
		SET  @RESULT = 0 -- DELETE PAGE NOT SUCCESSFULL !!!!
	END
END
