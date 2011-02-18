if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateSuDung]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateSuDung]
GO
CREATE PROCEDURE sp_ISO_UpdateSuDung
	@ID						int,
	@Ma_phong				int,
	@Ma_mon_hoc_TKB			int,
	@Ma_nam_hoc				int,
	@STT_tuan				int,
	@Thu_trong_tuan			int,
	@Buoi					nvarchar(10),
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40)
AS
BEGIN	
	SET @User1 = GETDATE()
	UPDATE SuDung
	SET 
		Ma_phong				=	@Ma_phong,				
		Ma_nam_hoc				=	@Ma_nam_hoc,				
		STT_tuan				=	@STT_tuan,				
		Thu_trong_tuan			=	@Thu_trong_tuan,	
		Buoi					=	@Buoi,
		User1					=	@User1,
		User2					=	@User2,
		User3					=	@User3,
		User4					=	@User4,
		User5					=	@User5
	WHERE
		ID	=	@ID
END