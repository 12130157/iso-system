/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	24/05/2011
	Mục Đích	:	Cập nhật cột Tinh_trang( 0 = luu, 1 = gui )
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateDeNghiNhanSu')
BEGIN
	DROP PROC sp_NhanSu_UpdateDeNghiNhanSu
END
GO
CREATE PROC sp_NhanSu_UpdateDeNghiNhanSu
	@ID					INT,
	@Chuc_danh			INT,
	@So_luong			INT,
	@Cong_viec			NVARCHAR(2000),
	@Luong				NUMERIC,
	@Thoi_gian_bat_dau_lam DATETIME,
	@Tinh_trang			INT,
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = 0 
	IF EXISTS (SELECT * FROM DeNghiNhanSu WHERE ID=@ID)   
	BEGIN  
		UPDATE DeNghiNhanSu SET Chuc_danh=@Chuc_danh,Cong_viec=@Cong_viec,So_luong=@So_luong,Luong=@Luong,Thoi_gian_bat_dau_lam=@Thoi_gian_bat_dau_lam,Ly_do_reject=null,Tinh_trang=@Tinh_trang,Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SET @KQ = @ID
	END  
END
GO

