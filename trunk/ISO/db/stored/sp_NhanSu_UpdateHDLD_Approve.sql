/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	26/05/2011
	Mục Đích	:	Duyệt Đề Nghị Khoán Thử Việc
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateHDLD_Approve')
BEGIN
	DROP PROC sp_NhanSu_UpdateHDLD_Approve
END
GO
CREATE PROC sp_NhanSu_UpdateHDLD_Approve  
	@ID					INT,
	@Ma_nguoi_duyet		INT,
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = -1
	IF EXISTS (SELECT * FROM HopDongLaoDong WHERE ID=@ID)   
	BEGIN
		DECLARE @Tinh_trang INT
		SELECT @Tinh_trang=Tinh_trang FROM HopDongLaoDong WHERE ID=@ID
		IF ((SELECT ID FROM HoSoDuTuyen WHERE Ten_dang_nhap = (SELECT Ten_DN FROM ThanhVien WHERE ID=@Ma_nguoi_duyet)) = (SELECT Nguoi_du_tuyen FROM HopDongLaoDong WHERE ID=@ID))
		BEGIN
			UPDATE HopDongLaoDong SET Tinh_trang=@Tinh_trang+1,Ngay_NDT_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
			SET @KQ = @ID
		END
		ELSE
		BEGIN
			UPDATE HopDongLaoDong SET Tinh_trang=@Tinh_trang+1,Hieu_truong=@Ma_nguoi_duyet,Ngay_HT_duyet=getdate(),Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
			SET @KQ = @ID
		END
	END  
END
GO

/*

DECLARE @KQ INT 
EXEC sp_InsertHopDongLaoDong 0,3,1,'1/1/1991','1/1/1991','1',@KQ OUTPUT
SELECT @KQ

SELECT * FROM HopDongLaoDong

SELECT * FROM HopDongLaoDong

*/
