
--sp_getAllChiTietTaiKhoanSms.sql
IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllChiTietTaiKhoanSms')

BEGIN
	Drop Proc sp_getAllChiTietTaiKhoanSms
End
Go
Create PROC sp_getAllChiTietTaiKhoanSms
@Ma_tai_khoan_SMS int
AS
begin
	if Exists(select * from ChiTietTaiKhoanSMS where Ma_tai_khoan_SMS=@Ma_tai_khoan_SMS)
	BEGIN
		select ID as 'Ma CTTK SMS', Ma_tai_khoan_SMS as 'Ma TK SMS' ,Dang_ky_thang as 'Dang ky thang',Dang_ky_nam as 'Dang ky nam' from ChiTietTaiKhoanSMS where Ma_tai_khoan_SMS=@Ma_tai_khoan_SMS
	END
end
--select * from ChiTietTaiKhoanSMS
--exec sp_getAllChiTietTaiKhoanSms '1'
GO

--sp_getAllDRVCuPhap.sql
IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllDRVCuPhap')
BEGIN
	Drop Proc sp_getAllDRVCuPhap
End
go

CREATE PROC sp_getAllDRVCuPhap
AS
BEGIN
	 if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'' and Cum_tu_9 <>'' and Cum_tu_10 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 + ' '+ Cum_tu_8 + ' '+Cum_tu_9 +' '+ Cum_tu_10 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'' and Cum_tu_9 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 + ' '+ Cum_tu_8 + ' '+ Cum_tu_9  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 + ' '+ Cum_tu_8 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3  ,Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4<>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3  +' ' + Cum_tu_4 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap',Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3   as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
		END
END

--exec sp_getAllDRVCuPhap1

GO

--sp_getAllDRVCuPhap1.sql


--exec sp_getAllDRVCuPhap

GO

--sp_getAllDRVTaiKhoanSMS.sql
IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllDRVTaiKhoanSMS')

BEGIN
	Drop Proc sp_getAllDRVTaiKhoanSMS
End
Go
Create PROC sp_getAllDRVTaiKhoanSMS

AS

	BEGIN

		select TK.ID as 'Ma TK SMS', Ma_sinh_vien as'Ma sinh vien',So_dien_thoai  as 'So dien thoai'
		   ,LTK.Ten as 'Ten loai TK', convert(varchar,Ngay_dang_ky , 103) as 'Ngay dang ky',Ghi_chu as'Ghi chu'
			from (TaiKhoanSMS TK inner join LoaiTaiKhoanSMS LTK on TK.Loai_tai_khoan=LTK.ID)
			order by TK.ID desc
	END
--exec sp_getAllDRVTaiKhoanSMS
--CONVERT(VARCHAR(50), CAST(@dateTimeString AS DATETIME), 121)
--select * from TaiKhoanSMS
--delete from TaiKhoanSMS
GO

--sp_getAllKeyword1CuPhap.sql
IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllKeyword1CuPhap')

BEGIN
	Drop Proc sp_getAllKeyword1CuPhap
End
Go
Create PROC sp_getAllKeyword1CuPhap
	@Cum_tu_1 Varchar(10)
AS
BEGIN
	IF EXISTS (select * from CuPhap where Cum_tu_1=@Cum_tu_1 )
	BEGIN	
		select Cum_tu_1,Cum_tu_2 from CuPhap where Cum_tu_1=@Cum_tu_1 group by Cum_tu_1, Cum_tu_2
		
	END
END
--
--select * from CuPhap where Cum_tu_1='HVD'
exec sp_getAllKeyword1CuPhap 'Diem'
GO

--sp_getAllLoaiHopThu.sql
IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllLoaiHopThu')

BEGIN
	Drop Proc sp_getAllLoaiHopThu
End
Go
Create PROC sp_getAllLoaiHopThu
AS
	BEGIN
		select ID as 'Ma hop thu', Ten as 'Ten hop thu' ,Ghi_chu as 'Ghi chu'  from LoaiHopThu
	END
--exec sp_getAllLoaiHopThu 

GO

--sp_getAllLoaiTaiKhoanSMS.sql
IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllLoaiTaiKhoanSMS')

BEGIN
	Drop Proc sp_getAllLoaiTaiKhoanSMS
End
Go
Create PROC sp_getAllLoaiTaiKhoanSMS
AS
Begin
		select ID ,Ten ,Phi_dich_vu ,Ghi_chu from LoaiTaiKhoanSMS
END
--exec sp_getAllLoaiTaiKhoanSMS
GO

--sp_getAllLoaiTaiKhoanSMS2.sql
IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllLoaiTaiKhoanSMS2')

BEGIN
	Drop Proc sp_getAllLoaiTaiKhoanSMS2
End
Go
Create PROC sp_getAllLoaiTaiKhoanSMS2
AS
Begin
		select ID as 'Ma hop thu' ,Ten as'Ten hop thu' ,Phi_dich_vu as 'Phi dich vu' ,Ghi_chu as 'Ghi chu' from LoaiTaiKhoanSMS
END
select * from LoaiTaiKhoanSMS
--exec sp_getAllLoaiTaiKhoanSMS2
GO

--sp_getAllTenCuPhap.sql
IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllTenCuPhap')

BEGIN
	Drop Proc sp_getAllTenCuPhap
End
Go
Create PROC sp_getAllTenCuPhap
AS
BEGIN
	select Cum_tu_1 from CuPhap group by Cum_tu_1
END
--
--select * from LoaiHopThu
exec sp_getAllTenCuPhap
GO

--sp_getChiTietTaiKhoanSMSByID.sql
IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getChiTietTaiKhoanSMSByID')

BEGIN
	Drop Proc sp_getChiTietTaiKhoanSMSByID
End
Go
Create PROC sp_getChiTietTaiKhoanSMSByID
@Ma_tai_khoan_SMS int
AS
begin
	if Exists(select * from ChiTietTaiKhoanSMS where ID=@Ma_tai_khoan_SMS)
	BEGIN
		select * from ChiTietTaiKhoanSMS where ID=@Ma_tai_khoan_SMS
	END
end
--select * from ChiTietTaiKhoanSMS
--exec sp_getChiTietTaiKhoanSMSByID '0'
GO

--sp_getCuPhapByID.sql
IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getCuPhapByID')

BEGIN
	Drop Proc sp_getCuPhapByID
End
Go
Create PROC sp_getCuPhapByID
@id int
AS
begin
	IF EXISTS (select * from CuPhap where ID=@id )
	BEGIN
		select ID, Ten, Cum_tu_1,Cum_tu_2,Cum_tu_3,Cum_tu_4,Cum_tu_5
			   ,Cum_tu_6,Cum_tu_7,Cum_tu_8,Cum_tu_9,Cum_tu_10,
			   Ghi_chu from CuPhap where ID=@id
	END
end
--
--select * from LoaiHopThu
exec sp_getCuPhapByID '1'
GO

--sp_getLoaiHopThuByID.sql
IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getLoaiHopThuByID')

BEGIN
	Drop Proc sp_getLoaiHopThuByID
End
Go
Create PROC sp_getLoaiHopThuByID
	@ID INT
AS
BEGIN
	IF EXISTS (SELECT * FROM LoaiHopThu WHERE ID = @ID)
	BEGIN	
		SELECT * FROM LoaiHopThu  
		WHERE ID = @ID
		
	END
END
--
--select * from LoaiHopThu
--exec sp_getLoaiHopThuByID '1'
GO

--sp_getLoaiTaiKhoanSMSByID.sql
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
GO

--sp_getTaiKhoanSMSByID.sql
IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getTaiKhoanSMSByID')

BEGIN
	Drop Proc sp_getTaiKhoanSMSByID
End
Go
Create PROC sp_getTaiKhoanSMSByID
@Ma_tai_khoan_SMS int
AS
begin
	IF EXISTS (select * from TaiKhoanSMS where ID=@Ma_tai_khoan_SMS)
	BEGIN
		select * from TaiKhoanSMS where ID=@Ma_tai_khoan_SMS
	END
end
--exec sp_getTaiKhoanSMSByID '1'
GO

--sp_getTaiKhoanSMSBySDT_MSV.sql
IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getTaiKhoanSMSBySDT_MSV')

BEGIN
	Drop Proc sp_getTaiKhoanSMSBySDT_MSV
End
Go
Create PROC sp_getTaiKhoanSMSBySDT_MSV
@so_Dien_Thoai int,
@Ma_tai_khoan_SMS int
AS
begin
	IF EXISTS (select * from TaiKhoanSMS where So_dien_thoai=@so_Dien_Thoai and Ma_sinh_vien=@Ma_tai_khoan_SMS)
	BEGIN
		select * from TaiKhoanSMS where So_dien_thoai=@so_Dien_Thoai and Ma_sinh_vien=@Ma_tai_khoan_SMS
	END
end
--exec sp_getTaiKhoanSMSBySDT_MSV '0934070401', 1

--select * from TaiKhoanSMS
GO

--sp_SearchNane_LoaiHopThu.sql
IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_SearchNane_LoaiHopThu')
BEGIN
	Drop Proc sp_SearchNane_LoaiHopThu
End
go
CREATE PROC sp_SearchNane_LoaiHopThu
	@Ten	varchar(40) 
	
AS
BEGIN
	IF @Ten = ''
	BEGIN
		-- DIEU KIEN 1 ==> SEARCH ALL
		select ID as 'Ma hop thu', Ten as 'Ten hop thu' ,Ghi_chu as 'Ghi chu'  from LoaiHopThu
	END

	ELSE IF @Ten <> ''
	BEGIN
		-- DIEU KIEN 2 ==> SEARCH CUSTOMER NAME

		select ID as 'Ma hop thu', Ten as 'Ten hop thu' ,Ghi_chu as 'Ghi chu'  from LoaiHopThu
		WHERE Ten LIKE '%' +@Ten + '%'
	END
	
END
--select * from TaiKhoanSMS
--exec sp_SearchNane_LoaiHopThu 'hop thu'
GO

--sp_Search_Account.sql
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
GO

--sp_Search_KeywordName.sql
IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_Search_KeyworkName')
BEGIN
	Drop Proc sp_Search_KeyworkName
End
go
CREATE PROC sp_Search_KeyworkName
	@Cum_tu_1		VARCHAR(10) ,
	@Cum_tu_2	NVARCHAR(10)
AS
BEGIN
	IF @Cum_tu_1 = '' AND @Cum_tu_2 = ''
	BEGIN
		-- DIEU KIEN 1 ==> SEARCH ALL
		exec sp_getAllDRVCuPhap
	END

	ELSE IF @Cum_tu_1 <> '' AND @Cum_tu_2 = ''
	BEGIN
		-- DIEU KIEN 2 ==> SEARCH CUSTOMER NAME
		
		if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'' and Cum_tu_9 <>'' and Cum_tu_10 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5' ,Cum_tu_6 as 'Cu phap 6'
			 ,Cum_tu_7 as 'Cu phap 7',Cum_tu_8 as 'Cu phap 8',Cum_tu_9 as 'Cu phap 9', Cum_tu_10 as 'Cu phap 10'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'' and Cum_tu_9 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5' ,Cum_tu_6 as 'Cu phap 6'
			 ,Cum_tu_7 as 'Cu phap 7',Cum_tu_8 as 'Cu phap 8',Cum_tu_9 as 'Cu phap 9'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5' ,Cum_tu_6 as 'Cu phap 6'
			 ,Cum_tu_7 as 'Cu phap 7',Cum_tu_8 as 'Cu phap 8'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5' ,Cum_tu_6 as 'Cu phap 6'
			 ,Cum_tu_7 as 'Cu phap 7'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5' ,Cum_tu_6 as 'Cu phap 6'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4<>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap 
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
		
------------
	END
	ELSE IF @Cum_tu_1 = '' AND @Cum_tu_2 <> ''
	BEGIN
		-- DIEU KIEN 3 ==> SEARCH PHONE
		if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'' and Cum_tu_9 <>'' and Cum_tu_10 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5' ,Cum_tu_6 as 'Cu phap 6'
			 ,Cum_tu_7 as 'Cu phap 7',Cum_tu_8 as 'Cu phap 8',Cum_tu_9 as 'Cu phap 9', Cum_tu_10 as 'Cu phap 10'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'' and Cum_tu_9 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5' ,Cum_tu_6 as 'Cu phap 6'
			 ,Cum_tu_7 as 'Cu phap 7',Cum_tu_8 as 'Cu phap 8',Cum_tu_9 as 'Cu phap 9'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5' ,Cum_tu_6 as 'Cu phap 6'
			 ,Cum_tu_7 as 'Cu phap 7',Cum_tu_8 as 'Cu phap 8'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5' ,Cum_tu_6 as 'Cu phap 6'
			 ,Cum_tu_7 as 'Cu phap 7'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5' ,Cum_tu_6 as 'Cu phap 6'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4<>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
		
	END
---------------
	ELSE IF @Cum_tu_1 <> '' AND @Cum_tu_2 <> ''
	BEGIN
		-- DIEU KIEN 4 ==> SEARCH CUSTOMER NAME + PHONE
		if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'' and Cum_tu_9 <>'' and Cum_tu_10 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5' ,Cum_tu_6 as 'Cu phap 6'
			 ,Cum_tu_7 as 'Cu phap 7',Cum_tu_8 as 'Cu phap 8',Cum_tu_9 as 'Cu phap 9', Cum_tu_10 as 'Cu phap 10'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'' and Cum_tu_9 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5' ,Cum_tu_6 as 'Cu phap 6'
			 ,Cum_tu_7 as 'Cu phap 7',Cum_tu_8 as 'Cu phap 8',Cum_tu_9 as 'Cu phap 9'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5' ,Cum_tu_6 as 'Cu phap 6'
			 ,Cum_tu_7 as 'Cu phap 7',Cum_tu_8 as 'Cu phap 8'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5' ,Cum_tu_6 as 'Cu phap 6'
			 ,Cum_tu_7 as 'Cu phap 7'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5' ,Cum_tu_6 as 'Cu phap 6'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4<>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	END
-------
END
--select * from CuPhap
--exec sp_Search_KeyworkName '',''
GO

--sp_Search_KeyworkName.sql
IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_Search_KeyworkName')
BEGIN
	Drop Proc sp_Search_KeyworkName
End
go
CREATE PROC sp_Search_KeyworkName
	@Cum_tu_1		VARCHAR(10) ,
	@Cum_tu_2	NVARCHAR(10)
AS
BEGIN
	IF @Cum_tu_1 = 'All' AND @Cum_tu_2 = 'All'
	BEGIN
		-- DIEU KIEN 1 ==> SEARCH ALL
		exec sp_getAllDRVCuPhap
	END

	ELSE IF @Cum_tu_1 <> 'All' AND @Cum_tu_2 = 'All'
	BEGIN
		-- DIEU KIEN 2 ==> SEARCH CUSTOMER NAME
		
		if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'' and Cum_tu_9 <>'' and Cum_tu_10 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 + ' '+ Cum_tu_8 + ' '+Cum_tu_9 +' '+ Cum_tu_10 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'' and Cum_tu_9 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 + ' '+ Cum_tu_8 + ' '+Cum_tu_9  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 + ' '+ Cum_tu_8 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3  + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+Cum_tu_4 + ' '+ Cum_tu_5  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4<>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4   as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap 
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
		
------------
	END
	ELSE IF @Cum_tu_1 = 'All' AND @Cum_tu_2 <> 'All'
	BEGIN
		-- DIEU KIEN 3 ==> SEARCH PHONE
		if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'' and Cum_tu_9 <>'' and Cum_tu_10 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3  + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 + ' '+ Cum_tu_8 + ' '+Cum_tu_9 +' '+ Cum_tu_10 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'' and Cum_tu_9 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 + ' '+ Cum_tu_8 + ' '+Cum_tu_9  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3  + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 + ' '+ Cum_tu_8 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3  + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7   as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3  ,Cum_tu_4 + ' '+ Cum_tu_5  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4<>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3  + ' ' + Cum_tu_4 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1   as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
		
	END
---------------
	ELSE IF @Cum_tu_1 <> 'All' AND @Cum_tu_2 <> 'All'
	BEGIN
		-- DIEU KIEN 4 ==> SEARCH CUSTOMER NAME + PHONE
		if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'' and Cum_tu_9 <>'' and Cum_tu_10 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 + ' '+ Cum_tu_8 + ' '+Cum_tu_9 +' '+ Cum_tu_10 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'' and Cum_tu_9 <>'')
		BEGIN
				select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 + ' '+ Cum_tu_8 + ' '+Cum_tu_9 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'')
		BEGIN
				select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 + ' '+ Cum_tu_8 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'')
		BEGIN
				select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>'')
		BEGIN
				select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>'')
		BEGIN
				select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4<>'')
		BEGIN
				select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'')
		BEGIN
				select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'')
		BEGIN
				select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2 as 'Cu Phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'')
		BEGIN
				select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	END
-------
END
--select * from CuPhap
--exec sp_Search_KeyworkName '',''
GO

--sp_SMS_DeleteAllChiTietTaiKhoanSMS.sql
IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_SMS_DeleteAllChiTietTaiKhoanSMS')

BEGIN
	Drop Proc sp_SMS_DeleteAllChiTietTaiKhoanSMS
End
Go
Create PROC sp_SMS_DeleteAllChiTietTaiKhoanSMS
	@Ma_tai_khoan_SMS INT
AS
BEGIN
	IF EXISTS (SELECT * FROM ChiTietTaiKhoanSMS WHERE Ma_tai_khoan_SMS = @Ma_tai_khoan_SMS)
	BEGIN	
		DELETE FROM ChiTietTaiKhoanSMS  
		WHERE Ma_tai_khoan_SMS = @Ma_tai_khoan_SMS
		
	END
END
--
--select * from ChiTietTaiKhoanSMS
GO

--sp_SMS_DeleteChiTietTaiKhoanSMS.sql
/***********************************************************
* Purpose : Delete ChiTietTaiKhoanSMS
* Author : NGUYEN VAN NUOI
* Date: 9-3-2011
* Description: Delete ChiTietTaiKhoanSMS
*/

IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_SMS_DeleteChiTietTaiKhoanSMS')

BEGIN
	Drop Proc sp_SMS_DeleteChiTietTaiKhoanSMS
End
Go
Create PROC sp_SMS_DeleteChiTietTaiKhoanSMS
	@ID INT
AS
BEGIN
	IF EXISTS (SELECT * FROM ChiTietTaiKhoanSMS WHERE ID = @ID)
	BEGIN	
		DELETE FROM ChiTietTaiKhoanSMS  
		WHERE ID = @ID
	END
END

GO

--sp_SMS_DeleteCuPhap.sql
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

GO

--sp_SMS_DeleteLoaiHopThu.sql
IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_SMS_DeleteLoaiHopThu')

BEGIN
	Drop Proc sp_SMS_DeleteLoaiHopThu
End
Go
Create PROC sp_SMS_DeleteLoaiHopThu
	@ID INT
AS
BEGIN
	IF EXISTS (SELECT * FROM LoaiHopThu WHERE ID = @ID)
	BEGIN	
		DELETE FROM LoaiHopThu  
		WHERE ID = @ID
	END

END
GO

--sp_SMS_DeleteLoaiTaiKhoanSMS.sql
/***********************************************************
* Purpose : Delete LoaiTaiKhoanSMS
* Author : NGUYEN VAN NUOI
* Date: 9-3-2011
* Description: Delete LoaiTaiKhoanSMS
*/

IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_SMS_DeleteLoaiTaiKhoanSMS')

BEGIN
	Drop Proc sp_SMS_DeleteLoaiTaiKhoanSMS
End
Go
Create PROC sp_SMS_DeleteLoaiTaiKhoanSMS
	@ID INT
AS
BEGIN
	IF EXISTS (SELECT * FROM LoaiTaiKhoanSMS WHERE ID = @ID)
	BEGIN	
		DELETE FROM LoaiTaiKhoanSMS  
		WHERE ID = @ID
	END
END

GO

--sp_SMS_DeleteTaiKhoanSMS.sql
/***********************************************************
* Purpose : Delete TaiKhoanSMS
* Author : NGUYEN VAN NUOI
* Date: 9-3-2011
* Description: Delete TaiKhoanSMS
*/

IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_SMS_DeleteTaiKhoanSMS')

BEGIN
	Drop Proc sp_SMS_DeleteTaiKhoanSMS
End
Go
Create PROC sp_SMS_DeleteTaiKhoanSMS
	@ID INT
AS
BEGIN
	IF EXISTS (SELECT * FROM TaiKhoanSMS WHERE ID = @ID)
	BEGIN	
		DELETE FROM TaiKhoanSMS  
		WHERE ID = @ID
	END
END
 
GO

--sp_SMS_InertChiTietTaiKhoan.sql
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_InertChiTietTaiKhoan' ) 
BEGIN
	DROP PROC sp_SMS_InertChiTietTaiKhoan
END
GO
CREATE PROC sp_SMS_InertChiTietTaiKhoan
	@Ma_tai_khoan_SMS		int,
	@Dang_ky_thang			int,
	@Dang_ky_nam			int,
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(100),
	@User2					varchar(100),
	@User3					varchar(100), 
	@User4					varchar(100),
	@User5					varchar(100)	
	
AS 
BEGIN
	SELECT	@Ngay_cap_nhat_cuoi = GETDATE()
	INSERT INTO ChiTietTaiKhoanSMS 
	VALUES (@Ma_tai_khoan_SMS,
			@Dang_ky_thang,
			@Dang_ky_nam,
			@Ngay_cap_nhat_cuoi,
			@User1,
			@User2,
			@User3,
			@User4,
			@User5)
END 
GO

--sp_SMS_InertLoaiHopThu.sql

/***********************************************************
* Purpose : INSERT loai hop thu
* Author : NGUYEN VAN NUOI
* Date:8-3-2011
* Description: INSERT loai hop thu
*/

IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_InertLoaiHopThu' ) 
BEGIN
	DROP PROC sp_SMS_InertLoaiHopThu
END
GO
CREATE PROC sp_SMS_InertLoaiHopThu
	@Ten					nvarchar(40),
	@Ghi_chu				nvarchar(500),
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(100),
	@User2					varchar(100),
	@User3					varchar(100), 
	@User4					varchar(100),
	@User5					varchar(100)	
	
AS 
BEGIN
	SELECT	@Ngay_cap_nhat_cuoi = GETDATE()
	INSERT INTO LoaiHopThu 
	VALUES (@Ten,
			@Ghi_chu,
			@Ngay_cap_nhat_cuoi,
			@User1,
			@User2,
			@User3,
			@User4,
			@User5)
END 
GO

--sp_SMS_InertLoaiTaiKhoanSMS.sql

/***********************************************************
* Purpose : INSERT LoaiTaiKhoanSMS
* Author : NGUYEN VAN NUOI
* Date: 9-3-2011
* Description: INSERT LoaiTaiKhoanSMS
*/

IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_InertLoaiTaiKhoanSMS' ) 
BEGIN
	DROP PROC sp_SMS_InertLoaiTaiKhoanSMS
END
GO
CREATE PROC sp_SMS_InertLoaiTaiKhoanSMS
	@Ten					nvarchar(40),
	@Phi_dich_vu			float,
	@Ghi_chu				nvarchar(100),
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(100),
	@User2					varchar(100),
	@User3					varchar(100), 
	@User4					varchar(100),
	@User5					varchar(100)	
	
AS 
BEGIN
	SELECT	@Ngay_cap_nhat_cuoi = GETDATE()
	INSERT INTO LoaiTaiKhoanSMS 
	VALUES (@Ten,
			@Phi_dich_vu,
			@Ghi_chu,
			@Ngay_cap_nhat_cuoi,
			@User1,
			@User2,
			@User3,
			@User4,
			@User5)
END 
GO

--sp_SMS_InertTaiKhoanSMS.sql

/***********************************************************
* Purpose : INSERT Tai Khoan SMS
* Author : NGUYEN VAN NUOI
* Date: 9-3-2011
* Description: INSERT Tai Khoan SMS
*/

IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_InertTaiKhoanSMS' ) 
BEGIN
	DROP PROC sp_SMS_InertTaiKhoanSMS
END
GO
CREATE PROC sp_SMS_InertTaiKhoanSMS
	@So_dien_thoai			varchar(20),
	@Ma_sinh_vien			int,
	@Loai_tai_khoan			int,
	@Ngay_dang_ky			datetime,
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(100),
	@User2					varchar(100),
	@User3					varchar(100), 
	@User4					varchar(100),
	@User5					varchar(100)
	
AS 
BEGIN
			SELECT	@Ngay_cap_nhat_cuoi = GETDATE()
			INSERT INTO TaiKhoanSMS 
			VALUES (@So_dien_thoai,
					@Ma_sinh_vien,
					@Loai_tai_khoan,
					@Ngay_dang_ky,
					@Ngay_cap_nhat_cuoi,
					@User1,
					@User2,
					@User3,
					@User4,
					@User5)
end
GO

--sp_SMS_INSERTCUPHAP.sql
/***********************************************************
* Purpose : INSERT CUPHAP
* Author : Nguyen Chi Tam
* Date: 28-2-2010
* Description: THEM 1 CU PHAP VAO CuPhap.dbo
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_InertCuPhap' ) 
BEGIN
	DROP PROC sp_SMS_InertCuPhap
END
GO
CREATE PROC sp_SMS_InertCuPhap
	@Ten					nvarchar(500),
	@Cum_tu_1				varchar(10),
	@Cum_tu_2				varchar(10),
	@Cum_tu_3				varchar(10),
	@Cum_tu_4				varchar(10),
	@Cum_tu_5				varchar(10),
	@Cum_tu_6				varchar(10),
	@Cum_tu_7				varchar(10),
	@Cum_tu_8				varchar(10),
	@Cum_tu_9				varchar(10),
	@Cum_tu_10				varchar(10),
	@Ghi_chu				nvarchar(500),
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(100),
	@User2					varchar(100),
	@User3					varchar(100),
	@User4					varchar(100),
	@User5					varchar(100)	
	
AS 
BEGIN
	SELECT	@Ngay_cap_nhat_cuoi = GETDATE()
	INSERT INTO CuPhap 
	VALUES (@Ten,
			@Cum_tu_1,
			@Cum_tu_2,
			@Cum_tu_3,
			@Cum_tu_4,
			@Cum_tu_5,
			@Cum_tu_6,
			@Cum_tu_7,
			@Cum_tu_8,
			@Cum_tu_9,
			@Cum_tu_10,
			@Ghi_chu,
			@Ngay_cap_nhat_cuoi,
			@User1,
			@User2,
			@User3,
			@User4,
			@User5)
END 
GO

--sp_SMS_INSERT_CHITIETTAIKHOAN.sql
/***********************************************************
* Purpose : INSERT CHI TIET TAI KHOAN
* Author : NGUYEN VAN NUOI
* Date: 28-2-2011
* Description: INSERT CU PHAP
*/


GO

--sp_SMS_UpdateChiTietTaiKhoanByID.sql
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_UpdateChiTietTaiKhoanByID' ) 
BEGIN
	DROP PROC sp_SMS_UpdateChiTietTaiKhoanByID
END
GO
CREATE PROC sp_SMS_UpdateChiTietTaiKhoanByID
	@ID						int,
	@Ma_tai_khoan_SMS		int,
	@Dang_ky_thang			int,
	@Dang_ky_nam			int,
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(100),
	@User2					varchar(100),
	@User3					varchar(100),
	@User4					varchar(100),
	@User5					varchar(100)	
AS
BEGIN
	SELECT @Ngay_cap_nhat_cuoi = GETDATE()
	IF EXISTS ( SELECT * FROM ChiTietTaiKhoanSMS WHERE ID = @ID )
	BEGIN
		UPDATE ChiTietTaiKhoanSMS
		SET
			Ma_tai_khoan_SMS	=	@Ma_tai_khoan_SMS,
			Dang_ky_thang		=	@Dang_ky_thang,
			Dang_ky_nam			=	@Dang_ky_nam,
			Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi,
			User1				=	@User1,
			User2				=	@User2,
			User3				=	@User3,
			User4				=	@User4,
			User5				=	@User5
		WHERE ID = @ID
	END
END 
GO

--sp_SMS_UPDATECUPHAP.sql
/***********************************************************
* Purpose : UPDATE CU PHAP
* Author : NGUYEN CHI TAM
* Date: 28-2-2011
* Description: UPDATE CU PHAP
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_UpdateCuPhapByID' ) 
BEGIN
	DROP PROC sp_SMS_UpdateCuPhapByID
END
GO
CREATE PROC sp_SMS_UpdateCuPhapByID
	@ID						int,
	@Ten					nvarchar(40),
	@Cum_tu_1				varchar(10),
	@Cum_tu_2				varchar(10),
	@Cum_tu_3				varchar(10),
	@Cum_tu_4				varchar(10),
	@Cum_tu_5				varchar(10),
	@Cum_tu_6				varchar(10),
	@Cum_tu_7				varchar(10),
	@Cum_tu_8				varchar(10),
	@Cum_tu_9				varchar(10),
	@Cum_tu_10				varchar(10),
	@Ghi_chu				nvarchar(500),
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(100),
	@User2					varchar(100),
	@User3					varchar(100),
	@User4					varchar(100),
	@User5					varchar(100)
AS
BEGIN
	SELECT @Ngay_cap_nhat_cuoi = GETDATE()
	IF EXISTS ( SELECT * FROM CuPhap WHERE ID = @ID )
	BEGIN
		UPDATE CuPhap
		SET	Ten = @Ten,
			Cum_tu_1 = @Cum_tu_1,
			Cum_tu_2 = @Cum_tu_2,
			Cum_tu_3 = @Cum_tu_3,
			Cum_tu_4 = @Cum_tu_4,
			Cum_tu_5 = @Cum_tu_5,
			Cum_tu_6 = @Cum_tu_6,
			Cum_tu_7 = @Cum_tu_7,
			Cum_tu_8 = @Cum_tu_8,
			Cum_tu_9 = @Cum_tu_9,
			Cum_tu_10 = @Cum_tu_10,
			Ghi_chu = @Ghi_chu,
			Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi,
			User1 = @User1,
			User2 = @User2,
			User3 = @User3,
			User4 = @User4,
			User5 = @User5
		WHERE ID = @ID
	END
END 
GO

--sp_SMS_UpdateCuPhapByID.sql
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_UpdateCuPhapByID' ) 
BEGIN
	DROP PROC sp_SMS_UpdateCuPhapByID
END
GO
CREATE PROC sp_SMS_UpdateCuPhapByID
	@ID						int,
	@Ten					nvarchar(500),
	@Cum_tu_1				varchar(10),
	@Cum_tu_2				varchar(10),
	@Cum_tu_3				varchar(10),
	@Cum_tu_4				varchar(10),
	@Cum_tu_5				varchar(10),
	@Cum_tu_6				varchar(10),
	@Cum_tu_7				varchar(10),
	@Cum_tu_8				varchar(10),
	@Cum_tu_9				varchar(10),
	@Cum_tu_10				varchar(10),
	@Ghi_chu				nvarchar(500),
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(100),
	@User2					varchar(100),
	@User3					varchar(100),
	@User4					varchar(100),
	@User5					varchar(100)
AS
BEGIN
	SELECT @Ngay_cap_nhat_cuoi = GETDATE()
	IF EXISTS ( SELECT * FROM CuPhap WHERE ID = @ID )
	BEGIN
		UPDATE CuPhap
		SET	Ten = @Ten,
			Cum_tu_1 = @Cum_tu_1,
			Cum_tu_2 = @Cum_tu_2,
			Cum_tu_3 = @Cum_tu_3,
			Cum_tu_4 = @Cum_tu_4,
			Cum_tu_5 = @Cum_tu_5,
			Cum_tu_6 = @Cum_tu_6,
			Cum_tu_7 = @Cum_tu_7,
			Cum_tu_8 = @Cum_tu_8,
			Cum_tu_9 = @Cum_tu_9,
			Cum_tu_10 = @Cum_tu_10,
			Ghi_chu = @Ghi_chu,
			Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi,
			User1 = @User1,
			User2 = @User2,
			User3 = @User3,
			User4 = @User4,
			User5 = @User5
		WHERE ID = @ID
	END
END 
GO

--sp_SMS_UpdateLoaiHopThu.sql
/***********************************************************
* Purpose : UPDATE LOAIHOPTHUDEN
* Author : NGUYEN VAN NUOI
* Date: 8-3-2011
* Description: UPDATE LOAIHOPTHUDEN
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_UpdateLoaiHopThuByID' ) 
BEGIN
	DROP PROC sp_SMS_UpdateLoaiHopThuByID
END
GO
CREATE PROC sp_SMS_UpdateLoaiHopThuByID
	@ID						int,
	@Ten					nvarchar(40),
	@Ghi_chu				nvarchar(500),
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(100),
	@User2					varchar(100),
	@User3					varchar(100), 
	@User4					varchar(100),
	@User5					varchar(100)	
AS
BEGIN 
	SELECT @Ngay_cap_nhat_cuoi = GETDATE()
	IF EXISTS ( SELECT * FROM LoaiHopThu WHERE ID = @ID )
	BEGIN
		UPDATE LoaiHopThu
		SET
			Ten					=	@Ten,
			Ghi_chu				=	@Ghi_chu,
			Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi,
			User1				=	@User1,
			User2				=	@User2,
			User3				=	@User3,
			User4				=	@User4,
			User5				=	@User5
		WHERE ID = @ID
	END
END 
GO

--sp_SMS_UpdateLoaiTaiKhoanSMSByID.sql
/***********************************************************
* Purpose : UPDATE LoaiTaiKhoanSMS
* Author : NGUYEN VAN NUOI
* Date: 8-3-2011
* Description: UPDATE LoaiTaiKhoanSMS
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_UpdateLoaiTaiKhoanSMSByID' ) 
BEGIN
	DROP PROC sp_SMS_UpdateLoaiTaiKhoanSMSByID
END
GO
CREATE PROC sp_SMS_UpdateLoaiTaiKhoanSMSByID
	@ID						int,
	@Ten					nvarchar(40),
	@Phi_dich_vu			float,
	@Ghi_chu				nvarchar(500),
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(100),
	@User2					varchar(100),
	@User3					varchar(100), 
	@User4					varchar(100),
	@User5					varchar(100)	

AS
BEGIN 
	SELECT @Ngay_cap_nhat_cuoi = GETDATE()
	IF EXISTS ( SELECT * FROM LoaiTaiKhoanSMS WHERE ID = @ID )
	BEGIN
		UPDATE LoaiTaiKhoanSMS
		SET
			Ten					=	@Ten,
			Phi_dich_vu			=	@Phi_dich_vu,
			Ghi_chu				=	@Ghi_chu,
			Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi,
			User1				=	@User1,
			User2				=	@User2,
			User3				=	@User3,
			User4				=	@User4,
			User5				=	@User5
		WHERE ID = @ID
	END
END 

--select * from LoaiTaiKhoanSMS
--exec sp_SMS_UpdateLoaiTaiKhoanSMSByID 1,'DK_3_Ngay',50000,'Dang ky theo tuan (nhan thong tin theo tuan)',getdate(),'','','','',''
GO

--sp_SMS_UpdateTaiKhoanSMSByID.sql
/***********************************************************
* Purpose : UPDATE Tai Khoan SMS
* Author : NGUYEN VAN NUOI
* Date: 8-3-2011
* Description: UPDATE Tai Khoan SMS
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_UpdateTaiKhoanSMSByID' ) 
BEGIN
	DROP PROC sp_SMS_UpdateTaiKhoanSMSByID
END
GO
CREATE PROC sp_SMS_UpdateTaiKhoanSMSByID
	@ID						int,
	@So_dien_thoai			varchar(20),
	@Ma_sinh_vien			int,
	@Loai_tai_khoan			int,
	@Ngay_dang_ky			datetime,
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(100),
	@User2					varchar(100),
	@User3					varchar(100), 
	@User4					varchar(100),
	@User5					varchar(100)

AS
BEGIN 
	SELECT @Ngay_cap_nhat_cuoi = GETDATE()
	IF EXISTS ( SELECT * FROM TaiKhoanSMS WHERE ID = @ID )
	BEGIN
		UPDATE TaiKhoanSMS
		SET
			So_dien_thoai		=	@So_dien_thoai,
			Ma_sinh_vien		=	@Ma_sinh_vien,
			Loai_tai_khoan		=	@Loai_tai_khoan,
			Ngay_dang_ky		=	@Ngay_dang_ky,
			Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi,
			User1				=	@User1,
			User2				=	@User2,
			User3				=	@User3,
			User4				=	@User4,
			User5				=	@User5
		WHERE ID = @ID
	END
END 
GO

--sp_SMS_UPDATE_CHITIETTAIKHOAN.sql
/***********************************************************
* Purpose : UPDATE CHI TIET TAI KHOAN
* Author : NGUYEN VAN NUOI
* Date: 8-3-2011
* Description: UPDATE CHI TIET TAI KHOAN
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_UpdateChiTietTaiKhoanByID' ) 
BEGIN
	DROP PROC sp_SMS_UpdateChiTietTaiKhoanByID
END
GO
CREATE PROC sp_SMS_UpdateChiTietTaiKhoanByID
	@ID						int,
	@Ma_tai_khoan_SMS		int,
	@Dang_ky_thang			int,
	@Dang_ky_nam			int,
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)	
AS
BEGIN
	SELECT @Ngay_cap_nhat_cuoi = GETDATE()
	IF EXISTS ( SELECT * FROM ChiTietTaiKhoanSMS WHERE ID = @ID )
	BEGIN
		UPDATE ChiTietTaiKhoanSMS
		SET
			Ma_tai_khoan_SMS	=	@Ma_tai_khoan_SMS,
			Dang_ky_thang		=	@Dang_ky_thang,
			Dang_ky_nam			=	@Dang_ky_nam,
			Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi,
			User1				=	@User1,
			User2				=	@User2,
			User3				=	@User3,
			User4				=	@User4,
			User5				=	@User5
		WHERE ID = @ID
	END
END 
GO
