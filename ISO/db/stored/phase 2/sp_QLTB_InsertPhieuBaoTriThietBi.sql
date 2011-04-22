

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_InsertPhieuBaoTriThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_InsertPhieuBaoTriThietBi]
GO
CREATE PROC sp_QLTB_InsertPhieuBaoTriThietBi
	--phieubaotrithietbi
	@ID						int output,
    @Nguoi_de_xuat			int,
	@Ngay_bao_tri			datetime,
    @Ghi_chu				nvarchar(80),
	@Ma_phong				int
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN

	set @Ngay_bao_tri = GETDATE()
	set @Ngay_cap_nhat_cuoi = GETDATE()

--insert phieubaotrithietbi
	insert into phieubaotrithietbi 
	values (
		@Nguoi_de_xuat,
		@Ngay_bao_tri,
		@Ghi_chu,
		@Ma_phong,
		@Ngay_cap_nhat_cuoi,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)  	
		SELECT @ID = ID FROM phieubaotrithietbi WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
END