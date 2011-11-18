IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE NAME='sp_NhanSu_InsertQuaTrinhCongTac')
BEGIN
	DROP PROC sp_NhanSu_InsertQuaTrinhCongTac
END
GO
CREATE PROC sp_NhanSu_InsertQuaTrinhCongTac
@Ma_thanh_vien INT,
@Ngay_nhan_chuc DATETIME,
@Chuc_vu INT,
@KQ INT OUTPUT
AS
BEGIN
	SET @KQ = -1
	IF NOT EXISTS (SELECT * FROM QUATRINHCONGTAC WHERE Ma_thanh_vien=@Ma_thanh_vien AND Chuc_vu=@Chuc_vu AND DATEPART(YEAR,Ngay_nhan_chuc)=DATEPART(YEAR,@Ngay_nhan_chuc))
	BEGIN
		INSERT INTO QuaTrinhCongTac(Ma_thanh_vien,Ngay_nhan_chuc,Chuc_vu,Ngay_cap_nhat_cuoi)
		VALUES (@Ma_thanh_vien,@Ngay_nhan_chuc,@Chuc_vu,GETDATE())
		SELECT @KQ=MAX(ID) FROM QUATRINHCONGTAC
	END
END