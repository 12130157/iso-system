/***********************************************************
* Purpose : Generate giao an
* Author : Tam Kute
* Date: 21-11-2010S
* Description: Generate giao an
***********************************************************/
 
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[sp_iso_GenerateGiaoAn]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[sp_iso_GenerateGiaoAn]
GO
CREATE PROC [sp_iso_GenerateGiaoAn]
	@MaKHGD int
AS
BEGIN
	DECLARE @MaCTKHGD  int
	DECLARE @TenChuong nvarchar(2000)
	DECLARE @CoHieu int
	DECLARE @NoiDungTH nvarchar(2000)
	DECLARE @CongViecChuanBi nvarchar(2000)
	DECLARE @STTNoiDung int
	DECLARE @Nhom int
	DECLARE @Tuan int
	DECLARE @MaGiaoAn int
	DECLARE @TempSTTND int	
	DECLARE @CoHieuLT int
	DECLARE @CoHieuTH int
	DECLARE @SoGiaoAn int
	DECLARE @MaGiaoVien int
	DECLARE @DateCurrent datetime
	DECLARE @CoHieuTemp int
	DECLARE @Muc_Tieu_Bai_Hoc nvarchar(2000)
	DECLARE @Ngay_BD datetime
	DECLARE @SoTietMoiBuoi int
	---------SET---------------------------------------
	SET @CoHieuLT=0
	SET @CoHieuTH=1
	SET @SoGiaoAn=1
	SET @DateCurrent=GETDATE()
	---------------SET GIAO AN LY THUYET---------------
	DECLARE @MucTieu nvarchar(2000)
	DECLARE @DoDungPTDH nvarchar(2000)
	DECLARE @OnDinhLH nvarchar(2000)
	DECLARE @ThoiGianOD int	
	DECLARE @ThoiGianTHBH int
	DECLARE @DanNhap nvarchar(2000)
	DECLARE @HDDanNhapGV nvarchar(2000)
	DECLARE @HDDanNhapHS nvarchar(2000)
	DECLARE @ThoiGianDN int 
	DECLARE @NoiDungBaiGiang nvarchar(4000)
	DECLARE @HDGiangBaiMoiGV nvarchar(2000)
	DECLARE @HDGiangBaiMoiHS nvarchar(2000)
	DECLARE @ThoiGianBaiGiang int
	DECLARE @CungCoKienThuc nvarchar(2000)
	DECLARE @HDCungCoGV nvarchar(2000)
	DECLARE @HDCungCoHS nvarchar(2000)
	DECLARE @ThoiGianCungCo int
	DECLARE @HuongDanTuHoc nvarchar(40)
	DECLARE @HDHuongDanTHGV nvarchar(2000)
	DECLARE @HDHuongDanTHHS nvarchar(2000)
	DECLARE @ThoiGianHDTH	int		
	DECLARE @TaiLieuThamKhao nvarchar(40)
	

		--SET @MucTieu=N'Giáo viên update Mục tiêu của bài giảng'
		SET @DoDungPTDH=N'- Bảng viết + viết lông viết bảng ---- Máy tính + Slide trình chiếu ---- Máy chiếu + Màn chiếu '
		SET @OnDinhLH=N'- Setup projector --- Điểm danh lớp'
		SET @ThoiGianOD=10
		SET @ThoiGianTHBH=215
		--SET @DanNhap=N'Giáo viên update nội dung phần DẪN NHẬP'
		SET @HDDanNhapGV=N'- Thuyết trình ---- Trình chiếu ---- Phát vấn ---- Quản lý lớp.'
		SET @HDDanNhapHS=N'- Lắng nghe ---- Quan sát ---- Trả lời câu hỏi ---- Ghi bài.'
		SET @ThoiGianDN=30
		SET @NoiDungBaiGiang=''
		SET @HDGiangBaiMoiGV=N'- Chia nhóm ---- Hướng dẫn chủ đề thảo luận ---- Quản lý lớp ---- Tổng kết nội dung ---- Thuyết trình có minh họa bằng slide trình chiếu ---- Đặt câu hỏi.'
		SET @HDGiangBaiMoiHS=N'- Xem tài liệu về bài học ---- Phân tích dữ liệu thông tin ---- Thảo luận ---- Trình bày kết quả thảo luận ---- Lắng nghe và ghi chép vào tài liệu học tập ---- Trả lời câu hỏi '
		SET @ThoiGianBaiGiang=165
		SET @CungCoKienThuc=N''
		SET @HDCungCoGV=N'- Đặt câu hỏi ---- Thuyết trình hệ thống lại kiến thức.'
		SET @HDCungCoHS=N'- Lắng nghe ---- Trả lời câu hỏi ---- Ghi bài.'
		SET @ThoiGianCungCo=10
		SET @HuongDanTuHoc=N''
		SET @HDHuongDanTHGV=N'- Đặt câu hỏi ---- Hướng dẫn thực hiện.'
		SET @HDHuongDanTHHS=N'- Lắng nghe ghi bài ---- Làm bài tập theo yêu cầu'
		SET @ThoiGianHDTH=10
		SET @TaiLieuThamKhao=N''

	---------------SET GIAO AN THUC HANH---------------
		DECLARE @MucTieu2 nvarchar(2000)
		DECLARE @DoDungPTDH2 nvarchar(2000)
		DECLARE @HinhThucTCDH2 nvarchar(2000)
		DECLARE @OnDinhLH2 nvarchar(2000)
		DECLARE @ThoiGianOnDinh2 int--10
		DECLARE @ThoiGianTHBH2	int--290
		DECLARE @DanNhap2 nvarchar(2000)
		DECLARE @HDDanNhapGV2 nvarchar(2000)
		DECLARE @HDDanNhapHS2 nvarchar(2000)
		DECLARE @ThoiGianDN2 int--20
		DECLARE @HuongDanBanDau2 nvarchar(2000)
		DECLARE @HDHuongDanBDGV2 nvarchar(2000)
		DECLARE @HDHuongDanBDHS2 nvarchar(2000)
		DECLARE @ThoiGianHDBD2 int --50
		DECLARE @HuongDanThuongXuyen2 nvarchar(2000)
		DECLARE @HDHuongDanTXGV2 nvarchar(2000)
		DECLARE @HDHuongDanTXHS2 nvarchar(2000)
		DECLARE @ThoiGianHDTX2 int --190
		DECLARE @HDHuongDanKT2 nvarchar(2000)
		DECLARE @HDHuongDanKTGV2 nvarchar(2000)
		DECLARE @HDHuongDanKTHS2 nvarchar(2000)
		DECLARE @ThoiGianHDKT int --20
		DECLARE @HuongDanRenLuyen2 nvarchar(2000)
		DECLARE @HDHuongDanRLGV2 nvarchar(2000)
		DECLARE @ThoiGianHDRL2 int --10
		DECLARE @RutKinhNghiem2 nvarchar(2000)

			SET @MucTieu2=N'Giáo viên update Mục tiêu của bài giảng'
			SET @DoDungPTDH2=N'- Bảng viết + viết lông viết bảng ---- Máy tính thực hành'
			SET @HinhThucTCDH2=N'- Hướng dẫn ban đầu tập trung ---- Học viên thực hành theo nhóm -> báo cáo kết quả'
			SET @OnDinhLH2=N'Setup projector --- Điểm danh lớp'
			SET @ThoiGianOnDinh2=10
			SET @ThoiGianTHBH2=290
			--SET @DanNhap2=N'Giáo viên update nội dung phần DẪN NHẬP'
			SET @HDDanNhapGV2=N'- Thuyết trình ---- Trình chiếu ---- Phát vấn ---- Quản lý lớp.'
			SET @HDDanNhapHS2=N'- Lắng nghe ---- Quan sát ---- Trả lời câu hỏi ---- Ghi bài.'
			SET @ThoiGianDN2=20
			SET @HuongDanBanDau2=N''
			SET @HDHuongDanBDGV2=N'- Thuyết trình có minh họa bằng Slide trình chiếu ---- Thao tác mẫu nội dung thực hành ---- Cho bài tập thực hành, chia nhóm ---- Chia nhóm.'
			SET @HDHuongDanBDHS2=N'- Nghe nhắc lại nội dung lý thuyết ---- Quan sát giáo viên thao tác mẫu ---- Tìm nhóm thực hành ---- Phân công công việc trong nhóm.'
			SET @ThoiGianHDBD2=50
			SET @HuongDanThuongXuyen2=N'- Kiểm tra các bước thực hiện của từng nhóm, học sinh ---- Xử lý lỗi trong khi thực hiện ---- Hỗ trợ học viên thực hiện thao tác chưa chính xác'
			SET @HDHuongDanTXGV2=N'- Quan sát thao tác học viên ---- Nhắc nhở học viên sửa sai thao tác ---- Làm mẫu lại cho những nhóm yếu.'
			SET @HDHuongDanTXHS2=N'- Thực hành theo bài tập ---- Ghi chú lại những lưu ý quan trọng ---- Ghi nhận lại những lỗi thường xảy ra khi thực hiện.'
			SET @ThoiGianHDTX2=190
			SET @HDHuongDanKT2=N'- Kiểm tra kết quả thực hiện của từng nhóm, học sinh ---- Hệ thống các lỗi thường gặp khi thực hành ---- Những lưu ý cần thiết trong quá trình chuyển đổi hệ đếm'
			SET @HDHuongDanKTGV2=N'- Thuyết trình ---- Quản lý lớp ---- Tổng kết nội dung.'
			SET @HDHuongDanKTHS2=N'- Lắng nghe ---- Ghi chú ---- Quan sát, so sánh kết quả với bài làm.'
			SET @ThoiGianHDKT=20
			SET @HuongDanRenLuyen2=N''
			SET @HDHuongDanRLGV2=N'-Đưa ra các câu hỏi trắc nghiệm lý thuyết, giúp cho học sinh nắm được toàn bộ nội dung bài học. ---- Đưa ra bài thực hành cá nhân để học sinh tự thực hiện.'
			SET @ThoiGianHDRL2=10
			SET @RutKinhNghiem2=N''
	---------------SET GIAO AN TICH HOP----------------
	DECLARE @MucTieu3 nvarchar(2000)
	DECLARE @DoDungPTDH3 nvarchar(2000)
	DECLARE @HinhThucTCDH3 nvarchar(2000)
	DECLARE @OnDinhLH3 nvarchar(2000)
	DECLARE @ThoiGianOnDinh3 int --10
	DECLARE @ThoiGianTHBH3 int --230
	DECLARE @DanNhap3 nvarchar(2000)
	DECLARE @HDDanNhapGV3 nvarchar(2000)
	DECLARE @HDDanNhapHS3 nvarchar(2000)
	DECLARE @ThoiGianDanNhap3 int --10
	DECLARE @GioiThieuChuDe3 nvarchar(2000)
	DECLARE @HDGTCDGV3 nvarchar(2000)
	DECLARE @HDGTCDHS3 nvarchar(2000)
	DECLARE @ThoiGianGTCD3 int --20
	DECLARE @GiaiQuyetVanDe3 nvarchar(2000)
	DECLARE @HDGQVDGV3 nvarchar(2000)
	DECLARE @HDGQVDHS3 nvarchar(2000)
	DECLARE @ThoiGianGTVD3 int --170
	DECLARE @KetThucVanDe3 nvarchar(2000)
	DECLARE @HDHDKTGV3 nvarchar(2000)
	DECLARE @HDHDKTHS3 nvarchar(2000)
	DECLARE @ThoiGianHDKT3 int --30
	DECLARE @HuongDanTuHoc3 nvarchar(2000)
	DECLARE @HDTuHocGV3 nvarchar(2000)
	DECLARE @ThoiGianHDTH3 int --5
	DECLARE @RutKinhNghiem3 nvarchar(2000)

			SET @MucTieu3=N'Giáo viên update Mục tiêu của bài giảng' --Lay Tu Muc_Tieu_Bai_Hoc Cua DeCuongMonHoc
			SET @DoDungPTDH3=N'Laptop, Projector, Bảng ,viết'
			SET @HinhThucTCDH3=N'Sử dụng máy chiếu, chiếu slide trình bày --- Trả lời các câu hỏi của học viên'
			SET @OnDinhLH3=N'Setup projector --- Điểm danh lớp'
			SET @ThoiGianOnDinh3=10
			SET @ThoiGianTHBH3=215
			SET @DanNhap3=N'Giáo viên update nội dung phần DẪN NHẬP' --Lay Tu Ten Chuong Cua ChiTietKHGD, Khong lay order
			SET @HDDanNhapGV3=N'- Đưa ra những đoạn phim, hình ảnh về ứng dụng của bài học.--- -  Đặt câu hỏi cho học sinh.'
			SET @HDDanNhapHS3=N'- Chú ý theo dõi về những đoạn phim, hình ảnh. --- - Nhận xét về tính ứng dụng của bài học trong thực tế. --- - Trả lời các câu hỏi giáo viên đưa ra.'
			SET @ThoiGianDanNhap3=10
			SET @GioiThieuChuDe3=N'Giáo viên update nội dung phần GIỚI THIỆU CHỦ ĐỀ' --Lay tu noi dung ly thuyet bo vao cua ban chi tiet khgd
			SET @HDGTCDGV3=N'- Cho xem trước sản phẩm mẫu của bài học.--- - Phát phiếu hướng dẫn thực hiện cho học sinh xem các bước thực hiện.'
			SET @HDGTCDHS3=N'- Chú ý theo dõi các demo hướng dẫn của giáo viên. --- - Trả lời các câu hỏi của giáo viên đưa ra. --- - Đặt câu hỏi với các kiến thức mới.'
			SET @ThoiGianGTCD3 =20
			SET @GiaiQuyetVanDe3 =N'Giáo viên update nội dung phần GIẢI QUYẾT VẤN ĐỀ' --Lay tu noi dung thuc hanh cua chitietkhgd
			SET @HDGQVDGV3 =N'-Trình chiều slide về các khai niệm cơ bản , các thuật ngữ chuyên môn trong bài học.--- - Làm theo các bước theo phiếu hướng dẫn thực hiện một cách chi tiết, chậm rãi cho học sinh theo dõi. --- - Hướng dẫn cách làm từng bước cho học sinh. --- - Quan sát cách làm của học sinh, hướng dẫn các bạn làm chậm.'
			SET @HDGQVDHS3 =N'- Xem slide và xem các thao tác mẫu của giáo viên. --- -  Đối chiếu theo phiếu hướng dẫn thực hiện. - Thực hành theo hướng dẫn của giáo viên. --- -Thắc mắc các bước cài đặt khó.'
			SET @ThoiGianGTVD3 =150
			SET @KetThucVanDe3 =''
			SET @HDHDKTGV3 =N'-Tóm tắt lại toàn bộ nội dung lý thuyết , thực hành của bài học, các ý chính của từng mục. --- - Thao tác mẫu lại 1 lần nữa để học sinh nắm rõ các bước thực hành.'
			SET @HDHDKTHS3 =N'-Hệ thống hóa lại toàn bộ nội dung của bài học, đặt câu hỏi. --- -Hệ thống hóa lại toàn bộ nội dung của bài học, đặt câu hỏi. --- - Quan sát các thao tác và review lại các thao tác còn thiếu.'
			SET @ThoiGianHDKT3 =30
			SET @HuongDanTuHoc3 =''
			SET @HDTuHocGV3 =N'-Đưa ra các câu hỏi trắc nghiệm lý thuyết, giúp cho học sinh nắm được toàn bộ nội dung bài học. --- - Đưa ra bài thực hành cá nhân để học sinh tự thực hiện.'
			SET @ThoiGianHDTH3 =5
			SET @RutKinhNghiem3 =N''
			
	---------------------------------------------------
	--GET CHITIETKHGD
	DECLARE arrayCTKHGD CURSOR FOR
	(
		SELECT ID As MaCTKHGD,Ngay_BD,Ten_chuong,Co_hieu,Noi_dung_TH,Cong_viec_chuan_bi,STT_Noi_Dung,nhom As Nhom,Tuan,Ma_giao_an,Muc_tieu_bai_hoc
		FROM ChiTietKHGD 
		WHERE Ma_ke_hoach_giang_day=@MaKHGD
	)

	--OPEN ARRAY
	OPEN arrayCTKHGD 

	FETCH NEXT FROM arrayCTKHGD 
	INTO @MaCTKHGD,@Ngay_BD,@TenChuong,@CoHieu,@NoiDungTH,@CongViecChuanBi,@STTNoiDung,@Nhom,@Tuan,@MaGiaoAn,@Muc_Tieu_Bai_Hoc
	

	SET @TempSTTND =-1
	SET @CoHieuTemp=-1
	SELECT @MaGiaoVien=Ma_nguoi_tao,@SoTietMoiBuoi=So_tiet_moi_buoi FROM KeHoachGiangDay WHERE ID=@MaKHGD
	
	WHILE @@FETCH_STATUS=0
	BEGIN
	
		-------------------------------------------------------------------------------------
		IF ISNULL(@MaGiaoAn,'') ='' 
				AND ( @STTNoiDung <> @TempSTTND OR (@STTNoiDung = @TempSTTND AND @CoHieu <> @CoHieuTemp)) 
		BEGIN
			
			SET @TempSTTND=@STTNoiDung
			SET @CoHieuTemp=@CoHieu
			IF @CoHieu = @CoHieuLT
			BEGIN
				SET	@MucTieu=@Muc_Tieu_Bai_Hoc
				SET @DanNhap=@Muc_Tieu_Bai_Hoc
				SET @NoiDungBaiGiang=@TenChuong
				SET @CungCoKienThuc=@Muc_Tieu_Bai_Hoc
				SET @ThoiGianTHBH=@SoTietMoiBuoi*45
				--------------------CALL STORE INSERT GiaoAn LY THUYET--------------------------
				Execute sp_ISO_InsertGiaoAnLyThuyet
						@MaGiaoAn output,@MaKHGD,@SoGiaoAn,@Ngay_BD,@MucTieu,@DoDungPTDH,@OnDinhLH
						,@ThoiGianOD,@ThoiGianTHBH,@DanNhap,@HDDanNhapGV,@HDDanNhapHS,@ThoiGianDN,@NoiDungBaiGiang,@HDGiangBaiMoiGV,@HDGiangBaiMoiHS,@ThoiGianBaiGiang
						,@CungCoKienThuc,@HDCungCoGV,@HDCungCoHS,@ThoiGianCungCo,@HuongDanTuHoc,@HDHuongDanTHGV,@HDHuongDanTHHS
						,@ThoiGianHDTH,@TaiLieuThamKhao,@DateCurrent,@TenChuong,@MaGiaoVien

			END
			ELSE IF @CoHieu = @CoHieuTH			
			BEGIN
				SET	@MucTieu2=@Muc_Tieu_Bai_Hoc
				SET @DanNhap2=@Muc_Tieu_Bai_Hoc
				SET @TenChuong=@NoiDungTH
				SET @HuongDanBanDau2=@NoiDungTH
				SET @ThoiGianTHBH2=@SoTietMoiBuoi*60
				--------------------CALL STORE INSERT GiaoAn THUC HANH--------------------------
				Execute sp_ISO_InsertGiaoAnThucHanh
						@MaGiaoAn output,@MaKHGD,@SoGiaoAn,@Ngay_BD,@MucTieu2,@DoDungPTDH2,@HinhThucTCDH2,@OnDinhLH2,@ThoiGianOnDinh2
						,@ThoiGianTHBH2,@DanNhap2,@HDDanNhapGV2,@HDDanNhapHS2,@ThoiGianDN2,@HuongDanBanDau2,@HDHuongDanBDGV2,@HDHuongDanBDHS2
						,@ThoiGianHDBD2,@HuongDanThuongXuyen2,@HDHuongDanTXGV2,@HDHuongDanTXHS2,@ThoiGianHDTX2,@HDHuongDanKT2,@HDHuongDanKTGV2
						,@HDHuongDanKTHS2,@ThoiGianHDKT,@HuongDanRenLuyen2,@HDHuongDanRLGV2,@ThoiGianHDRL2,@RutKinhNghiem2,@DateCurrent,@TenChuong,@MaGiaoVien
			END
			ELSE
			BEGIN
				--------------------CALL STORE INSERT GiaoAn TICH HOP--------------------------
				SET @GiaiQuyetVanDe3=@NoiDungTH
				SET @GioiThieuChuDe3=@TenChuong
				SET	@MucTieu3=@Muc_Tieu_Bai_Hoc
				SET @DanNhap3=@Muc_Tieu_Bai_Hoc
				SET @ThoiGianTHBH3=@SoTietMoiBuoi*45
				Execute sp_ISO_InsertGiaoAnTichHop
						@MaGiaoAn output,@MaKHGD,@SoGiaoAn,@Ngay_BD,@MucTieu3,@DoDungPTDH3,@HinhThucTCDH3,@OnDinhLH3,@ThoiGianOnDinh3,@ThoiGianTHBH3
						,@DanNhap3,@HDDanNhapGV3,@HDDanNhapHS3,@ThoiGianDanNhap3,@GioiThieuChuDe3,@HDGTCDGV3,@HDGTCDHS3,@ThoiGianGTCD3,@GiaiQuyetVanDe3,@HDGQVDGV3,@HDGQVDHS3
						,@ThoiGianGTVD3,@KetThucVanDe3,@HDHDKTGV3,@HDHDKTHS3,@ThoiGianHDKT3,@HuongDanTuHoc3,@HDTuHocGV3,@ThoiGianHDTH3,@RutKinhNghiem3,@DateCurrent,@TenChuong,@MaGiaoVien
			END

			SET @SoGiaoAn=@SoGiaoAn+1

			IF ISNULL(@MaGiaoAn,-1)<>-1
			BEGIN
				UPDATE ChiTietKHGD SET Ma_giao_an=@MaGiaoAn WHERE ID=@MaCTKHGD
				UPDATE GiaoAn SET User1=@CoHieu WHERE ID=@MaGiaoAn
			END
		END
		-------------------------------------------------------------------------------------
		
		FETCH NEXT FROM arrayCTKHGD 
		INTO @MaCTKHGD,@Ngay_BD,@TenChuong,@CoHieu,@NoiDungTH,@CongViecChuanBi,@STTNoiDung,@Nhom,@Tuan,@MaGiaoAn,@Muc_Tieu_Bai_Hoc				

	END


	--CLOSE ARRAY
	CLOSE arrayCTKHGD
	--FREE ARRAY 			
	DEALLOCATE arrayCTKHGD 
			
END
