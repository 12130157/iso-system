

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_UpdateChiTietPhieuMuonThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_UpdateChiTietPhieuMuonThietBi]
GO
CREATE PROC sp_QLTB_UpdateChiTietPhieuMuonThietBi
	@ID						INT,
	@Ma_thiet_bi			INT,
	@Tinh_trang				int,
    @Ghi_chu				NVARCHAR(200),
    @Ngay_cap_nhat_cuoi		DATETIME,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN
	set @Ngay_cap_nhat_cuoi = GETDATE()
	DECLARE @Thoi_gian_tra datetime
--insert phieumuonthietbi
	if(@Tinh_trang = 1)
	BEGIN
		DECLARE @So_lan_su_dung  INT
		SELECT @So_lan_su_dung = So_lan_su_dung FROM ThietBi WHERE ID = @Ma_thiet_bi
		UPDATE ThietBi SET So_lan_su_dung = @So_lan_su_dung + 1 WHERE ID = @Ma_thiet_bi
		SET @Thoi_gian_tra = GETDATE()
	END
	UPDATE PhieuMuonThietBi 
	SET
		Tinh_trang	=	@Tinh_trang,
		Ghi_chu		=	@Ghi_chu,
		Thoi_gian_tra	=	@Thoi_gian_tra
		Ngay_cap_nhat_cuoi		=	@Ngay_cap_nhat_cuoi,
		User1		=	@User1,
		User2		=	@User2,
		User3		=	@User3,
		User4		=	@User4,
		User5		=	@User5
	WHERE ID = @ID 	
	
END