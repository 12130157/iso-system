if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DiemDanh_GetHocSinhByDieuKien]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].sp_DiemDanh_GetHocSinhByDieuKien
GO
CREATE PROCEDURE sp_DiemDanh_GetHocSinhByDieuKien
	@Khoa			varchar(30),
	@Lop			varchar(10),
	@NamHoc			varchar(10),
	@GiaoVien		varchar(20),
	@MonHoc			varchar(30),
	@ThoiGian		varchar(10)
	--@TinhTrang		varchar(10)
AS
BEGIN
	DECLARE @sql NVarchar(2000)
	declare @Dieu_Kien_Khoa			nvarchar(100)
	declare @Dieu_Kien_Lop			nvarchar(100)
	declare @Dien_Kien_Nam_Hoc		nvarchar(100)
	declare @Dieu_Kien_Giao_Vien		nvarchar(100)
	declare @Dieu_Kien_Mon_Hoc		nvarchar(100)
	declare @Dieu_Kien_Thoi_Gian		nvarchar(200)
	declare @Dieu_Kien_Tinh_Trang		nvarchar(100)
	DECLARE @And nvarchar(5)
	DECLARE @Where nvarchar(7)
	set @Dieu_Kien_Thoi_Gian = ' ''t'' = ''t'' '
	set @Dieu_Kien_Tinh_Trang = ' ''t'' = ''t'' '
	SET @And = ' AND '
	SET @Where = ' WHERE '
	if(@Khoa <> '')
	BEGIN
		SET @Dieu_Kien_Khoa = ' F.ID = ' + @Khoa
	END
	if(@Lop <> '')
	BEGIN
		SET @Dieu_Kien_Lop = 'd.id =' + @Lop
	END
	if(@NamHoc <> '')
	BEGIN
		SET @Dien_Kien_Nam_Hoc = ' A.User1 = ' + @NamHoc
	END
	if(@GiaoVien<>'')
	Begin
		SET @Dieu_Kien_Giao_Vien = 'j.id =' + @GiaoVien
	END
	if(@MonHoc <> '')
	BEGIN
		SET @Dieu_Kien_Mon_Hoc = ' B.Ma_mon_hoc = ' + @MonHoc
	END
	if(@ThoiGian <> '')
	BEGIN
		if(Cast(@ThoiGian AS Int) < 61)
		BEGIN
			SET @Dieu_Kien_Thoi_Gian = ' A.Tuan = ' + @ThoiGian
		END
		if(Cast(@ThoiGian AS Int) < 81 AND Cast(@ThoiGian AS Int) > 60)
		BEGIN
			SET @Dieu_Kien_Thoi_Gian = ' Datepart(mm, A.Ngay_hoc) = ' + Cast(Cast(@ThoiGian AS Int) - 60 AS varchar) 
			print @Dieu_Kien_Thoi_Gian
		END
	END
	SELECT @sql = '
	SELECT K.KI_HIEU AS TENLOP,(H.HO+' '+H.TEN_LOT+' '+H.TEN) AS TENGIAOVIEN,J.TEN_MON_HOC AS TENMONHOC,
	A.BUOI AS BUOI,B.USER1 AS NHOM, A.NGAY_HOC AS NGAYHOC,A.GIO_BAT_DAU AS BATDAU,A.GIO_KET_THUC AS KETTHUC,
	(E.HO+' '+E.TEN_LOT+' '+E.TEN) AS TENHOCSINH
	FROM CHITIETDIEMDANH A INNER JOIN THANHVIENDIEMDANH B ON A.MA_TVDD=B.ID
	INNER JOIN DIEMDANH C ON B.MA_DIEM_DANH=C.ID
	INNER JOIN THANHVIEN D ON B.MA_THANH_VIEN=D.ID
	INNER JOIN CHITIETTHANHVIEN E ON D.TEN_DN=E.TEN_DANG_NHAP
	INNER JOIN THANHVIEN G ON C.MA_GIAO_VIEN=G.ID
	INNER JOIN CHITIETTHANHVIEN H ON G.TEN_DN=H.TEN_DANG_NHAP
	INNER JOIN MONHOC J ON C.MA_MON_HOC=J.ID
	INNER JOIN LOPHOC K ON C.MA_LOP_HOC=K.ID
	INNER JOIN CHUYENNGANH M ON K.MA_CHUYEN_NGANH=M.ID
	INNER JOIN KHOA_TRUNGTAM F ON M.MA_KHOATT=F.ID
	INNER JOIN THOIKHOABIEU L ON C.MA_CT_TKB = L.ID
	WHERE L.TINH_TRANG=2'
	+ @Where + @Dieu_Kien_Khoa + @And + @Dieu_Kien_Lop + @And + @Dien_Kien_Nam_Hoc + @And + @Dieu_Kien_Giao_Vien + @And + @Dieu_Kien_Mon_Hoc + @And + @Dieu_Kien_Thoi_Gian +
	' ORDER BY A.Ngay_hoc,A.Buoi DESC'
	exec  sp_executesql @sql
END

--exec sp_DiemDanh_GetGiaoVienByDieuKien 7,6,2,53,71,''
--sp_help sp_executesql
--sp_ISO_GetLichSuDungPhong '1','1','60','',''
--select * from lophoc
--select * from chitiettkb