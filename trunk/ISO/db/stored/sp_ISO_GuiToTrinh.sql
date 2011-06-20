if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GuiToTrinh]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GuiToTrinh]
GO
CREATE PROCEDURE sp_ISO_GuiToTrinh
	@ID					int,
	@Ten				nvarchar(200) output,
	@Ma_nguoi_tao		int,
	@Ma_nguoi_duyet		int,
	@Ngay_cap_nhat_cuoi	datetime,
	@Ngay_duyet			datetime,
	@Ngay_gui			datetime,
	@Ly_do_reject		nvarchar(2000),
	@Tinh_trang			varchar,
	@User1				varchar(40),
	@User2				varchar(40),
	@User3				varchar(40),
	@User4				varchar(40),
	@User5				varchar(40),
	@Ngay_gui_output	varchar(10) output,
	@Gio_gui_output		varchar(10) output
AS
BEGIN
	SET @Ngay_cap_nhat_cuoi = GETDATE()
	SET @Ngay_gui = GETDATE()
	DECLARE @Ten_nguoi_tao nvarchar(100)

	SELECT @Ten_nguoi_tao = ISNULL(Ho, '') + ' ' + ISNULL(Ten_lot, '') + ' ' + ISNULL(Ten, '')
	FROM ChiTietThanhVien AS A INNER JOIN ThanhVien AS B ON A.Ten_dang_nhap = B.Ten_DN 
	WHERE B.ID = @Ma_nguoi_tao
	SELECT @ID = MAX(ID) FROM ToTrinh WHERE Tinh_trang <> '2' AND Tinh_trang <> '1' AND Ma_nguoi_tao = @Ma_nguoi_tao
	SET @Ten = N'Tờ trình - Thay đổi TKB -' + @Ten_nguoi_tao + ' ' + Convert(varchar(10), @Ngay_cap_nhat_cuoi, 103) 
	IF EXISTS(SELECT * FROM ToTrinh WHERE Tinh_trang <> '2' AND Tinh_trang <> '1' AND Ma_nguoi_tao = @Ma_nguoi_tao)
	BEGIN
		UPDATE ToTrinh
		SET
			Ten			=	@Ten,
			Ngay_gui	=	@Ngay_gui,
			Tinh_trang	=	@Tinh_trang,
			Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi,
			Ly_do_reject =	NULL
		WHERE ID = @ID
	END
	ELSE
	BEGIN
		INSERT INTO ToTrinh VALUES
		(
			@Ten,
			@Ma_nguoi_tao,
			@Ma_nguoi_duyet,
			NULL,
			@Ngay_duyet,
			@Ngay_gui,
			@Ly_do_reject,
			@Tinh_trang,
			@Ngay_cap_nhat_cuoi,
			@User1,
			@User2,
			@User3,
			@User4,
			@User5
		)
		SELECT @ID = ID FROM ToTrinh WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
	END	
	UPDATE ChiTietTKBThayDoi SET Ma_to_trinh = @ID, Tinh_trang = '1' WHERE Ma_nguoi_tao = @Ma_nguoi_tao AND Ma_to_trinh = -2
	UPDATE MonHocTKBThayDoi	SET Ma_to_trinh = @ID, Tinh_trang = '1' WHERE Ma_nguoi_tao = @Ma_nguoi_tao AND Ma_to_trinh = -2

	SELECT @Ten = Ten, @Ngay_gui_output = Convert(varchar(10), Ngay_gui, 103), @Gio_gui_output = Convert(varchar(10), Ngay_gui, 108) 
		FROM ToTrinh WHERE ID = @ID
END
