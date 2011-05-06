IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchNormalMessByNoiDungTinNhan')
BEGIN
	DROP PROC sp_ISO_SMS_searchNormalMessByNoiDungTinNhan
END
GO
CREATE PROC sp_ISO_SMS_searchNormalMessByNoiDungTinNhan
	@NoiDungTinNhan		varchar(max)
AS
BEGIN
	IF @NoiDungTinNhan = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllNormalMessInbox
	END
	ELSE
	BEGIN
		SELECT	A.ID,A.So_dien_thoai,A.Noi_dung_tin_nhan,
				dbo.statusToString(A.Tinh_trang) AS 'Tinh_trang',
				A.Ngay_nhan,dbo.fnc_ISO_SMS_statusReply(A.Ma_Tin_Nhan_Tra_Loi) AS 'Tinh_trang_Tra_loi'

		FROM HopThuDen AS A 

		WHERE	A.Loai_hop_thu = 2 
		AND		A.tinh_trang != 3
		AND		A.Noi_Dung_Tin_Nhan LIKE '%'+@NoiDungTinNhan+'%'

		ORDER BY A.Tinh_trang ASC , A.id DESC
	END
END

--EXEC sp_ISO_SMS_searchNormalMessByNoiDungTinNhan 'test'