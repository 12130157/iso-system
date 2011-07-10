
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_QLTB_ShowThietBi]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_QLTB_ShowThietBi]
GO
CREATE PROCEDURE sp_QLTB_ShowThietBi

	@numRows		varchar(10),
	@totalPages		varchar(10)

AS
BEGIN
	DECLARE @sql NVarchar(1000)
	SELECT @sql = '
	select * from (
		select top ' + @numRows + ' * 
		from (
			select top ' + @totalPages + ' *
			from (
				select A.ID as MaThietBi, 
				A.Ten as TenThietBi, 
				B.ID as MaTinhTrang, 
				B.Ten as TenTinhTrang, 
				C.Ki_hieu_phong as TenPhongBan,
				D.Ten_loai as TenLoaiThietBi, 
				A.Ki_hieu as KiHieu 
		from ThietBi as A 
				inner join TinhTrangThietBi as B on B.ID = A.Ma_tinh_trang 
				inner join PhongBan as C on C.ID = A.Ma_phong 
				inner join LoaiThietBi as D on D.ID = A.Ma_loai
			) AS TB0
			order by TB0.TenThietBi desc
		) as TB1 
		order by TB1.TenThietBi asc
	) as TB2 
	order by TB2.TenThietBi asc'

	exec  sp_executesql @sql
END

--select * from thietBi
--sp_QLTB_ShowThietBi '7','5'