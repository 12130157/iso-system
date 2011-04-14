IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllDRVCuPhap')

BEGIN
	Drop Proc sp_getAllDRVCuPhap
End
Go
Create PROC sp_getAllDRVCuPhap
AS
BEGIN
		select ID as 'ID', Ten as 'Name', Cum_tu_1 as 'Keyword 1',Cum_tu_2 as 'Keyword 2'
		 ,Cum_tu_3 as 'Keyword 3',Cum_tu_4 as 'Keyword 4',Cum_tu_5 as 'Keyword 5',Cum_tu_6 as 'Keyword 6'
		 ,Cum_tu_7 as 'Keyword 7',Cum_tu_8 as 'Keyword 8',Cum_tu_9 as 'Keyword 9',Cum_tu_10 as 'Keyword 10'
		 ,Ghi_chu as 'Note' from CuPhap
	
END

exec sp_getAllDRVCuPhap