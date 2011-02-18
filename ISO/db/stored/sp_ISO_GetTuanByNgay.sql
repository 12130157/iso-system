if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetTuanByNgay]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetTuanByNgay]
GO
CREATE PROC sp_ISO_GetTuanByNgay
	@Kieu_tuan varchar, -- Tuan hien tai hoac tuan sau
	@Ma_tuan int output,
	@Tu_ngay varchar(10) output,
	@Den_ngay varchar(10) output,
	@Thu_tu_tuan varchar(2) output,
	@Ma_nam_hoc int output
AS
BEGIN
	DECLARE @Ngay datetime
	SET @Ngay = getdate()
	IF(@Kieu_tuan = '2')
	BEGIN
		SET @Ngay = DATEADD(DAY, 7, @Ngay)
	END
	SELECT @Ma_tuan = ID, @Tu_ngay = Convert(varchar(10),Tu_ngay,110), @Thu_tu_tuan = So_thu_tu,
				@Den_ngay = Convert(varchar(10),Den_ngay,110), @Ma_nam_hoc = Ma_nam_hoc 
		FROM TuanLe
		WHERE Cast(Convert(varchar(10), Tu_ngay, 110) As datetime) <= Cast(Convert(varchar(10), @Ngay, 110) As datetime)  And Cast(Convert(varchar(10), @Ngay, 110) As datetime) <= Cast(Convert(varchar(10), Den_ngay, 110) As datetime)
print @Tu_ngay
END