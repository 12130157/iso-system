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
		select ID as 'ID', Ten as 'Name', Cum_tu_1 as 'Keyword 1',Cum_tu_2 as 'Keyword 2'
		 ,Cum_tu_3 as 'Keyword 3',Cum_tu_4 as 'Keyword 4',Cum_tu_5 as 'Keyword 5',Cum_tu_6 as 'Keyword 6'
		 ,Cum_tu_7 as 'Keyword 7',Cum_tu_8 as 'Keyword 8',Cum_tu_9 as 'Keyword 9',Cum_tu_10 as 'Keyword 10'
		 ,Ghi_chu as 'Note' from CuPhap
	END

	ELSE IF @Ten <> '' AND @Cum_tu_1 = ''
	BEGIN
		-- DIEU KIEN 2 ==> SEARCH CUSTOMER NAME
		
		select ID as 'ID', Ten as 'Name', Cum_tu_1 as 'Keyword 1',Cum_tu_2 as 'Keyword 2'
		 ,Cum_tu_3 as 'Keyword 3',Cum_tu_4 as 'Keyword 4',Cum_tu_5 as 'Keyword 5',Cum_tu_6 as 'Keyword 6'
		 ,Cum_tu_7 as 'Keyword 7',Cum_tu_8 as 'Keyword 8',Cum_tu_9 as 'Keyword 9',Cum_tu_10 as 'Keyword 10'
		 ,Ghi_chu as 'Note' from CuPhap
		WHERE Ten LIKE '%' + @Ten + '%'
	END
	ELSE IF @Ten = '' AND @Cum_tu_1 <> ''
	BEGIN
		-- DIEU KIEN 3 ==> SEARCH PHONE
		select ID as 'ID', Ten as 'Name', Cum_tu_1 as 'Keyword 1',Cum_tu_2 as 'Keyword 2'
		 ,Cum_tu_3 as 'Keyword 3',Cum_tu_4 as 'Keyword 4',Cum_tu_5 as 'Keyword 5',Cum_tu_6 as 'Keyword 6'
		 ,Cum_tu_7 as 'Keyword 7',Cum_tu_8 as 'Keyword 8',Cum_tu_9 as 'Keyword 9',Cum_tu_10 as 'Keyword 10'
		 ,Ghi_chu as 'Note' from CuPhap
		WHERE  Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
	END
	ELSE IF @Ten <> '' AND @Cum_tu_1 <> ''
	BEGIN
		-- DIEU KIEN 4 ==> SEARCH CUSTOMER NAME + PHONE
		select ID as 'ID', Ten as 'Name', Cum_tu_1 as 'Keyword 1',Cum_tu_2 as 'Keyword 2'
		 ,Cum_tu_3 as 'Keyword 3',Cum_tu_4 as 'Keyword 4',Cum_tu_5 as 'Keyword 5',Cum_tu_6 as 'Keyword 6'
		 ,Cum_tu_7 as 'Keyword 7',Cum_tu_8 as 'Keyword 8',Cum_tu_9 as 'Keyword 9',Cum_tu_10 as 'Keyword 10'
		 ,Ghi_chu as 'Note' from CuPhap
		WHERE Ten LIKE '%' + @Ten + '%' 
			AND Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
	END
END
--select * from CuPhap
--exec sp_Search_KeyworkName '',''