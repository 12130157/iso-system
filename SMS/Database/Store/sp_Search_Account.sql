IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_Search_Account')
BEGIN
	Drop Proc sp_Search_Account
End
go
CREATE PROC sp_Search_Account
	@So_dien_thoai	varchar(20) ,
	@ma_sinh_vien		int
AS
BEGIN
	IF @So_dien_thoai = '' AND @ma_sinh_vien = ''
	BEGIN
		-- DIEU KIEN 1 ==> SEARCH ALL
		select ID as 'ID', So_dien_thoai as 'Numberphone', Ma_sinh_vien as 'StudentID',Loai_tai_khoan as 'AccountType'
		 ,Ngay_dang_ky 'RegisterDate' from TaiKhoanSMS
	END

	ELSE IF @So_dien_thoai <> '' AND @ma_sinh_vien = ''
	BEGIN
		-- DIEU KIEN 2 ==> SEARCH CUSTOMER NAME

		select ID as 'ID', So_dien_thoai as 'Numberphone', Ma_sinh_vien as 'StudentID',Loai_tai_khoan as 'AccountType'
		 ,Ngay_dang_ky 'RegisterDate' from TaiKhoanSMS
		WHERE So_dien_thoai = @So_dien_thoai 
	END
	ELSE IF @So_dien_thoai = '' AND @
ma_sinh_vien <> ''
	BEGIN
		-- DIEU KIEN 3 ==> SEARCH PHONE
		select ID as 'ID', So_dien_thoai as 'Numberphone', Ma_sinh_vien as 'StudentID',Loai_tai_khoan as 'AccountType'
		 ,Ngay_dang_ky 'RegisterDate' from TaiKhoanSMS
		WHERE  Ma_sinh_vien = @ma_sinh_vien 
	END
	ELSE IF @So_dien_thoai <> '' AND @ma_sinh_vien <> ''
	BEGIN
		-- DIEU KIEN 4 ==> SEARCH CUSTOMER NAME + PHONE
		select ID as 'ID', So_dien_thoai as 'Numberphone', Ma_sinh_vien as 'StudentID',Loai_tai_khoan as 'AccountType'
		 ,Ngay_dang_ky 'RegisterDate' from TaiKhoanSMS
		WHERE So_dien_thoai  = @So_dien_thoai 
			AND Ma_sinh_vien  = @ma_sinh_vien 
	END
END
--select * from TaiKhoanSMS
--exec sp_Search_Account '0934070400',''