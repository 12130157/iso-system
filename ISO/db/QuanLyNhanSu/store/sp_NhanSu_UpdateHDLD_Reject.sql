/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	26/05/2011
	Mục Đích	:	Từ Chối Hợp Đồng Lần Đầu
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateHDLD_Reject')
BEGIN
	DROP PROC sp_NhanSu_UpdateHDLD_Reject
END
GO
CREATE PROC sp_NhanSu_UpdateHDLD_Reject  
	@ID					INT,
	@Ly_do_reject		NVARCHAR(500),
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = 0  
	IF EXISTS (SELECT * FROM HopDongLanDau WHERE ID=@ID)   
	BEGIN  
		UPDATE HopDongLanDau SET Ly_do_reject=@Ly_do_reject,Tinh_trang='6',Phong_HC=null,Ngay_HC_duyet=null,Phong_DT=null,Ngay_DT_duyet=null,Hieu_truong=null,Ngay_HT_duyet=null,Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SET @KQ = 1
	END  
END
GO

/*

DECLARE @KQ INT 
EXEC sp_InsertDeNghiKTV 0,3,1,'1/1/1991','1/1/1991','1',@KQ OUTPUT
SELECT @KQ

SELECT * FROM DeNghiNhanSu

SELECT * FROM DeNghiKTV

*/
