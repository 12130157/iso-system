if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetTuanByNgayHienTai]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetTuanByNgayHienTai]
GO
CREATE PROC sp_ISO_GetTuanByNgayHienTai
	@Ma_tuan int output,
	@Tu_ngay varchar(10) output,
	@Den_ngay varchar(10) output,
	@Thu_tu_tuan varchar(2) output,
	@Ma_nam_hoc int output
AS
BEGIN
	DECLARE @Ngay_hien_tai datetime
	SET @Ngay_hien_tai = getdate()
	SELECT @Ma_tuan = ID, @Tu_ngay = Convert(varchar(10),Tu_ngay,110), @Thu_tu_tuan = So_thu_tu,
				@Den_ngay = Convert(varchar(10),Den_ngay,110), @Ma_nam_hoc = Ma_nam_hoc 
		FROM TuanLe
		WHERE Cast(Convert(varchar(10), Tu_ngay, 110) As datetime) <= Cast(Convert(varchar(10), @Ngay_hien_tai, 110) As datetime)  And Cast(Convert(varchar(10), @Ngay_hien_tai, 110) As datetime) <= Cast(Convert(varchar(10), Den_ngay, 110) As datetime)
print @Tu_ngay
END