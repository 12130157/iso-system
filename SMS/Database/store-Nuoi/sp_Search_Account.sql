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
		select TK.ID AS 'Ma TK SMS',So_dien_thoai as 'So dien thoai',Ma_sinh_vien as'Ma sinh vien'
		   ,LTK.Ten as 'Ten loai TK SMS',convert(varchar,Ngay_dang_ky , 103) as 'Ngay dang ky',Ghi_chu as'Ghi chu'
			from (TaiKhoanSMS TK inner join LoaiTaiKhoanSMS LTK on TK.Loai_tai_khoan=LTK.ID)
			order by TK.ID desc
	END

	ELSE IF @So_dien_thoai <> '' AND @ma_sinh_vien = ''
	BEGIN
		-- DIEU KIEN 2 ==> SEARCH CUSTOMER NAME

		select TK.ID as 'Ma TK SMS',So_dien_thoai as 'So dien thoai',Ma_sinh_vien as'Ma sinh vien'
		   ,LTK.Ten as 'Ten loai TK SMS',convert(varchar,Ngay_dang_ky , 103) as 'Ngay dang ky',Ghi_chu as'Ghi chu'
			from (TaiKhoanSMS TK inner join LoaiTaiKhoanSMS LTK on TK.Loai_tai_khoan=LTK.ID)
		WHERE So_dien_thoai like '%' + @So_dien_thoai + '%'
		order by TK.ID desc
	END
	ELSE IF @So_dien_thoai = '' AND @ma_sinh_vien <> ''
	BEGIN
		-- DIEU KIEN 3 ==> SEARCH PHONE
		select TK.ID as 'Ma TK SMS',So_dien_thoai as 'So dien thoai',Ma_sinh_vien as'Ma sinh vien'
		   ,LTK.Ten as 'Ten loai TK SMS',convert(varchar,Ngay_dang_ky , 103) as 'Ngay dang ky',Ghi_chu as'Ghi chu'
			from (TaiKhoanSMS TK inner join LoaiTaiKhoanSMS LTK on TK.Loai_tai_khoan=LTK.ID)
		WHERE Ma_sinh_vien = @ma_sinh_vien 
		order by TK.ID desc
	END
	ELSE IF @So_dien_thoai <> '' AND @ma_sinh_vien <> ''
	BEGIN
		-- DIEU KIEN 4 ==> SEARCH CUSTOMER NAME + PHONE
		select TK.ID as 'Ma TK SMS',So_dien_thoai as 'So dien thoai',Ma_sinh_vien as'Ma sinh vien'
		   ,LTK.Ten as 'Ten loai TK SMS',convert(varchar,Ngay_dang_ky , 103) as 'Ngay dang ky',Ghi_chu as'Ghi chu'
			from (TaiKhoanSMS TK inner join LoaiTaiKhoanSMS LTK on TK.Loai_tai_khoan=LTK.ID)
		WHERE  So_dien_thoai like '%' + @So_dien_thoai + '%' 
			AND Ma_sinh_vien = @ma_sinh_vien 
		order by TK.ID desc
	END
END
--select * from TaiKhoanSMS
--exec sp_Search_Account '',4
--select  So_dien_thoai + User1 + User2  as 'So dien thoai',Ngay_dang_ky as 'Ngay dang ky'  from TaiKhoanSMS