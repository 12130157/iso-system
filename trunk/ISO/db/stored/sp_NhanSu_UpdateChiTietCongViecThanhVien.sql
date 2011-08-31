--Người Lập :	Trần Cẩm Thành
--Ngày Lập  :	06/08/2011
--Mục Đích  :	Cập Nhật Dữ Liệu Khen Thưởng/ Kỷ Luật cho Nhân Sự

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE NAME='sp_NhanSu_UpdateChiTietCongViecThanhVien')
BEGIN
	DROP PROC sp_NhanSu_UpdateChiTietCongViecThanhVien
END
GO
CREATE PROC sp_NhanSu_UpdateChiTietCongViecThanhVien
@ID				INT,
@Ghi_chu		NVARCHAR(1000),
@Loai_ghi_chu	INT,
@KQ				INT OUTPUT
AS
BEGIN
	SET @KQ = -1
	IF EXISTS(SELECT * FROM CHITIETCONGVIECTHANHVIEN WHERE ID=@ID)
	BEGIN
		UPDATE CHITIETCONGVIECTHANHVIEN SET Ghi_chu=@Ghi_chu,Loai_ghi_chu=@Loai_ghi_chu,Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SET @KQ = @ID
	END
END
