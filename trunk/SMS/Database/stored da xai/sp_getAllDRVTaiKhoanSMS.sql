IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllDRVTaiKhoanSMS')

BEGIN
	Drop Proc sp_getAllDRVTaiKhoanSMS
End
Go
Create PROC sp_getAllDRVTaiKhoanSMS

AS

	BEGIN
		select TK.ID,So_dien_thoai as 'Number phone',Ma_sinh_vien as'StudentID'
		   ,LTK.Ten as 'Account Name',Ngay_dang_ky as 'Registrantion Date',Ghi_chu as'Note'
			from (TaiKhoanSMS TK inner join LoaiTaiKhoanSMS LTK on TK.Loai_tai_khoan=LTK.ID)
	END
exec sp_getAllDRVTaiKhoanSMS