IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_Search_KeyworkName')
BEGIN
	Drop Proc sp_Search_KeyworkName
End
go
CREATE PROC sp_Search_KeyworkName
	@Ten		VARCHAR(40) ,
	@Cum_tu_1	NVARCHAR(200)
AS
BEGIN
	IF @Ten = '' AND @Cum_tu_1 = ''
	BEGIN
		-- DIEU KIEN 1 ==> SEARCH ALL
		select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
		 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5'
		 ,Ghi_chu as 'Ghi Chu' from CuPhap
	END

	ELSE IF @Ten <> '' AND @Cum_tu_1 = ''
	BEGIN
		-- DIEU KIEN 2 ==> SEARCH CUSTOMER NAME
		
		select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
		 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5'
		 ,Ghi_chu as 'Ghi Chu' from CuPhap
		WHERE Ten LIKE '%' + @Ten + '%'
	END
	ELSE IF @Ten = '' AND @Cum_tu_1 <> ''
	BEGIN
		-- DIEU KIEN 3 ==> SEARCH PHONE
		select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
		 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5'
		 ,Ghi_chu as 'Ghi Chu' from CuPhap
		WHERE  Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
	END
	ELSE IF @Ten <> '' AND @Cum_tu_1 <> ''
	BEGIN
		-- DIEU KIEN 4 ==> SEARCH CUSTOMER NAME + PHONE
		select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
		 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5'
		 ,Ghi_chu as 'Ghi Chu' from CuPhap
		WHERE Ten LIKE '%' + @Ten + '%' 
			AND Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
	END
END
--select * from CuPhap
--exec sp_Search_KeyworkName '',''