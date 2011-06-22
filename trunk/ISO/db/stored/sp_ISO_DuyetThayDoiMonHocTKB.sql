if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_DuyetThayDoiMonHocTKB]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_DuyetThayDoiMonHocTKB]
GO
CREATE PROCEDURE sp_ISO_DuyetThayDoiMonHocTKB
	@Tinh_trang varchar,
	@Ma_to_trinh	int,
	@Ma_nguoi_tao	int
AS
BEGIN
	DECLARE @Ma_giao_vien	int
	DECLARE @Ma_mon_hoc_TKB int
	DECLARE @Total	int
	IF(@Tinh_trang = '2')
	BEGIN

		DECLARE @C CURSOR		
		SET @C = CURSOR FOR SELECT Ma_mon_hoc_TKB FROM MonHocTKBThayDoi WHERE Ma_to_trinh = @Ma_to_trinh
		OPEN @C
		FETCH NEXT FROM @C INTO @Ma_mon_hoc_TKB

		WHILE @@FETCH_STATUS = 0
		BEGIN
			SELECT @Total = Count(*) FROM MonHocTKBThayDoi WHERE Ma_mon_hoc_TKB = @Ma_mon_hoc_TKB
				
			IF(@Total = 1)
			BEGIN 
				DECLARE @Ngay_cap_nhat_cuoi datetime
				DECLARE @ID int
				SET @Ngay_cap_nhat_cuoi = GETDATE()
				INSERT INTO MonHocTKBThayDoi
					SELECT 
						ID,
						Ma_giao_vien,
						-1,
						@Ma_nguoi_tao,
						NULL,
						NULL,
						@Ngay_cap_nhat_cuoi,
						NULL,
						NULL,
						NULL,
						NULL,
						NULL
					FROM MonHocTKB 
					WHERE ID = @Ma_mon_hoc_TKB 
				SELECT @ID = ID FROM MonHocTKBThayDoi WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
				--UPDATE MonHocTKBThayDoi SET Ma_nguoi_tao = @Ma_nguoi_tao WHERE Ngay_cap_nhat_cuoi = @Ngay_cap_nhat_cuoi
				UPDATE MonHocTKBThayDoi SET ID_thay_the = @ID WHERE Ma_mon_hoc_TKB = @Ma_mon_hoc_TKB AND Ma_to_trinh = @Ma_to_trinh
			END
			FETCH NEXT FROM @C INTO @Ma_mon_hoc_TKB
		END
		UPDATE MonHocTKB 
			SET
				Ma_giao_vien = B.Ma_giao_vien
			FROM MonHocTKB AS A 
				INNER JOIN MonHocTKBThayDoi AS B ON A.ID = B.Ma_mon_hoc_TKB AND B.Tinh_trang = '1'
			WHERE B.Ma_to_trinh = @Ma_to_trinh	 

		UPDATE MonHocTKBThayDoi
			SET
				Tinh_trang = '2'
		WHERE Ma_to_trinh = @Ma_to_trinh
	END
	ELSE 
	BEGIN
		UPDATE MonHocTKBThayDoi SET Tinh_trang = '3' WHERE Ma_to_trinh = @Ma_to_trinh
	END
END

-- Tinh trang thay doi
-- 0 TK thay doi
-- 1 TK gui HT
-- 2 Approved
-- 3 Reject
-- select * from monhoctkbthaydoi


