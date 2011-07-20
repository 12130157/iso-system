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
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = 0  
	IF NOT EXISTS (SELECT * FROM KeHoachTNS WHERE Nam=@Nam)   
	BEGIN
		INSERT INTO KeHoachTNS VALUES('',@Nam,'0',@Nguoi_lap_ke_hoach,GETDATE(),null,null,null,GETDATE(),'','','','','')
		SELECT @KQ=ID FROM KeHoachTNS WHERE Nam=@Nam AND Nguoi_lap_ke_hoach =@Nguoi_lap_ke_hoach 
	END  
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertKeHoachTNS '2010','1','2',@KQ OUTPUT
SELECT @KQ

SELECT * FROM ThanhVien

SELECT * FROM KeHoachTNS

*/
