IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_Search_KeyworkName')
BEGIN
	Drop Proc sp_Search_KeyworkName
End
go
CREATE PROC sp_Search_KeyworkName
	@Cum_tu_1		VARCHAR(10) ,
	@Cum_tu_2	NVARCHAR(10)
AS
BEGIN
	IF @Cum_tu_1 = 'All' AND @Cum_tu_2 = 'All'
	BEGIN
		-- DIEU KIEN 1 ==> SEARCH ALL
		exec sp_getAllDRVCuPhap
	END

	ELSE IF @Cum_tu_1 <> 'All' AND @Cum_tu_2 = 'All'
	BEGIN
		-- DIEU KIEN 2 ==> SEARCH CUSTOMER NAME
		
		if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'' and Cum_tu_9 <>'' and Cum_tu_10 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 + ' '+ Cum_tu_8 + ' '+Cum_tu_9 +' '+ Cum_tu_10 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'' and Cum_tu_9 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 + ' '+ Cum_tu_8 + ' '+Cum_tu_9  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 + ' '+ Cum_tu_8 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3  + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+Cum_tu_4 + ' '+ Cum_tu_5  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4<>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4   as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap 
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%'
		END
		
------------
	END
	ELSE IF @Cum_tu_1 = 'All' AND @Cum_tu_2 <> 'All'
	BEGIN
		-- DIEU KIEN 3 ==> SEARCH PHONE
		if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'' and Cum_tu_9 <>'' and Cum_tu_10 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3  + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 + ' '+ Cum_tu_8 + ' '+Cum_tu_9 +' '+ Cum_tu_10 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'' and Cum_tu_9 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 + ' '+ Cum_tu_8 + ' '+Cum_tu_9  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3  + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 + ' '+ Cum_tu_8 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3  + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7   as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3  ,Cum_tu_4 + ' '+ Cum_tu_5  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4<>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3  + ' ' + Cum_tu_4 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1   as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE  Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
		
	END
---------------
	ELSE IF @Cum_tu_1 <> 'All' AND @Cum_tu_2 <> 'All'
	BEGIN
		-- DIEU KIEN 4 ==> SEARCH CUSTOMER NAME + PHONE
		if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'' and Cum_tu_9 <>'' and Cum_tu_10 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 + ' '+ Cum_tu_8 + ' '+Cum_tu_9 +' '+ Cum_tu_10 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'' and Cum_tu_9 <>'')
		BEGIN
				select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 + ' '+ Cum_tu_8 + ' '+Cum_tu_9 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'')
		BEGIN
				select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7 + ' '+ Cum_tu_8 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'')
		BEGIN
				select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6 
			 + ' '+Cum_tu_7  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>'')
		BEGIN
				select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5 + ' '+ Cum_tu_6  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>'')
		BEGIN
				select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 + ' '+ Cum_tu_5  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4<>'')
		BEGIN
				select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3 + ' '+ Cum_tu_4 as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'')
		BEGIN
				select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2
			 + ' '+ Cum_tu_3  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'')
		BEGIN
				select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 + ' '+ Cum_tu_2 as 'Cu Phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'')
		BEGIN
				select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1  as 'Cu phap'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
				WHERE Cum_tu_1 LIKE '%' + @Cum_tu_1 + '%' 
					AND Cum_tu_2 LIKE '%' + @Cum_tu_2 + '%'
		END
	END
-------
END
--select * from CuPhap
--exec sp_Search_KeyworkName '',''