IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE NAME='sp_NhanSu_InsertChungChiBangCapKhacCuaThanhVien')
BEGIN
	DROP PROC sp_NhanSu_InsertChungChiBangCapKhacCuaThanhVien
END
GO
CREATE PROC sp_NhanSu_InsertChungChiBangCapKhacCuaThanhVien
@Ma_thanh_vien INT,
@Ma_CCBCK INT,
@Ngay_bat_dau DATETIME,
@Ngay_ket_thuc DATETIME,
@Nam_tot_nghiep INT,
@Xep_loai NVARCHAR(100), 
@KQ INT OUTPUT
AS
BEGIN
	SET @KQ = -1
	IF NOT EXISTS (SELECT * FROM CHUNGCHIBANGCAPKHACCUATHANHVIEN WHERE Ma_thanh_vien=@Ma_thanh_vien AND Ma_CCBCK=@Ma_CCBCK)
	BEGIN
		INSERT INTO CHUNGCHIBANGCAPKHACCUATHANHVIEN(Ma_thanh_vien,Ma_CCBCK,Ngay_bat_dau,Ngay_ket_thuc,Nam_tot_nghiep,Xep_loai)
		VALUES (@Ma_thanh_vien,@Ma_CCBCK,@Ngay_bat_dau,@Ngay_ket_thuc,@Nam_tot_nghiep,@Xep_loai)
		SELECT @KQ=MAX(ID) FROM CHUNGCHIBANGCAPKHACCUATHANHVIEN
	END
END