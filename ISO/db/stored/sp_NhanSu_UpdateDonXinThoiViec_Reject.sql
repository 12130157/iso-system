/*
	Người Viết	:	Trần Cẩm thành
	Ngày Viết	:	19/08/2011
	Mục Đích	:	Approve đơn xin thôi việc
	SELECT * FROM DONXINTHOIVIEC
*/

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE NAME='sp_NhanSu_UpdateDonXinThoiViec_Reject')
BEGIN
	DROP PROC sp_NhanSu_UpdateDonXinThoiViec_Reject
END
GO
CREATE PROC sp_NhanSu_UpdateDonXinThoiViec_Reject  
	@ID					INT,
	@Ly_do_reject		NVARCHAR(1000),
	@KQ					INT OUTPUT
AS  
BEGIN  
	SET @KQ = -1 
	IF EXISTS (SELECT * FROM DonXinThoiViec WHERE ID=@ID)   
	BEGIN  
		UPDATE DonXinThoiViec SET Ly_do_reject=@Ly_do_reject,Tinh_trang='6',Truong_khoa=null,ngay_TK_duyet=null,Phong_HC=null,Ngay_HC_duyet=null,Phong_DT=null,Ngay_DT_duyet=null,Hieu_truong=null,Ngay_HT_duyet=null,Ngay_cap_nhat_cuoi=getdate() WHERE ID=@ID
		SET @KQ = @ID
	END  
END
GO

