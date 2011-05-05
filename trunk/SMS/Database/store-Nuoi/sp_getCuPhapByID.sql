IF Exists (Select * from dbo.SYSOBJECTS Where name='sp_getCuPhapByID')

BEGIN
	Drop Proc sp_getCuPhapByID
End
Go
Create PROC sp_getCuPhapByID
@id int
AS
begin
	IF EXISTS (select * from CuPhap where ID=@id )
	BEGIN
		select ID, Ten, Cum_tu_1,Cum_tu_2,Cum_tu_3,Cum_tu_4,Cum_tu_5
			   ,Cum_tu_6,Cum_tu_7,Cum_tu_8,Cum_tu_9,Cum_tu_10,
			   Ghi_chu from CuPhap where ID=@id
	END
end
--
--select * from LoaiHopThu
exec sp_getCuPhapByID '1'