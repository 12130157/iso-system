/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	27/05/2011
	Mục Đích	:	Đề Nghị Nhân Sự Mới
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertDeNghiNhanSu')
BEGIN
	DROP PROC sp_NhanSu_InsertDeNghiNhanSu
END
GO
CREATE PROC sp_NhanSu_InsertDeNghiNhanSu 
	@Nam					INT,
	@Ma_bo_phan				INT,		
	@Nguoi_de_nghi			INT,
	@Chuc_danh				INT,
	@So_luong				INT,
	@Cong_viec				NVARCHAR(2000),
	@Luong					NUMERIC,
	@Thoi_gian_bat_dau_lam	DATETIME,
	@Tinh_trang				INT,				
	@KQ						INT OUTPUT  
AS  
BEGIN  
	SET @KQ = 0  
	IF NOT EXISTS (SELECT * FROM DeNghiNhanSu WHERE Nam=@Nam AND Ma_bo_phan=@Ma_bo_phan AND Chuc_danh=@Chuc_danh)   
	BEGIN  
		INSERT INTO DeNghiNhanSu VALUES(@Nam,@Ma_bo_phan,@Nguoi_de_nghi,@Chuc_danh,@So_luong,@Cong_viec,@Luong,@Thoi_gian_bat_dau_lam,@Tinh_trang,GETDATE(),null,null,null,null,null,null,null,null,null,GETDATE(),'','','','','')
		SELECT @KQ=ID FROM DeNghiNhanSu WHERE Nam=@Nam AND Ma_bo_phan=@Ma_bo_phan AND Chuc_danh=@Chuc_danh
	END  
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertDeNghiNhanSu '2011','8','5','5','2','Quét rác','5000000','1/1/1991',0,@KQ OUTPUT
SELECT @KQ
SELECT ID FROM DeNghiNhanSu WHERE Nam='2011' AND Ma_bo_phan='8' AND Chuc_danh='5'

SELECT * FROM DeNghiNhanSu

SELECT * FROM KeHoachTNS

*/
