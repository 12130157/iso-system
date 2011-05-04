IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllDRVTaiKhoanSMS')

BEGIN
	Drop Proc sp_getAllDRVTaiKhoanSMS
End
Go
Create PROC sp_getAllDRVTaiKhoanSMS

AS

	BEGIN

		select TK.ID as 'Ma TK SMS', Ma_sinh_vien as'Ma sinh vien',So_dien_thoai as 'So dien thoai 1',TK.User1 as 'So dien thoai 2',TK.User2 as 'So dien thoai 3'
		   ,LTK.Ten as 'Ten loai TK', convert(varchar,Ngay_dang_ky , 103) as 'Ngay dang ky',Ghi_chu as'Ghi chu'
			from (TaiKhoanSMS TK inner join LoaiTaiKhoanSMS LTK on TK.Loai_tai_khoan=LTK.ID)
	END
--exec sp_getAllDRVTaiKhoanSMS
--CONVERT(VARCHAR(50), CAST(@dateTimeString AS DATETIME), 121)
--select * from TaiKhoanSMS
--delete from TaiKhoanSMS