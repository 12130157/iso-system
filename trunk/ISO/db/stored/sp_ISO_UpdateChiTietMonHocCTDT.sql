if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateChiTietMonHocCTDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateChiTietMonHocCTDT]
GO
CREATE PROCEDURE sp_ISO_UpdateChiTietMonHocCTDT
	@ID int,
	@Ma_chuong_trinh int,
	@Thu_tu int,
	@Ma_mon_hoc int,
	@Ngay_cap_nhat_cuoi datetime,
	@Ly_thuyet varchar(10),
	@Thuc_hanh varchar(10),
	@LT_TH varchar(10),
	@TTSX varchar(10),
	@Tinh_chat nvarchar(40),
	@Nam_hoc varchar(10),
	@Hoc_ky varchar(10),
	@Ma_hoc_phan int,
	@User1 varchar(40),
	@User2 varchar(40),
	@User3 varchar(40),
	@User4 varchar(40),
	@User5 varchar(40)
AS
BEGIN	

	SET @Ngay_cap_nhat_cuoi = GETDATE()	
	UPDATE ChiTietMonHocCTDT
	SET
	Ma_chuong_trinh			=						@Ma_chuong_trinh, 
	Thu_tu					=						@Thu_tu, 
	Ma_mon_hoc				=						@Ma_mon_hoc, 
	Ngay_cap_nhat_cuoi		=						@Ngay_cap_nhat_cuoi, 
	Ly_thuyet				=						@Ly_thuyet, 
	Thuc_hanh				=						@Thuc_hanh,
	LT_TH					=						@LT_TH, 
	TTSX					=						@TTSX, 
	Tinh_chat				=						@Tinh_chat, 
	Nam_hoc					=						@Nam_hoc, 
	Hoc_ky					=						@Hoc_ky, 
	Ma_hoc_phan				=						@Ma_hoc_phan,
	User1					=						@User1, 
	User2					=						@User2, 
	User3					=						@User3, 
	User4					=						@User4, 
	User5					=						@User5 
	WHERE
		ID						=	@ID
END						