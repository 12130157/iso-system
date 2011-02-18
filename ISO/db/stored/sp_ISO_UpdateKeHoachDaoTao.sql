
/***********************************************************
* Purpose : Update "KE HOACH DAO TAO"
* Author : ThienVD
* Date: 02-04-2010
* Description: Update "KE HOACH DAO TAO"
***********************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ISO_UpdateKeHoachDaoTao]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_ISO_UpdateKeHoachDaoTao]
GO
CREATE PROCEDURE sp_ISO_UpdateKeHoachDaoTao
	@ID				int,	
	@Ten			nvarchar(200),
	@Nam1			varchar(4),
	@Nam2			varchar(4),
	@Nam3			varchar(4),
	@Nam4			varchar(4),
	@Nam5			varchar(4),
	@Nam6			varchar(4),
	@Nhiem_vu_1		nvarchar(2000),
	@Nhiem_vu_2		nvarchar(2000),
	@Nhiem_vu_3		nvarchar(2000),
	@Nhiem_vu_4		nvarchar(2000),
	@Ma_nguoi_lap	int,
--	@Ngay_lap		datetime,
	@Ma_nguoi_duyet	int,
	@Ngay_duyet		datetime,
	@Tinh_trang		int,
	@Ngay_cap_nhat_cuoi	varchar(30)		output,
	@Ly_do_reject	nvarchar(80),
	@Ngay_gui		datetime,
	@Bo_sung		int,
	@User1			varchar(40),
	@User2			varchar(40),
	@User3			varchar(40),
	@User4			varchar(40),
	@User5			varchar(40)
AS
BEGIN
	SET @Ten = N'KẾ HOẠCH ĐÀO TẠO NĂM HỌC: ' + @Nam1 + '-' + @Nam2	
	SET @Ngay_cap_nhat_cuoi=GETDATE()
		
	UPDATE KEHOACHDAOTAO
	SET 
		Ten				=	@Ten,
		Nam1			=	@Nam1,
		Nam2			=	@Nam2,
		Nam3			=	@Nam3,
		Nam4			=	@Nam4,
		Nam5			=	@Nam5,
		Nam6			=	@Nam6,
		Nhiem_vu_1		=	@Nhiem_vu_1,
		Nhiem_vu_2		=	@Nhiem_vu_2,
		Nhiem_vu_3		=	@Nhiem_vu_3,
		Nhiem_vu_4		=	@Nhiem_vu_4,
		Ma_nguoi_lap	=	@Ma_nguoi_lap,
--		Ngay_lap		=	@Ngay_lap,
		Ma_nguoi_duyet	=	@Ma_nguoi_duyet,
		Ngay_duyet		=	@Ngay_duyet,
		Tinh_trang		=	@Tinh_trang,
		Ngay_cap_nhat_cuoi	=	@Ngay_cap_nhat_cuoi,
		Ly_do_reject	=	@Ly_do_reject,
		Ngay_gui		=	@Ngay_gui,
		Bo_sung			=	@Bo_sung,
		User1			=	@User1,
		User2			=	@User2,
		User3			=	@User3,
		User4			=	@User4,
		User5			=	@User5
	WHERE
		ID				=	@ID
	
	
	SELECT @Ngay_cap_nhat_cuoi=Convert(varchar(10),Ngay_cap_nhat_cuoi,110)
	FROM KeHoachDaoTao
	WHERE ID=@ID
END

