
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_InsertChiTietPhieuMuon]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_InsertChiTietPhieuMuon]
GO
CREATE PROC sp_QLTB_InsertChiTietPhieuMuon
	@ID						int output,
	@Ma_phieu_muon			int,
	@Ma_thiet_bi			int,
	@Tinh_trang				varchar,
	@Ghi_chu				nvarchar(2000),
	@Thoi_gian_muon			datetime,
	@Thoi_gian_tra			datetime,
	@Phan_loai				varchar(1),
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40),

	@Choice					varchar
AS
BEGIN
	SET @Ngay_cap_nhat_cuoi	= getdate()
	IF(@Choice = '1')
	BEGIN
		SET @Tinh_trang = '1'
	END
	ELSE
	BEGIN
		SET @Tinh_trang = '2'
		UPDATE ThietBi SET Ma_tinh_trang = 1 WHERE ID = @Ma_thiet_bi 
	END
	INSERT INTO	ChiTietPhieuMuon
	VALUES (
		@Ma_phieu_muon,
		@Ma_thiet_bi,
		@Tinh_trang,
		@Ghi_chu,
		@Thoi_gian_muon,
		@Thoi_gian_tra,
		@Phan_loai,
		@Ngay_cap_nhat_cuoi,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5		
	)
	SELECT @ID = ID FROM ChiTietPhieuMuon WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
END
