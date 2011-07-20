/*
	Người Viết	:	Trần Cẩm Thành
	Ngày Viết	:	24/05/2011
	Mục Đích	:	Thêm Đề Nghị Khoán Thử Việc
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertDeNghiKTV')
BEGIN
	DROP PROC sp_NhanSu_InsertDeNghiKTV
END
GO
CREATE PROC sp_NhanSu_InsertDeNghiKTV  
	@Nguoi_du_tuyen			INT,
	@Tinh_trang				INT,
	@Ma_truong_khoa			INT,
	@KQ						INT OUTPUT  
AS  
BEGIN  
	SET @KQ = 0  
	IF NOT EXISTS (SELECT * FROM DeNghiKTV WHERE Nguoi_du_tuyen=(SELECT A.ID FROM HOSODUTUYEN A INNER JOIN CHITIETKHTNS B ON A.VI_TRI_DU_TUYEN=B.ID INNER JOIN KEHOACHTNS C ON B.MA_KE_HOACH=C.ID WHERE A.ID=@Nguoi_du_tuyen))   
	BEGIN  
		INSERT INTO DeNghiKTV VALUES(@Nguoi_du_tuyen,null,null,null,null,@Tinh_trang,GETDATE(),@Ma_truong_khoa,null,null,null,null,null,null,null,null,GETDATE(),'','','','','')
		SELECT @KQ=MAX(ID) FROM DeNghiKTV
	END  
END  
GO
/*

DECLARE @KQ INT 
EXEC sp_InsertDeNghiKTV '1','0',@KQ OUTPUT
SELECT @KQ

SELECT * FROM DeNghiNhanSu

SELECT * FROM DeNghiKTV

*/
