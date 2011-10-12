/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	24/05/2011
	Mục Đích	:	Cập nhật cột tình trạng (2 = TruongKhoa, 3 = PDT, 4 = PHC, 5 = HT  )
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateDeNghiNhanSu_Approve')
BEGIN
	DROP PROC sp_NhanSu_UpdateDeNghiNhanSu_Approve
END
GO
CREATE PROC sp_NhanSu_UpdateDeNghiNhanSu_Approve
	@ID					INT,
	@Ma_nguoi_duyet		INT,
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = -1
	DECLARE @BOPHAN INT
	IF EXISTS (SELECT * FROM DeNghiNhanSu WHERE ID=@ID)   
	BEGIN
		DECLARE @Tinh_trang INT
		SET @Tinh_trang = (SELECT Tinh_trang FROM DeNghiNhanSu WHERE ID=@ID)

		IF(@Tinh_trang=1)
		BEGIN
			SELECT @BOPHAN=Ma_bo_phan FROM THANHVIEN WHERE ID=@Ma_nguoi_duyet
			IF (@BOPHAN = 1)
			BEGIN
				UPDATE DeNghiNhanSu SET Tinh_trang='3',Phong_DT=@Ma_nguoi_duyet,Ngay_DT_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
				SET @KQ = 1
			END

			IF (@BOPHAN = 2)
			BEGIN
				UPDATE DeNghiNhanSu SET Tinh_trang='3',Phong_HC=@Ma_nguoi_duyet,Ngay_HC_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
				SET @KQ = 1
			END
			
			IF (@BOPHAN <> 1 OR @BOPHAN <> 2)
			BEGIN
				UPDATE DeNghiNhanSu SET Tinh_trang='2',Truong_khoa=@Ma_nguoi_duyet,Ngay_TK_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
				SET @KQ = 1
			END
		END
		IF(@Tinh_trang=2)
		BEGIN
			SELECT @BOPHAN=Ma_bo_phan FROM THANHVIEN WHERE ID=@Ma_nguoi_duyet
			IF (@BOPHAN = 1)
			BEGIN
				UPDATE DeNghiNhanSu SET Tinh_trang='3',Phong_DT=@Ma_nguoi_duyet,Ngay_DT_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
				SET @KQ = 1
			END
			IF (@BOPHAN = 2)
			BEGIN
				UPDATE DeNghiNhanSu SET Tinh_trang='3',Phong_HC=@Ma_nguoi_duyet,Ngay_HC_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
				SET @KQ = 1
			END
		END
		IF(@Tinh_trang=3)
		BEGIN
			SELECT @BOPHAN=Ma_bo_phan FROM THANHVIEN WHERE ID=@Ma_nguoi_duyet
			IF (@BOPHAN = 1)
			BEGIN
				UPDATE DeNghiNhanSu SET Tinh_trang='4',Phong_DT=@Ma_nguoi_duyet,Ngay_DT_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
				SET @KQ = 1
			END
			IF (@BOPHAN = 2)
			BEGIN
				UPDATE DeNghiNhanSu SET Tinh_trang='4',Phong_HC=@Ma_nguoi_duyet,Ngay_HC_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
				SET @KQ = 1
			END
		END
		IF(@Tinh_trang=4)
		BEGIN
			UPDATE DeNghiNhanSu SET Tinh_trang='5',Hieu_truong=@Ma_nguoi_duyet,Ngay_HT_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
			SET @KQ = 1
		END
	END  
END
GO

