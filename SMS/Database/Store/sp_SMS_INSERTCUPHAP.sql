/***********************************************************
* Purpose : INSERT CUPHAP
* Author : Nguyen Chi Tam
* Date: 28-2-2010
* Description: THEM 1 CU PHAP VAO CuPhap.dbo
*/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_SMS_InertCuPhap' ) 
BEGIN
	DROP PROC sp_SMS_InertCuPhap
END
GO
CREATE PROC sp_SMS_InertCuPhap
	@ID						int,
	@Ten					nvarchar(40),
	@Cum_tu_1				varchar(10),
	@Cum_tu_2				varchar(10),
	@Cum_tu_3				varchar(10),
	@Cum_tu_4				varchar(10),
	@Cum_tu_5				varchar(10),
	@Cum_tu_6				varchar(10),
	@Cum_tu_7				varchar(10),
	@Cum_tu_8				varchar(10),
	@Cum_tu_9				varchar(10),
	@Cum_tu_10				varchar(10),
	@Ghi_chu				nvarchar(400),
	@Ngay_cap_nhat_cuoi		datetime,
	@User1					varchar(40),
	@User2					varchar(40),
	@User3					varchar(40),
	@User4					varchar(40),
	@User5					varchar(40),	
	@Result					int		OUTPUT 
AS 
BEGIN
	SELECT	@Ngay_cap_nhat_cuoi = GETDATE()
	
	IF NOT EXISTS ( SELECT * FROM CuPhap WHERE ID = @ID)
	BEGIN
		INSERT INTO CuPhap 
		VALUES (@Ten,
				@Cum_tu_1,
				@Cum_tu_2,
				@Cum_tu_3,
				@Cum_tu_4,
				@Cum_tu_5,
				@Cum_tu_6,
				@Cum_tu_7,
				@Cum_tu_8,
				@Cum_tu_9,
				@Cum_tu_10,
				@Ghi_chu,
				@Ngay_cap_nhat_cuoi,
				@User1,
				@User2,
				@User3,
				@User4,
				@User5)
		SET @Result = 1 -- successfull
	END
	ELSE
	BEGIN
		SET @Result = 0 -- failse
	END 
END 