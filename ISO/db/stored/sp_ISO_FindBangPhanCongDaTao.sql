if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_FindBangPhanCongDaTao]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_FindBangPhanCongDaTao]
GO
CREATE PROCEDURE sp_ISO_FindBangPhanCongDaTao
	@Ma_nam_hoc			varchar(4),
	@Hoc_ki				varchar,
	@Ma_khoa			int,
	@Ma_he_dao_tao		int,
	@Ma_quyet_dinh		int,
	@Tinh_trang_approved	int,
	@result				varchar(1) output
AS
BEGIN
	If exists(SELECT * FROM BangPhanCong WHERE Ma_nam_hoc = @Ma_nam_hoc AND Hoc_ki = @Hoc_ki 
		AND Ma_khoa = @Ma_khoa AND Ma_he_dao_tao = @Ma_he_dao_tao AND Ma_quyet_dinh = @Ma_quyet_dinh)
	Begin
		SET @result = '1'
	End
	Else
	Begin
		DECLARE @Nam_bat_dau INT
		SELECT @Nam_bat_dau = Nam_bat_dau FROM NamHoc WHERE ID = @Ma_nam_hoc
		IF EXISTS(SELECT A.ID FROM ChiTietMonHocCTDT AS A INNER JOIN ChuongTrinhDaoTao AS B ON A.Ma_chuong_trinh = B.ID
			INNER JOIN QuyetDinhMoLop AS C ON B.Ma_quyet_dinh = C.ID 
				INNER JOIN LopHoc AS D ON D.Ma_quyet_dinh = B.Ma_quyet_dinh AND B.Ma_nghe = D.Ma_chuyen_nganh
					INNER JOIN ChuyenNganh AS E ON B.Ma_nghe = E.ID
			WHERE CAST(ROUND(CAST(A.Hoc_ky AS FLOAT) / 2, 0) - 1 AS INT) + CAST(C.Nam_bat_dau AS INT) = @Nam_bat_dau 
				AND E.Ma_khoaTT = @Ma_khoa AND B.Ma_trinh_do = @Ma_he_dao_tao AND CAST(A.Hoc_ky AS INT) % 2 = @Hoc_ki % 2
					AND C.ID = @Ma_quyet_dinh AND B.Tinh_trang = @Tinh_trang_approved)
		BEGIN
			SET @result = '2'
		END
		ELSE
			SET @result = '0'
	End
END

