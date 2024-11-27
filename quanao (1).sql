-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 27, 2024 lúc 12:01 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanao`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `id` int(11) NOT NULL,
  `madonhang` varchar(10) NOT NULL,
  `masanpham` varchar(10) NOT NULL,
  `giasanpham` int(11) NOT NULL,
  `soluongsanpham` int(11) NOT NULL,
  `Motachitiet` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `id` int(11) NOT NULL,
  `tenkhachhang` varchar(50) NOT NULL,
  `sodienthoai` int(11) NOT NULL,
  `email` varchar(20) NOT NULL,
  `diachi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

CREATE TABLE `khachhang` (
  `ID` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `matkhau` varchar(250) NOT NULL,
  `tenkhachhang` varchar(100) NOT NULL,
  `dienthoai` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`ID`, `email`, `matkhau`, `tenkhachhang`, `dienthoai`) VALUES
(1, 'trungnguyen7358@gmail.com', '12345678', 'trung', '0976982240'),
(2, 'jungkior1@gmail.com', '123', 'kqmdcvl1', '0976155120'),
(3, 'jungkior2@gmail.com', '123', '', '1234567890'),
(4, 'jungkior3@gmail.com', 'jqk', 'jungkior', '1234567890'),
(5, 'jungkior4@gmail.com', '123', 'Nghia', '0901573919');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `ID` int(11) NOT NULL,
  `Tensanpham` varchar(50) NOT NULL,
  `Hinhanhsanpham` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`ID`, `Tensanpham`, `Hinhanhsanpham`) VALUES
(1, 'Trang chủ', 'https://static.thenounproject.com/png/3574480-200.png'),
(2, 'Quần-Áo', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkVOWmq6iydSgMkJe5rreK0O3h61eiYpBW_A&s'),
(3, 'Giày', 'https://pos.nvncdn.com/205d8e-20707/ps/20240118_ZEo4zSF1NA.jpeg'),
(4, 'Liên hệ', 'https://png.pngtree.com/png-clipart/20201113/ourmid/pngtree-phone-icon-with-square-black-frame-png-image_5578524.png'),
(5, 'Thông tin', 'https://png.pngtree.com/png-vector/20190110/ourmid/pngtree-vector-information-icon-png-image_312741.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanphammoi`
--

CREATE TABLE `sanphammoi` (
  `ID` int(11) NOT NULL,
  `tensp` varchar(250) NOT NULL,
  `giasp` varchar(100) NOT NULL,
  `hinhanh` varchar(500) NOT NULL,
  `mota` varchar(1000) NOT NULL,
  `loai` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanphammoi`
--

INSERT INTO `sanphammoi` (`ID`, `tensp`, `giasp`, `hinhanh`, `mota`, `loai`) VALUES
(1, 'Áo phông nam CANIFA', '399000', 'https://down-vn.img.susercontent.com/file/vn-11134201-7ras8-m20pwhu4cy5acf.webp', 'Sản phẩm được thiết kế, sản xuất và phân phối độc quyền bởi CANIFA - thương hiệu thời trang Việt Nam được nhiều khách hàng tin tưởng sử dụng từ năm 2001. Với hệ thống hơn 100 cửa hàng và đại lý phân phối khắp toàn quốc', 1),
(2, 'ÁO VEST 4C7025CT2/A22', '4500000', 'https://www.viettien.com.vn/admin/wp-content/uploads/2019/10/VEST-4.jpg', 'Áo Vest San Sciaro giúp quý ông luôn lịch lãm, chuyên nghiệp, sang trọng và thoải mái phù hợp khi gặp gỡ đối tác hoặc tham dự các sự kiện trang trọng. Sản phẩm được phân phối tại các cửa hàng Việt Tiến trên toàn quốc.', 1),
(3, 'Áo Khoác Nam Burberry Quilted Jacket', '17800000', 'https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2024/11/ao-khoac-nam-burberry-quilted-jacket-mau-den-size-xs-672457ecdac1c-01112024112412.jpg', 'Áo Khoác Nam Burberry Quilted Jacket Màu Đen là chiếc áo thời trang nam cao cấp được thiết kế vô cùng thời trang đến từ thương hiệu Burberry nổi tiếng. Sở hữu gam màu thanh lịch cùng chất liệu cao cấp áo giữ ấm tốt cho cơ thể và mang lại cho bạn phong cách thời trang trẻ trung, nam tính.', 1),
(4, 'Bộ Quần Áo Cộc Tay Nam Nike Basketball', '7450000', 'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https:/admin.vuahanghieu.com/upload/product/2024/06/bo-quan-ao-coc-tay-nam-nike-basketball-fq0355-100-fq0352-010-mau-trang-den-size-m-667e1b0086150-28062024090800.jpg', 'Bộ Quần Áo Cộc Tay Nam Nike Basketball FQ0355-100/FQ0352-010 Màu Trắng Đen được hoàn thiện từ với chất liệu vải polyester và cotton cao cấp mềm mại, thoáng khí, chất vải nhẹ và mang lại cảm giác thoải mái khi mặc. Bộ quần áo này mang phong cách thể thao dễ chịu và thoải mái phù hợp mặc hàng ngày, tập thể dục thể thao.   ', 1),
(5, 'Áo Cardigan Nữ Spao Cable Crop Cardigan', '1450000', 'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2024/10/ao-cardigan-nu-spao-cable-crop-cardigan-spcke37g42-mau-xanh-navy-size-s-6703394cf0f36-07102024082844.jpg', 'Áo thiết kế kiểu dáng ngắn, vừa vặn,cộc tay với cổ tròn, đóng mở cúc gài, có thể mặc đóng hoặc khoác ngoài tiện lợi. Điểm nhấn chi tiết logo thêu tinh tế phía trước ngực, thể hiện nét đặc trưng riêng.  Đây sẽ là mẫu áo len cộc tay lý tưởng từ mùa hè sang thu.', 1),
(6, 'Áo Thun Nam Lacoste Men\'s Sport Crocodile', '1990000', 'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2024/11/ao-thun-nam-lacoste-men-s-sport-crocodile-print-cotton-jersey-th1520-031-mau-xanh-navy-size-xs-67244f2bda598-01112024104651.jpg', 'Áo thun Lacoste Men\'s Sport Crocodile Print Cotton Jersey TH1520 031 được thiết kế với kiểu dáng năng động và được làm từ chất vải cotton mềm mịn, có độ thoáng mát nhưng vẫn giúp giữ ấm cho bạn được vào mùa lạnh.Form dáng chuẩn đẹp, từng đường may chỉn chu và tinh tế nên dù bạn có là vị khách khó tính đến mấy cũng sẽ cảm thấy hài lòng về sản phẩm này. Bên cạnh đó, chiếc áo cũng không quá cầu kì trong thiết kế, nổi bật với tone màu xanh navy và được tạo điểm nhấn với tên thương hiệu ở giữa ngực kèm họa tiết cá sấu trên tay áo mang nét đặc trưng của hãng.', 1),
(7, 'Giày Lười Nam Cole Haan Pinch Penny Loafer', '3450000', 'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2024/06/giay-luoi-nam-cole-haan-pinch-penny-loafer-mau-den-size-40-666ff2d45c109-17062024152452.jpg', 'Giày Lười Nam Cole Haan Pinch Penny Loafer Màu Đen được làm từ da bóng cao cấp. Phần đế giày có độ bền cao, ma sát tốt. Lót giày dày dặn, êm ái giúp chân luôn thoải mái dù mang giày suốt cả ngày.', 2),
(8, 'Quần Jean Nam Dolce & Gabbana D&G Navy Blue ', '15295000', 'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2024/03/quan-jean-nam-dolce-gabbana-d-g-navy-blue-flared-classic-gp02xd-g8ke5-s9001-mau-xanh-size-46-65ee845a22405-11032024111106.jpg', 'Quần Jean Dolce & Gabbana D&G Navy Blue Flared Classic GP02XD G8KE5 S9001 được làm từ vải cotton cao cấp co giãn tốt nên mặc rất thoải mái. Form quần chuẩn đẹp, đường may tinh tế, tỉ mỉ từng chi tiết làm hài lòng ngay cả với khách hàng khó tính.', 1),
(9, 'Bộ Thể Thao Puma Core Heritage', '3250000', 'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2024/11/bo-the-thao-puma-core-heritage-677677-677678-mau-do-size-s-67258ebc9ef34-02112024093020.jpg', 'Bộ Thể Thao Puma Core Heritage có độ mềm mịn, không nhăn, không xù, không phai màu. Gam màu đơn giản này, bạn sẽ dễ dàng kết hợp với các trang phục khác nhau theo sở thích của bản thân.\r\nĐiểm nhấn tên thương hiệu in nổi bật phía trước mang nét đặc trưng chỉ có ở thương hiệu Puma.', 1),
(10, 'Giày Thể Thao Nike SB Dunk Low Ben & Jerry\'s \'Chunky Dunky\'', '37920000', 'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2023/02/giay-the-thao-nike-sb-dunk-low-ben-jerry-s-chunky-dunky-cu3244-100-phoi-mau-size-39-63fc764c2c024-27022023162220.jpg', 'Giày Thể Thao Nike SB Dunk Low Ben & Jerry\'s \'Chunky Dunky\' CU3244-100 Phối Màu được làm từ chất liệu da cao cấp với độ ôm được thiết kế đặc biệt để nâng đỡ có định hướng và hỗ trợ chuyển động.Form giày đi lên chân vừa vặn, các đường chỉ khâu rất tinh tế và chắc chắn đảm bảo hài lòng mọi khách hàng. Đế ngoài bằng cao su mềm dẻo tạo độ bám, lớp lót mềm mại mang lại cảm giác thoải mái cho đôi chân.', 2),
(11, 'Giày Thể Thao Nike Travis Scott X Air Jordan 1 Low OG Reverse Mocha', '38800000', 'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/06/giay-the-thao-nike-travis-scott-x-air-jordan-1-low-og-reverse-mocha-phoi-mau-62b9388a27724-27062022115642.jpg', 'Đôi giày này được thiết kế với tông màu mocha nâu và trắng, kết hợp với những chi tiết Swoosh ngược mang đậm dấu ấn của Travis Scott. Phối màu Reverse Mocha đã tạo nên sự khác biệt lớn, không quá phô trương nhưng vẫn thể hiện sự tinh tế và cá tính.', 2),
(12, 'Giày Cao Gót Nữ Dior Women J’Adior Slingback Pump Black And White', '17800000', 'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2024/08/giay-cao-got-nu-dior-women-j-adior-slingback-pump-black-and-white-cotton-embroidery-mau-den-trang-size-37-5-66bf162a100ce-16082024160442.jpg', 'Giày Dior Women J’Adior Slingback Pump Black And White Cotton Embroidery được làm từ chất liệu vải phối da cao cấp có độ mềm mại và thoải mái cho người đi. Đôi giày này đã thực sự thu hút sự săn đón của các chị em nhờ thiết kế sành điệu, sang trọng cùng gam màu đen phối trắng đẹp mắt và cực dễ phối đồ.', 2),
(13, 'Giày Sneaker Dior Patent Calf Leather', '19600000', 'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2023/12/giay-sneaker-dior-patent-calf-leather-iridescent-nappa-leather-and-suede-phoi-mau-657c0104114be-15122023143220.jpg', 'Giày Sneaker Dior Patent Calf Leather lấy cảm hứng từ những đôi giày thể thao bóng rổ từ những năm 90, Astroloubi như một món quà thú vị cho outfit năng động thường ngày.', 2),
(14, 'Giày Cao Gót Nữ Dior J’adior Slingback Pump Gold-Tone', '24500000', 'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2023/06/giay-cao-got-dior-j-adior-slingback-pump-gold-tone-kdp944mlm_s49k-mau-vang-gold-6478382e311c2-01062023131822.jpg', 'Slingback là kiểu giày với một chiếc quai đằng sau giúp người dùng khoe được gót chân xinh xắn. Phần quai phía sau được thiết kế như sợi thun co giãn với dòng chữ \"J\'adior\" thanh lịch. Phần mũi nhọn giúp tạo cảm giác đôi chân dài hơn, bước đi uyển chuyển, màu vàng gold tối giản dễ dàng phối với nhiều loại trang phục và thích hợp cho nhiều hoàn cảnh khác nhau.', 2),
(15, 'Giày Lười Nam Duca Di Morrone Da Lộn Leone-Cam_TDM ', '1795000', 'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/07/giay-luoi-nam-duca-di-morrone-da-lon-leone-cam_tdm-mau-nau-size-41-62e2538bdf93d-28072022161451.jpg', 'Giày Lười Nam Duca Di Morrone Da Lộn Leone-Cam_TDM Màu Nâu được làm từ chất liệu da lộn cao cấp, mềm mại, dễ vệ sinh. Đế giày với độ bền cao, thiết kế chắc chắn mang lại độ ma sát tốt.', 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `sanphammoi`
--
ALTER TABLE `sanphammoi`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `sanphammoi`
--
ALTER TABLE `sanphammoi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
