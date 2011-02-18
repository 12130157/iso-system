if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_PhanCongNoiDungChiTietKHDT]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_PhanCongNoiDungChiTietKHDT]
GO
CREATE PROCEDURE sp_ISO_PhanCongNoiDungChiTietKHDT
	@ID					int,
	@Gio				int,
	@Phut				int,
	@Thu				int,
	@Ghi_chu			nvarchar(4000),
	@Buoi				int,
	@Ngay				datetime,
	@Tinh_trang_phan_cong	int,
	@Tu_ngay			datetime,
	@User1				varchar(40),
	@User2				varchar(40),
	@User3				varchar(40),
	@User4				varchar(40),  
	@User5				varchar(40)
AS
BEGIN	
	IF(@Thu > 0)
	BEGIN
		SET @Ngay = DATEADD(DAY, @Thu - 1, @Tu_ngay)
	END
	ELSE
	BEGIN
		SET @Ngay = NULL
	END
	UPDATE NoiDungChiTietKHDT
	SET
		Gio						=	@Gio,
		Phut					=	@Phut,
		Thu						=	@Thu,
		Ghi_chu					=	@Ghi_chu,
		Buoi					=	@Buoi,
		Ngay					=	@Ngay,
		Tinh_trang_phan_cong		=	@Tinh_trang_phan_cong,
		User1					=	@User1,
		User2					=	@User2,
		User3					=	@User3,
		User4					=	@User4,
		User5					=	@User5
	WHERE
		ID = @ID
END