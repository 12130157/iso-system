IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE NAME='sp_NhanSu_InsertBangCap')
BEGIN
	DROP PROC sp_NhanSu_InsertBangCap
END
GO
CREATE PROC sp_NhanSu_InsertBangCap
@Ma_thanh_vien INT,
@Loai_bang NVARCHAR(20),
@Truong_cap NVARCHAR(200),
@Nam_tot_nghiep INT,
@Loai_tot_nghiep NVARCHAR(40),
@Chuyen_nganh	NVARCHAR(100),
@Bang_cap_chinh INT,
@KQ	INT OUTPUT
AS
BEGIN
	SET @KQ = -1
	IF EXISTS (SELECT * FROM THANHVIEN WHERE ID=@Ma_thanh_vien)
	BEGIN
		INSERT INTO BANGCAP(Ma_thanh_vien,Loai_bang,Truong_cap,Nam_tot_nghiep,Loai_tot_nghiep,Chuyen_nganh,Ngach_luong,Bang_cap_chinh) VALUES (@Ma_thanh_vien,@Loai_bang,@Truong_cap,@Nam_tot_nghiep,@Loai_tot_nghiep,@Chuyen_nganh,'2.34',@Bang_cap_chinh)
		SELECT @KQ = MAX(ID) FROM BANGCAP
	END
END
