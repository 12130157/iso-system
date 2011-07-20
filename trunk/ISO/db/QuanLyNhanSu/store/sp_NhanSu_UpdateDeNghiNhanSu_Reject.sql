/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	24/05/2011
	Mục Đích	:	Cập nhật các cột tình trạng duyệt về mặc định là 0
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateDeNghiNhanSu_Reject')
BEGIN
	DROP PROC sp_NhanSu_UpdateDeNghiNhanSu_Reject
END
GO
CREATE PROC sp_NhanSu_UpdateDeNghiNhanSu_Reject
	@ID					INT,
	@Ly_do_reject		NVARCHAR(500),
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = 0  
	IF EXISTS (SELECT * FROM DeNghiNhanSu WHERE ID=@ID)   
	BEGIN  
		UPDATE DeNghiNhanSu SET Ly_do_reject=@Ly_do_reject,Tinh_trang='6',Truong_khoa=null,Ngay_TK_duyet=null,Phong_HC=null,Ngay_HC_duyet=null,Phong_DT=null,Ngay_DT_duyet=null,Hieu_truong=null,Ngay_HT_duyet=null,Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SET @KQ = 1
	END  
END
GO

