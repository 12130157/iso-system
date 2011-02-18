if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap]
GO
CREATE PROCEDURE sp_ISO_getMailOfTruongKhoaAndPhoKhoaByMaNguoiLap
	@Ma_nguoi_lap	int,
	@Ma_truong_khoa int,
	@Ma_pho_khoa int
AS
BEGIN
	
	DECLARE @Ma_bo_phan int
	SELECT @Ma_bo_phan = Ma_bo_phan FROM ThanhVien WHERE ID = @Ma_nguoi_lap

	SELECT ISNULL(B.Email,'') AS EMAIL FROM ThanhVien AS A INNER JOIN ChiTietThanhVien AS B ON A.Ten_DN = B.Ten_dang_nhap INNER JOIN Khoa_TrungTam AS C ON A.Ma_bo_phan = C.ID WHERE C.ID = @Ma_bo_phan AND (A.Ma_vai_tro = @Ma_truong_khoa OR A.Ma_vai_tro = @Ma_pho_khoa)

END
