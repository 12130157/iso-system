/*
	Người Viết	:	Huỳnh Thị Ngoc Mai
	Ngày Viết	:	24/05/2011
	Mục Đích	:	STORE INSERT KE_HOACH_TUYEN_NHAN_SU 
	-- TINH_TRANG	= 0 -- SAVE
	-- TINH_TRANG	= 1 -- GUI
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertKeHoachTNS')
BEGIN
	DROP PROC sp_NhanSu_InsertKeHoachTNS
END
GO
CREATE PROC sp_NhanSu_InsertKeHoachTNS
	@Nam				INT,					
	@Nguoi_lap_ke_hoach	INT,
	@Bo_sung			INT,
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = -1
	INSERT INTO KeHoachTNS(Nam,Tinh_trang,Nguoi_lap_ke_hoach,Ngay_lap_ke_hoach,Bo_sung,Ngay_cap_nhat_cuoi,User1,User2,User3,User4,User5) VALUES(@Nam,'0',@Nguoi_lap_ke_hoach,GETDATE(),@Bo_sung,GETDATE(),'','','','','')
	SELECT @KQ=MAX(ID) FROM KeHoachTNS
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_NhanSu_InsertKeHoachTNS '2011','15','0',@KQ OUTPUT
SELECT @KQ

SELECT * FROM ThanhVien

SELECT * FROM KeHoachTNS

*/
