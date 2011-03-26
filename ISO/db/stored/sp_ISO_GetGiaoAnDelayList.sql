if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_GetGiaoAnDelayList]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_GetGiaoAnDelayList]
GO
CREATE PROCEDURE sp_ISO_GetGiaoAnDelayList
	@Day		int
AS
BEGIN
	if exists (select * from dbo.sysobjects where name='GiaoAnDelayList')
	begin
		drop table GiaoAnDelayList
	end
	
	create table GiaoAnDelayList(
		id_ChiTietKHGD		int,
		Ma_giao_vien		int,
		Ho_ten_giao_vien	nvarchar(50),
		Email				nvarchar(50),
		Ma_lop				int,
		Ten_lop				nvarchar(50),
		Ma_mon_hoc			int,
		Ten_mon_hoc			nvarchar(50),
		Giao_an_so			int,
		Ngay_day			datetime,
		Nhom				int
	)
	
	insert into GiaoAnDelayList
	select
		B.ID AS 'id_ChiTietKHGD', 
		A.Ma_giao_vien,
		D.Ho + ' ' + D.Ten_lot + ' ' + D.Ten as 'Ho_ten_giao_vien',
		D.Email,
		A.Ma_lop,
		E.Ki_hieu as 'Ten_lop',
		A.Ma_mon_hoc,
		F.Ten_mon_hoc,
		B.STT_noi_dung as 'Giao_an_so',
		B.Ngay_BD as 'Ngay_day',
		B.Nhom as 'Nhom'				
	from KeHoachGiangDay A
	inner join ChiTietKHGD B on A.ID=B.Ma_ke_hoach_giang_day
	inner join ThanhVien C on A.Ma_giao_vien=C.ID
	inner join ChiTietThanhVien D on C.Ten_DN=D.Ten_dang_nhap
	inner join LopHoc E on A.Ma_lop=E.ID
	inner join MonHoc F on A.Ma_mon_hoc=F.ID
	where Ma_ke_hoach_giang_day=1
	and ISNULL(B.Ma_giao_an,'')=''
	and DATEDIFF(day, getdate(),B.Ngay_BD) >=0 
	and DATEDIFF(day, getdate(),B.Ngay_BD) <= @Day
	and ISNULL(B.User1,'') = ''		
	
	-- UPDATE COLUMN USER1 TRONG TABLE ChiTietKHGD THANH 1, CO HIEU LA DA EMAIL NHAC NHO GIAOAN DELAY ROI	
	DECLARE @ID_ChiTietKHGD INT		
	DECLARE @C CURSOR		
	SET @C = CURSOR FOR SELECT id_ChiTietKHGD FROM GiaoAnDelayList
		
	OPEN @C
	FETCH NEXT FROM @C INTO @ID_ChiTietKHGD
		
	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE ChiTietKHGD
		SET User1 = '1'
		WHERE ID = @ID_ChiTietKHGD
		
		FETCH NEXT FROM @C INTO @ID_ChiTietKHGD
	END
	/*
	-- LAY DU LIEU TRA VE DE SEND EMAIL
	SELECT
		
		Ma_giao_vien,
		Ho_ten_giao_vien,
		Email,
		Ma_lop,
		Ten_lop,
		Ma_mon_hoc,
		Ten_mon_hoc,
		Giao_an_so,
		Ngay_day,
		Nhom
	FROM GiaoAnDelayList
	
	DROP TABLE GiaoAnDelayList */
END