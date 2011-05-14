IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchNormalMessDeletedSentByNoiDungTinNhan')
BEGIN
	DROP PROC sp_ISO_SMS_searchNormalMessDeletedSentByNoiDungTinNhan
END
GO
CREATE PROC sp_ISO_SMS_searchNormalMessDeletedSentByNoiDungTinNhan
	@NoiDungTinNhan		varchar(max)
AS
BEGIN
	IF @NoiDungTinNhan = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllNormalMessDeletedSent
	END
	ELSE
	BEGIN
		SELECT id,so_dien_thoai,noi_dung_tin_nhan,ngay_gui 

		FROM HopThuDi 

		WHERE tinh_trang = 3 AND loai_hop_thu = 6
		AND		Noi_Dung_Tin_Nhan LIKE '%'+@NoiDungTinNhan+'%'

		ORDER BY id DESC
	END
END

--EXEC sp_ISO_SMS_searchNormalMessDeletedSentByNoiDungTinNhan '34'