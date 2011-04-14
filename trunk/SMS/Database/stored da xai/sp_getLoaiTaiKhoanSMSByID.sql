IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getLoaiTaiKhoanSMSByID')

BEGIN
	Drop Proc sp_getLoaiTaiKhoanSMSByID
End
Go
Create PROC sp_getLoaiTaiKhoanSMSByID
@id int
AS
begin
	IF EXISTS (select * from LoaiTaiKhoanSMS where ID=@id)
	BEGIN
		select * from LoaiTaiKhoanSMS where ID=@id
	END
end
--exec sp_getLoaiTaiKhoanSMSByID '1'