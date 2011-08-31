--Người Lập :	Trần Cẩm Thành
--Ngày Lập  :	06/08/2011
--Mục Đích  :	Nhập Dữ Liệu Khen Thưởng/ Kỷ Luật cho Nhân Sự

IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE NAME='sp_NhanSu_InsertChiTietCongViecThanhVien')
BEGIN
	DROP PROC sp_NhanSu_InsertChiTietCongViecThanhVien
END
GO
CREATE PROC sp_NhanSu_InsertChiTietCongViecThanhVien
@Ma_nam_hoc		INT,
@Ma_thanh_vien	INT,
@Chuc_vu		INT,
@Ghi_chu		NVARCHAR(1000),
@Loai_ghi_chu	INT,
@KQ				INT OUTPUT
AS
BEGIN
	SET @KQ = -1
	IF NOT EXISTS(SELECT * FROM CHITIETCONGVIECTHANHVIEN WHERE Ma_nam_hoc=@Ma_nam_hoc AND Ma_thanh_vien=@Ma_thanh_vien AND Chuc_vu=@Chuc_vu AND Ghi_chu=@Ghi_chu AND Loai_ghi_chu=@Loai_ghi_chu)
	BEGIN
		INSERT INTO CHITIETCONGVIECTHANHVIEN(Ma_nam_hoc,Ma_thanh_vien,Chuc_vu,Ghi_chu,Loai_ghi_chu,Ngay_cap_nhat_cuoi) VALUES (@Ma_nam_hoc,@Ma_thanh_vien,@Chuc_vu,@Ghi_chu,@Loai_ghi_chu,getdate())
		SELECT @KQ=MAX(ID) FROM CHITIETCONGVIECTHANHVIEN
	END
END
