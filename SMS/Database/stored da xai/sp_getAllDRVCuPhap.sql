IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getAllDRVCuPhap')

BEGIN
	Drop Proc sp_getAllDRVCuPhap
End
Go
Create PROC sp_getAllDRVCuPhap
AS
BEGIN
		select ID as 'Ma cu phap', Ten as 'Ten cu phap', Cum_tu_1 as 'Cu phap 1',Cum_tu_2 as 'Cu phap 2'
		 ,Cum_tu_3 as 'Cu phap 3',Cum_tu_4 as 'Cu phap 4',Cum_tu_5 as 'Cu phap 5'
		 ,Ghi_chu as 'Ghi Chu' from CuPhap
	
END

--exec sp_getAllDRVCuPhap