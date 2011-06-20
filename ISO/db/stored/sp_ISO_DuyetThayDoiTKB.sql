if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DuyetThayDoiTKB]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DuyetThayDoiTKB]
GO
CREATE PROCEDURE sp_ISO_DuyetThayDoiTKB
	@Tinh_trang varchar,
	@Ma_to_trinh	int,
	@Ma_nguoi_tao	int
AS
BEGIN
	DECLARE @Ma_phong	int
	DECLARE	@Tuan	int
	DECLARE @Thu	int
	DECLARE @Buoi	nvarchar
	DECLARE @Ngay_hoc	datetime
	DECLARE @Ma_chi_tiet_TKB int

	IF(@Tinh_trang = '2')
	BEGIN
		UPDATE ChiTietTKBThayDoi
			SET
				Tinh_trang = '2'
		WHERE Ma_to_trinh = @Ma_to_trinh

		DECLARE @C CURSOR		
		SET @C = CURSOR FOR SELECT @Ma_chi_tiet_TKB FROM ChiTietTKBThayDoi WHERE Ma_to_trinh = @Ma_to_trinh
		OPEN @C
		FETCH NEXT FROM @C INTO @Ma_chi_tiet_TKB

		WHILE @@FETCH_STATUS = 0
		BEGIN
			DECLARE @ID_Thay_doi	int
			DECLARE @Total	int
			--SELECT @Ma_chi_tiet_TKB = MIN(Ma_chi_tiet_TKB) FROM ChiTietTKBThayDoi 
				--WHERE Ma_to_trinh = @Ma_to_trinh AND Ma_chi_tiet_TKB != @Temp
			SELECT @Total = Count(*) FROM ChiTietTKBThayDoi WHERE Ma_chi_tiet_TKB = @Ma_chi_tiet_TKB
			IF(@Total = 1)
			BEGIN 
				DECLARE @Ngay_cap_nhat_cuoi datetime
				DECLARE @ID int
				SET @Ngay_cap_nhat_cuoi = GETDATE()
				INSERT INTO ChiTietTKBThayDoi
					SELECT 
						Ma_mon_hoc_TKB,
						ID,
						Thu_trong_tuan,
						Buoi,
						Ma_phong,
						Tuan,
						Ngay_hoc,
						NULL,
						-1,
						NULL,
						NULL,
						@Ngay_cap_nhat_cuoi,
						NULL,
						NULL,
						NULL,
						NULL,
						NULL
					FROM ChiTietTKB 
					WHERE ID = @Ma_chi_tiet_TKB
				UPDATE ChiTietTKBThayDoi SET Ma_nguoi_tao = @Ma_nguoi_tao WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
				UPDATE ChiTietTKBThayDoi SET ID_thay_the = @ID WHERE Ma_chi_tiet_TKB = @Ma_chi_tiet_TKB AND Ma_to_trinh = @Ma_to_trinh
			END
			FETCH NEXT FROM @C INTO @Ma_chi_tiet_TKB
		END

		UPDATE ChiTietTKB 
			SET
				Ma_phong = A.Ma_phong,
				Tuan = A.Tuan,
				Thu_trong_tuan = A.Thu_trong_tuan,
				Buoi = A.Buoi,
				Ngay_hoc = A.Ngay_hoc
			FROM ChiTietTKB AS A 
				INNER JOIN ChiTietTKBThayDoi AS B ON A.ID = B.Ma_chi_tiet_TKB AND B.Tinh_trang = '1'
			WHERE B.Ma_to_trinh = @Ma_to_trinh	 

		
	END
	ELSE 
	BEGIN
		UPDATE ChiTietTKBThayDoi SET Tinh_trang = '3' WHERE Ma_to_trinh = @Ma_to_trinh
	END
END

-- Tinh trang thay doi
-- 0 TK thay doi
-- 1 TK gui HT
-- 2 Chi tiet truoc thay doi
select * from chitiettkbthaydoi

