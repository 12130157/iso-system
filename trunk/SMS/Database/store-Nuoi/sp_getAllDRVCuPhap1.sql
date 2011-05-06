IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllDRVCuPhap')
BEGIN
	Drop Proc sp_getAllDRVCuPhap
End
go

CREATE PROC sp_getAllDRVCuPhap
AS
BEGIN
	 if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'' and Cum_tu_9 <>'' and Cum_tu_10 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5' ,Cum_tu_6 as 'Cu phap 6'
			 ,Cum_tu_7 as 'Cu phap 7',Cum_tu_8 as 'Cu phap 8',Cum_tu_9 as 'Cu phap 9', Cum_tu_10 as 'Cu phap 10'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'' and Cum_tu_9 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5' ,Cum_tu_6 as 'Cu phap 6'
			 ,Cum_tu_7 as 'Cu phap 7',Cum_tu_8 as 'Cu phap 8',Cum_tu_9 as 'Cu phap 9'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'' and Cum_tu_8 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5' ,Cum_tu_6 as 'Cu phap 6'
			 ,Cum_tu_7 as 'Cu phap 7',Cum_tu_8 as 'Cu phap 8'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>''  and Cum_tu_7 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5' ,Cum_tu_6 as 'Cu phap 6'
			 ,Cum_tu_7 as 'Cu phap 7'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>''  and Cum_tu_6 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5' ,Cum_tu_6 as 'Cu phap 6'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4 <>'' and Cum_tu_5 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'' and Cum_tu_4<>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'' and Cum_tu_3<>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Cum_tu_3 as 'Cu phap 3'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'' and Cum_tu_2 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
		END
	else if exists(select *  from CuPhap where Cum_tu_1 <>'')
		BEGIN
			select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1'
			 ,Ghi_chu as 'Ghi Chu' from CuPhap
		END
END

--exec sp_getAllDRVCuPhap
