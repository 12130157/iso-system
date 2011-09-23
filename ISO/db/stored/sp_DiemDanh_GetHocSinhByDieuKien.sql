if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_DiemDanh_GetHocSinhByDieuKien]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].sp_DiemDanh_GetHocSinhByDieuKien
GO
CREATE PROCEDURE sp_DiemDanh_GetHocSinhByDieuKien
	@Khoa			varchar(30),
	@Lop			varchar(30),
	@NamHoc			varchar(30),
	@HocSinh		varchar(30),
	@MonHoc			varchar(30),
	@NgayHoc		varchar(30),
	@Nhom			varchar(10)
AS
BEGIN
	DECLARE @sql NVarchar(2000)
	declare @Dieu_Kien_Khoa			nvarchar(100)
	declare @Dieu_Kien_Lop			nvarchar(100)
	declare @Dien_Kien_Nam_Hoc		nvarchar(100)
	declare @Dieu_Kien_Hoc_Sinh		nvarchar(100)
	declare @Dieu_Kien_Mon_Hoc		nvarchar(100)
	declare @Dieu_Kien_Nhom			nvarchar(100)
	declare @Dieu_Kien_Ngay_Hoc		nvarchar(100)
	set @Dieu_Kien_Khoa = ''
	set @Dieu_Kien_Lop = ''
	set @Dien_Kien_Nam_Hoc = ''
	set @Dieu_Kien_Hoc_Sinh = ''
	set @Dieu_Kien_Mon_Hoc = ''
	set @Dieu_Kien_Nhom = ''
	set @Dieu_Kien_Ngay_Hoc = ''
	
	if(@NgayHoc <> '')
	begin
		SET @Dieu_Kien_Ngay_Hoc = ' AND CONVERT(VARCHAR(10),A.NGAY_HOC,105)=''' + @NgayHoc + ''''
	end

	if(@Khoa <> '')
	BEGIN
		SET @Dieu_Kien_Khoa = ' AND F.ID=' + @Khoa
	END
	if(@Lop <> '')
	BEGIN
		SET @Dieu_Kien_Lop = ' AND K.ID=' + @Lop
	END
	if(@NamHoc <> '')
	BEGIN
		SET @Dien_Kien_Nam_Hoc = ' AND L.NAM_BAT_DAU='  + @NamHoc
	END
	if(@HocSinh <> '')
	Begin
		SET @Dieu_Kien_Hoc_Sinh = ' AND D.ID=' + @HocSinh
	END
	if(@MonHoc <> '')
	BEGIN
		SET @Dieu_Kien_Mon_Hoc = ' AND J.ID=' + @MonHoc
	END
	if(@Nhom = '')
	BEGIN
		SET @Dieu_Kien_Nhom = ' AND B.USER1='''' '
	END
	if(@Nhom <> '')
	BEGIN
		SET @Dieu_Kien_Nhom = ' AND B.USER1='+@Nhom
	END
	SELECT @sql = '
	SELECT K.KI_HIEU AS TENLOP,(H.HO+'' ''+H.TEN_LOT+'' ''+H.TEN) AS TENGIAOVIEN,J.TEN_MON_HOC AS TENMONHOC,
	A.BUOI AS BUOI,B.USER1 AS NHOM, CONVERT(VARCHAR(10),A.NGAY_HOC,105) AS NGAYHOC,A.GIO_BAT_DAU AS BATDAU,A.GIO_KET_THUC AS KETTHUC,
	(E.HO+'' ''+E.TEN_LOT+'' ''+E.TEN) AS TENHOCSINH
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
	WHERE L.TINH_TRANG=2 '
	+ @Dieu_Kien_Khoa 
	+ @Dieu_Kien_Lop 
	+ @Dien_Kien_Nam_Hoc 
	+ @Dieu_Kien_Hoc_Sinh 
	+ @Dieu_Kien_Mon_Hoc
	+ @Dieu_Kien_Nhom 
	+ @Dieu_Kien_Ngay_Hoc +
	' ORDER BY A.Ngay_hoc,A.Buoi DESC'
	PRINT @sql
	exec  sp_executesql @sql

END

--exec sp_DiemDanh_GetHocSinhByDieuKien 6,9,2011,'',53,'07-09-2011',''
--sp_help sp_executesql
--sp_ISO_GetLichSuDungPhong '1','1','60','',''
--select * from lophoc
--select * from chitiettkb