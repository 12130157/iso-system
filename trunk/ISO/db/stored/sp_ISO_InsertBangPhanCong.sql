if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_InsertBangPhanCong]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_InsertBangPhanCong]
GO
CREATE PROCEDURE sp_ISO_InsertBangPhanCong
	@ID						INT OUTPUT,
	@Ten					NVARCHAR(200),
	@Ma_khoa				INT,
	@Hoc_ki					VARCHAR,
	@Ma_he_dao_tao			INT,
	@Ma_nam_hoc				INT,
	@Tinh_trang				VARCHAR,
	@Ngay_tao				DATETIME,
	@Nguoi_tao				INT,
	@Ngay_duyet				DATETIME,
	@Nguoi_duyet			INT,
	@Ngay_gui				DATETIME,
	@Ngay_cap_nhat_cuoi		DATETIME,
	@Ly_do_reject			NTEXT,
	@Hoc_ki_nam_hoc			VARCHAR,
	@Ma_quyet_dinh			INT,
	@User1					VARCHAR(40),
	@User2					VARCHAR(40),
	@User3					VARCHAR(40),
	@User4					VARCHAR(40),
	@User5					VARCHAR(40),
	@Tinh_trang_approved	VARCHAR
AS
BEGIN
	DECLARE @Nam_bat_dau	VARCHAR(5)
	DECLARE @Nam_ket_thuc	VARCHAR(5)
	SELECT @Nam_bat_dau = Nam_bat_dau, @Nam_ket_thuc = Nam_ket_thuc FROM NamHoc WHERE ID = @Ma_nam_hoc
	DECLARE @Ten_khoa	NVARCHAR(100)
	SELECT @Ten_khoa = Ten FROM Khoa_TrungTam WHERE ID = @Ma_khoa
	DECLARE @Ten_he_dao_tao NVARCHAR(50)
	SELECT @Ten_he_dao_tao = Ten FROM HeDaoTao WHERE ID = @Ma_he_dao_tao
	SET @Ten = N'Bảng phân công - ' + @Ten_he_dao_tao + ' - ' + @Ten_khoa + N' - Học kì ' + @Hoc_ki + ' (' + @Nam_bat_dau + '-' + @Nam_ket_thuc + ')' 
	SET @Ngay_cap_nhat_cuoi	= GETDATE()	
	INSERT INTO BangPhanCong VALUES
	(
		@Ten,
		@Ma_khoa,
		@Hoc_ki,
		@Ma_he_dao_tao,
		@Ma_nam_hoc,
		@Tinh_trang,
		@Ngay_tao,
		@Nguoi_tao,
		@Ngay_duyet,
		@Nguoi_duyet,
		@Ngay_gui,
		@Ngay_cap_nhat_cuoi,
		@Ly_do_reject,
		@Hoc_ki_nam_hoc,
		@Ma_quyet_dinh,
		@User1,
		@User2,
		@User3,
		@User4,
		@User5
	)
	SELECT @ID = ID FROM BangPhanCong WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi

	DECLARE @Ma_chi_tiet_CTDT INT		
	DECLARE @C CURSOR	
	SET @C = CURSOR FOR SELECT A.ID FROM ChiTietMonHocCTDT AS A INNER JOIN ChuongTrinhDaoTao AS B ON A.Ma_chuong_trinh = B.ID
	INNER JOIN QuyetDinhMoLop AS C ON B.Ma_quyet_dinh = C.ID 
	INNER JOIN LopHoc AS D ON D.Ma_quyet_dinh = B.Ma_quyet_dinh AND B.Ma_nghe = D.Ma_chuyen_nganh
	INNER JOIN ChuyenNganh AS E ON B.Ma_nghe = E.ID
	WHERE CAST(ROUND(CAST(A.Hoc_ky AS FLOAT) / 2, 0) - 1 AS INT) + CAST(C.Nam_bat_dau AS INT) = @Nam_bat_dau 
		AND E.Ma_khoaTT = @Ma_khoa AND B.Ma_trinh_do = @Ma_he_dao_tao 
		AND CAST(A.Hoc_ky AS INT) % 2 = @Hoc_ki % 2 AND C.ID = @Ma_quyet_dinh
		AND B.Tinh_trang = @Tinh_trang_approved

	OPEN @C
	FETCH NEXT FROM @C INTO @Ma_chi_tiet_CTDT
	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO ChiTietBangPhanCong
		SELECT 
			@ID,
			D.ID,
			@Ma_chi_tiet_CTDT,
			NULL,
			NULL,
			NULL,
			GETDATE(),
			NULL,
			NULL,
			NULL,
			NULL,
			NULL	
		FROM ChiTietMonHocCTDT AS A INNER JOIN ChuongTrinhDaoTao AS B ON A.Ma_chuong_trinh = B.ID
		INNER JOIN QuyetDinhMoLop AS C ON B.Ma_quyet_dinh = C.ID 
		INNER JOIN LopHoc AS D ON D.Ma_quyet_dinh = B.Ma_quyet_dinh AND B.Ma_nghe = D.Ma_chuyen_nganh
		WHERE A.ID = @Ma_chi_tiet_CTDT
		FETCH NEXT FROM @C INTO @Ma_chi_tiet_CTDT
	END
	SELECT @Hoc_ki_nam_hoc = Hoc_ky FROM ChiTietMonHocCTDT WHERE ID = @Ma_chi_tiet_CTDT
	UPDATE BangPhanCong SET Hoc_ki_nam_hoc = @Hoc_ki_nam_hoc WHERE ID = @ID
END
-- select * from lophoc order by ma_chuyen_nganh
-- select 1%2
-- select * from chuongtrinhdaotao