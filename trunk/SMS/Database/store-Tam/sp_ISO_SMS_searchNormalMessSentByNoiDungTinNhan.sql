IF EXISTS (SELECT * FROM sysobjects WHERE name ='sp_ISO_SMS_searchNormalMessSentByNoiDungTinNhan')
BEGIN
	DROP PROC sp_ISO_SMS_searchNormalMessSentByNoiDungTinNhan
END
GO
CREATE PROC sp_ISO_SMS_searchNormalMessSentByNoiDungTinNhan
	@NoiDungTinNhan		varchar(max)
AS
BEGIN
	IF @NoiDungTinNhan = ''
	BEGIN
		EXEC sp_ISO_SMS_getAllNormalMessSent
	END
	ELSE
	BEGIN
		SELECT id,so_dien_thoai,noi_dung_tin_nhan,ngay_gui 

		FROM hopthudi 
	
		WHERE	tinh_trang = 1 AND loai_hop_thu = 6 
		AND		Noi_Dung_Tin_Nhan LIKE '%'+@NoiDungTinNhan+'%'

		ORDER BY id DESC

		

	END
END

--EXEC sp_ISO_SMS_searchNormalMessSentByNoiDungTinNhan '34'