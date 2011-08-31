/*
	Người Viết	:	Trần Cẩm thành
	Ngày Viết	:	19/08/2011
	Mục Đích	:	cập nhật đơn xin thôi việc
	SELECT * FROM DONXINTHOIVIEC
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_InsertDonXinThoiViec')
BEGIN
	DROP PROC sp_NhanSu_InsertDonXinThoiViec
END
GO
CREATE PROC sp_NhanSu_InsertDonXinThoiViec  
	@Nguoi_du_tuyen		INT,
	@KQ					INT OUTPUT  
AS  
BEGIN  
	SET @KQ = -1
	IF NOT EXISTS (SELECT * FROM DonXinThoiViec WHERE Nguoi_du_tuyen=@Nguoi_du_tuyen)
	BEGIN
		INSERT INTO DonXinThoiViec(Nguoi_du_tuyen,Ngay_lap,Tinh_trang,Ngay_cap_nhat_cuoi)
		VALUES(@Nguoi_du_tuyen,getdate(),'0',getdate())
		SELECT @KQ=MAX(ID) FROM DonXinThoiViec
	END
	ELSE
	BEGIN
		SELECT @KQ=ID FROM DonXinThoiViec WHERE Nguoi_du_tuyen=@Nguoi_du_tuyen
	END
END  
GO

