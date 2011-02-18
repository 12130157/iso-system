CREATE function dbo.udf_DayOfWeek(@dtDate DATETIME)
RETURNS NVARCHAR(10)
AS
BEGIN
DECLARE @rtDayofWeek NVARCHAR(10)
SELECT @rtDayofWeek = CASE DATEPART(weekday,@dtDate)
WHEN 1 THEN N'Chủ Nhật'
WHEN 2 THEN N'Thứ Hai'
WHEN 3 THEN N'Thứ Ba'
WHEN 4 THEN N'Thứ Tư'
WHEN 5 THEN N'Thứ Năm'
WHEN 6 THEN N'Thứ Sáu'
WHEN 7 THEN N'Thứ Bảy'
END
RETURN (@rtDayofWeek)
END
GO
