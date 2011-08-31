/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	24/05/2011
	Mục Đích	:	Thêm Hợp Đồng Lần Đầu
*/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertHDLD')
BEGIN
	DROP PROC sp_NhanSu_InsertHDLD
END
GO
CREATE PROC sp_NhanSu_InsertHDLD
	@Nguoi_du_tuyen			INT,
	@So_lan					INT,
	@Nguoi_lap				INT,
	@KQ						INT OUTPUT  
AS  
BEGIN  
	SET @KQ = -1
	INSERT INTO HopDongLaoDong(Nguoi_du_tuyen,Tinh_trang,So_lan,Nguoi_lap,Ngay_lap,Ngay_cap_nhat_cuoi) VALUES(@Nguoi_du_tuyen,'0',@So_lan,@Nguoi_lap,GETDATE(),GETDATE())
	SELECT @KQ=MAX(ID) FROM HopDongLaoDong
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_NhanSu_InsertHDLD '1','0','1',@KQ OUTPUT
SELECT @KQ

*/
