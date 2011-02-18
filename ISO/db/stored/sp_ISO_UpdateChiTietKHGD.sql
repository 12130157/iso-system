
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateChiTietKHGD]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateChiTietKHGD]
GO
CREATE PROCEDURE sp_ISO_UpdateChiTietKHGD
	@ID						int,
	@noiDungTH				nvarchar(4000),
	@congViecChuanBi		nvarchar(4000),
	@ngayCapNhatCuoi		datetime,
	@User1					varchar(40),
	@User2					varchar(40)
	
AS
BEGIN
	SET @ngayCapNhatCuoi = GETDATE()
	UPDATE ChiTietKHGD
	SET 
		Noi_dung_TH				=	@noiDungTH,
		Cong_viec_chuan_bi		=	@congViecChuanBi,
		Ngay_cap_nhat_cuoi		=	@ngayCapNhatCuoi,
		User1					=	@User1,
		User2					=	@User2
		
	WHERE
		ID						=	@ID

	DECLARE @MaGiaoAn int
	DECLARE @CoHieu int
	SELECT @MaGiaoAN=Ma_giao_an,@CoHieu=Co_hieu FROM ChiTietKHGD WHERE ID=@ID
	IF @CoHieu <> 1 AND @CoHieu<>2
		UPDATE GiaoAn SET Giai_quyet_van_de=@noiDungTH WHERE ID=@MaGiaoAn

	IF @CoHieu=1
		UPDATE GiaoAn Set Huong_dan_ban_dau=@noiDungTH WHERE ID=@MaGiaoAn


END

