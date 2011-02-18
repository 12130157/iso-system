if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertSuDung]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertSuDung]
GO
CREATE PROCEDURE sp_ISO_InsertSuDung
	@ID						int output,
	@Ma_mon_hoc_TKB			int,
	@Ma_phong				int,
	@Ma_nam_hoc				int,
	@STT_tuan				int,
	@Thu_trong_tuan			int,
	@Buoi					nvarchar(10),
	@User1					varchar(40), -- Ngay_cap_nhat_cuoi
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN	
	SET @User1 = GETDATE()
	INSERT INTO SuDung
	VALUES (
		@Ma_phong,			
		@Ma_mon_hoc_TKB,	
		@Ma_nam_hoc,				
		@STT_tuan,				
		@Thu_trong_tuan,	
		@Buoi,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	SELECT @ID = ID FROM SuDung
		WHERE User1 = @User1
END