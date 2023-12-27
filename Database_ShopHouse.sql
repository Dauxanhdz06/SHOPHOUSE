
--###### DỰ ÁN SHOP HOUSE#####--
----create database ShopHouse
----Phân chia Vai trò của ba loại tài khoản(Bảng Role)
create table Role (roleID int primary key, roleName nvarchar(20))  
insert into Role (roleID, roleName) values ('0', N'customer'), ('1', N'seller'),('2',N'admin');
select * from Role
----Tạo bảng User (Tài khoản đăng nhập và mật khẩu)
create table [User](userID int identity(1,1) primary key, [name] nvarchar(50), username varchar(50), [password] varchar(20),
phone varchar(10), address nvarchar(500), mail nvarchar(100), roleID int, 
foreign key (roleID) references Role(roleID))
insert into [User] ([name], username, [password],roleID) values 
				( N'Nguyễn Việt Hoàng','VietHoang', '123456','2'),
				( N'Admin Nguyen','VietHoang','123456','2')
insert into [User] ( [name], username, [password],roleID) values 
				( N'Seller 1','Seller1','012345','1'),
				( N'Seller 2','Seller2','012345','1'),
				( N'Customer1','Customer1','012345','0'),
				( N'Customer2','Customer2','012345','0');
select * from [User]
----Tạo bảng Category phân loại mặt hàng
create table Category (categoryID varchar(10) primary key, categoryName nvarchar(50))
insert into Category (categoryID, categoryName) values ('TS',N'T-Shirts'), 
														('JA',N'Jacket'),
														('JE',N'Jeans'),
														('SW',N'Sweatshirts'),
														('TR',N'Trousers'),
														('KI',N'Kitwears'),
														('AC',N'Accesories');
select * from Category
----Tạo bảng Product (sản phẩm được bán trong Website)
create table Product (
productID varchar(10) primary key, 
productName nvarchar(200), 
productPrice varchar(max),
detail nvarchar(max),
quantity int,
categoryID varchar(10), created_By nvarchar(20),
type varchar(20),
---man,woman,kids,accessories,essential,prices
CreateDate date,
voting INT DEFAULT 0
foreign key (categoryID) references Category(categoryID)
)
select * from Product
----Tạo bảng isSeller (bảng quản lý người bán hàng)
create table isSeller(
userID int, productID varchar(10), primary key (userID, productID),
foreign key (userID) references [User](userID), 
foreign key (productID) references Product(productID)
) 
select * from isSeller
----Tạo bảng ProductImg (bảng chứa ảnh mặt hàng)
create table ProductImg ( 
IMGID varchar(10) primary key, 
url nvarchar(max), 
createDateIMG date,
productID varchar(10), 
foreign key (productID) references Product(productID)
)
select * from ProductIMG
----Tạo bảng InformationShopping(tổng hợp thông tin sản phẩm, khách hàng xuất hóa đơn thanh toán)
create table [InformationShopping](
InforID int identity(1,1) primary key, 
userID int,
[name] nvarchar(250),
[phone] varchar(50),
[address] nvarchar(250),
[RequireDate] date,
totalcost int,
OrderID int,
foreign key (userID) references [User](userID)
)
select * from [InformationShopping]
----Tạo bảng Order_Items(liệt kê những mặt hàng đã mua)
create table [Order_Items] (
OrderID int identity(1,1) primary key,
productID varchar(10), 
quantityProductBuyed int,
InforID int,
foreign key (productID) references Product(productID),
foreign key (InforID) references [InformationShopping](InforID)
)
select * from Order_Items
---ALTER TABLE [InformationShopping]
---DROP COLUMN OrderID;
---DELETE FROM Product
----WHERE productID = 'T-S1';
insert into Product (productID, productName, productPrice,detail,quantity,categoryID,created_By,type,CreateDate) values
------------####################T-Shirt###################----------------
-----Áo Nam (T-Shirt) 16
('TS1',N'Áo Thun Đông Nam Mickey Everything','800.000',N'Thành phần: 70% Cotton, 30% Polyester.
Bộ sưu tập SHOP’S HOUSE x Disney với biểu tượng nổi tiếng chuột Mickey, hình ảnh được thiết kế bởi các nhà sáng tạo hàng đầu tại Disney. 
Sử dụng loại vải có kết cấu sợi tạo nên mặt vải đanh chắc, không bị bai dão, hạn chế xù lông tốt.
Mặt vải tạo nên sự ấm áp cho người mặc, khả năng co giãn nhẹ nhàng giúp thoải mái ngay cả khi vận động.
Sản xuất tai Việt Nam.
SHOP’S HOUSE - Look good. Feel good.
','10','TS','Seller1','MAN',N'2023-12-20'),
('TS2',N'Áo Thun Đông Nam Mickey','430.000',N'Nằm trong BST áo nỉ gia đình mới nhất mùa thu đông năm nay.
Kiểu dáng rộng, thoải mái với điểm nhấn hình Mickey nhỏ ở ngực trẻ trung.
Thiết kế dài tay giúp giữ ấm tốt.
Thích hợp mix cùng quần jeans, quần dài mặc trong mọi hoàn cảnh đi chơi, đi làm.
Sản xuất tại Việt Nam.
SHOP’S HOUSE - Look good. Feel good.
','10','TS','Seller1','MAN',N'2023-12-20'),
('TS3',N'Áo Thun Đông Nam Cơ Bản','810.000',N'Thành phần: 95% Viscose, 5% Spandex.
Được biết đến là sáng tạo tuyệt vời của ngành dệt may - sợi tái sinh có nguồn gốc từ Bamboo ngày càng trở nên phổ biến.
Tre là một trong số những thực vật bền vững, sinh trưởng tự nhiên và thân thiện với môi trường.
Cây tre phát triển nhanh vì vậy việc sử dụng sợi làm từ tre không gây tác động đến tự nhiên.
Với sự kết từ Bamboo và Spandex giúp vải có các tính năng ưu việt:
Áo mềm mại, thông thoáng, thấm hút tốt, thân thiện với làn da.
Sản xuất tại Việt Nam.
SHOP’S HOUSE - Look good. Feel good.
','10','TS','Seller1','MAN',N'2023-12-20'),
('TS4',N'Áo Thun Đông Nam In Chữ City','300.000',N'Chất liệu da cá dày, thành phần: 70% Cotton + 30% Polyester.
Vải nỉ thể thao nhẹ, thấm hút tốt, độ bền cao.
Kiểu dáng cơ bản, form vừa cơ thể, điểm nhấn là phần in chữ trước ngực.
Thiết kế dài tay, bo nhẹ ở cổ tay thân áo giữ ấm tốt và thoải mái.
Mặc cùng quần jean,quần nỉ đi chơi hoặc đi làm.
Sản xuất tại Việt Nam.
SHOP’S HOUSE - Look good. Feel good.
','10','TS','Seller1','MAN',N'2023-12-20'),
('TS5',N'Áo Thun Đông Nam Rip Cổ 4cm','200.000',N'Chất liệu thun rib co giãn tốt, thoải mái và mềm mại, không kích ứng da.
Thành phần: 95% Cotton, 5% Spandex.
Kiểu dáng suông cơ bản, cao cổ giữ ấm cơ thể vượt trội.
Thích hợp để mặc bên trong như áo giữ nhiệt.
Sản xuất tại Việt Nam.
SHOP’S HOUSE - Look good. Feel good.
','10','TS','Seller1','MAN',N'2023-12-20'),
('TS6',N'Áo Thun Nam In Superior Cotton USA','750.000',N'Chất liệu: 100% Cotton.
Sợi bông cao cấp đến từ Mỹ được tin dùng nhất.
Khả năng thấm hút mồ hôi tốt, mang lại sự thoải mái trong điều kiện thời tiết tại Việt Nam.
Co giãn nhẹ, phù hợp với chuyển động của cơ thể.
Hình in Superior cá tính tạo điểm nhấn cho mẫu áo.
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam.
','10','TS','Seller1','MAN',N'2023-12-20'),
('TS7',N'Áo Thun Đông Nam Cắt Phối Nhung','820.000',N'Chất liệu da cá dày thấm hút và giữ ấm tốt mang đến cảm giác thoải mái cho người mặc.
Thành phần: 70% Cotton + 30% Polyester.
Áo nỉ với điểm nhấn cắt phối, thiết kế basic dễ mặc, kiểu dáng rộng rãi.
Thích hợp mặc chạy bộ, chơi thể thao hoặc đi dạo phố, cà phê với bạn bè.
Kết hợp cùng quần jeans, quần nỉ và phối với áo thun, áo giữ nhiệt.
Sản xuất tại Việt Nam.
SHOP’S HOUSE - Look good. Feel good.
','10','TS','Seller1','MAN',N'2023-12-20'),
('TS8',N'Áo Thun Thể Thao Nam Training','240.000',N'Thành phần 79% Polyester + 21% Spandex.
Thoải mái với vải mềm mại, thông thoáng, thấm hút tốt.
Tập luyện cường độ cao nhờ áo co giãn, đàn hồi tuyệt vời.
Bề mặt vải chắc chắn, độ bền cao - hạn chế nhăn nhàu.
Kả năng kháng khuẩn, khử mùi tới 30 lần giặt.
Áo thun form dáng slimfit ôm vừa phải, phù hợp với nhiều dáng người.
Hình in phong cách thể thao khỏe khoắn.
Sản xuất tại Việt Nam.
SHOP’S HOUSE - Look good. Feel good.
','10','TS','Seller1','MAN',N'2023-12-20'),
('TS9',N'Áo Thun Thể Thao Nam Run','600.000',N'Áo thun nam thể thao, thiết kế mới nhất dành cho nam giới.
Thành phần: 95% Polyester Askin 5% Spandex.
Chất vải mềm mại, co giãn cực tốt, thấm hút mồ hôi hiệu quả.
Áo phù hợp cho các hoạt động thể dục thể thao, vận động hàng ngày.
Thiết kế hình in năng động, khoẻ khoắn.
Bảng màu basic dễ phối đồ.
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam.
','10','TS','Seller1','MAN',N'2023-12-20'),
('TS10',N'Áo Thun Thể Thao Nam In Running','260.000',N'Áo thun thể thao nam chất liệu: 84% Nylon + 16% Spandex làm mát tự nhiên.
Vải mềm mịn, thông thoáng, thấm hút tốt rất thích hợp cho các hoạt động thể thao.
Thiết kế dáng basic dễ mặc, phù hợp mọi vóc dáng.
Áo năng động trẻ trung mang đến sự khoẻ khoắn cho người mặc.
Có tính ứng dụng cao khi kết hợp được với nhiều loại trang phục khác nhau như: quần short, quần jeans...
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam.
','10','TS','Seller1','MAN',N'2023-12-20'),
('TS11',N'Áo Thun Thể Thao Nam Năng Động','270.000',N'Áo thun nam thể thao, thiết kế hiện đại, trải nghiệm thoải mái.
Thành phần: 50% Polyester + 41% Polyamide + 9% Spandex.
Nằm trong dòng sản phẩm thể thao SHOP’S HOUSE Sport, áo thun nam mang đến sự thoải mái cho các anh ngay cả khi vận động mạnh.
Co giãn tốt, chất vải mềm, thấm hút mồ hôi hiệu quả.
Chữ in ngực chắc chắn, khoẻ khoắn tạo điểm nhấn riêng cho chiếc áo.
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam.
','10','TS','Seller1','MAN',N'2023-12-20'),
('TS12',N'Áo Thun Thể Thao Nam In Ngực','660.000',N'Thành phần: 75% Nylon + 13% PET by Coolmax + 12% Spandex.
Vận động cường độ cao nhờ chất liệu đàn hồi nhanh chóng.
Thoáng mát nhờ bề mặt vải có các lỗ nhỏ hỗ trợ quá trình lưu thông thoát ẩm.
Thoải mái tập luyện thể thao cũng như mặc thường ngày.
Dáng suông phù hợp với mọi dáng người.
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam.
','10','TS','Seller1','MAN',N'2023-12-20'),
('TS13',N'Áo Thun / TShirt Thể Thao Nam','550.000',N'Chất liệu  84% Polyester + 16% Micro Polyester.
Kết hợp của sợi micro siêu mảnh giúp sản phẩm có bề mặt mỏng mịn, siêu nhẹ.
Công nghệ vải với khả năng thấm hút vượt trội chỉ 0.3s.
Co giãn và đàn hồi tự nhiên nhờ kiểu dệt.
Dáng suông cơ bản phù hợp với mọi vóc dáng.
Thoải mái làn da ngay kể cả khi tham gia hoạt động thể thao.
Nhẹ mát mặc ở nhà, đi chơi thể thao hay đi cafe với gia đình bạn bè đều rất phù hợp.
SHOP’S HOUSE - Look good. Feel good.
','10','TS','Seller1','MAN',N'2023-12-20'),
('TS14',N'Áo Thun Nam Thể Thao Cổ Tròn Phối Sườn','790.000',N'Chất liệu 95% Cotton + 5% Spandex.
Vải cotton mềm mại, thoáng mát, thấm hút tốt.
Thấm hút mồ hôi cực tốt, thoáng mát rất thích hợp với thời tiết nóng ẩm của Việt Nam.
Sợi vải co giãn hiệu quả, năng động trong ngày hè.
Form dáng suông phù hợp với nhiều kích thước cơ thể.
SHOP’S HOUSE - Look good. Feel good.
','10','TS','Seller1','MAN',N'2023-12-20'),
('TS15',N'Áo Thun Thể Thao Nam Hoạ Tiết Tràn Thân','430.000',N'Áo thun thể thao SHOP’S HOUSE thế hệ mới.   
Thành phần: 88% Recycle Polyester + 12% Elastane.
Polyester Recycle được biết đến là dòng sợi dẫn đầu cho xu hướng xanh hoá ngành dệt may - thân thiện với môi trường.
Áo có khả năng thấm hút siêu tốt, thông thoáng, kiểm soát độ ẩm cơ thể, rất phù hợp với điều kiện thời tiết nhiệt đới.
Khả năng co giãn, đàn hồi tốt, phù hợp với chuyển động cơ thể đặc biệt là hoạt động thể thao.
Chống tĩnh điện tốt, không xù lông rút sợi.
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam.
','10','TS','Seller1','MAN',N'2023-12-20'),
('TS16',N'Áo Thun Nam Thêu Trái Tim','570.000',N'Thành phần: 90.9% Polyester + 9.1% Spandex.
Thấm hút mồ hôi tạo cảm giác thoáng khí.
Cấu trúc sợi liên kết chặt chẽ, bề mặt vải chắc chắn.
Áo có form dáng suông rộng giúp tạo sự cử động thoải mái cho người mặc.
Thiết kế hình thêu trước ngực tạo điểm nhấn.
Áo có chất liệu nỉ co giãn, giữ ấm, bề mặt vải mịn cùng màu sắc thanh lịch có thể kết hợp cùng quần nỉ hoặc quần jeans.
SHOP’S HOUSE - Look good. Feel good.
','10','TS','Seller1','MAN',N'2023-12-20');
-----Áo Nữ (TShirt) 15
insert into Product (productID, productName, productPrice,detail,quantity,categoryID,created_By,type,CreateDate) values
('TS17',N'Áo Thun Nữ Đệm Vai Họa Tiết','130.000',N'Áo thun nữ chất liệu Bamboo, thành phần:  95% Bamboo + 5% Spandex
Sợi vải được làm từ tre nên rất lành tính, thân thiện môi trường
Mềm mại, thông thoáng, an toàn với làn da
Co giãn đàn hồi, có độ bền cao
Thiết kế cổ tim, dáng suông dễ mặc
Rất tiện dụng, dễ phối với nhiều trang phục: quần short, quần jeans, kaki, chân váy...
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TS','Seller1','WOMEN',N'2023-12-20'),
('TS18',N'Áo Thun Nữ Cổ Tim Bamboo','540.000',N'Chất liệu: 100% cotton
Áo có trọng lượng nhẹ và mềm mại với làn da tạo cảm giác dễ chịu và khoan khoái khi mặc.
Khả năng thấm hút cực tốt nên giữ có cơ thể luôn khô ráo, mát mẻ và giúp ngăn mùi hôi hiệu quả
Áo thun đệm vai hoạ tiết là sản phẩm được nhiều cô nàng yêu thích bởi sự trẻ trung, gợi cảm, sang trọng, kín đáo.
Có thể kết hợp với nhiều sản phẩm như quần ống rộng, chân váy, quần baggy, quần jean,...
SHOP’S HOUSE - Look good. Feel good.
','10','TS','Seller1','WOMEN',N'2023-12-20'),
('TS19',N'Áo Thun Nữ Lệch Vai Sành Điệu','670.000',N'Áo tính - quyến rũ và đậm chất riêng
Áo thun nữ lệch vai mang đến item mới mẻ cho tủ đồ của các cô nàng
Thiết kế lệch vai trẻ trung, ấn tượng tôn được đường cong cơ thể
Màu sắc ấn tượng, dế phối đồ
SHOP’S HOUSE - Look good. Feel good.
','10','TS','Seller1','WOMEN',N'2023-12-20'),
('TS20',N'Áo Thun Nữ Vải Rib Cơ Bản','230.000',N'Thành phần: 62% Polyester, 30% Rayon, 8% Spandex
Áo thun nữ chất liệu thun rib có khả năng co giãn và đàn hồi tốt mang lại cảm giác mặc mềm mại, thoải mái cho các chị em
Thiết kế basic, trơn màu, dễ phối đồ
Sản phẩm có độ bển tốt, form ôm tôn  dáng
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','TS','Seller1','WOMEN',N'2023-12-20'),
('TS21',N'Áo Thun Nữ Dáng Ôm In Chữ','540.000',N'Áo thun nữ chất liệu rib co dãn thoải mái, giữ ấm tốt
Kiểu dáng ôm sát với điểm nhấn in chữ trẻ trung, năng động
Có thể mặc cùng chân váy, quần jean, quần leging,...
Phù hợp để mặc đi chơi, đi làm, đi thể thao
SHOP’S HOUSE - Look good. Feel good.
','10','TS','Seller1','WOMEN',N'2023-12-20'),
('TS22',N'Áo Thun Nữ In Gấu Bột Ngô','330.000',N'Chất liệu vải Bột Ngô:  80% Cotton + 20% Polyester I-scra Softcool
Chất liệu thân thiện với môi trường, co giãn tốt
Thông thoáng, thoải mái nhờ vải mềm mại, thấm hút tốt, hạn chế xù lông vón cục
Co giãn vượt trội so với spandex thông thường
Form dáng suông rộng tạo sự thoải mái cho người mặc
Thiết kế hình in trước ngực tạo điểm nhấn trẻ trung cho áo
Đễ dàng kết hợp cùng quần shorts, quần jeans & chân váy
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TS','Seller1','WOMEN',N'2023-12-20'),
('TS23',N'Áo Thun Nữ Dáng Ôm Phối Bo','370.000',N'Áo thun nữ vảo cotton mềm mại, thấm hút mồ hôi tốt
Thành phần: 95% Cotton, 5% spandex
Lựa chọn áo thun tươi mới, nữ tính dành cho phái đẹp
Áo có khả năng co giãn tốt, mềm mại trên da và đa dạng cách phối đồ
Hoạ tiết chữ trên ngực áo tạo điểm nhấn riêng biệt, phối màu trẻ trung, hiện đại
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TS','Seller1','WOMEN',N'2023-12-20'),
('TS24',N'Áo Thun Nữ SHOP’S HOUSE Clean Việt Nam','380.000',N'Thành phần: 95% Cotton + 5% Spandex
Thoải mái với thấm hút, mát mẻ và không gây kích ứng da
Form dáng trẻ trung năng động với phần thêu đắp vải phối trước ngực
Hình in kết hợp đính hạt nổi bật nữ tính.
Kết hợp cùng quần jean,quần âu,sooc hoặc chân váy mặc đi làm,đi chơi.
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TS','Seller1','WOMEN',N'2023-12-20'),
('TS25',N'Áo Thun Nữ Cổ Tròn Basic','430.000',N'Thành phần: 95% Cotton + 5% Spandex
Thoải mái với thấm hút, mát mẻ và không gây kích ứng da
Form dáng trẻ trung năng động với phần thêu đắp vải phối trước ngực
Hình in kết hợp đính hạt nổi bật nữ tính.
Kết hợp cùng quần jean,quần âu,sooc hoặc chân váy mặc đi làm,đi chơi.
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TS','Seller1','WOMEN',N'2023-12-20'),
('TS26',N'Áo Thun Nữ Ôm Cổ Vuông','210.000',N'Chất liệu sản phẩm: 92% Rayon và 8% Spandex
Mềm mại, thoáng mát, thoải mái với cơ thể
Co giãn tốt, ôm lấy cơ thể giúp bạn tôn lên những đường cong mềm mại
Thấm hút mồ hôi hiệu quả
Áo thun rib nữ dáng ôm cổ vuông trẻ trung, phù hợp với nhiều dáng người, có thể mix cùng quần jeans, quần sooc, chân váy đều thích hợp.
SHOP’S HOUSE - Look good. Feel good.
','10','TS','Seller1','WOMEN',N'2023-12-20'),
('TS27',N'Áo Thun Nữ SHOP’S HOUSE Clean Việt Nam','440.000',N'Chất liệu sản phẩm: 92% Rayon và 8% Spandex
Mềm mại, thoáng mát, thoải mái với cơ thể
Co giãn tốt, ôm lấy cơ thể giúp bạn tôn lên những đường cong mềm mại
Thấm hút mồ hôi hiệu quả
Áo thun rib nữ dáng ôm cổ vuông trẻ trung, phù hợp với nhiều dáng người, có thể mix cùng quần jeans, quần sooc, chân váy đều thích hợp.
SHOP’S HOUSE - Look good. Feel good.
','10','TS','Seller1','WOMEN',N'2023-12-20'),
('TS28',N'Áo Thun Nữ Trễ Vai In Hình Sói','660.000',N'Chất liệu sản phẩm: 92% Rayon và 8% Spandex
Mềm mại, thoáng mát, thoải mái với cơ thể
Co giãn tốt, ôm lấy cơ thể giúp bạn tôn lên những đường cong mềm mại
Thấm hút mồ hôi hiệu quả
Áo thun rib nữ dáng ôm cổ vuông trẻ trung, phù hợp với nhiều dáng người, có thể mix cùng quần jeans, quần sooc, chân váy đều thích hợp.
SHOP’S HOUSE - Look good. Feel good.
','10','TS','Seller1','WOMEN',N'2023-12-20'),
('TS29',N'Áo Thun Nữ Cổ Tròn Bamboo Đẹp','460.000',N'Chất liệu 62% Polyester, 30% Rayon, 8% Spandex
Vải mềm mại, co giãn thoải mái cho người mặc
Form áo ôm crptop trẻ trung năng động
Điểm nhấn tại ngực áo là hình thêu phong cách sporty bền đẹp, cùng tone màu với viền bo chỉn chu tinh tế
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','TS','Seller1','WOMEN',N'2023-12-20'),
('TS30',N'Áo Thun Nữ Croptop In Chữ','430.000',N'Áo croptop nữ cá tính với chữ in nổi bật trước ngực, in puff tạo hiệu ứng nổi đặc biệt
Thiết kế phần nách được cắt cách điệu, thoải mái
Chất liệu thun rib co giãn tốt, giữ form khi mặc
Có thể phối theo phong cách cá tính với quần suông, jogger, chân váy, quần jeans hay phong cách cơ bản cùng jeans, chân váy, quần short
Thích hợp mặc đi chơi, đi làm hoặc đi học
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TS','Seller1','WOMEN',N'2023-12-20'),
('TS31',N'Áo Thun Thể Thao Nữ In Running','440.000',N'Chất liệu: 84% Nylon + 16% Spandex
Thoải mái tham gia tập luyện thể thao cũng như hoạt động thường ngày
Vải mềm mịn, thấm hút mồ hôi nhanh chóng tạo cảm giác thoáng mát
Độ co giãn tốt co giãn tốt, giữ form chịu được cường độ tập luyện cao
Độ bền cao, bền màu
SHOP’S HOUSE SPORT - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TS','Seller1','WOMEN',N'2023-12-20');
------Áo trẻ em (TShirt) 16
insert into Product (productID, productName, productPrice,detail,quantity,categoryID,created_By,type,CreateDate) values
('TS32',N'Áo Thun Trẻ Em In Chữ Prince','550.000',N'Áo thun dành cho các bạn nhỏ từ 10-14 tuổi
Thành phần: 100% Cotton
Form dáng suông rộng tạo sự thoải mái cho các bé
Thiết kế hình in bóng rổ khỏe khoắn phù hợp với các bạn nhỏ năng động
Phối màu trẻ trung, ấn tượng
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TS','Seller1','KIDS',N'2023-12-20'),
('TS33',N'Áo Thun Bé Gái In Vương Miện','570.000',N'Thành phần:  80% Cotton + 20% Polyester I-scra Softcool
Cotton & Polyester được kết hợp với tỷ lệ hoàn hảo tạo nền vải bền chắc
Mặt phải mềm mại, mịn màng, mặt trái được cào bông bằng công nghệ hiện đại tạo độ xốp, tăng khả năng giữ ấm của sản phẩm
Độ bền cao, co giãn nhẹ, thích hợp với chuyển động của cơ thể
Điểm nhấn nổi bật là hình in vương miện dễ thương
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TS','Seller1','KIDS',N'2023-12-20'),
('TS34',N'Áo Thun Trẻ Em Giữ Nhiệt Bamboo','460.000',N'Chất liệu: 95% Viscose by Bamboo + 5% Spandex
Vải thun rib co dãn tốt, mềm mại, thông thoáng, thấm hút tốt và giữ ấm
Chất liệu thoải mái, thân thiện với làn da
Thiết kế cổ tròn, dài tay, kiểu dáng cơ bản ôm vừa cơ thể rất dễ mặc và phối với mọi loại trang phục cho bé
Mặc riêng hoặc bên trong kết hợp với áo nỉ, áo khoác và phối với quần nỉ, quần len
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','TS','Seller1','KIDS',N'2023-12-20'),
('TS35',N'Áo Thun Trẻ Em In Chữ Bears Friend','460.000',N'Áo phông trẻ em cộc tay in Bears Friend chất liệu cotton mềm mướt, thoáng mát
Thành phần:  95% Cotton + 5% Spandex
Kiểu dáng rộng thoải mái, dễ chịu trong suốt quá trình sử dụng
Hình in trước ngực và sau lưng nổi bật làm điểm nhấn
Bé có thể mặc áo cùng quần sooc hoặc quần dài đi học, đi chơi hoặc mặc ở nhà đều rất phù hợp
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TS','Seller1','KIDS',N'2023-12-20'),
('TS36',N'Áo Thun Trẻ Em In Chú Voi Cotton USA','560.000',N'Chất liệu Cotton USA
Thành phần: 100% Cotton
Sợi bông Cotton được tin dùng nhất thế giới đến từ Mỹ
Chất liệu cotton mềm mại,thoải mái và thấm hút
Bé có thể mặc đi chơi,đi học hay ở nhà cả ngày mà không khó chịu hay bí.
Hình in chú voi cute phía trước tạo điểm nhấn
SHOP’S HOUSE - Look good. Feel good.
','10','TS','Seller1','KIDS',N'2023-12-20'),
('TS37',N'Áo Thun Trẻ Em Bột Ngô In Hello Bền Đẹp','350.000',N'Thành phần:  80% Cotton + 20% I-scra Softcool
Thoải mái hoạt động với chất liệu co giãn đàn hồi cực tốt mà không cần sử dụng đến sợi spandex, bề mặt vải hồi phục tốt ngay sau khi co giãn.
Sợi cotton bột ngô chiếm tới 80% nên hiệu quả thấm hút cao
Độ bền màu cao: Nhờ có gốc sợi polyester từ rượu trong ngô nên sản phẩm có độ dai & bên màu cực tốt.
Kiểu dáng suông, cùng chữ in phía trước và sau nổi bật
SHOP’S HOUSE - Look good, Feel good.
Sản xuất tại Việt Nam
','10','TS','Seller1','KIDS',N'2023-12-20'),
('TS38',N'Áo Thun Trẻ Em In Hoa Cúc Ngực','840.000',N'Chất liệu cotton mềm mại
Thành phần: 95% Cotton + 5% Spandex
Vải co giãn, thấm hút tốt theo chuyển động cơ thể bé
Sản phẩm thân thiện với môi trường, không gây kích ứng da
Kiểu dáng cộc tay mát mẻ, điểm nhấn là hình in nổi hoa cúc trước ngực
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TS','Seller1','KIDS',N'2023-12-20'),
('TS39',N'Áo Thun Trẻ Em Cotton USA In Con Thuyền','540.000',N'Chất liệu Cotton USA
Thành phần: 100% Cotton
Vải Cotton tốt nhất nhận được chứng chỉ OEKO TEX100
Cotton bền vững góp phần bảo vệ môi trường sống
Thấm hút mồ hôi tốt, thoáng mát, rất thích hợp với thời tiết nóng ẩm việt Nam
Co giãn nhẹ, phù hợp với chuyển động của cơ thể
Thiết kế hình in thuyền chèo lên trên nền nước xanh độc đáo
Kiểu dáng rộng thoải mái
SHOP’S HOUSE - Look good. Feel good
Sản xuất tại Việt Nam
','10','TS','Seller1','KIDS',N'2023-12-20'),
('TS40',N'Áo Thun Trẻ Em In Chú Cáo Nhỏ Cotton Usa','530.000',N'Áo phông dễ thương cho bé với hình in chú cáo uống cafe cute
Chất liệu 100% Cotton mềm mại, thoải mái và thấm hút tốt
Bé có thể mặc đi chơi, đi học hay ở nhà cả ngày mà không khoá chịu hay bí da
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TS','Seller1','KIDS',N'2023-12-20'),
('TS41',N'Áo Thun Trẻ Em Cotton USA Thêu Khủng Long','520.000',N'Chất liệu Cotton USA
Thành phần: 100% Cotton
Vải Cotton tốt nhất nhận được chứng chỉ OEKO TEX*100
Cotton bền vững: Góp phần bảo vệ môi trường sống
Thấm hút mồ hôi tốt, thoáng mát, rất thích hợp với thời tiết nóng ẩm việt Nam
Co giãn nhẹ, phù hợp với chuyển động của cơ thể
Kiểu dáng rộng thoải mái
SHOP’S HOUSE - Look good. Feel good
Sản xuất tại Việt Nam
','10','TS','Seller1','KIDS',N'2023-12-20'),
('TS42',N'Áo Thun Kid Lớn Cổ 3cm Túi Trước Ngực','660.000',N'Thành phần: 95% Cotton, 5% spandex
Áo thun thu đông có tính năng co giãn tốt, mềm mại khi mặc
Chất liệu lành tính, không kích ứng da
Thiết kế basic dễ mặc, cổ cáo 3cm giúp tăng cường khả năng giữ ấm hiệu quả
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','TS','Seller1','KIDS',N'2023-12-20'),
('TS43',N'Áo Thun Trẻ Em Dài Tay Dáng Suông Cổ Lộ','550.000',N'Chất liệu Rip
Thành phần : 95% Cotton, 5% spandex
Áo thun cổ lọ kiểu dáng cơ bản
Luôn thoải mái, vải mềm mại co giãn 4 chiều siêu tốt, giữ ấm và thấm hút mồ hôi tốt
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','TS','Seller1','KIDS',N'2023-12-20'),
('TS44',N'Áo Thun Dài Tay Bé Gái In Hình Dễ Thương','640.000',N'Món quà xinh xắn đáng yêu dành riêng cho các bạn nhỏ
Thành phần: 80% Cotton + 20% Polyester I-scra Softcool
Áo thun dài tay, mềm mại cho bé mặc đi học, đi chơi hay ở nhà đều đẹp
Chất liệu Cotton bột ngô lành tính, mềm mại, an toàn cho bé
Hình in công chúa ngựa tạo điểm nhấn khác biệt vô cùng ấn tượng, chắc hẳn sẽ đem lại sự yêu thích cho bé
Chiếc áo thun dài tay vô cùng đa năng, bảo vệ bé khỏi trời lạnh, gió, bụi
Dễ mặc trong với áo khoác, áo gió, áo phao khi thời tiết lạnh về
SHOP’S HOUSE - Look good. Feel good
Sản xuất tại Việt Nam
','10','TS','Seller1','KIDS',N'2023-12-20'),
('TS45',N'Áo Thun Dài Tay Trẻ Em Ngôi Sao Lấp Lánh','640.000',N'Áo thun dài tay trẻ em Ngôi sao lấp lánh
Thành phần: 80% Cotton + 20% Polyester I-scra Softcool
Sử dụng loại sợi co giãn đặc biệt: Iscra - loại sợi sinh học thế hệ mới được chiết xuất từ ngô
Chất liệu thân thiện với môi trường, co giãn từ sợi 
Sợi Cotton được kết hợp với Iscra theo tỷ lệ thích hợp giúp sản phẩm có tính năng thông thoáng mềm mại
Áo thấm hút tốt, hạn chế xù lông vón cục và giữ ấm cho bé hiệu quả
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TS','Seller1','KIDS',N'2023-12-20'),
('TS46',N'Áo Thun Bé Gái Cổ Cao Bèo Ngực','750.000',N'Áo thun dài tay dành cho bé 2-8 tuổi
Thành phần: 95% Cotton + 5% Spandex
Thiết kế trang trí bèo trước ngực vô cùng điệu đà và đáng yêu
Áo có chất liệu nỉ tăm, giữ ấm, bề mặt vải mịn cùng màu sắc bắt mắt có thể kết hợp cùng quần nỉ hoặc quần jeans
Bề mặt vải đều đẹp, không xù lông vón cục
Co giãn đàn hồi tốt, không gây khó chịu cho cơ thể, thông thoáng, giữ ấm cho bé
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TS','Seller1','KIDS',N'2023-12-20'),
('TS47',N'Áo Thun Trẻ Em Suông Cotton Compact In Gấu','800.000',N'Chất liệu cotton co giãn 4 chiều, thoải mái trong từng cử động của bé gái
Được dệt từ sợi bông USA cao cấp góp phần bảo vệ môi trường sống
Đảm bảo độ mảnh, có khả năng nhuộm ưu việt 
Thấm hút mồ hôi tốt, thoáng mát, rất thích hợp với thời tiết nóng ẩm việt Nam
Màu sắc thanh lịch có thể kết hợp được với quần shorts, chân váy, hoặc quần jean
SHOP’S HOUSE - Look good. Feel good
','10','TS','Seller1','KIDS',N'2023-12-20');

------------####################T-Shirt###################----------------
------------####################Jacket###################----------------
------Áo trẻ nam (Jacket) 16
insert into Product (productID, productName, productPrice,detail,quantity,categoryID,created_By,type,CreateDate) values
('JA1',N'Áo Khoác Thể Thao Nam Có Mũ','730.000',N'Áo khoác thể thao nam, thành phần 90% Nylon, 10% Spandex
Thiết kế trẻ trung - năng động - ấm áp
Áo khoác có form dáng suông rộng nên cử động thoải mái
Thiết kế mũ áo và túi thân trước tạo điểm nhấn trẻ trung
Áo có chất liệu nỉ co giãn, giữ ấm, bề mặt vải mịn cùng màu sắc thanh lịch có thể mặc đi làm, đi chơi hoặc ở nhà vào mùa đông
Độ bền cao, ít nhăn nhàu, co giãn, phù hợp với chuyển động của cơ thể
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JA','Seller2','MAN',N'2023-12-20'),
('JA2',N'Áo Khoác Nam Bomber Bổ Ngực','830.000',N'Áo khoác bomber nam vải gió giúp giữ ấm cơ thể tốt
Thành phần:  90% Nylon, 10% Spandex
Kiểu dáng thời trang cùng màu sắc trẻ trung, năng động, dễ dàng phối với nhiều trang phục khác nhau
Thiết kế bo len cổ, tay và gấu áo tạo độ ôm vừa phải mang đến cảm giác thoải mái khi mặc
Tay áo có túi khóa tạo sự khỏe khoắn và để đồ tiện lợi, chắc chắn
Đường may tỉ mỉ, có độ bền cao khi sử dụng
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JA','Seller2','MAN',N'2023-12-20'),
('JA3',N'Áo Khoác Thể Thao Nam Bo Gấu','380.000',N'Chất liệu 90% Nylon, 10% Spandex
Vải nỉ dày dặn phù hợp với thời tiết se lạnh.
Chất liệu co giãn 1 lớp khiến sản phẩm vô cùng thoải mái khi sử dụng
Bản bo chun gấu to khỏe khoắn cùng logo nổi bật là điểm nhấn của sản phẩm thêm bắt mắt
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JA','Seller2','MAN',N'2023-12-20'),
('JA4',N'Áo Khoác Nỉ Thể Thao Nam Double Face Smart','530.000',N'Chất liệu Double face smart tăng cường khả năng giữ ấm cơ thể
Thành phần: 87% Polyester + 8% Rayon + 5% Spandex
Cấu trúc dệt 4 hệ sợi liên kết chặt chẽ. Bề mặt chắc chắn
Hai mặt phải mang lại cảm giác tiếp xúc da thoải mái, hạn chế xù lông vón cục
Áo khoác nỉ cổ dựng, có túi khóa hai bên sườn, thân sau có logo cao su in cao thành cùng màu vải chính
Form dáng cơ bản ôm vừa tôn dáng mang lại cảm giác gọn gàng cho người mặc
Thiết kế trơn màu đơn giản phù hợp với khách hàng yêu thích phong cách tối giản
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','MAN',N'2023-12-20'),
('JA5',N'Áo Khoác Nam Chun Bo Gấu Cản Gió Cản Bụi','260.000',N'Thành phần:  90% Nylon, 10% Spandex
Áo khoác nam cản gió, cản bụi, giữ ấm
Thoải mái dễ dàng vận động với chất liệu co giãn 4 chiều
Khóa kéo bền bỉ, kéo dễ dàng
Thiết kế trẻ trung, hiện đại, giữ ấm tốt đồng thời phù hợp phối đồ đa dạng
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JA','Seller2','MAN',N'2023-12-20'),
('JA6',N'Áo Khoác Nỉ Thể Thao Nam Kéo Khóa Phối Tay','770.000',N'Thành phần:  87% Polyester + 8% Rayon + 5% Spandex
Vải nỉ  mềm mại, thoải mái. Thấm hút tốt, kiểm soát độ ẩm. Khô nhanh. Co giãn đàn hồi giữ form.
Áo khoác nỉ có mũ, phần mũ áo có dây rút điều chỉnh độ rộng chật của mũ.
Túi ốp hai bên sườn phom dáng ngắn trẻ trung năng động
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','MAN',N'2023-12-20'),
('JA7',N'Áo Khoác Nam Có Mũ Chống Ngấm Nước','860.000',N'Chất liệu: 100% NYLON
Chất liệu siêu nhẹ và có độ mềm mịn vượt trội.
Chống thấm nước tốt, yên tâm khi trời mưa nhẹ lất phất.
Chất liệu cao cấp chống tĩnh điện giúp bảo vệ sức khỏe người mặc.
Chất vải ít nhăn, bền màu.
SHOP’S HOUSE - Look good. Feel good
','10','JA','Seller2','MAN',N'2023-12-20'),
('JA8',N'Áo Khoác Gió Nam Thông Minh Trượt Nước','540.000',N'Áo khoác gió nam thông minh - 100% Polyester, thiết kế mới của SHOP’S HOUSE làm từ chất liệu vải gió, được cải tiến và nâng cấp với khả năng trượt nước và đặc biệt là tính thuận tiện khi mang theo
Chiếc áo có thể lộn ngược và gấp gọn thành 1 chiếc túi ngọn nhẹ, dễ dàng mang đi mọi nơi
Thiết kế áo dạng cơ bản, phần gấu áo có chun rút điều chỉnh theo mong muốn của người sử dụng; chun tay ôm vừa và chắc chắn tránh gió lùa
Bên trong có lót lưới, mũ áo tháo rời linh hoạt
Khóa áo được in và khắc logo nổi bật
Ngực áo được in logo phản quang khoẻ khoắn
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','MAN',N'2023-12-20'),
('JA9',N'Bộ Đồ Thể Thao Nam Nỉ Double Face Áo Khoác Kéo Khóa','420.000',N'Bộ đồ thể thao in hình trẻ trung năng động
Thành phần: 91% Polyester + 9% Spandex
Áo khoác kéo khóa với chi tiết phối đơn giản, trẻ trung, khỏe khoắn
Sản phẩm được dệt từ sợi Polyester dài & mảnh, kết hợp cùng kiểu dệt Double Face cho nền vải chắc chắn nhưng vẫn có độ xốp, nhẹ nhàng
Độ bền cao, ít nhăn nhàu 
Co giãn, phù hợp với chuyển động của cơ thể
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JA','Seller2','MAN',N'2023-12-20'),
('JA10',N'Áo Khoác Gió Nam 3C 2 Lớp Thể Thao Phối Lưng','630.000',N'Chất liệu vải 100% Polyester
Vải có bề mặt lỳ, mềm mịn, ít nhăn, chắc chắn hơn so với chất liệu vải gió thông thường
Áo có thiết kế trẻ trung đơn giản, đường cắt xẻ khỏe khoắn nam tính
Chun tại cổ tay giúp người mặc trông gọn gàng, vừa vặn hơn
Phần mũ có thể tháo rời và miệng mũ có luồn chun rất trẻ trung và tinh tế
SHOP’S HOUSE - Look good. Feel good
Sản xuất tại Việt Nam
','10','JA','Seller2','MAN',N'2023-12-20'),
('JA11',N'Áo Khoác Phao Nam 3s Plus - Trượt Nước, Siêu Ấm','630.000',N'Thành phần:100% Nylon
Phiên bản nâng cấp của áo phao 3S
Có khả năng trượt nước tới 10 lần giặt
Trọng lượng siêu nhẹ (chỉ ~300gram) nhưng vẫn giữ ấm cơ thể cực tốt, dễ dàng gấp lại và mang đi
Thiết kế vừa vặn, khỏe khoắn thuận tiện cho các hoạt động ngoài trời
Mũ có thể tháo rời, cổ tay áo và gấu chun ôm người, giữ ấm tốt
Túi áo 2 bên có khóa kéo chắc chắn chống rơi đồ, túi rộng dễ để vật dụng cần thiết
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','MAN',N'2023-12-20'),
('JA12',N'Áo Khoác Gió Nam 3C Plus Năng Động Chống Ngấm Nước, Cản Gió, Cản Bụi','530.000',N'Áo khoác nam 3C PLUS - Cản gió, Chống thấm nước vào mặt trong, Cản bụi 
Thành phần:  100% Polyester
Kết cấu dệt chắc chắn giúp cản gió, cản bụi hiệu quả,
Mặt cào lông phía trong giúp cản gió
Lớp ngoài có kiểu dệt chéo giúp vải phẳng hơn trong quá trình sử dụng
Lớp màng mỏng phía ngoài giúp trượt nước
Thiết kế có mũ có thể tháo rời, khóa áo có in khắc logo
Đường cắt khỏe khoắn, phom áo thoải mái vận động
Gấu áo có chun rút tùy chỉnh theo yêu cầu mong muốn của khách hàng. chun tay ôm vừa và chắc chắn. 
Ngực áo có in logo SHOP’S HOUSE phản quang công nghệ nhũ bạc vô cùng nổi bật và tinh tế. 
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JA','Seller2','MAN',N'2023-12-20'),
('JA13',N'Áo Phao Nam Trần Trám','360.000',N'Chất liệu: 100% Nylon ở lớp ngoài và lớp lót, 100% Polyester là lớp bông nhồi
Thiết kế cơ bản dễ mặc dễ phối đồ
Túi áo cạnh sườn có khóa kéo an toàn khi đựng điện thoại hoặc đồ dùng cá nhân
Bo tay và bo gấu mềm mại dễ cử động
Bên trong được làm bằng chất liệu bông siêu nhẹ đặc biệt vừa giữ ấm cơ thể vừa dễ dàng vận động
Sản phẩm kết hợp với áo giữ nhiệt, áo len, thun. Ngoài ra còn mix với sản phẩm SHOP’S HOUSE như quần jeans, quần kaki
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','MAN',N'2023-12-20'),
('JA14',N'Áo Gió Nam 3C Pro Có Mũ Siêu Ấm','530.000',N'Nằm trong thiết kế dành cho gia đình
Chất liệu: 100% Polyester
Áo khoác 2 lớp cơ bản, bấm cổ tay ôm kín giữ ấm hơn khi di chuyển tránh gió lùa vào cơ thể
Thiết kế mũ áo có thể tháo rời, chun ở gấu áo có thể tuỳ chỉnh
Túi áo có khóa kéo chắc chắc để đựng đồ
Sản phẩm kết hợp với áo giữ nhiệt, áo len, thun, quần jeans, quần kaki
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','MAN',N'2023-12-20'),
('JA15',N'Áo Phao Nam Mũ Nhám Cài Siêu Ấm','430.000',N'Thành phần chính : 100% Polyester
Bề mặt vải mềm mại, mịn
Giữ ấm tốt nhờ kiểu dệt của hai hệ sợi vuông góc với nhau khăng khít, giúp cản gió, cách nhiệt, giữ ấm hiệu quả
Sử dụng sợi Polyester chi số lớn, tạo bề mặt vừa đứng phom vừa mềm mại, vừa giữ ấm tốt
Bền, dễ chăm sóc, dễ bảo quản
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good
','10','JA','Seller2','MAN',N'2023-12-20'),
('JA16',N'Áo Phao Nam Có Mũ Siêu Nhẹ Hai Mặt','760.000',N'Mẫu áo phao siêu nhẹ có thể sử dụng được 2 mặt sản phẩm
Mặt ngoài là lớp vải 380T loại vải thông dụng nhất trong sản phẩm áo phao giữ ấm mùa đông
Mặt trong là lớp vải 100% polyester với bề măt vải mịn, chắc, bền màu và kháng nước tốt
Chỉ với 1 sản phẩm ,khách hàng có thể sử dụng được cả mặt trong và ngoài với 2 thiết kế riêng biệt
SHOP’S HOUSE - Look good. Feel good
','10','JA','Seller2','MAN',N'2023-12-20');
------Áo trẻ nữ (Jacket) 16
insert into Product (productID, productName, productPrice,detail,quantity,categoryID,created_By,type,CreateDate) values
('JA17',N'Áo Khoác Ngắn Cá Vai','730.000',N'Áo khoác măng tô dáng ngắn kèm đai cá tính
Nếu bạn đang tìm kiếm 1 chiếc áo khoác thanh lịch, ấn tượng mà ấm áp cho mùa thu - đông, thì đây chính là lựa chọn tuyệt vời!
Sản phẩm được mong đợi và săn đón hàng đầu tại SHOP’S HOUSE
Thành phần: 92% Polyester, 8% Spandex
Thiết kế hiện đại, trẻ trung, phù hợp phối cùng nhiều loại trang phục khác nhau: áo giữ nhiệt, áo thun dài tay, quần jean, chân váy…
Chất liệu dày dặn, chắc chắn, thoải mái khi chuyển động
Đai kim loại không gỉ, an toàn, bền đẹp theo thời gian
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JA','Seller2','WOMEN',N'2023-12-20'),
('JA18',N'Áo Khoác Nữ Da Kẹp Nắp Túi','830.000',N'Chất liệu Da
Thành phần: Mặt ngoài 100% PU, Mặt trong 100% Polyester
Vải được kết cấu từ 2 lớp bề mặt phải là da PU hiện đại khoẻ khắn bề mặt trái tiếp xúc với da là 100% Polyester
Luôn thoải mái khi mặc co giãn tự nhiên, giữ ấm tốt
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','WOMEN',N'2023-12-20'),
('JA19',N'Áo Khoác Thể Thao Nữ Túi Hộp','380.000',N'Chất vải Gió co giãn 4 chiều: 90% Nylon, 10% Spandex
Sản phẩm sở hữu nhiều tính năng giúp giữ ấm và thoải mái cho người mặc 
Vải co giãn bốn chiều nhờ sợi spandex, giúp dễ dàng vận động khi mặc
Cản gió, cản bụi, giữ ấm tốt nhờ kiểu dệt thoi hai hệ sợi vuông góc với nhau
Thành phần chính là sợi Nylon mang lại cảm giác mềm mại, bền chắc cho sản phẩm
Thiết kế túi hộp mang lại vẻ thể thao, khoẻ khoắn, trẻ trung
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','WOMEN',N'2023-12-20'),
('JA20',N'Áo Khoác Nữ Kaki Dáng Ngắn','530.000',N'Chất liệu sản phẩm: Vải kaki 
Thành phần: 97% Cotton + 3% Spandex
Đường may và sợi vải chắc chắn, thân thiện với người dùng
Áo khoác nhẹ trong thời tiết sẽ lạnh cũng như chống nắng
Thiết kế chi tiết túi điểm nhấn và cá tính
Kiểu dáng ngắn, khỏe khoắn, dễ dàng mix với các trang phục như chân váy, jeans
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JA','Seller2','WOMEN',N'2023-12-20'),
('JA21',N'Áo Khoác Lông Nữ Tay Rộng','260.000',N'Áo khoác lông dành cho nữ chất liệu mềm mại, siêu thoải mái cho làn da nàng, 
Phom dáng rộng rãi, tạo kiểu khỏe mạnh
Thiết kế màu trơn giúp nàng trông phong cách và nổi bật giữa đám đông
Chiếc áo thích hợp để mặc hàng ngày, hẹn hò, đi mua sắm, làm việc hay tiệc tùng
Có thể kết hợp mặc với quần jean, quần legging hoặc váy
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','WOMEN',N'2023-12-20'),
('JA22',N'Áo Khoác Nỉ Thể Thao Nữ','770.000',N'Vải nỉ 2 mặt
Thành phần: 87% Polyester + 8% Rayon + 5% Spandex
Vải nỉ  mềm mại, thoải mái. Thấm hút tốt, kiểm soát độ ẩm. Khô nhanh. Co giãn đàn hồi giữ form.
Áo khoác nỉ có mũ, phần mũ áo có dây rút điều chỉnh độ rộng chật của mũ.
Túi ốp hai bên sườn phom dáng ngắn trẻ trung năng động
Hình in cao su phong cách sporty sắc nét, bền đẹp
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','WOMEN',N'2023-12-20'),
('JA23',N'Áo Khoác Nữ Thể Thao In Sọc','860.000',N'Áo khoác nữ cản gió, cản bụi, giữ ấm
Chất liệu thành phần: 90% Nylon, 10% Spandex
Vải co giãn 4 chiều, rất thoải mái dễ dàng khi vận động
Thiết kế trẻ trung, hiện đại, giữ ấm tốt đồng thời phù hợp phối đồ đa dạng
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JA','Seller2','WOMEN',N'2023-12-20'),
('JA24',N'Áo Khoác Nữ Nỉ Cào Lông','540.000',N'Chất liệu nỉ cào lông 100% Polyester
Thiết kế basic dễ mặc dễ phối đồ, có mũ ấm áp
Áo nỉ cào lông siêu ấm rất dễ ứng dụng thời tiết Việt Nam. Cảm giác chạm mềm mại, êm ái
Trọng lượng áo siêu nhẹ nên tiện lợi cho việc gấp gọn mang theo
Sản phẩm kết hợp với phối các phẩm SHOP’S HOUSE, như áo thun, len, phông, jeans, quần nỉ
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','WOMEN',N'2023-12-20'),
('JA25',N'Áo Khoác Gió Nữ 3C Pro','420.000',N'Thành phần : Vải chính/ lót :100% Polyester
Bề mặt bên trong được cán một màng PU mỏng giúp tăng cường khả năng cản gió và giữ ấm
Áo khoác 2 lớp thiết kế cơ bản, dễ mặc được cải tiến từ phiên bản 3C Plus
Mũ tháo rời, túi bản to có khóa kéo, hình phản quan phía sau
Khóa áo thiết kế chắc chắn và bắt mắt
Cải tiến Cúc bấm tại cổ tay dễ dàng thao tác
Gấu áo có chun rút. dễ dàng điều chỉnh dáng suông và bo gấu
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','WOMEN',N'2023-12-20'),
('JA26',N'Áo Khoác Giả Lông Cừu Nữ Cao Cổ','630.000',N'Thành phần: 100% Polyester
Áo khoác nữ có bề mặt vải mềm mại
Giữ ấm tốt nhờ kiểu dệt cào lông mềm mại, cách nhiệt, giữ ấm hiệu quả
Sử dụng sợi Polyester tăng độ bền và khả năng giữ ấm
Bền, dễ chăm sóc, dễ bảo quản
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','WOMEN',N'2023-12-20'),
('JA27',N'Áo Khoác Nỉ Thể Thao Nữ Double Face Smart','630.000',N'Chất liệu Double face smart
Thành phần: 87% Polyester + 8% Rayon + 5% Spandex
Vải mềm mại, thoải mái.Thấm hút tốt, kiểm soát độ ẩm. Khô nhanh. Co giãn đàn hồi giữ form.
Cổ dựng, túi khóa hai bên sườn, thân sau có logo cao su, phom dáng cơ bản ôm vừa tôn dáng mang lại cảm giác gọn gàng cho người mặc
Thiết kế trơn màu đơn giản, yêu thích phong cách tối giản
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','WOMEN',N'2023-12-20'),
('JA28',N'Áo Khoác Thể Thao Nữ Gió Dáng Ngắn','530.000',N'Thành phần: 90% Nylon, 10% Spandex
Chất liệu vải gió co giãn 4 chiều dễ dàng vận động
Bề mặt mềm mại. Cản gió, cản bụi, giữ ấm tốt
Áo khoác gió dáng ngắn, mũ liền có chốt dây rút điều chỉnh độ rộng chật của mũ
Hai túi cơi khóa thân trước, vị trí cơi túi có hình in phản quang 
Gấu áo có dây rút trong. Thân sau có hình in text phản quang
Khoác ngoài áo thun, áo giữ nhiệt, áo len,.....kết hợp cùng quần jeans, quần gió, jogger
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','WOMEN',N'2023-12-20'),
('JA29',N'Áo Khoác Nỉ Thể Thao Nữ Cổ Dựng Phối Tay','360.000',N'Chất liệu: Doubleface Smart
Vải chính: 87% Polyester, 8% Rayon, 5% Spandex
Lót túi: 100% Polyester
Cấu trúc dệt 4 hệ sợi liên kết chặt chẽ, bề mặt chắc chắn
Hai mặt phải mang lại cảm giác tiếp xúc da thoải mái, hạn chế xù lông vón cục
Cấu trúc Double Face được mô tả như một chiếc bánh sandwich với lớp giữa mềm mỏng – xốp chứa đựng không khí tĩnh, tăng cường khả năng giữ ấm cơ thể
Áo khoác dày dặn, xốp nhẹ, hạn chế nhăn nhàu, tính năng giữ ấm cơ thể vượt trội là những ưu điểm của dòng sản phẩm này.
Với thiết kế năng động, kết hợp sự pha phối màu sắc trẻ trung nữ tính, chi tiết điểm nhấn tinh tế mang phong cách thể thao, giúp bạn trông trẻ hơn.
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look goof. Feel good.
','10','JA','Seller2','WOMEN',N'2023-12-20'),
('JA30',N'Áo Khoác Gió Thông Minh Nữ Trượt Nước','530.000',N'Cấu trúc 2 lớp cơ bản, thành phần chất liệu: 100% Polyester
Thiết kế có mũ có thể tháo rời, khóa áo có in khắc logo
Đường cắt khỏe khoắn, phom áo thoải mái vận động
Gấu áo có chun rút tùy chỉnh, chun tay ôm vừa và chắc chắn 
Ngực áo có in logo SHOP’S HOUSE phản quang công nghệ nhũ bạc
Dễ dàng gấp gọn chỉ với vài thao tác với thiết kế túi đựng ngay trên áo
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JA','Seller2','WOMEN',N'2023-12-20'),
('JA31',N'Áo Khoác Gió Nữ 3C Plus Năng Động','430.000',N'Áo khoác gió nữ 3C PLUS: Cản gió, Cản bụi, Chống ngấm nước vào bên trong 
Phiên bản nâng cấp của Áo gió 3C
Thành phần: 100% Polyester
Giữ ấm hiệu quả mà vẫn đảm bảo vẻ ngoài gọn gàng nhờ cấu trúc 2 lớp dày dặn, bền chắc
Linh hoạt khi sử dụng với thiết kế mũ áo có thể tháo rời, gấu áo có chun rút tùy chỉnh theo yêu cầu mong muốn của khách hàng
Chun tay ôm vừa vặn giúp cản gió trong quá trình di chuyển bằng xe máy, xe đạp...
Công nghệ in nhũ bạc mang đến sự sang trọng, cao cấp cho áo gió của bạn
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JA','Seller2','WOMEN',N'2023-12-20'),
('JA32',N'Áo Khoác Phao Nữ Siêu Nhẹ Có Mũ','760.000',N'Thiết kế áo phao basic dành cho nữ
Form dáng gọn gàng, thoải mái vận động, di chuyển
Trọng lượng siêu nhẹ, giữ ấm hiệu quả
Màu sắc đa dạng, phù hợp với nhiều lứa tuổi
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','WOMEN',N'2023-12-20');
------Áo trẻ em (Jacket) 16
insert into Product (productID, productName, productPrice,detail,quantity,categoryID,created_By,type,CreateDate) values
('JA33',N'Áo Khoác Phao Vip Trẻ Em','730.000',N'Thành phần: 100% Polyester, bề mặt vải mềm mại
Giữ ấm tốt nhờ kiểu dệt của hai hệ sợi vuông góc với nhau khăng khít giúp cản gió, cách nhiệt, giữ ấm hiệu quả
Sử dụng sợi Polyester chỉ số lớn tạo bề mặt vừa đứng phom vừa giữ ấm tốt
Áo phao cho bé mặc bền, dễ chăm sóc và bảo quản
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','KIDS',N'2023-12-20'),
('JA34',N'Áo Khoác Trẻ Em Nhỏ 3C Pro','830.000',N'Áo khoác cho bé từ 2-8 tuổi, chất liệu 100% Polyester
Thiết kế 2 lớp cơ bản phù hợp sử dụng trong mọi hoàn cảnh
Bấm cổ tay nhằm ôm kín hơn khi di chuyển, không để gió luồn vào cơ thể
Mũ áo có thể tháo rời, chun áo ở gấu điều chỉnh cho phù hợp
Túi áo có khóa kéo chắc chắc đựng đồ
Đặc biệt là có phần ghi tên và thông tin của các bé gắn tại lót áo
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','KIDS',N'2023-12-20'),
('JA35',N'Áo Khoác Trẻ Em Nỉ Cào Lông Tai Thỏ','380.000',N'Áo khoác cho bé chất liệu nỉ cào lông Fluffy Fleece
Vải chính/ Lót túi: 100% Polyester
Bề mặt vải mềm mại
Giữ ấm tốt nhờ kiểu dệt cào lông mềm mại, cách nhiệt, giữ ấm hiệu quả
Sử dụng sợi Polyester tăng độ bền và khả năng giữ ấm
Bền, dễ chăm sóc, dễ bảo quản
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','KIDS',N'2023-12-20'),
('JA36',N'Áo Khoác Trẻ Em Lớn 3C Pro','530.000',N'Vải chính/ lót: 100% Polyester
Kiểu dệt hai hệ sợi vuông góc với nhau chặt chẽ tạo nên độ bền cao, giữ ấm tốt, cản gió tốt
Bề mặt có vân chéo nhờ kiểu dệt twill vừa khoẻ khoắn vừa thời trang
Bề mặt bên trong được cán một màng PU mỏng giúp tăng cường khả năng cản gió và giữ ấm
Sản phẩm thiết yếu giữ ấm hiệu quả
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','KIDS',N'2023-12-20'),
('JA37',N'Áo Khoác Gió Trẻ Em Chống Ngấm Nước Có Mũ','260.000',N'Chất liệu sản phẩm: 100% Polyester
Áo khoác kid trên chất liệu có tráng nhựa giúp tối ưu hoàn toàn việc cản gió
Form dáng thoải mái nhưng đủ gọn gàng khỏe khoắn
Áo có mũ tháo rời, chun tay và gấu bản to tối ưu nhất công năng khi sử dụng
Logo in tại ngực trái, khóa cáo tiện lợi, chắc chắn 
SHOP’S HOUSE - Look good. Feel good.
 Sản xuất tại Việt Nam
','10','JA','Seller2','KIDS',N'2023-12-20'),
('JA38',N'Áo Khoác Gió Cho Bé 3C Plus (2 - 9 Tuổi)','770.000',N'Áo khoác trẻ em 3C PLUS - phiên bản mới nhất BST Thu Đông 2022
Thành phần:  100% Polyester
Làm từ vải gió với cấu tạo 2 lớp cơ bản
Có khả năng: Cản gió - Cản bụi - Chống ngấm nước vượt trội
Phom áo thoải mái để bé vận động, mặc được trong nhiều hoàn cảnh
Phần mũ có thể tháo rời linh hoạt, chun tay ôm vừa, gấu áo có chun rút tuỳ chỉnh
Ngực áo in logo SHOP’S HOUSE phản quang nổi bật và tinh tế
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JA','Seller2','KIDS',N'2023-12-20'),
('JA39',N'Áo Khoác Gió Thông Minh Trẻ Em Trượt Nước Cản Gió Cản Bụi','860.000',N'Thành phần:  100% Polyester
Áo gió thông minh 2 lớp phiên bản áo khoác gió cao nhất của SHOP’S HOUSE
Luôn thoải mái với chất liệu cản gió, cản bụi 
Chất liệu được cải tiến khả năng trượt nước
Dễ dàng gấp gọn chỉ cần lộn ngược thành 1 chiếc túi
Form dáng cơ bản, phần gấu áo có chun rút điều chỉnh theo mong muốn của người sử dụng.
Chun tay ôm vừa và chắc chắn tránh gió lùa
Bên trong có lót lưới, mũ áo tháo rời linh hoạt.
Khóa áo được in và khắc logo nổi bật.
Ngực áo được in logo phản quang đầy tinh tế
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JA','Seller2','KIDS',N'2023-12-20'),
('JA40',N'Áo Gió Trẻ Em 3C Plus (10 - 13 Tuổi)','540.000',N'Áo khoác trẻ em 2 lớp cơ bản, chất liệu vải gió
Thành phần:  100% Polyester
Thiết kế có mũ có thể tháo rời, khóa áo có in khắc logo, đường cắt khỏe khoắn, phom áo thoải mái vận động
Gấu áo có chun rút tùy chỉnh theo mong muốn 
Phần chun tay ôm vừa và chắc chắn  
Ngực áo có in logo SHOP’S HOUSE phản quang vô cùng nổi bật và tinh tế
Sản phẩm dành cho trẻ từ 10 - 13 tuổi, phù hợp để bé mặc trong nhiều hoàn cảnh
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JA','Seller2','KIDS',N'2023-12-20'),
('JA41',N'Áo Phao Trẻ Em Dáng Gile Siêu Nhẹ','420.000',N'Thành phần chất liệu 100% Nylon
Lớp ngoài và lớp lót được làm bằng Nylon với kiểu dệt thoi đặc trưng mang lại kết cấu bền chặt cho sản phẩm 
Bông được làm bẳng Polyesster 
Áo phao Siêu ấm, siêu nhẹ - một sản phẩm thiết yếu trong mùa đông dành cho các bạn nhỏ
Kiểu dáng gile dễ kết hợp với nhiều loại trang phục, tiện lợi cho bé vận động.
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','KIDS',N'2023-12-20'),
('JA42',N'Áo Phao Trẻ Em Siêu Nhẹ Có Mũ Siêu Ấm','630.000',N'Thành phần:  100% NYLON
Thiết kế túi đựng nhỏ gọn, dễ dàng mang theo sản phẩm
Sản phẩm áo siêu nhẹ, có tác dụng giữ ấm cho cơ thể
Chống thấm nước, tránh mưa nhẹ, chống tĩnh điện
SHOP’S HOUSE - Look good. Feel good
','10','JA','Seller2','KIDS',N'2023-12-20'),
('JA43',N'Áo Phao Trẻ Em 3s Plus Siêu Ấm - Siêu Nhẹ - Siêu Gọn','630.000',N'Áo phao 3S Plus - phiên bản cải tiến dành cho trẻ em
Thành phần:  100% NYLON
Sở hữu những đặc tính nổi trội đặc trưng:
SIÊU NHẸ - LIGHTWEIGHT: Trong lượng siêu nhẹ thoải mái khi dùng
SIÊU ẤM – WARM: giữ ấm hiệu quả trong thời tiết giá lạnh
SIÊU GỌN – PACKABLE: có khả năng gấp gọn trong túi đi kèm
TRƯỢT NƯỚC – WATER REPELLENT: trượt nước giúp bảo vệ cơ thể bé khi trời mua nhẹ hoặc sương sớm
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','KIDS',N'2023-12-20'),
('JA44',N'Áo Phao Trẻ Em 3s Plus Phiên Bản Nâng Cấp','530.000',N'Ấm áp, an toàn cho bé cùng Áo phao 3S Plus mới tại SHOP’S HOUSE
Thành phần:  100% NYLON
Sản phẩm được các ba mẹ lựa chọn nhờ sở hữu những đặc tính nổi trội:
SIÊU NHẸ (LIGHTWEIGHT):Trong lượng áo siêu nhẹ, cho bé thoải mái vận động
SIÊU ẤM (WARM): Các lớp vải và bông đều được chọn lọc và thiết ké để giữ ấm hiệu quả trong thời tiết giá lạnh
SIÊU GỌN (PACKABLE): Áo có khả năng gấp gọn trong túi đi kèm, vô cùng tiện lợi
TRƯỢT NƯỚC (WATER REPELLENT): Trong điều kiện mưa nhẹ, sương sớm, ba mẹ hoàn toàn có thể yên tâm vì áo có khả năng trượt nước!
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','KIDS',N'2023-12-20'),
('JA45',N'Áo Phao Trẻ Em 3S Siêu Nhẹ Tay Raglan','360.000',N'Sản phẩm được các ba mẹ lựa chọn nhờ sở hữu những đặc tính nổi trội:
SIÊU NHẸ (LIGHTWEIGHT):Trong lượng áo siêu nhẹ, cho bé thoải mái vận động
SIÊU ẤM (WARM): Các lớp vải và bông đều được chọn lọc và thiết ké để giữ ấm hiệu quả trong thời tiết giá lạnh
SIÊU GỌN (PACKABLE): Áo có khả năng gấp gọn trong túi đi kèm, vô cùng tiện lợi
TRƯỢT NƯỚC (WATER REPELLENT): Trong điều kiện mưa nhẹ, sương sớm, ba mẹ hoàn toàn có thể yên tâm vì áo có khả năng trượt nước!
','10','JA','Seller2','KIDS',N'2023-12-20'),
('JA46',N'Áo Phao Trẻ Em Siêu Nhẹ','530.000',N'Các bố mẹ mong muốn sở hữu cho con mình chiếc áo phao trẻ em mặc nhẹ, ấm, gọn, dễ dàng trong mọi hoạt động và tiện lợi giúp các bé mặc hàng ngày thì đây là lựa chọn hoàn hảo.
Áo khoác phao cho bé siêu nhẹ SHOP’S HOUSE được làm từ 100% NYLON
Sở hữu 3 tính năng trong 1: Siêu nhẹ - Siêu Ấm - Siêu gọn
SIÊU NHẸ - LIGHTWEIGHT: 1 chiếc áo phao 3S chỉ có 200gr
SIÊU ẤM – KEEP WARM: Khả năng giữ ấm tốt ở nhiệt độ tối thiểu 9 độ C, phù hợp với thời tiết Việt Nam
SIÊU GỌN – PACKABLE: Có thể gấp gọn và cho vào túi được tặng kèm
Ngoài ra, áo còn có khả năng CẢN GIÓ, CẢN BỤI và vô cùng thân thiện môi trường
SHOP’S HOUSE - Look good. Feel good.
','10','JA','Seller2','KIDS',N'2023-12-20');
------------####################Jacket###################----------------
------------####################Jeans###################----------------
------Áo nam (Jeans) 
insert into Product (productID, productName, productPrice,detail,quantity,categoryID,created_By,type,CreateDate) values
('JE1',N'Quần Jean Nam Slim Cotton Dễ Mặc','730.000',N'Vải chính : 67% Cotton, 32% Polyester, 1% Spandex
Vải lót : 80% polyester, 20%cotton
Chất liệu cotton USA là một trong những loại nguyên liệu cao cấp được cả thế giới tin dùng
Sạch hơn các loại bông khác do quá trình thu hoạch sử dụng thiết bị điều khiển bằng máy tính tân tiến nhất, gần như loại bỏ được hoàn toàn lỗi con người hay dẫn đến việc tạo ra bông rác và bông vụn.
Dễ nhuộm màu do phần lớn bông USA hiện nay được phân hạng là bông trắng, sợi bông dễ nhuộm nhất so với hạng bông đốm hay màu nhạt.
Chiếc quần có khả năng co giãn nhẹ, thoải mái khi di chuyển
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JE','Seller1','MAN',N'2023-12-20'),
('JE2',N'Quần Jeans Nam Slim Fit Coolmax Mác Kẹp SHOP’S HOUSE Denim','830.000',N'Chất liệu: 76% Cotton + 22% Polyester by Coolmax all season + 2% Lycra
Thiết kế thêu túi trang trí, mác kẹp SHOP’S HOUSE DENIM nổi bật
Form slim ôm vừa vặn giúp người mặc trông gọn gàng, khỏe khắn và năng động
Về màu sắc có 2 ánh màu xanh cho khách hàng lựa chọn, rất dễ phối đồ
Quần co giãn đàn hồi tốt, nhẹ và dễ chịu
Kết hợp với áo T-shirt, Polo, Sơ mi....
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JE','Seller1','MAN',N'2023-12-20'),
('JE3',N'Quần Jean Nam Coolmax Mác Logo Đỉa Quần','380.000',N'Vải chính: 76% Cotton, 22% Polyester, 2% Spandex
Vải lót: 80% Polyester, 20%Cotton
Quần jeans nam chất liệu cotton USA là một trong những loại nguyên liệu cao cấp được cả thế giới tin dùng với những đặc tính sạch - dễ nhuộm màu
Quần có khả năng đàn hồi và co giãn rất tốt, có độ bền cao
Khả năng thoát hơi ẩm và mao dẫn thoát mồ hôi, độ thoáng khí tốt.
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JE','Seller1','MAN',N'2023-12-20'),
('JE4',N'Quần Short Jean Nam Xắn Gấu Trẻ Trung','530.000',N'Quần jeans nam làm từ vải denim dệt thoi 
Thành phần: 100% Cotton USA
Chất vải mềm, độ dày dặn vừa phải không gây cảm giác nóng bức, khó chịu
Co giãn đàn hồi thoải mái trong mọi hoạt động
Thiết kế trẻ trung, cá tính
Có thể kết hợp với nhiều loại trang phục như: áo thun, sơ mi, áo hai dây
Mặc được trong nhiều hoàn cảnh
SHOP’S HOUSE - Look good. Feel good.
','10','JE','Seller1','MAN',N'2023-12-20'),
('JE5',N'Quần Jean Nam Cafe Thân Thiện Với Môi Trường','260.000',N'Quần short nam YD3 làm từ chất liệu jeans năng động, trẻ trung
Vải dày, bền chắc, không lo sờn rách trong quá trình sử dụng
Short jeans nam thiết kế xắn gấu khoẻ khoắn
Đứng phom rất tôn dáng khi mặc
Co giãn đàn hồi tạo cảm giác thoải mái vận động
Khả năng thấm hút mồ hôi tốt, không gây bí nóng
SHOP’S HOUSE - Look good. Feel good.
','10','JE','Seller1','MAN',N'2023-12-20'),
('JE6',N'Quần Jean Nam S-Cafe Siêu Co Giãn Thoáng Mát','770.000',N'Quần jeans nam S-Cafe siêu co giãn thoáng mát
Thành phần: 76% Cotton, 22% Polyester by S-cafe, 2% Lycra
Sợi S-cafe: sản xuất từ công nghệ độc quyền có khả năng chống tia UV hiệu quả nhờ khả năng khúc xạ ánh sáng, hạn ché tia UVA và UVB tiếp xúc với cơ thể người mặc
Kiểm soát mùi tốt vì bột café được tích hợp vào sợi café theo công nghệ S.cafe
Co giãn tốt do có chứa thành phần spandex nên thoải mái khi vận động
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','MAN',N'2023-12-20'),
('JE7',N'Quần Jeans Nam Coolmax Mỏng Nhẹ Mác SHOP’S HOUSE','860.000',N'Quần jeans nam Cotton Mỹ cho cảm giác mắc mềm nhẹ
Thiết kế mác logo nhận diện thương hiệu SHOP’S HOUSE DENIM 
Chất liệu coolmax all season mềm, co giãn đàn hồi tốt, nhẹ và dễ chịu
Phom regular rộng rãi thoải mái cho người mặc  
Về màu sắc có 2 ánh màu xanh cho khách hàng lựa chọn, rất dễ phối đồ 
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JE','Seller1','MAN',N'2023-12-20'),
('JE8',N'Quần Jean Nam Slimfit Rayon Dây Dệt Túi Đồng Hồ','540.000',N'Quần jeans nam dáng slimfit ôm vừa vặn giúp các người mặc trông gọn gàng, khỏe khoắn và năng động
Thành phần: 70% cotton USA + 20% polyester + 8% rayon + 2%spandex
Chất liệu co giãn 4 chiều thoải mái, mềm mịn, dễ chịu
Có thể kết hợp với áo t-shirt, polo, sơ mi mặc được cả mùa đông và mùa hè, đi làm đi chơi, trong nhiều hoàn cảnh sử dụng
Thiết kế basic hiện đại, là sản phẩm mới nhất trong mùa năm nay
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','MAN',N'2023-12-20'),
('JE9',N'Quần Jeans Nam Ống Suông Lưng Thun','420.000',N'Quần jean nam thiết kế form dáng thoải mái, độ suông vừa phải
Chất liệu: 98% Cotton USA, 2% Spandex
Sản phẩm có khả năng thấm hút mồ hôi, độ này phù hợp cho cảm giác thoáng mát
Kết cấu cạp chun vòng bụng linh hoạt, có dây rút buộc chắc chắn
Sản phẩm dễ dàng chăm sóc, có thể giặt máy
Lưu ý: Không ngâm sản phẩm quá lâu, không giặt cùng với các sản phẩm sáng màu
Lộn trái sản phẩm khi phơi, không phơi trực tiếp dưới ánh nắng mặt trời.
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','MAN',N'2023-12-20'),
('JE10',N'Quần Jeans Nam Slim Cotton Usa 71','630.000',N'Quần jean nam kiểu dáng slim tôn dáng khỏe khoắn
Chất liệu: 89% Cotton USA + 10% Polyester + 1% Spandex
Chất liệu mang đến cảm giác thoải mái, an toàn cho người sử dụng và thân thiện với môi trường
Sản phẩm co giãn nhẹ, dễ dàng vận động
Màu sắc đa dạng, dễ phối đồ
Thiết kế có hình thêu trang trí phần túi sau độc đáo
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','MAN',N'2023-12-20'),
('JE11',N'Quần Jeans Nam Slimfit Coolmax All Season','630.000',N'Chất liệu Jean Coolmax
Thành phần: 76% Cotton USA + 22% Coolmax all season + 2% Lycra
Vải thoáng mát, truyền dẫn ẩm tốt, bề mặt sợi có rãnh làm tăng khả năng truyền dẫn khí và ẩm.
Khả năng thấm hút mồ hôi tốt, hút ẩm nhanh tạo sự thoải mái cho cơ thể khi sử dụng.
Đàn hồi co giãn tốt, ít nhàu, tiện dụng khi vận động và sử dụng trong mọi hoàn cảnh.
Phù hợp với thời tiết quanh năm
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','MAN',N'2023-12-20'),
('JE12',N'Quần Jeans Nam Slim Fit Thêu Túi','530.000',N'Quần jeans nam dáng slimfit trẻ trung, hiện đại và đầy cá tính
Chất vải Denim được SHOP’S HOUSE tuyển chọn mang đến sự thoải mái cho người mặc, độ co giãn vừa đủ, thuận tiện khi di chuyển
Thành phần: 99% cotton + 1% spandex
Form dáng slim fit ôm vừa vặn giúp tôn lên đôi chân săn chắc của phái mạnh 
Thiết kế ống rộng ở đùi và thuôn dần xuống mắt cá chân để tạo cảm giác thoải mái cho người mặc
Mặc dùng giày thể thao, áo thun/ polo hoặc sơ mi phá cách sẽ vô cùng ấn tượng
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','MAN',N'2023-12-20'),
('JE13',N'Quần Jeans Nam Ống Đứng Slimfit Basic','360.000',N'Chất liệu: 89% Cotton USA + 10% Polyester + 1% Spandex
Chất liệu cotton Mỹ bền sạch hơn các loại chất liệu cotton khác
Dễ nhuộm màu đem lại cho sản phẩm màu sắc tươi sáng và đa dạng
Co giãn 4 chiều mang lại cảm giác thoải mái cho người mặc
Kiểu dáng slimfit ôm dáng vừa vặn
SHOP’S HOUSE - Look good. Feel good
Sản xuất tại Việt Nam
','10','JE','Seller1','MAN',N'2023-12-20'),
('JE14',N'Quần Short Jeans Nam Ống Đứng Thời Trang','530.000',N'Quần short jean nam YD2 chất mềm co giãn đàn hồi, mặc thoải mái
Vải đứng form, chắc chắn nhưng không gây cảm giác bí nóng khi mặc
Thiết kế ống đứng, vê gấu cá tính
Kiểu dáng năng động, trẻ trung
Lên dáng khoẻ khoắn, độ chải màu tự nhiên rất dễ phối đồ
Phù hợp để đi chơi, tham gia các chuyến dã ngoại cùng gia đình, bạn bè
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','MAN',N'2023-12-20'),
('JE15',N'Quần Jeans Nam Slim S-Cafe Mác Da SHOP’S HOUSE Denim','430.000',N'Thành phần: 76% Cotton USA, 22% Polyester S-café, 2% Spandex
Chất liệu khử mùi, chống tia UV, bền và thấm hút tốt
Thiết kế basic với điểm nhấn mác da SHOP’S HOUSE DENIM
Form dáng slim fit, cạp quần nằm dưới eo, dáng quần ôm từ hông đến mắc cá chân 1 cách vừa vặn
Quần có 2 ánh màu xanh cho khách hàng lựa chọn, rất dễ phối đồ
Có thể kết hợp với áo t-shirt, polo, sơ mi,...
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JE','Seller1','MAN',N'2023-12-20'),
('JE16',N'Quần Jeans Nam Slim Denim Like Cơ Bản','760.000',N'Thành phần: 98% Cotton, 2% Spandex
Vải dày dặn chắc chắn, bền đẹp
Không bai màu hay co rút trong quá trình sử dụng
Phom dáng slimfit ôm dáng vừa vặn, thiết kế năng động
Phối được cùng nhiều trang phục: áo polo, áo thun, sơ mi
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','MAN',N'2023-12-20');
------Áo nữ (Jeans) 
insert into Product (productID, productName, productPrice,detail,quantity,categoryID,created_By,type,CreateDate) values
('JE17',N'Quần Jean Nữ Dáng Baggy Cotton USA','730.000',N'Quần jeans nữ chất liệu Denim Cotton USA mang đến cảm giác dễ chịu khi mặc
Được làm từ sợi bông tiêu chuẩn tốt nhất thế giới
Vải bền đẹp, chắc chắn, không phai màu, không co rút khi giặt
Kiểu dáng baggy chiết ly ống thoải mái và tôn dáng
Che được khuyết điểm đùi to, chân thô
Có thể kết hợp với nhiều trang phục khác nhau tạo sự trẻ trung, năng động
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','WOMEN',N'2023-12-20'),
('JE18',N'Quần Jean Nữ Ống Suông Xanh Nhạt','830.000',N'Quần jeans nữ làm từ vải denim dệt thoi 
Thành phần: 100% Cotton USA
Chất vải mềm, độ dày dặn vừa phải không gây cảm giác nóng bức, khó chịu
Co giãn đàn hồi thoải mái trong mọi hoạt động
Thiết kế trẻ trung, cá tính
Có thể kết hợp với nhiều loại trang phục như: áo thun, sơ mi, áo hai dây
Mặc được trong nhiều hoàn cảnh
SHOP’S HOUSE - Look good. Feel good.
 Sản xuất tại Việt Nam
','10','JE','Seller1','WOMEN',N'2023-12-20'),
('JE19',N'Quần Jean Nữ Dáng Skinny Co Giãn Thoải Mái','380.000',N'Quần jeans nữ dáng skinny ôm sát cơ thể
Dáng quần tôn trọn vòng 3 và đôi chân của bạn
Chất liệu co giãn 4 chiều thoải mái, mềm mịn, dễ chịu 
Có thể kết hợp với áo t-shirt, polo, sơ mi, tank top ..... mặc được cả mùa đông và mùa hè, đi làm đi chơi, ......trong nhiều hoạt cảnh sử dụng
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','WOMEN',N'2023-12-20'),
('JE20',N'Quần Jean Nữ Dáng Baggy Thanh Lịch Tôn Dáng','530.000',N'Chất liệu: Vải Denim thành phần 98% cotton, 2% spandex
Quần Jean SHOP’S HOUSE có độ bền rất cao giúp bạn yên tâm sử dụng trong thời gian dài mà không lo bị nhăn, mòn rách
Khả năng thấm hút mồ hôi tốt giúp điều hòa nhiệt độ cơ thể, thoáng mát, phù hợp với nhiều điều kiện thời tiết
Chất liệu vải jean dày đẹp, có độ cứng cáp, giúp tôn dáng người mặc
 SHOP’S HOUSE - Look good. Feel good.
','10','JE','Seller1','WOMEN',N'2023-12-20'),
('JE21',N'Quần Short Jean Nữ Ống Rộng Năng Động','260.000',N'Quần short nữ ngắn chất liệu jean trẻ trung
Thành phần: 99% Cotton + 1% Spandex
Thiết kế dáng ngắn, xắn gấu năng động và cơ bản
Sở hữu chiếc quần này, nàng có thể dễ dàng kết hợp mặc cùng các kiểu áo như polo, t-shirt, tank-top... để đi chơi hay vận động một cách thoải mái
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','WOMEN',N'2023-12-20'),
('JE22',N'Quần Jeans Nữ Dáng Skinny Trơn','770.000',N'Chất liệu: Denim 99% cotton và 1% spandex
Sản phẩm giữ form đẹp, co giãn nhẹ tạo cảm giác thoải mái khi mặc
Độ bền rất cao giúp bạn yên tâm sử dụng trong thời gian dài
Không lo bị nhăn, mòn rách do đặc tính vải bông thô
Chất liệu vải dày đẹp, có độ cứng cáp, giúp tôn dáng người mặc
Khả năng thấm hút mồ hôi rất tốt, điều hòa nhiệt độ cơ thể, phù hợp với nhiều điều kiện thời tiết
SHOP’S HOUSE - Look good. Feel good.
','10','JE','Seller1','WOMEN',N'2023-12-20'),
('JE23',N'Quần Jeans Nữ Dáng Suông Cạp Chéo','860.000',N'Chất liệu: 100% Cotton USA
Quần jean kiểu dáng suông cạp chéo tôn dáng khỏe khoắn
Chất liệu mang đến cảm giác thoải mái, an toàn cho người sử dụng và thân thiện với môi trường
Sản phẩm co giãn nhẹ, dễ dàng vận động
Màu sắc đa dạng, dễ phối đồ
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','WOMEN',N'2023-12-20'),
('JE24',N'Quần Jeans Nữ Cafe Dáng Suông','540.000',N'Vải chính: Denim Cafe (76% Cotton, 22% Polyester, 2% Spandex)
Vải lót: Lót túi hàng Jeans Protrade (80% Polyester, 20% Cotton)
Chất liệu co giãn nhẹ, thoáng mát và dễ chịu cho làn da
Tính năng khử mùi, chống tia UV
Quần ống suông với hiệu ứng thời trang và ria mèo bắt mắt, trẻ trung
Form ống suông giúp hack dáng tạo cảm giác đôi chân dài, đồng thời đem lại sự thoải mái ở phần hông và đùi cho phái nữ
Sản phẩm có thể kết hợp với áo phông, áo crop top, áo hai dây, áo polo hoặc sơ mi
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JE','Seller1','WOMEN',N'2023-12-20'),
('JE25',N'Quần Jeans Nữ Dáng Suông Túi Vuông','420.000',N'Chất liệu Denim
Thành phần 99% Cotton + 1% Spandex
Vải mềm, có sự đàn hồi tạo cảm giác thoải mái cho người mặc
Dáng suông với điểm nhấn túi ốp vuông ở phía trước
Sử dụng ở nhiều hoàn cảnh khác nhau: đi cà phê với bạn bè, đi làm, đi học, đi du lịch,.....
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JE','Seller1','WOMEN',N'2023-12-20'),
('JE26',N'Quần Jeans Nữ Dáng Baggy Năng Động Cá Tính','630.000',N'Chất liệu jeans co giãn 4 chiều thoải mãi, dễ dàng vận động
Thành phần: 100% Cotton USA
Dáng quần thoải mái ở phần mông, đùi ống nhỏ dần giúp che đi khuyết điểm bắp chân to
Có thể kết hợp với nhiều loại trang phục như: áo t-shirt, polo, sơ mi, tank-top...
Chiếc quần mặc được cả cả đông lẫn hè, đa dạng hoàn cảnh sử dụng từ đi làm đến đi chơi, dã ngoại
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','WOMEN',N'2023-12-20'),
('JE27',N'Quần Jeans Nữ Skinny Lưng Cao Hack Dáng','630.000',N'Quần jeans nữ dáng skinny ôm sát cơ thể tôn trọn vòng 3 và đôi chân cực đẹp
Thành phần: 90% Cotton USA + 8% Polyester + 2% Lycra
Chất liệu co giãn 4 chiều thoải mái, mềm mịn, dễ chịu
Thích hợp phối với áo T-shirt, Polo, Sơ mi hay Tank-top để mặc được cả mùa đông và mùa hè
Sản phẩm có thể sử dụng được trong nhiều hoàn cảnh đi làm, đi chơi
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','WOMEN',N'2023-12-20'),
('JE28',N'Quần Jeans Nữ Skinny Túi Vuông Co Giãn 4 Chiều','530.000',N'Quần jeans nữ dáng skinny ôm sát cơ thể tôn trọn vòng 3 và đôi chân
Chất liệu co giãn 4 chiều tạo cảm giác thoải mái, mềm mịn và dễ chịu khi mặc
Thành phần:  90% cotton USA + 8% polyester + 2% lycra
Chiếc quần có thể kết hợp với áo T-shirt, Polo, Sơ mi, Tank-top... để chị em mặc cả mùa đông và mùa hè
Sản phẩm dùng được trong nhiều hoàn cảnh như đi làm, đi chơi,...
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','WOMEN',N'2023-12-20'),
('JE29',N'Quần Jeans Nữ Ống Đứng Cao Cạp 2 Cúc','360.000',N'Thành phần:  98.5% Cotton USA + 1.5% Spandex
Quần jean ống đứng, chất liệu jean co giãn
Vải mềm, có sự đàn hồi tạo cảm giác thoải mái cho người mặc
Quần rất tôn dáng, giúp che đi khuyết điểm chân cong
Thiết kế basic, màu sắc trẻ trung, dễ phối đồ
kết hợp với áo T-shirt, Polo, Sơ mi... mặc quanh năm, đi làm, đi chơi.
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','WOMEN',N'2023-12-20'),
('JE30',N'Quần Jeans Nữ Dáng Baggy Gân Giữa','530.000',N'Chất liệu: Vải Denim
Thành phần: 98.5% Cotton USA + 1.5% Spandex
Chất liệu co giãn 4 chiều thoải mái , dễ dàng vận động
Sợi vải liên kết bền chắc, giữ màu, thấm hút mồ hôi
Kiểu dáng baggy giúp che đi khuyết điểm
Dễ dàng kết hợp với áo t-shirt, polo, sơ mi... mặc quanh năm trong nhiều hoàn cảnh khác nhau
 SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','WOMEN',N'2023-12-20'),
('JE31',N'Quần Jeans Nữ Skinny Co Giãn 4 Chiều','430.000',N'Thành phần: 98.5% Cotton USA + 1.5% Spandex
Quần jean nữ vải demin chắc chắn và bền form
Chị em có thể tự tin, thoải mái diện chiếc quần này trong mọi hoạt động cho cơ thể với chất liệu co giãn 4 chiều
Vải mềm, độ dày dặn vừa phải không gây cảm giác nóng bức, khó chịu cho người mặc
Đây là thiết kế tôn dáng, với phần lên màu vô cùng trẻ trung, cá tính
Có thể mặc quanh năm, là món đồ cân vô cùng nhiều outfit cho các chị em
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','WOMEN',N'2023-12-20'),
('JE32',N'Quần Jeans Nữ Dáng Suông Ống Đứng Xắn Gấu','760.000',N'Thành phần: 98.5% Cotton USA + 1.5% Spandex
Quần jeans nữ dáng suông đứng có chi tiết xắn gấu trẻ trung
Dáng quần vừa vặn giúp tôn đôi chân dài hơn và che đi khuyết điểm nếu bắp chân to
Chất liệu co giãn 4 chiều thoải mãi, dễ dàng vận động
Chiếc quần có thể kết hợp với áo T-shirt, Polo, Sơ mi, Tank-top... mặc được cả mùa đông và mùa hè
Sản phẩm sử dụng được trong nhiều hoàn cảnh đi làm, đi chơi
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','WOMEN',N'2023-12-20');
------Áo trẻ em (Jeans) 
insert into Product (productID, productName, productPrice,detail,quantity,categoryID,created_By,type,CreateDate) values
('JE33',N'Quần Jeans Trẻ Em Cạp Chun Mài Ống','730.000',N'Chất liệu jeans cotton USA
Thành phần:  70% Cotton USA + 20% Polyester + 8% Rayon + 2% Spandex
Mềm mại, co giãn 4 chiều, độ đàn hồi tốt
Kiểu dáng jogger chun cạp, ống đứng vừa vặn
Cạp chun thoải mái, năng động và trẻ trung
Bé thoải mái mặc khi đi học, đi chơi....
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','KIDS',N'2023-12-20'),
('JE34',N'Quần Jeans Trẻ Em Can Gối Ly Thân','830.000',N'Quần jean cho bé dáng cơ bản
Thành phần:  99% Cotton + 1% Spandex
Cạp chun thoải mái, can gối cá tính
Chất liệu jean mềm thân thiện với làn da bé
Quần vừa vặn đem lại sự thoải mái cho bé khi mặc
Đường may chắc chắn
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','KIDS',N'2023-12-20'),
('JE35',N'Quần Jeans Kid Cạp Chun Cơ Bản','380.000',N'Thành phần: 90% Cotton, 8% Polyester, 2% Spandex
Được làm từ chất liệu cotton USA là một trong những loại nguyên liệu cao cấp được cả thế giới tin dùng
Vải co giãn tốt, có độ bền cao, mềm mại, thông thoáng và thấm hút tốt
Thiết kế cạp chun thoải mái, form dáng dễ mặc phù hợp nhiều độ tuổi của bé
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','JE','Seller1','KIDS',N'2023-12-20'),
('JE36',N'Quần Jeans Trẻ Em Vải Cotton Co Giãn Tốt','530.000',N'Chất liệu jean cotton, thành phần:  98.5% Cotton USA + 1.5% Spandex
Quần jeans kid phom slim, chất liệu nhẹ, co dãn tốt.
Phom dáng dễ mặc, phù hợp nhiều độ tuổi
Chất liệu nhẹ, mềm mại, co dãn tốt
SHOP’S HOUSE - Look good. Feel good
Sản xuất tại Việt Nam
','10','JE','Seller1','KIDS',N'2023-12-20'),
('JE37',N'Quần Short Jeans Trẻ Em','260.000',N'Quần short trẻ em form ngắn 
Thiết kế basic, có túi tiện lợi cho bé
Chất liệu jeans không quá dày, thoải mái, co giãn vừa đủ, thuận tiện cho bé chạy nhảy hàng ngày
Thành phần: 99% cotton + 1% spandex
Cạp chun tiện lợi, phù hợp với các bạn nhỏ đi học, đi chơi
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','KIDS',N'2023-12-20'),
('JE38',N'Quần Short Jeans Xước, Dáng Lửng Dành Cho Bé Gái','770.000',N'Quần short jean dáng lửng dành cho bé gái từ 8 - 15 tuổi
Thành phần: 99% Cotton + 1% Spandex
Điểm nhấn họa tiết cào rách hình trái tim đáng yêu
Cạp chun thoải mái cho bé hoạt động cả ngày dài
Phối cùng nhiều loại áo như: T-shirt, Polo, sơ mi, tank-top...
Sản phẩm phù hợp để bé mặc đi học, đi chơi và cả ở nhà
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','KIDS',N'2023-12-20'),
('JE39',N'Quần Short Jeans Trẻ Em Xắn Gấu','860.000',N'Thành phần: 100% Cotton
Quần sooc ngắn với chi tiết lơ vê gấu khỏe khoắn, cạp chun thoải mái cử động cho bé hoạt động cả ngày dài.
Thích hợp phối với nhiều loại áo như T-shirt, sơ mi, tank-top....
Trang phục này bé có thể mặc đi học, đi chơi.
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','KIDS',N'2023-12-20'),
('JE40',N'Quần Short Jeans Trẻ Em Regular Lưng Thun Phối Túi Trước','540.000',N'Bền chắc, ít nhăn và không xù lông, thoáng mát, dễ chịu
Thành phần: 99% Cotton + 1% Spandex
Thoải mái vận động với sợi vải co giãn
Thân thiện với môi trường
Dễ nhuộm màu
Sản phẩm dễ kết hợp với nhiều loại áo khác nhau như áo sơ mi, áo phông, áo polo,...
SHOP’S HOUSE - Look good. Feel good!
Sản xuất tại Việt Nam
','10','JE','Seller1','KIDS',N'2023-12-20'),
('JE41',N'Quần Short Jeans Trẻ Em Lưng Thun Cào Rách','420.000',N'Sản phẩm phù hợp với mọi hoạt động của bé, thấm hút mồ hôi tốt
Thành phần: 99% Cotton + 1% Spandex
Co giãn nhẹ, phù hợp với từng chuyển động trên cơ thể
Màu sắc trang nhã, thanh lịch
Có thể kết hợp được với nhiều kiểu áo như áo thun, áo Polo, áo sơ mi,...
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','JE','Seller1','KIDS',N'2023-12-20'),
('JE42',N'Quần Jeans Trẻ Em Ống Suông Cạp Chun','630.000',N'Thành phần:  98.5% Cotton USA + 1.5% Spandex
Vải mang đến sự mềm mại, thoải mái và thoáng khí cho bé
Sợi spandex giúp mang đến sự co giãn tối đa, tạo sự tiện lợi cho mọi hoạt động hằng ngày
Nên ngâm phèn chua 1h hoặc để tủ đá 1 đêm trước khi giặt lần đầu để tránh phai màu nhiều
Kiểu dáng suông phù hợp với nhiều vóc dáng các bé từ 8-15 tuổi
SHOP’S HOUSE - Look good. Feel good.
','10','JE','Seller1','KIDS',N'2023-12-20');
------------####################Jeans###################----------------
------------####################Sweatshirts###################----------------
------Áo nam (Sweatshirts) 
insert into Product (productID, productName, productPrice,detail,quantity,categoryID,created_By,type,CreateDate) values
('SW1',N'Áo Thể Thao Nam Nỉ In Limitless','730.000',N'Chất liệu nỉ 2 mặt, thành phần: 87% Polyester + 13% Spandex
Công nghệ dệt hiện đại giúp sản phẩm có độ xốp, mềm mại, giữ ấm cho cơ thể
Bề mặt vải mềm mịn, chắc chắn, không xù lông vón cục
Thấm hút tốt, hạn chế tĩnh điện
Co giãn đàn hồi, không bai gião ,độ bền cao
Kiểu dáng cơ bản ôm, khỏa khoắn trẻ trung, hình in phản quang nổi bật
Phù hợp mặc đi làm, đi học, đi chơi, mix cùng quần joger, quần jeans
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','SW','Seller2','MAN',N'2023-12-20'),
('SW2',N'Áo Nỉ Thể Thao Nam Gắn Mác Cao Su','830.000',N'Thành phần : 87% Polyester + 8% Rayon + 5% Elastane
Cấu trúc dệt 4 hệ sợi liên kết chặt chẽ. Hai mặt phải mang lại cảm giác tiếp xúc da thoải mái, hạn chế xù lông vón cục.
Mềm mại, thoải mái, thấm hút tốt, kiểm soát độ ẩm. Khô nhanh. Co giãn đàn hồi giữ form.
Dáng slim ôm vừa, tôn dáng, cổ tròn, bo tay và bo gấu, điểm nhấn là chi tiết hình in text phong cách thể thao khỏe khoắn.
Thân sau có may logo cao su tinh tế bền đẹp.
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','SW','Seller2','MAN',N'2023-12-20'),
('SW3',N'Áo Khoác Nỉ Thể Thao Nam Double Face Smart','380.000',N'Chất liệu Double face smart tăng cường khả năng giữ ấm cơ thể
Thành phần: 87% Polyester + 8% Rayon + 5% Spandex
Cấu trúc dệt 4 hệ sợi liên kết chặt chẽ. Bề mặt chắc chắn
Hai mặt phải mang lại cảm giác tiếp xúc da thoải mái, hạn chế xù lông vón cục
Áo khoác nỉ cổ dựng, có túi khóa hai bên sườn, thân sau có logo cao su in cao thành cùng màu vải chính
Form dáng cơ bản ôm vừa tôn dáng mang lại cảm giác gọn gàng cho người mặc
Thiết kế trơn màu đơn giản phù hợp với khách hàng yêu thích phong cách tối giản
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','SW','Seller2','MAN',N'2023-12-20'),
('SW4',N'Áo Thu Đông Nam, Chất Nỉ, Ép Chữ Nổi','530.000',N'Áo thu đông nam chất liệu nỉ, nhẹ, giữ ấm tốt và mềm mịn
Thành phần: 90.9% Polyester + 9.1% Spandex
Kiểu dáng suông cơ bản dễ mặc, phù hợp với mọi vóc dáng
Điểm nhấn là phần chữ ép nổi độc đáo
Áo có thể mặc cùng quần jean, quần nỉ dùng khi đi chơi, đi làm hay mặc ở nhà
Trang phục rất thích hợp mặc trong thời tiết se lạnh
SHOP’S HOUSE - Look good. Feel good.
','10','SW','Seller2','MAN',N'2023-12-20'),
('SW5',N'Áo Khoác Nỉ Thể Thao Nam Kéo Khóa Phối Tay','260.000',N'Thành phần:  87% Polyester + 8% Rayon + 5% Spandex
Vải nỉ  mềm mại, thoải mái. Thấm hút tốt, kiểm soát độ ẩm. Khô nhanh. Co giãn đàn hồi giữ form.
Áo khoác nỉ có mũ, phần mũ áo có dây rút điều chỉnh độ rộng chật của mũ.
Túi ốp hai bên sườn phom dáng ngắn trẻ trung năng động
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','SW','Seller2','MAN',N'2023-12-20'),
('SW6',N'Áo Nỉ Thu Đông Nam Dáng Rộng In Ngực','770.000',N'Thành phần: 70% Cotton + 30% Spandex
Áo nỉ nam chất liệu siêu mềm mịn và dày dặn, giữ form tốt
Kiểu dáng thoải mái, trẻ trung, năng động
Thiết kế basic với mác logo điểm nhấn ở ngực
Áo thích hợp để chàng mặc mọi lúc, mọi nơi như: đi làm, đi chơi, ở nhà, thể thao...
Có thể phối cùng quần jean, quần nỉ, quần sooc
SHOP’S HOUSE - Look good. Feel good.
','10','SW','Seller2','MAN',N'2023-12-20'),
('SW7',N'Áo Thể Thao Thu Đông Nam Nỉ Cơ Bản In SHOP’S HOUSE Sport','860.000',N'Áo nỉ nam Double Face Smart : 87% Polyester + 8% Rayon + 5% Spandex
Cấu trúc dệt 4 hệ sợi liên kết chặt chẽ bề mặt chắc chắn
Hai mặt phải mang lại cảm giác tiếp xúc da thoải mái, hạn chế xù lông vón cục
Cấu trúc Double Face được mô tả như một chiếc bánh sandwich với lớp giữa mềm mỏng – xốp chứa đựng không khí tĩnh, tăng cường khả năng giữ ấm cơ thể
Tính năng: Mềm mại, thoải mái. Thấm hút tốt, kiểm soát độ ẩm. Khô nhanh. Co giãn đàn hồi giữ form. Xốp nhẹ
Thiết kế bổ can vai, thân sau ép decan phản quang logo. Form dáng cơ bản phù hợp với nhiều dáng người, màu trẻ trung khỏe khoắn
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','SW','Seller2','MAN',N'2023-12-20'),
('SW8',N'Bộ Đồ Thể Thao Nam Nỉ Double Face Áo Khoác Kéo Khóa','540.000',N'Bộ đồ thể thao in hình trẻ trung năng động
Thành phần: 91% Polyester + 9% Spandex
Áo khoác kéo khóa với chi tiết phối đơn giản, trẻ trung, khỏe khoắn
Sản phẩm được dệt từ sợi Polyester dài & mảnh, kết hợp cùng kiểu dệt Double Face cho nền vải chắc chắn nhưng vẫn có độ xốp, nhẹ nhàng
Độ bền cao, ít nhăn nhàu 
Co giãn, phù hợp với chuyển động của cơ thể
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','SW','Seller2','MAN',N'2023-12-20'),
('SW9',N'Áo Thun Đông Nam Mickey','420.000',N'Nằm trong BST áo nỉ gia đình mới nhất mùa thu đông năm nay
Kiểu dáng rộng, thoải mái với điểm nhấn hình Mickey nhỏ ở ngực trẻ trung
Thiết kế dài tay giúp giữ ấm tốt
Thích hợp mix cùng quần jeans, quần dài mặc trong mọi hoàn cảnh đi chơi, đi làm
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','SW','Seller2','MAN',N'2023-12-20'),
('SW10',N'Áo Thun Đông Nam Rip Cổ 4cm','630.000',N'Chất liệu thun rib co giãn tốt, thoải mái và mềm mại, không kích ứng da
Thành phần: 95% Cotton, 5% Spandex
Kiểu dáng suông cơ bản, cao cổ giữ ấm cơ thể vượt trội
Thích hợp để mặc bên trong như áo giữ nhiệt
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','SW','Seller2','MAN',N'2023-12-20'),
('SW11',N'Áo Hoodie Nam Cơ Bản Dáng Rộng','630.000',N'Một chiếc áo dễ mặc, phối đồ trẻ trung dành cho nam giới
Áo hoodie nam dáng hiện đại, thoải mái, giữ ấm tốt
Chất liệu: 90.9% Polyester + 9.1% Spandex
Thành phần cotton giúp áo có độ mềm và thấm hút tốt
Polyester được bổ sung giúp tăng tuổi thọ và độ bền của áo
Cấu trúc dệt 4 hệ sợi liên kết chặt chẽ, 2 mặt vải mang lại cảm giác tiếp xúc da thoải mái, hạn chế xù lông vón cục
SHOP’S HOUSE - Look good. Feel good.
','10','SW','Seller2','MAN',N'2023-12-20'),
('SW12',N'Áo Thu Đông Nam Kẻ In Gấu','530.000',N'Áo thu đông nam chất liệu  58% Cotton + 39% Polyester + 3% Spandex
Vải co giãn, giữ ấm, bề mặt vải mịn cùng màu sắc thanh lịch
Áo có form dáng suông rộng giúp tạo sự cử động thoải mái cho người mặc
Hình in gấu trước ngực tạo điểm nhấn trẻ trung
Kết hợp cùng quần nỉ hoặc quần jeans
Thích hợp mặc ở nhà, đi chơi và đi làm vào mùa đông.
SHOP’S HOUSE - Look good.Feel good.
','10','SW','Seller2','MAN',N'2023-12-20'),
('SW13',N'Áo Thun Thu Đông Nam Họa Tiết Kẻ Ngang Hiện Đại','360.000',N'Áo thu đông kẻ ngang làm từ chất liệu nỉ co giãn, bề mặt vải mịn
Thành phần vải:  58% Cotton + 39% Polyester + 3% Spandex
Áo có khả năng giữ ấm cùng màu mắc thanh lịch
Thiết kế kẻ ngang tạo điểm nhấn trẻ trung. Phom dáng rộng tạo sự thoải mái khi cử động cho người mặc
Chiếc áo có thể kết hợp cùng quần nỉ hoặc quần jeans, thích hợp để mặc ở nhà, đi làm và đi chơi
SHOP’S HOUSE - Look good. Feel good.
','10','SW','Seller2','MAN',N'2023-12-20');
------Áo nữ (Sweatshirts)
insert into Product (productID, productName, productPrice,detail,quantity,categoryID,created_By,type,CreateDate) values
('SW14',N'Áo Nữ Nỉ In MOTIVATION','730.000',N'Thành phần: 70% Cotton + 30% Polyester
Vải nỉ ấm áp và giữ form tốt. Mặt phải mềm mại, mịn màng, mặt trái được cào bông bằng công nghệ hiện đại tạo độ xốp, tăng khả năng giữ ấm của sản phẩm
Độ bền cao, co giãn nhẹ, thích hợp với chuyển động của cơ thể
Áo thu đông nữ kiểu dáng trẻ trung với điểm nhấn là hình in cá tính, phù hợp với nhiều lứa tuổi
Sản phẩm thích hợp để chị em mặc đi chơi, đi làm, có thể mix với quần jean, chân váy hoặc quần sooc, legging
SHOP’S HOUSE - Look good. Feel good.
','10','SW','Seller2','WOMEN',N'2023-12-20'),
('SW15',N'Áo Khoác Nỉ Thể Thao Nữ','830.000',N'Vải nỉ 2 mặt
Thành phần: 87% Polyester + 8% Rayon + 5% Spandex
Vải nỉ  mềm mại, thoải mái. Thấm hút tốt, kiểm soát độ ẩm. Khô nhanh. Co giãn đàn hồi giữ form.
Áo khoác nỉ có mũ, phần mũ áo có dây rút điều chỉnh độ rộng chật của mũ.
Túi ốp hai bên sườn phom dáng ngắn trẻ trung năng động
Hình in cao su phong cách sporty sắc nét, bền đẹp
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','SW','Seller2','WOMEN',N'2023-12-20'),
('SW16',N'Áo Nỉ Nữ Gia Đình Thêu COFFEE','380.000',N'Thiết kế áo nỉ nữ thu đông với hình thêu coffee
Thành phần:  60% Polyester + 35% Cotton + 5% Spandex
Form dáng suông rộng thoải mái vận động
Thiết kế hình thêu trước ngực tinh tế, nhỏ xinh tạo điểm nhấn trẻ trung
Áo có chất liệu nỉ co giãn, giữ ấm, bề mặt vải mịn cùng màu sắc thanh lịch có thể kết hợp cùng quần nỉ hoặc quần jeans. 
SHOP’S HOUSE - Look good. Feel good.
','10','SW','Seller2','WOMEN',N'2023-12-20'),
('SW17',N'Áo Thu Đông Nữ Nỉ Thêu Ngực','530.000',N'Áo nỉ thu đông cho nữ, ấm áp riêng cho mùa lạnh này
Thành phần:  81% Cotton + 19% Polyester
Chất vải nỉ với thành phần chính là sợi cotton và polyester dày dặn mang lại nhiều ưu điểm
Áo có khả năng giữ ấm hiệu quả nhưng đồng thời vẫn đảm bảo thoáng khí cho người mặc thoải mái
Mặt phải mềm mại, mịn màng, mặt trái được cào bông bằng công nghệ hiện đại tạo độ xốp, tăng khả năng giữ ấm của sản phẩm
Độ bền cao, co giãn nhẹ, thích hợp với chuyển động của cơ thể
SHOP’S HOUSE - Look good. Feel good.
','10','SW','Seller2','WOMEN',N'2023-12-20'),
('SW18',N'Áo Sweater Nữ Chất Nỉ Thêu Cô Gái','260.000',N'Áo thu đông nữ chất liệu nỉ da cá
Thành phần: 70% Cotton + 30% Polyester
Kết cấu sợi tạo nên mặt vải đanh chắc, không bị bai dão, ít xù
Mặt vải tạo nên sự ấm áp cho người mặc
Khả năng thấm hút và co giãn tốt, độ bền cao, thoải mái cho hoạt động cơ thể
Kiểu dáng áo trẻ trung với điểm nhấn là hình thêu cô gái đầy nữ tính
Phù hợp để chị em mặc đi làm hoặc đi chơi
Dễ dàng mix với quần jean, chân váy hoặc sooc, quần legging theo phong cách và sở thích nàng muốn
SHOP’S HOUSE - Look good. Feel good.
','10','SW','Seller2','WOMEN',N'2023-12-20'),
('SW19',N'Áo Nỉ Nữ Gia Đình In Gấu BE NICE','770.000',N'Chất liệu nỉ có thành phần 60% Polyester + 35% Cotton + 5% Spandex
Vải mềm mướt, mịn màng, đem lại trải nghiệm tuyệt vời trên da
Mật độ dệt cao với các sợi mảnh giúp vải chặt chẽ, kết hợp cùng lớp lông mặt trong làm tăng khả năng giữ ấm cơ thể.
Hạn chế xù lông, vón cục
Được kết hợp từ 2 lớp do đó vải ít nhăn nhàu, đứng phom dáng dễ dàng phối đồ
SHOP’S HOUSE - Look good. Feel good.
','10','SW','Seller2','WOMEN',N'2023-12-20'),
('SW20',N'Áo Nỉ Nữ Cổ Tròn In Chữ Think','860.000',N'Chất liệu vải 100% cotton thân thiện với môi trường.
Sản phẩm giúp giữ ấm tốt, cảm giác mềm mịn, co giãn vừa đủ.
Bền form, bền màu, có thể giặt tay và giặt máy đều được.
Kiểu dáng suông, thiết kế hình in ở ngực áo tạo điểm nhấn khác biệt, dễ thương.
Áo nỉ nữ kiểu dáng cơ bản phù hợp với mọi dáng người trẻ trung,rất dễ mặc dễ mix đồ với quần jean baggy hay chân váy,...đi chơi, đi làm hoặc ở nhà. 
SHOP’S HOUSE - Look good. Feel good.
','10','SW','Seller2','WOMEN',N'2023-12-20'),
('SW21',N'Áo Khoác Nữ Nỉ Cào Lông','540.000',N'Chất liệu nỉ cào lông 100% Polyester
Thiết kế basic dễ mặc dễ phối đồ, có mũ ấm áp
Áo nỉ cào lông siêu ấm rất dễ ứng dụng thời tiết Việt Nam. Cảm giác chạm mềm mại, êm ái
Trọng lượng áo siêu nhẹ nên tiện lợi cho việc gấp gọn mang theo
Sản phẩm kết hợp với phối các phẩm SHOP’S HOUSE, như áo thun, len, phông, jeans, quần nỉ
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','SW','Seller2','WOMEN',N'2023-12-20'),
('SW22',N'Áo Thu Đông Nỉ Dài Tay In Hình','420.000',N'Áo thu đông nữ chất liệu nỉ dày dặn
Thành phần:  60% Polyester + 35% Cotton + 5% Spandex
Mặt trong có lớp lông nhung mềm mại, giữ form và rất ấm
Kiểu rộng cơ bản thích hợp với mọi dáng người
Điểm nhấn là hình in trẻ trung, cá tính trước ngực
Chiếc áo có thể mặc với nhiều phong cách và hoàn cảnh như: đi chơi, đi làm hoặc ở nhà đều phù hợp
SHOP’S HOUSE - Look good. Feel good.
','10','SW','Seller2','WOMEN',N'2023-12-20'),
('SW23',N'Áo Khoác Nỉ Thể Thao Nữ Double Face Smart','630.000',N'Chất liệu Double face smart
Thành phần: 87% Polyester + 8% Rayon + 5% Spandex
Vải mềm mại, thoải mái.Thấm hút tốt, kiểm soát độ ẩm. Khô nhanh. Co giãn đàn hồi giữ form.
Cổ dựng, túi khóa hai bên sườn, thân sau có logo cao su, phom dáng cơ bản ôm vừa tôn dáng mang lại cảm giác gọn gàng cho người mặc
Thiết kế trơn màu đơn giản, yêu thích phong cách tối giản
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','SW','Seller2','WOMEN',N'2023-12-20'),
('SW24',N'Áo Khoác Nỉ Thể Thao Nữ Cổ Dựng Phối Tay','630.000',N'Chất liệu: Doubleface Smart
Vải chính: 87% Polyester, 8% Rayon, 5% Spandex
Lót túi: 100% Polyester
Cấu trúc dệt 4 hệ sợi liên kết chặt chẽ, bề mặt chắc chắn
Hai mặt phải mang lại cảm giác tiếp xúc da thoải mái, hạn chế xù lông vón cục
Cấu trúc Double Face được mô tả như một chiếc bánh sandwich với lớp giữa mềm mỏng – xốp chứa đựng không khí tĩnh, tăng cường khả năng giữ ấm cơ thể
Áo khoác dày dặn, xốp nhẹ, hạn chế nhăn nhàu, tính năng giữ ấm cơ thể vượt trội là những ưu điểm của dòng sản phẩm này.
Với thiết kế năng động, kết hợp sự pha phối màu sắc trẻ trung nữ tính, chi tiết điểm nhấn tinh tế mang phong cách thể thao, giúp bạn trông trẻ hơn.
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look goof. Feel good.
','10','SW','Seller2','WOMEN',N'2023-12-20'),
('SW25',N'Bộ Nỉ Nữ Thể Thao Double Face Áo Khoác Kéo Khóa','530.000',N'Thành phần chất liệu: 91% Polyester + 9% Spandex
Được dệt từ sợi Polyester dài & mảnh, kết hợp cùng kiểu dệt Double Face cho nền vải chắc chắn nhưng vẫn có độ xốp, nhẹ nhàng.
Độ bền cao, ít nhăn nhàu
Co giãn, phù hợp với chuyển động của cơ thể
Hỗ trợ giữ ấm cơ thể, thông thoáng
Bộ đồ thể thao in hình trẻ trung năng động, áo khoác kéo khóa với chi tiết phối đơn giản
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','SW','Seller2','WOMEN',N'2023-12-20'),
('SW26',N'Áo Thu Đông Nữ Form Rộng Thêu Hoa','360.000',N'Thành phần: 70% Cotton + 30% Spandex
Áo thu đông nữ chất liệu nỉ ấm áp và giữ form tốt
Kiểu dáng phom rộng trẻ trung, điểm nhấn là hình thêu hoa
Chiếc áo dành cho chị em mặc để đi chơi, đi làm
Thích hợp để mix với quần jeans, chân váy, quần sooc, legging... mặc khi trời trở lạnh
SHOP’S HOUSE - Look good. Feel good.
','10','SW','Seller2','WOMEN',N'2023-12-20'),
('SW27',N'Áo Thu Đông Nữ Mickey And Friends Foundation','530.000',N'Thành phần: 70% Cotton + 30% Polyester
Chất liệu nỉ da cá mềm mại, mặt vải đanh chắc giữ ấm tốt, không bai gião, ít xù
Áo nỉ nữ form thoải mái, giữ ấm tốt. Thiết kế hình in mickey lớn trẻ trung tạo điểm nhấn
Có thể mặc cùng chân váy, quần dài, mặc đi chơi, đi làm
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','SW','Seller2','WOMEN',N'2023-12-20');
------Áo trẻ em (Sweatshirts)
insert into Product (productID, productName, productPrice,detail,quantity,categoryID,created_By,type,CreateDate) values
('SW28',N'Áo Nỉ Trẻ Em Heart','730.000',N'Áo cho bé chất nỉ co giãn, giữ ấm cơ thể, bề mặt vải mềm mịn cùng màu sắc thanh lịch
Thành phần:  81% Cotton + 19% Polyester
Phom dáng suông rộng giúp tạo sự cử động thoải mái cho bé
Thiết kế hình in trước ngực tạo điểm nhấn năng động, phong cách
Áo có thể kết hợp cùng quần nỉ, quần jeans theo các style khác nhau
Sản phẩm thích hợp cho bé mặc ở nhà, đi chơi và đi học vào mùa đông
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','SW','Seller2','KIDS',N'2023-12-20'),
('SW29',N'Áo Nỉ Trẻ Em Camping','830.000',N'Thành phần: 58% Cotton + 39% Polyester + 3% Spandex
Áo nỉ dài tay thu đông dành cho trẻ em
Áo có form dáng suông rộng giúp tạo sự thoải mái cử động cho các bé
Hình in trước ngực tạo điểm nhấn tươi vui, khác biệt
Áo có chất liệu nỉ co giãn, ấm áp, thấm hút mồ hôi, bền form
Thành phần sợi vải: 58% Cotton + 39% Polyester + 3% Spandex
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','SW','Seller2','KIDS',N'2023-12-20'),
('SW30',N'Áo Nỉ Trẻ Em In Stay Cool','380.000',N'Áo trẻ em làm từ chất liệu nỉ da cá, bề mặt vải mịn cùng màu sắc bắt mắt
Thiết kế dành cho các bé từ 8 - 15 tuổi, giữ ấm tốt
Thành phần: 60% cotton + 35% Polyester + 5% Spandex
Áo thu đông có form dáng suông rộng mang đến sự thoải mái cho bé khi cử động 
Điểm nhấn với thiết kế hình in trước ngực
Sản phẩm có thể phối cùng quần nỉ, quần jeans, quần kaki để bé mặc đi học, đi chơi, ở nhà,...
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','SW','Seller2','KIDS',N'2023-12-20'),
('SW31',N'Áo Nỉ Trẻ Em Lion King','530.000',N'Áo thun thu đông dễ thương dành cho các bé
Thành phần: 60% cotton, 35% Polyester, 5% Spandex
Một thiết kế siêu dễ thương dành cho mùa thu đông này của bé thêm ấm áp
Với hình in cùng thông điệp chủ đề “thế giới động vật”
Sư tử được thể hiện 1 cách đáng yêu và gần gũi với bé
Áo thích hợp làm món quà thu đông cho bé
Vải mềm mại, đanh chắc, giữ ấm tốt, ít xù lông
Co giãn thoải mái cho bé tự do vận động
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','SW','Seller2','KIDS',N'2023-12-20'),
('SW32',N'Áo Nỉ Trẻ Em Like Star','260.000',N'Thành phần: 70% Cotton + 30% Spandex
Áo nỉ thu đông dành cho trẻ em, dễ thương - ấn tượng
Chất vải nỉ dày dặn, ấm áp, giữ nhiệt tốt bảo vệ bé khỏi thời tiết giá lạnh
Thiết kế in chữ công nghệ cao, bền đẹp, dễ thương
Sản phẩm có 3 phiên bản màu sắc mưới mẻ, dễ mặc: tím, cam, trắng
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','SW','Seller2','KIDS',N'2023-12-20'),
('SW33',N'Áo Nỉ Trẻ Em In Mars','770.000',N'Thành phần: 70% Cotton + 30% Spandex
Áo thun thu đông dễ thương dành cho các bé
Một thiết kế siêu dễ thương dành cho mùa thu đông này của bé thêm ấm áp
Áo thích hợp làm món quà thu đông
Vải mềm mại, đanh chắc, giữ ấm tốt, ít xù lông
Co giãn thoải mái cho bé tự do vận động
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','SW','Seller2','KIDS',N'2023-12-20'),
('SW34',N'Áo Nỉ Trẻ Em Thêu Trái Tim','860.000',N'Áo nỉ dài tay thu đông dành cho trẻ em
Áo có form dáng suông rộng giúp tạo sự thoải mái cử động cho các bé
Hình thêu trái tim dễ thương, đơn giản nhưng tạo điểm nhấn riêng biệt
Áo có chất liệu nỉ co giãn, ấm áp, thấm hút mồ hôi, bền form
Thành phần sợi vải: 70% Cotton + 30% Polyester
Kết cấu sợi tạo nên mặt vải đanh chắc, không bị bai dão, ít xù
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','SW','Seller2','KIDS',N'2023-12-20'),
('SW35',N'Áo Nỉ Trẻ Em In Tràn Gấu','540.000',N'Áo nỉ trẻ em có thành phần chất liệu: 68% Cotton + 32% Polyester
Chất nỉ mềm mịn, ấm áp, không gây kích ứng làn da của bé
Kiểu dáng dài tay bảo vệ cho cơ thể bé khi trời lạnh, kín nhưng không lo bí
Thiết kế in hình gấu sành điệu, đường may tỉ mỉ, chắc chắn, sắc nét
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','SW','Seller2','KIDS',N'2023-12-20'),
('SW36',N'Áo Nỉ Trẻ Em Phối Tay Asteroid','420.000',N'Chất liệu nỉ da cá
Thành phần: 70% Cotton + 30% Spandex
Áo nỉ dài tay thu đông dành cho trẻ em
Form dáng cơ bản thoải mái cử động cho các bé
Hình in trước ngực tạo điểm nhấn tươi vui, khác biệt
Áo có chất liệu nỉ co giãn, ấm áp, thấm hút mồ hôi, bền form
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','SW','Seller2','KIDS',N'2023-12-20'),
('SW37',N'Áo Nỉ Trẻ Em Thêu Chữ Tomorrow','630.000',N'Thành phần:  60% Polyester + 35% Cotton + 5% Spandex
Ảo nỉ cho bé form rộng thoải mái
Giữ ấm tốt vào mùa đông
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','SW','Seller2','KIDS',N'2023-12-20'),
('SW38',N'Áo Nỉ Trẻ Em Little Camper','630.000',N'Thành phần: 58% Cotton + 39% Polyester + 3% Spandex
Sản xuất tại Việt Nam
','10','SW','Seller2','KIDS',N'2023-12-20'),
('SW39',N'Áo Nỉ Trẻ Em In Chữ Limitless Thể Thao','530.000',N'Thành phần: 87% Polyester + 13% Elastene
Áo thun thể thao trẻ em khỏe khoắn, năng động
Chất liệu nỉ giúp giữ ấm hiệu quả trong mùa thu đông
Hình in chữ ở ngực và tay áo mang lại cảm giác thể thao, năng độn cho bé
Thích hợp mặc đi học, đi chơi và phối đồ cùng áo gió, áo khoác SHOP’S HOUSE
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','SW','Seller2','KIDS',N'2023-12-20'),
('SW40',N'Áo Nỉ Trẻ Em (10 - 14 Tuổi) In School Child','360.000',N'Áo nỉ trẻ em thêu chữ có thành phần: 70% Cotton + 30% Polyester
Kết cấu sợi vải đanh chắc giúp áo có độ bền cao, không bai dão, ít xù trong suốt thời gian sử dụng
Sản phẩm thông thoáng, thấm hút và co giãn tốt tạo cảm giác dễ chịu cho bé khi mặc
Áo thun dài tay giữ ấm hiệu quả, rất thích hợp để mặc khi trời lạnh
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','SW','Seller2','KIDS',N'2023-12-20'),
('SW41',N'Áo Nỉ Trẻ Em In Hình Ếch (10-14 Tuổi)','530.000',N'Chất liệu nỉ
Thành phần: 70% Cotton + 30% Spandex
Bề mặt vải đều đẹp, không xù lông vón cục, co giãn đàn hồi tốt
Giữ nhiệt tốt, thấm hút mồ hôi hiệu quả tạo cảm giác thông thoáng không gây khó chịu cho cơ thể bé 
Sản phẩm thích hợp cho trẻ em từ 10-15 tuổi mặc ở nhà, đi ngủ, đi chơi vào mùa thu đông
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','SW','Seller2','KIDS',N'2023-12-20'),
('SW42',N'Áo Nỉ Trẻ Em In Gấu BE NICE','430.000',N'Thành phần: 60% Polyester + 35% Cotton + 5% Spandex
Áo nỉ thiết kế cho bé độ tuổi từ 2 - 8 tuổi
Vải nỉ mềm mại, giữ ấm tốt cùng màu sắc thanh lịch
Được kết hợp từ 2 lớp, do đó vải ít nhăn nhàu, đứng phom dáng, dễ dàng sử dụng và bảo quản
Áo có phom dáng rộng tạo sự thoải mái cử động cho bé
Chi tiết hình in ở ngực tạo điểm nhấn đáng yêu
Có thể kết hợp cùng quần jeans, quần kaki hoặc quần nỉ.
Sản phẩm thích hợp cho bé mặc ở nhà, đi học và đi chơi vào mùa đông
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','SW','Seller2','KIDS',N'2023-12-20'),
('SW43',N'Áo Nỉ Trẻ Em Gia Đình In Gấu','760.000',N'Chất liệu nỉ 81% Cotton + 19% Polyester
Áo nỉ dài tay đôi cho bé và mẹ có khả năng giữ ấm tốt, co giãn và mềm mại
Phom áo dáng rộng thoải mái cho chuyển động cơ thể bé
Thiết kế hình in chú gấu trẻ trung, cá tính
Chiếc áo có thể để bé mặc cùng quần jeans, quần nỉ hay chân váy
Là chiếc áo gia đình lý tưởng trong mùa thu đông này
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','SW','Seller2','KIDS',N'2023-12-20');
------------####################Sweatshirts###################----------------
------------####################Trousers###################----------------
------Quần nam (Trousers)
insert into Product (productID, productName, productPrice,detail,quantity,categoryID,created_By,type,CreateDate) values
('TR1',N'Quần Jean Nam Slim Cotton Dễ Mặc','730.000',N'Vải chính : 67% Cotton, 32% Polyester, 1% Spandex
Vải lót : 80% polyester, 20%cotton
Chất liệu cotton USA là một trong những loại nguyên liệu cao cấp được cả thế giới tin dùng
Sạch hơn các loại bông khác do quá trình thu hoạch sử dụng thiết bị điều khiển bằng máy tính tân tiến nhất, gần như loại bỏ được hoàn toàn lỗi con người hay dẫn đến việc tạo ra bông rác và bông vụn.
Dễ nhuộm màu do phần lớn bông USA hiện nay được phân hạng là bông trắng, sợi bông dễ nhuộm nhất so với hạng bông đốm hay màu nhạt.
Chiếc quần có khả năng co giãn nhẹ, thoải mái khi di chuyển
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','TR','Seller2','MAN',N'2023-12-20'),
('TR2',N'Quần Jeans Nam Slim Fit Coolmax Mác Kẹp SHOP’S HOUSE Denim','830.000',N'Chất liệu: 76% Cotton + 22% Polyester by Coolmax all season + 2% Lycra
Thiết kế thêu túi Jeang trí, mác kẹp SHOP’S HOUSE DENIM nổi bật
Form slim ôm vừa vặn giúp người mặc trông gọn gàng, khỏe khắn và năng động
Về màu sắc có 2 ánh màu xanh cho khách hàng lựa chọn, rất dễ phối đồ
Quần co giãn đàn hồi tốt, nhẹ và dễ chịu
Kết hợp với áo T-shirt, Polo, Sơ mi....
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','TR','Seller2','MAN',N'2023-12-20'),
('TR3',N'Quần Jean Nam Coolmax Mác Logo Đỉa Quần','380.000',N'Vải chính: 76% Cotton, 22% Polyester, 2% Spandex
Vải lót: 80% Polyester, 20%Cotton
Quần Jeans nam chất liệu cotton USA là một trong những loại nguyên liệu cao cấp được cả thế giới tin dùng với những đặc tính sạch - dễ nhuộm màu
Quần có khả năng đàn hồi và co giãn rất tốt, có độ bền cao
Khả năng thoát hơi ẩm và mao dẫn thoát mồ hôi, độ thoáng khí tốt.
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','TR','Seller2','MAN',N'2023-12-20'),
('TR4',N'Quần Jean Nam S-Cafe Siêu Co Giãn Thoáng Mát','770.000',N'Quần Jeans nam S-Cafe siêu co giãn thoáng mát
Thành phần: 76% Cotton, 22% Polyester by S-cafe, 2% Lycra
Sợi S-cafe: sản xuất từ công nghệ độc quyền có khả năng chống tia UV hiệu quả nhờ khả năng khúc xạ ánh sáng, hạn ché tia UVA và UVB tiếp xúc với cơ thể người mặc
Kiểm soát mùi tốt vì bột café được tích hợp vào sợi café theo công nghệ S.cafe
Co giãn tốt do có chứa thành phần spandex nên thoải mái khi vận động
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TR','Seller2','MAN',N'2023-12-20'),
('TR5',N'Quần Jeans Nam Coolmax Mỏng Nhẹ Mác SHOP’S HOUSE','860.000',N'Quần Jeans nam Cotton Mỹ cho cảm giác mắc mềm nhẹ
Thiết kế mác logo nhận diện thương hiệu SHOP’S HOUSE DENIM 
Chất liệu coolmax all season mềm, co giãn đàn hồi tốt, nhẹ và dễ chịu
Phom regular rộng rãi thoải mái cho người mặc  
Về màu sắc có 2 ánh màu xanh cho khách hàng lựa chọn, rất dễ phối đồ 
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','TR','Seller2','MAN',N'2023-12-20'),
('TR6',N'Quần Jean Nam Slimfit Rayon Dây Dệt Túi Đồng Hồ','540.000',N'Quần Jeans nam dáng slimfit ôm vừa vặn giúp các người mặc trông gọn gàng, khỏe khoắn và năng động
Thành phần: 70% cotton USA + 20% polyester + 8% rayon + 2%spandex
Chất liệu co giãn 4 chiều thoải mái, mềm mịn, dễ chịu
Có thể kết hợp với áo t-shirt, polo, sơ mi mặc được cả mùa đông và mùa hè, đi làm đi chơi, trong nhiều hoàn cảnh sử dụng
Thiết kế basic hiện đại, là sản phẩm mới nhất trong mùa năm nay
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TR','Seller2','MAN',N'2023-12-20'),
('TR7',N'Quần Jeans Nam Ống Suông Lưng Thun','420.000',N'Quần Jean nam thiết kế form dáng thoải mái, độ suông vừa phải
Chất liệu: 98% Cotton USA, 2% Spandex
Sản phẩm có khả năng thấm hút mồ hôi, độ này phù hợp cho cảm giác thoáng mát
Kết cấu cạp chun vòng bụng linh hoạt, có dây rút buộc chắc chắn
Sản phẩm dễ dàng chăm sóc, có thể giặt máy
Lưu ý: Không ngâm sản phẩm quá lâu, không giặt cùng với các sản phẩm sáng màu
Lộn trái sản phẩm khi phơi, không phơi trực tiếp dưới ánh nắng mặt trời.
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TR','Seller2','MAN',N'2023-12-20'),
('TR8',N'Quần Jeans Nam Slim Cotton Usa 71','630.000',N'Quần Jean nam kiểu dáng slim tôn dáng khỏe khoắn
Chất liệu: 89% Cotton USA + 10% Polyester + 1% Spandex
Chất liệu mang đến cảm giác thoải mái, an toàn cho người sử dụng và thân thiện với môi trường
Sản phẩm co giãn nhẹ, dễ dàng vận động
Màu sắc đa dạng, dễ phối đồ
Thiết kế có hình thêu Jeang trí phần túi sau độc đáo
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TR','Seller2','MAN',N'2023-12-20'),
('TR9',N'Quần Jeans Nam Slimfit Coolmax All Season','630.000',N'Chất liệu Jean Coolmax
Thành phần: 76% Cotton USA + 22% Coolmax all season + 2% Lycra
Vải thoáng mát, truyền dẫn ẩm tốt, bề mặt sợi có rãnh làm tăng khả năng truyền dẫn khí và ẩm.
Khả năng thấm hút mồ hôi tốt, hút ẩm nhanh tạo sự thoải mái cho cơ thể khi sử dụng.
Đàn hồi co giãn tốt, ít nhàu, tiện dụng khi vận động và sử dụng trong mọi hoàn cảnh.
Phù hợp với thời tiết quanh năm
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TR','Seller2','MAN',N'2023-12-20'),
('TR10',N'Quần Jeans Nam Slim Fit Thêu Túi','530.000',N'Quần Jeans nam dáng slimfit trẻ trung, hiện đại và đầy cá tính
Chất vải Denim được SHOP’S HOUSE tuyển chọn mang đến sự thoải mái cho người mặc, độ co giãn vừa đủ, thuận tiện khi di chuyển
Thành phần: 99% cotton + 1% spandex
Form dáng slim fit ôm vừa vặn giúp tôn lên đôi chân săn chắc của phái mạnh 
Thiết kế ống rộng ở đùi và thuôn dần xuống mắt cá chân để tạo cảm giác thoải mái cho người mặc
Mặc dùng giày thể thao, áo thun/ polo hoặc sơ mi phá cách sẽ vô cùng ấn tượng
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TR','Seller2','MAN',N'2023-12-20'),
('TR11',N'Quần Jeans Nam Ống Đứng Slimfit Basic','360.000',N'Chất liệu: 89% Cotton USA + 10% Polyester + 1% Spandex
Chất liệu cotton Mỹ bền sạch hơn các loại chất liệu cotton khác
Dễ nhuộm màu đem lại cho sản phẩm màu sắc tươi sáng và đa dạng
Co giãn 4 chiều mang lại cảm giác thoải mái cho người mặc
Kiểu dáng slimfit ôm dáng vừa vặn
SHOP’S HOUSE - Look good. Feel good
Sản xuất tại Việt Nam
','10','TR','Seller2','MAN',N'2023-12-20'),
('TR12',N'Quần Jeans Nam Slim S-Cafe Mác Da SHOP’S HOUSE Denim','430.000',N'Thành phần: 76% Cotton USA, 22% Polyester S-café, 2% Spandex
Chất liệu khử mùi, chống tia UV, bền và thấm hút tốt
Thiết kế basic với điểm nhấn mác da SHOP’S HOUSE DENIM
Form dáng slim fit, cạp quần nằm dưới eo, dáng quần ôm từ hông đến mắc cá chân 1 cách vừa vặn
Quần có 2 ánh màu xanh cho khách hàng lựa chọn, rất dễ phối đồ
Có thể kết hợp với áo t-shirt, polo, sơ mi,...
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','TR','Seller2','MAN',N'2023-12-20'),
('TR13',N'Quần Jeans Nam Slim Denim Like Cơ Bản','760.000',N'Thành phần: 98% Cotton, 2% Spandex
Vải dày dặn chắc chắn, bền đẹp
Không bai màu hay co rút trong quá trình sử dụng
Phom dáng slimfit ôm dáng vừa vặn, thiết kế năng động
Phối được cùng nhiều Jeang phục: áo polo, áo thun, sơ mi
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TR','Seller2','MAN',N'2023-12-20');
------Quần nữ (Trousers) 
insert into Product (productID, productName, productPrice,detail,quantity,categoryID,created_By,type,CreateDate) values
('TR14',N'Quần Jean Nữ Dáng Baggy Cotton USA','730.000',N'Quần Jeans nữ chất liệu Denim Cotton USA mang đến cảm giác dễ chịu khi mặc
Được làm từ sợi bông tiêu chuẩn tốt nhất thế giới
Vải bền đẹp, chắc chắn, không phai màu, không co rút khi giặt
Kiểu dáng baggy chiết ly ống thoải mái và tôn dáng
Che được khuyết điểm đùi to, chân thô
Có thể kết hợp với nhiều Jeang phục khác nhau tạo sự trẻ trung, năng động
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TR','Seller2','WOMEN',N'2023-12-20'),
('TR15',N'Quần Jean Nữ Ống Suông Xanh Nhạt','830.000',N'Quần Jeans nữ làm từ vải denim dệt thoi 
Thành phần: 100% Cotton USA
Chất vải mềm, độ dày dặn vừa phải không gây cảm giác nóng bức, khó chịu
Co giãn đàn hồi thoải mái trong mọi hoạt động
Thiết kế trẻ trung, cá tính
Có thể kết hợp với nhiều loại Jeang phục như: áo thun, sơ mi, áo hai dây
Mặc được trong nhiều hoàn cảnh
SHOP’S HOUSE - Look good. Feel good.
 Sản xuất tại Việt Nam
','10','TR','Seller2','WOMEN',N'2023-12-20'),
('TR16',N'Quần Jean Nữ Dáng Skinny Co Giãn Thoải Mái','380.000',N'Quần Jeans nữ dáng skinny ôm sát cơ thể
Dáng quần tôn trọn vòng 3 và đôi chân của bạn
Chất liệu co giãn 4 chiều thoải mái, mềm mịn, dễ chịu 
Có thể kết hợp với áo t-shirt, polo, sơ mi, tank top ..... mặc được cả mùa đông và mùa hè, đi làm đi chơi, ......trong nhiều hoạt cảnh sử dụng
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TR','Seller2','WOMEN',N'2023-12-20'),
('TR17',N'Quần Jean Nữ Dáng Baggy Thanh Lịch Tôn Dáng','530.000',N'Chất liệu: Vải Denim thành phần 98% cotton, 2% spandex
Quần Jean SHOP’S HOUSE có độ bền rất cao giúp bạn yên tâm sử dụng trong thời gian dài mà không lo bị nhăn, mòn rách
Khả năng thấm hút mồ hôi tốt giúp điều hòa nhiệt độ cơ thể, thoáng mát, phù hợp với nhiều điều kiện thời tiết
Chất liệu vải Jean dày đẹp, có độ cứng cáp, giúp tôn dáng người mặc
 SHOP’S HOUSE - Look good. Feel good.
','10','TR','Seller2','WOMEN',N'2023-12-20'),
('TR18',N'Quần Jeans Nữ Dáng Skinny Trơn','770.000',N'Chất liệu: Denim 99% cotton và 1% spandex
Sản phẩm giữ form đẹp, co giãn nhẹ tạo cảm giác thoải mái khi mặc
Độ bền rất cao giúp bạn yên tâm sử dụng trong thời gian dài
Không lo bị nhăn, mòn rách do đặc tính vải bông thô
Chất liệu vải dày đẹp, có độ cứng cáp, giúp tôn dáng người mặc
Khả năng thấm hút mồ hôi rất tốt, điều hòa nhiệt độ cơ thể, phù hợp với nhiều điều kiện thời tiết
SHOP’S HOUSE - Look good. Feel good.
','10','TR','Seller2','WOMEN',N'2023-12-20'),
('TR19',N'Quần Jeans Nữ Dáng Suông Cạp Chéo','860.000',N'Chất liệu: 100% Cotton USA
Quần Jean kiểu dáng suông cạp chéo tôn dáng khỏe khoắn
Chất liệu mang đến cảm giác thoải mái, an toàn cho người sử dụng và thân thiện với môi trường
Sản phẩm co giãn nhẹ, dễ dàng vận động
Màu sắc đa dạng, dễ phối đồ
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TR','Seller2','WOMEN',N'2023-12-20'),
('TR20',N'Quần Jeans Nữ Cafe Dáng Suông','540.000',N'Vải chính: Denim Cafe (76% Cotton, 22% Polyester, 2% Spandex)
Vải lót: Lót túi hàng Jeans Protrade (80% Polyester, 20% Cotton)
Chất liệu co giãn nhẹ, thoáng mát và dễ chịu cho làn da
Tính năng khử mùi, chống tia UV
Quần ống suông với hiệu ứng thời Jeang và ria mèo bắt mắt, trẻ trung
Form ống suông giúp hack dáng tạo cảm giác đôi chân dài, đồng thời đem lại sự thoải mái ở phần hông và đùi cho phái nữ
Sản phẩm có thể kết hợp với áo phông, áo crop top, áo hai dây, áo polo hoặc sơ mi
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','TR','Seller2','WOMEN',N'2023-12-20'),
('TR21',N'Quần Jeans Nữ Dáng Suông Túi Vuông','420.000',N'Chất liệu Denim
Thành phần 99% Cotton + 1% Spandex
Vải mềm, có sự đàn hồi tạo cảm giác thoải mái cho người mặc
Dáng suông với điểm nhấn túi ốp vuông ở phía trước
Sử dụng ở nhiều hoàn cảnh khác nhau: đi cà phê với bạn bè, đi làm, đi học, đi du lịch,.....
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','TR','Seller2','WOMEN',N'2023-12-20'),
('TR22',N'Quần Jeans Nữ Dáng Baggy Năng Động Cá Tính','630.000',N'Chất liệu Jeans co giãn 4 chiều thoải mãi, dễ dàng vận động
Thành phần: 100% Cotton USA
Dáng quần thoải mái ở phần mông, đùi ống nhỏ dần giúp che đi khuyết điểm bắp chân to
Có thể kết hợp với nhiều loại Jeang phục như: áo t-shirt, polo, sơ mi, tank-top...
Chiếc quần mặc được cả cả đông lẫn hè, đa dạng hoàn cảnh sử dụng từ đi làm đến đi chơi, dã ngoại
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TR','Seller2','WOMEN',N'2023-12-20'),
('TR23',N'Quần Jeans Nữ Skinny Lưng Cao Hack Dáng','630.000',N'Quần Jeans nữ dáng skinny ôm sát cơ thể tôn trọn vòng 3 và đôi chân cực đẹp
Thành phần: 90% Cotton USA + 8% Polyester + 2% Lycra
Chất liệu co giãn 4 chiều thoải mái, mềm mịn, dễ chịu
Thích hợp phối với áo T-shirt, Polo, Sơ mi hay Tank-top để mặc được cả mùa đông và mùa hè
Sản phẩm có thể sử dụng được trong nhiều hoàn cảnh đi làm, đi chơi
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TR','Seller2','WOMEN',N'2023-12-20'),
('TR24',N'Quần Jeans Nữ Skinny Túi Vuông Co Giãn 4 Chiều','530.000',N'Quần Jeans nữ dáng skinny ôm sát cơ thể tôn trọn vòng 3 và đôi chân
Chất liệu co giãn 4 chiều tạo cảm giác thoải mái, mềm mịn và dễ chịu khi mặc
Thành phần:  90% cotton USA + 8% polyester + 2% lycra
Chiếc quần có thể kết hợp với áo T-shirt, Polo, Sơ mi, Tank-top... để chị em mặc cả mùa đông và mùa hè
Sản phẩm dùng được trong nhiều hoàn cảnh như đi làm, đi chơi,...
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TR','Seller2','WOMEN',N'2023-12-20'),
('TR25',N'Quần Jeans Nữ Ống Đứng Cao Cạp 2 Cúc','360.000',N'Thành phần:  98.5% Cotton USA + 1.5% Spandex
Quần Jean ống đứng, chất liệu Jean co giãn
Vải mềm, có sự đàn hồi tạo cảm giác thoải mái cho người mặc
Quần rất tôn dáng, giúp che đi khuyết điểm chân cong
Thiết kế basic, màu sắc trẻ trung, dễ phối đồ
kết hợp với áo T-shirt, Polo, Sơ mi... mặc quanh năm, đi làm, đi chơi.
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TR','Seller2','WOMEN',N'2023-12-20'),
('TR26',N'Quần Jeans Nữ Dáng Baggy Gân Giữa','530.000',N'Chất liệu: Vải Denim
Thành phần: 98.5% Cotton USA + 1.5% Spandex
Chất liệu co giãn 4 chiều thoải mái , dễ dàng vận động
Sợi vải liên kết bền chắc, giữ màu, thấm hút mồ hôi
Kiểu dáng baggy giúp che đi khuyết điểm
Dễ dàng kết hợp với áo t-shirt, polo, sơ mi... mặc quanh năm trong nhiều hoàn cảnh khác nhau
 SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TR','Seller2','WOMEN',N'2023-12-20'),
('TR27',N'Quần Jeans Nữ Skinny Co Giãn 4 Chiều','430.000',N'Thành phần: 98.5% Cotton USA + 1.5% Spandex
Quần Jean nữ vải demin chắc chắn và bền form
Chị em có thể tự tin, thoải mái diện chiếc quần này trong mọi hoạt động cho cơ thể với chất liệu co giãn 4 chiều
Vải mềm, độ dày dặn vừa phải không gây cảm giác nóng bức, khó chịu cho người mặc
Đây là thiết kế tôn dáng, với phần lên màu vô cùng trẻ trung, cá tính
Có thể mặc quanh năm, là món đồ cân vô cùng nhiều outfit cho các chị em
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TR','Seller2','WOMEN',N'2023-12-20'),
('TR28',N'Quần Jeans Nữ Dáng Suông Ống Đứng Xắn Gấu','760.000',N'Thành phần: 98.5% Cotton USA + 1.5% Spandex
Quần Jeans nữ dáng suông đứng có chi tiết xắn gấu trẻ trung
Dáng quần vừa vặn giúp tôn đôi chân dài hơn và che đi khuyết điểm nếu bắp chân to
Chất liệu co giãn 4 chiều thoải mãi, dễ dàng vận động
Chiếc quần có thể kết hợp với áo T-shirt, Polo, Sơ mi, Tank-top... mặc được cả mùa đông và mùa hè
Sản phẩm sử dụng được trong nhiều hoàn cảnh đi làm, đi chơi
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TR','Seller2','WOMEN',N'2023-12-20');
------Quần trẻ em (Trousers) 
insert into Product (productID, productName, productPrice,detail,quantity,categoryID,created_By,type,CreateDate) values
('TR29',N'Quần Jeans Trẻ Em Cạp Chun Mài Ống','730.000',N'Chất liệu Jeans cotton USA
Thành phần:  70% Cotton USA + 20% Polyester + 8% Rayon + 2% Spandex
Mềm mại, co giãn 4 chiều, độ đàn hồi tốt
Kiểu dáng jogger chun cạp, ống đứng vừa vặn
Cạp chun thoải mái, năng động và trẻ trung
Bé thoải mái mặc khi đi học, đi chơi....
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TR','Seller2','KIDS',N'2023-12-20'),
('TR30',N'Quần Jeans Trẻ Em Can Gối Ly Thân','830.000',N'Quần Jean cho bé dáng cơ bản
Thành phần:  99% Cotton + 1% Spandex
Cạp chun thoải mái, can gối cá tính
Chất liệu Jean mềm thân thiện với làn da bé
Quần vừa vặn đem lại sự thoải mái cho bé khi mặc
Đường may chắc chắn
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','TR','Seller2','KIDS',N'2023-12-20'),
('TR31',N'Quần Jeans Kid Cạp Chun Cơ Bản','380.000',N'Thành phần: 90% Cotton, 8% Polyester, 2% Spandex
Được làm từ chất liệu cotton USA là một trong những loại nguyên liệu cao cấp được cả thế giới tin dùng
Vải co giãn tốt, có độ bền cao, mềm mại, thông thoáng và thấm hút tốt
Thiết kế cạp chun thoải mái, form dáng dễ mặc phù hợp nhiều độ tuổi của bé
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','TR','Seller2','KIDS',N'2023-12-20'),
('TR32',N'Quần Jeans Trẻ Em Vải Cotton Co Giãn Tốt','530.000',N'Chất liệu Jean cotton, thành phần:  98.5% Cotton USA + 1.5% Spandex
Quần Jeans kid phom slim, chất liệu nhẹ, co dãn tốt.
Phom dáng dễ mặc, phù hợp nhiều độ tuổi
Chất liệu nhẹ, mềm mại, co dãn tốt
SHOP’S HOUSE - Look good. Feel good
Sản xuất tại Việt Nam
','10','TR','Seller2','KIDS',N'2023-12-20'),
('TR33',N'Quần Jeans Trẻ Em Ống Suông Cạp Chun','630.000',N'Thành phần:  98.5% Cotton USA + 1.5% Spandex
Vải mang đến sự mềm mại, thoải mái và thoáng khí cho bé
Sợi spandex giúp mang đến sự co giãn tối đa, tạo sự tiện lợi cho mọi hoạt động hằng ngày
Nên ngâm phèn chua 1h hoặc để tủ đá 1 đêm trước khi giặt lần đầu để tránh phai màu nhiều
Kiểu dáng suông phù hợp với nhiều vóc dáng các bé từ 8-15 tuổi
SHOP’S HOUSE - Look good. Feel good.
','10','TR','Seller2','KIDS',N'2023-12-20');
------------####################Trousers###################----------------
------------####################Kitwears###################----------------
------Đồ bộ nam (Kitwears)
insert into Product (productID, productName, productPrice,detail,quantity,categoryID,created_By,type,CreateDate) values
('KI1',N'Bộ Đồ Nam Sportman','730.000',N'Bộ đồ nam thể thao thiết kế trẻ trung năng động
Thành phần: 100% Cotton
Chất liệu áo mềm mại thấm hút tốt, nhẹ thoáng mát vô cùng
Áo thun in chữ Sportnam khỏe khoắn năng động
Quần short gió thoải mái vận động, di chuyển
Phù hợp với khách hàng nam mặc nhà đi chơi thể thao hay cafe cùng gia đình bạn bè
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','KI','Seller1','MAN',N'2023-12-20'),
('KI2',N'Bộ Đồ Nam Họa Tiết','380.000',N'Đồ bộ nam với chất liệu áo 84% Nylon + 16% Spandex và quần 100% Polyester 
Vải áo mềm mịn, thoáng mát dễ chịu và có khả năng thấm hút tốt
Khả năng co giãn từ loại sợi Polyester đặc biệt có dạng xoắn nhẹ giúp quần có sự đàn hồi tự nhiên bền vững, không bai gião sau nhiều lần giặt và sử dụng
Độ bền màu cao, rất dễ chăm sóc, có thể giặt máy
Thiết kế trẻ trung, năng động với phần in hoạ tiết làm điểm nhấn
Bộ đồ có thể mặc trong nhiều hoàn cảnh như: ở nhà, đi chơi, cafe, dạo phố
SHOP’S HOUSE - Look good. Feel good.
','10','KI','Seller1','MAN',N'2023-12-20'),
('KI3',N'Bộ Đồ Nam Ba Lỗ','380.000',N'Bộ đồ ba lỗ dành cho nam thoáng mát và thoải mái
Chất liệu của Áo: 84% Nylon + 16% Spandex và Quần: 74% Nylon + 26% Spandex
Set đồ co giãn và có độ bền cao theo chuyển động cơ thể
Thiết kế kiểu tank-top khoẻ khoắn và năng động
Bộ đồ đa năng có thể mặc mọi lúc, mọi nơi từ ở nhà hay ra ngoài
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','KI','Seller1','MAN',N'2023-12-20'),
('KI4',N'Bộ Đồ Nam Running Siêu Thoáng Mát','530.000',N'Bộ đồ nam gồm Áo & quần shorts gió.
Áo có phom dáng suông giúp tạo sự thoải mái cử động cho cơ thể
Chi tiết in ở ngực & lưng áo tạo điểm nhấn.
Vải thể thao co giãn 4 chiều, thấm hút mồ hôi, thoáng mát
Màu sắc thanh lịch kết hợp cùng quần shorts gió
Quần shorts dáng suông cơ bản cùng túi ở sườn tiện lợi.
Thích hợp mặc đi chơi & đi tập vào mùa xuân và mùa hè.
SHOP’S HOUSE - Look good. Feel good.
','10','KI','Seller1','MAN',N'2023-12-20'),
('KI5',N'Bộ Đồ Thể Thao Nam Áo Hoodie','260.000',N'Cho mùa đông ấm áp và phong cách thời trang
Bộ đồ nam bao gồm áo hoodie dài tay và quần jogger dáng suông rộng giúp tạo sự cử động thoải mái cho người mặc. 
Thành phần:  91% Polyester + 9% Spandex
Thiết kế  mác nhận diện ở ngực tạo điểm nhất trẻ trung. 
Bộ đồ có chất liệu nỉ co giãn, giữ ấm tốt
Bề mặt vải mịn cùng màu sắc thanh lịch có thể mặc ở nhà, đi làm và đi chơi vào mùa đông. 
Khỏe khoắn, ấm áp, năng động, trẻ trung, nam tính
SHOP’S HOUSE - Look good. Feel good.
','10','KI','Seller1','MAN',N'2023-12-20'),
('KI6',N'Bộ Đồ Thể Thao Nam In Sọc','770.000',N'Bộ thể thao nam được dệt từ sợi Polyester dài & mảnh, kết hợp cùng kiểu dệt Double Face cho nền vải chắc chắn nhưng vẫn có độ xốp, nhẹ nhàng
Vải có độ bền cao, ít nhăn nhàu, co giãn phù hợp với chuyển động của cơ thể
Hỗ trợ giữ ấm, thông thoáng không lo bí bách cho da
Bộ nỉ thể thao nam cơ bản dễ mặc dễ vừa người, phù hợp với tất cả đối tượng
Thiết kế phong cách basic với điểm nhấn tinh tế là hình in phản quang ngực áo và hai bên sườn quần
Bộ đồ phù hợp để chàng mặc ở nhà, đi chơi thể thao hay cafe cùng gia đình bạn bè
SHOP’S HOUSE - Look good. Feel good.
','10','KI','Seller1','MAN',N'2023-12-20'),
('KI7',N'Bộ Đồ Nam In Họa Tiết','860.000',N'Bộ đồ nam thể thao thiết kế mới, khoẻ khoắn, năng động và đa năng!
Chất liệu áo: 84% Nylon + 16% Spandex
Áo thun thể thao mềm mịn, thông thoáng, thấm hút tốt đồng thời co giãn và có độ bền cao
Quần short thể thao được dệt từ những sợi mảnh dài giúp vải mềm mại, dễ chịu
Cấu trúc dệt cơ bản đặc trưng bởi các đường chéo tạo cho vải có độ bền chắc chắn hơn, hỗ trợ hạn chế nhăn nhúm
Vải có trọng lượng nhẹ, đứng form, đàn hồi tự nhiên bền vững, không bai dão sau nhiều lần giặt và sử dụng
Bộ đồ nam SHOP’S HOUSE có khả năng nhanh khô vì được dệt từ loại sợi siêu mảnh, thấm hút tốt vượt trội so với các loại vải thông thường
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','KI','Seller1','MAN',N'2023-12-20'),
('KI8',N'Bộ Đồ Thể Thao Nam Phối Họa Tiết Kẻ','540.000',N'Bộ đồ nam thể thao thiết kế mới, khoẻ khoắn, năng động và đa năng!
Chất liệu áo: 84% Nylon + 16% Spandex
Áo thun thể thao mềm mịn, thông thoáng, thấm hút tốt đồng thời co giãn và có độ bền cao
Quần short thể thao được dệt từ những sợi mảnh dài giúp vải mềm mại, dễ chịu
Cấu trúc dệt cơ bản đặc trưng bởi các đường chéo tạo cho vải có độ bền chắc chắn hơn, hỗ trợ hạn chế nhăn nhúm
Vải có trọng lượng nhẹ, đứng form, đàn hồi tự nhiên bền vững, không bai dão sau nhiều lần giặt và sử dụng
Bộ đồ nam SHOP’S HOUSE có khả năng nhanh khô vì được dệt từ loại sợi siêu mảnh, thấm hút tốt vượt trội so với các loại vải thông thường
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','KI','Seller1','MAN',N'2023-12-20'),
('KI9',N'Bộ Đồ Thể Thao Nam Gió Phối Sọc','420.000',N'Chất liệu: 90% Nylon, 10% Spandex
Thành phần chính là sợi Nylon mang lại cảm giác mềm mại, bền chắc cho sản phẩm
Vải co giãn bốn chiều nhờ sợi spandex giúp dễ dàng vận động khi mặc
Cản gió, cản bụi, giữ ấm tốt nhờ kiểu dệt thoi hai hệ sợi vuông góc với nhau
Thiết kế bộ đồ thể thao nam phối sọc khoẻ khoắn và năng động
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','KI','Seller1','MAN',N'2023-12-20'),
('KI10',N'Bộ Đồ Thể Thao Nam In Super Sport','630.000',N'Thành phần: 87% Polyester, 8% Rayon, 5% Spandex
Bộ đồ nam mềm mại khi chạm nhờ cấu trúc dệt 2 mặt giống nhau 
Xốp nhẹ và giữ ấm hiệu quả
Sản phẩm giữ form tốt, không lo bai dão với 4 hệ sợi liên kết chặt ché giúp về mặt ổn định kết cấu, không biến dạng trong quá trình sử dụng
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','KI','Seller1','MAN',N'2023-12-20'),
('KI11',N'Bộ Đồ Thể Thao Nam Nỉ Có Mũ In Logo','630.000',N'Vải chính: 91% Polyester, 9% Elastane
Lót túi: 100% Polyester
Sản phẩm được dệt từ sợi Polyester dài & mảnh, kết hợp cùng kiểu dệt Double Face cho nền vải chắc chắn nhưng vẫn có độ xốp, nhẹ nhàng.
Với sự kết hợp hoàn hảo của Polyester và Spandex, giúp sản phẩm có độ bền cao, ít nhăn nhàu
Bộ đồ co giãn, phù hợp với chuyển động của cơ thể
Hỗ trợ giữ ấm cơ thể, thông thoáng
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','KI','Seller1','MAN',N'2023-12-20');

------Đồ bộ nữ (Kitwears)
insert into Product (productID, productName, productPrice,detail,quantity,categoryID,created_By,type,CreateDate) values
('KI12',N'Bộ Đồ Yoguu In Choose Happy','530.000',N'Thành phần :  58% Cotton + 39% Polyester + 3% Spandex
Vải da cá mỏng,mềm mại, thấm hút tốt, thoáng, thoải mái cho da.
Kiểu dáng rộng rãi, trẻ trung với điểm nhấn hình in chữ trendy
Có thể mặc ở nhiều hoàn cảnh khác nhau: đi chơi, đi bộ hoặc ở nhà
Kết hợp với áo giữ nhiệt, áo khoác tùy vào điều kiện thời tiết
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','KI','Seller1','WOMEN',N'2023-12-20'),
('KI13',N'Bộ Đồ Nữ Thể Thao In Hình','360.000',N'Bộ đồ nữ thể thao mềm mát, tôn dáng
Thành phần:  100% Cotton
Kiểu dáng cộc tay dành cho mùa hè, ôm dáng gọn gàng năng động
Thích hợp để mặc hằng ngày, ở nhà, đi thể thao, đi chơi
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','KI','Seller1','WOMEN',N'2023-12-20'),
('KI14',N'Bộ Đồ Nữ Beautyfull Phối Quần','530.000',N'Thành phần: 70% Cotton + 30% Polyester
Vải nỉ ấm áp, khả năng thấm hút tốt
Co giãn nhẹ, thoải mái cho hoạt động thường ngày
Kiểu dáng suông rộng rãi, thoải mái.
Thiết kế đơn giản nhưng năng động và trẻ trung với điểm nhấn mác cao su phía trước
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','KI','Seller1','WOMEN',N'2023-12-20'),
('KI15',N'Đồ Bộ Nữ Phối Tay Thêu Gấu','430.000',N'Thành phần:  95% Cotton + 5% Spandex
Vải Cotton mềm mại, thấm hút tốt, tạo cảm giác nhẹ nhàng dễ chịu trên da.
Thiết kế áo ngắn tay kết hợp quần đùi vải thoải mái vận động tại nhà.
Màu sắc, kiểu dáng trẻ trung, họa tiết đơn giản, nổi bật.
Thiết kế bộ đồ nữ có thể mặc ở nhà, mặc đi chơi, đi chợ, tập thể thao.
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','KI','Seller1','WOMEN',N'2023-12-20'),
('KI16',N'Bộ Đồ Nữ Thể Thao Phối Màu','760.000',N'Bộ đồ thun thể thao thoáng mát, hiện đại dành cho mọi cô nàng
Thành phần: 100% Cotton
Chất cotton mềm, thông thoáng, thấm hút tốt
Hạn chế xù lông, vón cục với độ bền cao
Thiết kế in chữ nổi bật, khoẻ khoắn, phối màu trẻ trung, dễ mặc
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','KI','Seller1','WOMEN',N'2023-12-20'),
('KI17',N'Bộ Đồ Nữ Thể Thao Siêu Nhẹ','730.000',N'Bộ đồ thể thao nữ gồm: 1 áo thun thể thao, 1 quần short có túi & dây rút trong
Chất liệu áo siêu nhẹ gồm 88% Polyester + 12% Spandex
Cảm giác mặc mềm mại, mịn màng
Công nghệ dệt Jacquard hiện đại
Áo có khả năng thấm hút tốt, khô nhanh, co giãn đàn hồi thoải mái
Hình in khỏe khoắn cùng chiếc quần shorts phối màu trẻ trung năng động là sự lựa chọn hoàn hảo để mặc nhà hay tham gia thể thao cho các bạn nữ trong những ngày hè nóng bức
Chất liệu mực in cao su mềm mại nhưng vô cùng sắc nét không gây khó chịu cho người mặc
Giặt máy thoải mái không lo bong tróc hình in
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','KI','Seller1','WOMEN',N'2023-12-20'),
('KI18',N'Bộ Đồ Nữ Thể Thao In Chữ','380.000',N'Bộ đồ thể thao in chữ SPORT năng động, khoẻ khoắn
Chất liệu Cotton mềm mại, hạn chế tối đa xù lông vón cục
Thành phần: 100% Cotton
Bộ đồ thông thoáng tạo cảm giác thoải mái cho người sử dụng
Co giãn nhẹ và có độ bền cao
Bộ đồ là 1 sản phẩm thông dụng và không thể thiếu cho các chị em trong những ngày hè
Form dáng thoải mái, áo thun dáng rộng in chữ phong cách thể thao khoẻ khoắn kết hợp cùng chiếc quần shorts phối màu trẻ trung năng động
Đây là sự lựa chọn hoàn hảo để mặc nhà cho các bạn nữ trong những ngày hè nóng bức
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','KI','Seller1','WOMEN',N'2023-12-20'),
('KI19',N'Bộ Đồ Thể Thao Nữ Gió Phối Lẻ','380.000',N'Thành phần Vải chính: 90% Nylon, 10% Spandex
Thành phần Vải lót: 100% Polyester
Bộ đồ mang lại cảm giác mềm mại, bền chắc cho người mặc
Vải co giãn bốn chiều nhờ sợi spandex, giúp dễ dàng vận động khi mặc
Cản gió, cản bụi, giữ ấm tốt nhờ kiểu dệt thoi hai hệ sợi vuông góc với nhau
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','KI','Seller1','WOMEN',N'2023-12-20'),
('KI20',N'Đồ Bộ Nữ Dáng Rộng In Gấu Caro Cotton Usa','530.000',N'Bộ đồ nữ cộc tay, chất liệu  100% Cotton mềm mướt, thoáng mát
Vải hạn chế hiện tượng xù lông, vón cục sau nhiều lần sử dụng
Bộ sooc nữ dáng suông rộng, trẻ trung và năng động
Áo hình in chú gấu cá tính trước ngực và quần phối in tràn 
Có thể mặc đi chơi, ở nhà mang đến cảm giác thoải mái, dễ chịu
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','KI','Seller1','WOMEN',N'2023-12-20'),
('KI21',N'Đồ Bộ Nữ Cotton USA Dáng Rộng In Youth','260.000',N'Bộ đồ short nữ basic, dáng suông thoải mái
Chất liệu: 100% Cotton
Form dáng trẻ trung năng động với phần thêu đắp vải phối trước ngực
Bộ đồ phù hợp với khách hàng nữ 20-35 tuổi đều có thể mặc đi chơi hoặc ở nhà
','10','KI','Seller1','WOMEN',N'2023-12-20'),
('KI22',N'Bộ Đồ Thể Thao Nữ Mùa Hè Quần Dài','770.000',N'Chất liệu Áo: 87% Recycle Polyester + 13% spandex và Quần: 100% Micro Polyester
Thoải mái vận động với áo có thể co giãn
Thấm hút mồ hôi tốt, thoáng khí
Hạn chế nhăn nhàu, giữ form tốt
Sợi vải tái chế thân thiện với môi trường
Quần co giãn từ loại sợi Polyester đặc biệt có dạng xoắn nhẹ giúp đàn hồi tự nhiên bền vững.
Độ bền màu cao, rất dễ chăm sóc, có thể giặt máy
Nhanh khô vì được dệt từ loại sợi siêu mảnh, thấm hút tốt vượt trội
SHOP’S HOUSE - Look good. Feel good.
','10','KI','Seller1','WOMEN',N'2023-12-20'),
('KI23',N'Bộ Đồ Thể Thao Nữ Double Face Có Mũ','860.000',N'Thành phần: 91% Polyester, 9% Elastane
Sản phẩm được dệt từ sợi Polyester dài & mảnh, kết hợp cùng kiểu dệt Double Face cho nền vải chắc chắn nhưng vẫn có độ xốp, nhẹ nhàng.
Với sự kết hợp hoàn hảo của Polyester và Spandex, bộ đồ có độ bền cao, ít nhăn nhàu
Co giãn, phù hợp với chuyển động của cơ thể
Hỗ trợ giữ ấm cơ thể, thông thoáng
Thiết kế thể thao trẻ trung, năng động
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','KI','Seller1','WOMEN',N'2023-12-20');
------Đồ bộ trẻ em (Kitwears)
insert into Product (productID, productName, productPrice,detail,quantity,categoryID,created_By,type,CreateDate) values
('KI24',N'Bộ Đồ Thu Đông Kid Cổ Bo Tim','540.000',N'Thành phần: 58% Cotton + 39% Polyester + 3% Spandex
Một thiết kế bộ đồ ấm áp dành cho các bạn nhỏ
Sản phẩm được làm từ chất liệu da cá co giãn mềm mại, giữ ấm tốt và lành tính cho da trẻ em
Thiết basic, bo gấu tạo độ khoẻ khoắn đồng thời tăng khả năng giữ ấm của bộ đồ
Bảng màu đa dạng cho bé và gia đình lựa chọn
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','KI','Seller1','KIDS',N'2023-12-20'),
('KI25',N'Đồ Bộ Kid Lớn In Số 25','420.000',N'Bộ đồ trẻ em dành cho trẻ từ 10 - 14 tuổi
Chất liệu: 100% Cotton
Vải làm từ bột ngô nên rất lành tính với da bé và thân thiện môi trường
Đặc tính co giãn nổi trội cùng khả năng hút ẩm và thoát mồ hôi nhanh giúp mang lại sự thoải mái cho bé khi mặc 
Điểm nhấn là hình in ở ngực được nhắc lại ở quần, và chi tiết phối bo thể thao khiến cho sản phẩm khỏe hơn
Sản phẩm có thể mặc ở nhà hay đi chơi đều được
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','KI','Seller1','KIDS',N'2023-12-20'),
('KI26',N'Bộ Đồ Trẻ Em In Số 3','630.000',N'Bộ đồ hè siêu thoải mái dành cho các bé trai
Chất liệu: 84% Nylon + 16% Spandex
Sản phẩm gồm 1 áo thun ba lỗ thiết kế năng động in số 3 cùng 1 quần short thoải mái, co giãn vừa đủ
Mềm mịn, thông thoáng, thấm hút mồ hôi tốt cho trẻ thoải mái vận động
Bộ đồ co giãn tốt, giữ form, có độ bền cao
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','KI','Seller1','KIDS',N'2023-12-20'),
('KI27',N'Đồ Bộ Kid Nam In Họa Tiết','630.000',N'Bộ đồ trẻ em chất liệu 100% cotton cực thoáng mát, mềm mại
Thành phần: 100% Cotton
Thiết kế cộc tay rất thích hợp với thời tiết mùa hè oi bức
Mang đến cảm giác thoải mái cho bé vận động cả ngày dài
Hình in hoạ tiết ngộ nghĩnh, đáng yêu
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','KI','Seller1','KIDS',N'2023-12-20'),
('KI28',N'Đồ Bộ Kid Thêu Gấu Cổ Polo','530.000',N'Bộ đồ trẻ em cổ polo, thêu mặt gấu đáng yêu
Thành phần:  80% Cotton + 20% I-scra Softcool
Bộ cộc tay mát mẻ, năng động để bé thoải mái vận động, vui chơi
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','KI','Seller1','KIDS',N'2023-12-20'),
('KI29',N'Đồ Bộ Kid In Hình Cotton Usa','360.000',N'Thành phần: 100% Cotton
Bộ sooc cho bé thiết kế basic rất dễ mặc, đáng yêu với hình in chú chó siêu cute
Quần phối màu đồng nhất với hình in giúp bộ đồ ton-sur-ton và thú vị hơn
Bé có thể mặc cả ngày mà vẫn rất thoải mái, thấm hút mồ hôi và mềm mại với làn da
','10','KI','Seller1','KIDS',N'2023-12-20'),
('KI30',N'Bộ Đồ Trẻ Em In Du Hành','530.000',N'Thành phần: 60% Cotton, 35% Polyester, 5% Spandex
Chất liệu mềm mại, thoải mái cho làn da, giữ ấm tốt
Bộ độ trẻ em thiết kế thoải mái
Giúp bảo vệ cơ thể bé yêu khi trời lạnh
SHOP’S HOUSE - Look good. Feel good.
','10','KI','Seller1','KIDS',N'2023-12-20'),
('KI31',N'Bộ Đồ Thu Đông Kid Tennis','430.000',N'Thành phần: 70% Cotton, 30% Polyester
Chất liệu da cá dày dặn với vết cấu sợi tạo nên mặt vải đanh chắc giúp giữ ấm tốt cho bé khi mặc
Không bị bai dão, bền, ít xù, khả năng thấm hút tốt
Bộ đồ co giãn nhẹ, thoải mái cho hoạt động cơ thể
Thiết kế thu đông dài tay với điểm nhấn là hình in tennis trước ngực
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','KI','Seller1','KIDS',N'2023-12-20'),
('KI32',N'Đồ Bộ Kid In Tràn Yd','760.000',N'Bộ đồ trẻ em thoáng mát, mềm mại cho bé an toàn mỗi ngày
Thành phần:  80% Cotton + 20% I-scra Softcool
Bộ đồ được thiết kế trên nền loại sợi co giãn đặc biệt: Iscra - loại sợi sinh học thế hệ mới được chiết xuất từ ngô
Sản phẩm co giãn tốt, khả năng phục hồi biến dạng biến dạng vượt trội hơn spandex
Sợi Cotton được kết hợp với Iscra theo tỷ lệ thích hợp giúp sản phẩm sở hữu ưu điểm Thông thoáng, mềm mại, thấm hút tốt và đặc biệt hạn chế xù lông
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam.
','10','KI','Seller1','KIDS',N'2023-12-20'),
('KI33',N'Đồ Bộ Kid In Basket Ball BCI','730.000',N'Bộ đồ trẻ em thành phần: 100% Cotton BCI an toàn cho làm da của các bạn nhỏ
Cotton BCI là tổ chức phi lợi nhuận toàn cầu về chương trình bông bền vững mới mục tiêu mang đến những sản phẩm bông tốt hơn cho người dùng, cho các nông trại & cho môi trương
Bộ đồ trẻ em Cotton BCI được làm từ bông trồng theo tiêu cuẩn ECO an toàn, giảm thiểu 50-80% hóa chất so với bông thông thường
Bộ đồ có khả năng thấm hút mồ hôi tốt và độ bền cao, giúp các bạn nhỏ thoải mái vui chơi vận động
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','KI','Seller1','KIDS',N'2023-12-20'),
('KI34',N'Đồ Bộ Kid Áo Rộng Quần Leging','380.000',N'Thành phần: 100% Cotton
Bộ đồ hè cho bé, thoải mái, hiện đại đậm chất riêng
Sản phẩm gồm 1 áo thun form rộng và 1 quần legging mềm mại
Chất liệu Cotton Compact được dệt từ sợi bông USA cao cấp cho bé thoải mái khi mặc
Thấm hút mồ hôi tốt, co giãn nhẹ nhàng phù hợp với chuyển động của cơ thể 
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','KI','Seller1','KIDS',N'2023-12-20'),
('KI35',N'Đồ Bộ Kid In Tràn Mặt Cười','380.000',N'Bộ đồ trẻ em vải bột ngô lành tính, an toàn
Thành phần:  80% Cotton + 20% I-scra Softcool
Sản phẩm sử dụng loại sợi co giãn đặc biệt: Iscra - loại sợi sinh học thế hệ mới được chiết xuất từ ngô
Chất liệu thân thiện với môi trường, co giãn tốt, khả năng phục hồi biến dạng vượt trội hơn spandex 
Sợi Cotton được kết hợp với Iscra theo tỷ lệ thích hợp giúp sản phẩm có các tính năng nổi trội như: Thông thoáng, mềm mại, thấm hút tốt, hạn chế xù lông vón cục.
Thiết kế dễ thương, tươi mới dành cho các bạn nhỏ mặc nhà, mặc đi chơi, đi học
SHOP’S HOUSE - Look good, Feel good.
Sản xuất tại Việt Nam
','10','KI','Seller1','KIDS',N'2023-12-20'),
('KI36',N'Bộ Đồ Trẻ Em Kẻ Dáng Ôm','530.000',N'Bộ đồ thun ôm sát cho bé 2-8 tuổi
Thành phần: 96% Cotton + 4% Spandex
Chất liệu mềm mại, giữ nhiệt tốt, thấm hút hiệu quả
Co giãn giúp bé thoải mái vận động
Bộ đồ thiết kế kẻ dễ thương, mặc đi ngủ, mặc ở nhà, mặc bên trong vào mùa thu đông để giữ ấm
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','KI','Seller1','KIDS',N'2023-12-20'),
('KI37',N'Bộ Đồ Trẻ Em In W','260.000',N'Thành phần: 70% Cotton + 30% Spandex
Bộ đồ kid bao gồm áo sweater dài tay và quần jogger dáng suông rộng giúp bé thoải mái mặc đẹp và vận động
Thiết kế hình in trước ngực & phối tay tạo điểm nhấn hợp mốt, trẻ trung
Bộ đồ có chất liệu nỉ co giãn, giữ ấm, bề mặt vải mịn
Kết cấu sợi  tạo nên mặt vải đanh chắc, không bị bai dão, ít xù
SHOP’S HOUSE - Look good. Feel good.
','10','KI','Seller1','KIDS',N'2023-12-20');
------------####################Kitwears###################----------------
------------####################Accessories###################----------------
------Phụ kiện (Accessories)
insert into Product (productID, productName, productPrice,detail,quantity,categoryID,created_By,type,CreateDate) values
('AC1',N'Túi Unisex Thể Thao Xách Tay','730.000',N'Túi thể thao xách tay dành cho cả nam và nữ
Thành phần chất liệu: 90% PA, 10% PVC
Thiết kế đa năng, nhiều ngăn nên chứa được nhiều đồ nhưng vẫn gòn gàng, hiện đại
Phù hợp sử dụng khi đi tập luyện thể thao hay du lịch
Lưu ý bảo quản: không giặt máy, không sử dụng chất tẩy rửa hoá học
SHOP’S HOUSE: Look good. Feel good.
Sản xuất tại Việt Nam
','10','AC','Seller1','ACCESSORIES',N'2023-12-20'),
('AC2',N'Túi Unisex Casual Cho Nam Nữ','380.000',N'Túi đeo chéo tiện lợi, đa năng dành cho cả nam và nữ
Thành phần: Polyamide 65%, PP 35%
Thiết kê nhỏ gọn, nhiều ngăn đa năng
Chất liệu chắc chắn, đường may tỉ mỉ
Kiểu dáng casual thích hợp đeo mọi lúc mọi nơi
Nhỏ gọn, tiện lợi, phù hợp với mọi giới tính
SHOP’S HOUSE - Look good. Feel good.
','10','AC','Seller1','ACCESSORIES',N'2023-12-20'),
('AC3',N'Khăn Len Nữ Phối Kẻ','380.000',N'Thành phần: 53% Viscose, 20% Nylon, 27% Polyester
Khăn len là món phụ kiện hữu ích vừa làm đẹp vừa giữ ấm trong mùa đông
Sản phẩm có thành phần chủ yếu là viscose với ưu điểm có độ bóng và mềm mại ấn tượng, tạo cho người dùng cảm giác thoải mái như được nâng niu
Ngoài ra thành phần polyester và nylon được dệt thêm vào để tăng độ bền và giữ form cho sản phẩm
Sản xuất tại Việt Nam
SHOP’S HOUSE - Look good. Feel good.
','10','AC','Seller1','ACCESSORIES',N'2023-12-20'),
('AC4',N'Túi Unisex Đeo Chéo Phối Nắp Túi','530.000',N'Túi đeo chéo unisex phối nắp túi thời trang dành cho cả nam và nữ
Kích thước vừa vặn để được nhiều vật dụng như: điện thoại, ví, sổ, bút
Nắp đậy kết hợp với khoá cài bảo vệ đồ dùng bên trong không bị rơi trong quá trình sử dụng
Dạng hình hộp, dây đeo là dây dù mềm, chắc chắn, móc dây có thể xoay tròn tiện lợi
Thích hợp đeo đi chơi, du lịch, dã ngoại
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','AC','Seller1','ACCESSORIES',N'2023-12-20'),
('AC5',N'Mũ Bucket SHOP’S HOUSE Sport','260.000',N'Chiếc Bucket Hat với phối màu trung tính
Thành phần: 100% Cotton
Thiết kế đơn giản, nhấn mạnh logo SHOP’S HOUSE SPORT mang nhiều năng lượng tích cực
Phù hợp cho những người trẻ thể hiện cá tính
Phối đồ basic cũng mũ sẽ giúp bạn thể hiện được sự đơn giản, tự do của mình
SHOP’S HOUSE - Look good. Feel good.
','10','AC','Seller1','ACCESSORIES',N'2023-12-20'),
('AC6',N'Mũ Lưỡi Trai Thêu Space','770.000',N'Thành phần: 100% Cotton
Form dáng thể thao có kiểu dáng cực kì đơn giản, thanh lịch nhưng cũng không kém phần năng động.
Nổi bật với hình thêu Space tinh tế, sắc nét thêm phần cá tính
Dễ dàng điều chỉnh giúp vừa vặn với đầu người đội
SHOP’S HOUSE - Look good. Feel good.
','10','AC','Seller1','ACCESSORIES',N'2023-12-20'),
('AC7',N'Túi Unisex Đeo Chéo Nắp Nam Châm','860.000',N'Thành phần: Polyamide 65% + PP 35%
Túi đeo chéo chứa được các vật dụng như: sách, điện thoại, bút, ví, ô gấp tròn…
Thoải mái sử dụng túi đeo để đi chơi, du lịch, dã ngoại, phượt
Tránh tiếp xúc trực tiếp với nước lâu hoặc để trong môi trường ẩm thấp
Tránh sử dụng các vật nhọn với túi vì dễ gây rách, xước
Thường xuyên vệ sinh túi
SHOP’S HOUSE - Look good. Feel good.
','10','AC','Seller1','ACCESSORIES',N'2023-12-20'),
('AC8',N'Mũ Lưỡi Trai Phối Màu Thêu Chữ P','540.000',N'Mũ lưỡi trai phối màu thêu chữ P thoáng mát, thoải mái, thời trang
Thành phần: 100% Cotton
Chất liệu cotton thấm hút tốt, thông thoáng da đầu
Vải mềm, nhanh khô
Đường may tỉ mỉ, kết cấu chắc chắn
Mang đến cảm giác thoải mái và thuận tiện khi sử dụng
SHOP’S HOUSE - Look good. Feel good.
','10','AC','Seller1','ACCESSORIES',N'2023-12-20'),
('AC9',N'Túi Unisex Bản To','420.000',N'Túi unisex bản to thiết kế basic thành phần: PA 65%, PE 35%
Thiết kế của chiếc túi này khá rộng rãi và to bản nên chứa được nhiều đồ bên trong rất tiện dụng
Phong cách trẻ trung, hiện đại với 2 gam màu Đen, Trắng cơ bản
Thích hợp phối với các trang phục basic hằng ngày
SHOP’S HOUSE - Look good. Feel good.
','10','AC','Seller1','ACCESSORIES',N'2023-12-20'),
('AC10',N'Kính Râm Phân Cực Chống Tia Uv Mắt Vuông','630.000',N'Kính râm phân cực chống tia UV - 1 sản phẩm thời trang bảo vệ bạn
Chất liệu: 100% Polyester
Mắt kính phân cực chống tia UV400, tròng kính phân cực TAC được phủ một lớp phim phân cực, giúp hấp thụ tia sáng chói, thanh lọc ánh sáng, mang đến hiệu ứng hình ảnh chân thực và rõ nét hơn
Thiết kế mắt vuông trẻ trung, hiện đại cho outfit của bạn thêm phần thời trang, cá tính
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','AC','Seller1','ACCESSORIES',N'2023-12-20'),
('AC11',N'Kính Râm Phân Cực Chống Tia UV','630.000',N'Bảo vệ đôi mắt của bạn với kinh râm phân cực chống tia UV
Mắt kính phân cực chống tia UV400
Chất liệu: 100% Polyester
Tròng kính chất liệu Nylon, nhẹ hơn 20% so với tròng kính thông thường, chống va đập tốt, độ bền cao có thể uốn cong, đảm bảo độ tán sắc cao hơn tròng PC 70%.
Gọng kính được làm từ nhựa dẻo TR90 mang lại độ bền tốt, trọng lượng nhẹ cùng sự thoải mái cho người dùng
SHOP’S HOUSE - Look good. Feel good.
Sản xuất tại Việt Nam
','10','AC','Seller1','ACCESSORIES',N'2023-12-20'),
('AC12',N'Túi Unisex Dáng Hộp Dệt Hoạ Tiết','530.000',N'Túi unisex dùng được cho cả nam và nữ
Thành phần:  75% Cotton, 25% Polyester
Kích thước túi: 20*12.5*6cm
Dáng hộp dệt hoạ tiết đẹp mắt
Túi đeo chéo kèm dây tiện lợi
Thích hợp sử dụng khi đi chơi, dạo phố, du lịch
Dễ dàng kết hợp với nhiều loại trang phục để dùng hằng ngày
SHOP’S HOUSE - Look good. Feel good.
','10','AC','Seller1','ACCESSORIES',N'2023-12-20'),
('AC13',N'Túi Unisex Đeo Chéo Dệt Hoạ Tiết','360.000',N'Túi đeo chéo dệt hoạ tiết thời trang và phong cách
Thành phần: 75%cotton, 25%polyeste
Thiết kế unisex dùng được cho cả nam và nữ
Kích thước túi: 14*18.5*9cm
Quai bản to không đau vai
Dáng hộp cứng cáp, kèm dây đeo tiện lợi
Dễ dàng phối với nhiều trang phục sử dụng hằng ngày, đi chơi, dạo phố, du lịch
SHOP’S HOUSE - Look good. Feel good.
','10','AC','Seller1','ACCESSORIES',N'2023-12-20'),
('AC14',N'Mũ Nam Vải Bò','530.000',N'Chất liệu vải cotton mềm
Thành phần: 100% Cotton
Thấm hút tốt, thông thoáng da đầu
Kết cấu chắc chắn, đường may tỉ mỉ, giặt nhanh khô
Mang đến cho người dùng cảm giác thoải mái và thuận tiện khi sử dụng
SHOP’S HOUSE - Look good. Feel good.
','10','AC','Seller1','ACCESSORIES',N'2023-12-20'),
('AC15',N'Mũ Lưỡi Trai In Chữ','430.000',N'Mũ lưỡi trai in chữ chất liệu vải cotton
Thành phần: 100% Cotton
Mang đến cho người dùng cảm giác thoải mái và thuận tiện. 
Thấm hút tốt, thông thoáng da đầu
Kết cấu chắc chắn, đường may tỉ mỉ
Chất vải mềm, nhanh khô
SHOP’S HOUSE - Look good. Feel good
','10','AC','Seller1','ACCESSORIES',N'2023-12-20'),
('AC16',N'Mũ Nam Trơn Vải Da Lộn','760.000',N'Thành phần: 100% Cotton
Mang đến cho người dùng cảm giác thoải mái và thuận tiện. Theo đó, chiếc mũ này sở hữu những ưu điểm không thể bỏ lỡ:
Thấm hút tốt, thông thoáng da đầu
Kết cấu chắc chắn, đường may tỉ mỉ
Chất vải mềm, nhanh khô
SHOP’S HOUSE - Look good. Feel good
','10','AC','Seller1','ACCESSORIES',N'2023-12-20'),
('AC17',N'Túi Unisex Đeo Chéo Da Pu','860.000',N'Túi đeo chéo làm từ chất liệu da PU mềm, bền, dễ dàng vệ sinh
Sản phẩm unisex thích hợp dành cho cả nam và nữ giới
Phom dáng hộp có thể đựng được nhiều đồ vật cá nhân
Thiết kế quai khóa bản to chắc chắn
Màu sắc thanh lịch có thể kết hợp với nhiều trang phục khác nhau
SHOP’S HOUSE - Look good. Feel good.
','10','AC','Seller1','ACCESSORIES',N'2023-12-20'),
('AC18',N'Mặt Khóa Kim Thắt Lưng Nam Xoay 2 Chiều Bản 3.3cm','540.000',N'Chất liệu:  Hợp Kim thép phủ mạ
Mặt thắt lưng cài kim xoay chiều bản 3.3CM
Thiết kế mặt kim xoay tiện dụng dễ dàng chuyển mặt thắt lưng
Mặt khóa phù hợp với những người yêu thích sự cổ điển, lịch lãm
Dễ dàng kết hợp với các mẫu quần jeans, kaki, quần âu
SHOP’S HOUSE - Look good. Feel good.
','10','AC','Seller1','ACCESSORIES',N'2023-12-20'),
('AC19',N'Mặt Khóa Cài Thắt Lưng Nam Xoay 2 Chiều Bản 3.5cm','420.000',N'Chất liệu Hợp Kim thép phủ mạ
Mặt thắt lưng tự động xoay chiều bản 3.5CM
Thiết kế mặt khóa cài tự động tiện dụng dễ dàng chuyển mặt thắt lưng
Mặt khóa phù hợp với những người yêu thích sự cổ điển, lịch lãm
Dễ dàng kết hợp với các mẫu quần jeans, kaki, quần âu
SHOP’S HOUSE - Look good. Feel good.
','10','AC','Seller1','ACCESSORIES',N'2023-12-20'),
('AC20',N'Mặt Khóa Tự Động Thắt Lưng Nam Cao Cấp','630.000',N'Chất liệu Hợp Kim thép phủ mạ
Mặt thắt lưng tự động bản 3.5CM
Thiết kế cài tự động tiện dụng
Phần mặt kính thanh lịch, phong cách đơn giản nhưng không kém phần tinh tế
Dễ dàng kết hợp với các mẫu quần jeans, kaki, quần âu
SHOP’S HOUSE - Look good. Feel good.
','10','AC','Seller1','ACCESSORIES',N'2023-12-20');

------------####################Accessories###################----------------
------------#######################IMG#####################---------------------
------------T-Shirts--------------
insert into ProductIMG (IMGID, url,createDateIMG,productID) values
('IMG1',N'https://bizweb.dktcdn.net/100/438/408/products/atm6115-bee-qkm6029-vac-6.jpg?v=1698305841887',N'2023-12-20','TS1'),
('IMG2',N'https://bizweb.dktcdn.net/100/438/408/products/ao-ni-nam-atm6113-nav-6.jpg?v=1699237410980',N'2023-12-20','TS2'),
('IMG3',N'https://bizweb.dktcdn.net/100/438/408/products/ao-thu-dong-nam-dai-tay-yody-atm6002-den-9.jpg?v=1700874781320',N'2023-12-20','TS3'),
('IMG4',N'https://bizweb.dktcdn.net/100/438/408/products/ao-thun-nam-atm6109-nau-2.jpg?v=1698290325873',N'2023-12-20','TS4'),
('IMG5',N'https://bizweb.dktcdn.net/100/438/408/products/ao-thun-nam-atm6016-tra-1.jpg?v=1696315200867',N'2023-12-20','TS5'),
('IMG6',N'https://bizweb.dktcdn.net/100/438/408/products/tsm6085-dn1-qjm5021-xt2-12.jpg?v=1690163487757',N'2023-12-20','TS6'),
('IMG7',N'https://bizweb.dktcdn.net/100/438/408/products/ao-ni-nam-atm6081-ghd-8.jpg?v=1699237279737',N'2023-12-20','TS7'),
('IMG8',N'https://bizweb.dktcdn.net/100/438/408/products/stm6073-xng-3.jpg?v=1689560498837',N'2023-12-20','TS8'),
('IMG9',N'https://bizweb.dktcdn.net/100/438/408/products/ao-thun-nam-the-theo-stm6099-xde-sqm6025-ghi-4-2-yody.jpg?v=1702633445053',N'2023-12-20','TS9'),
('IMG10',N'https://bizweb.dktcdn.net/100/438/408/products/ao-thun-the-thao-nam-stm6013-xlu-5.jpg?v=1690163433867',N'2023-12-20','TS10'),
('IMG11',N'https://bizweb.dktcdn.net/100/438/408/products/stm6083-xla-sqm-5015-ghi-6-ao-thun-nam-yody.jpg?v=1689653926787',N'2023-12-20','TS11'),
('IMG12',N'https://bizweb.dktcdn.net/100/438/408/products/stm6081-tra-17.jpg?v=1699328596667',N'2023-12-20','TS12'),
('IMG13',N'https://bizweb.dktcdn.net/100/438/408/products/stm5079-cam-8.jpg?v=1677136777963',N'2023-12-20','TS13'),
('IMG14',N'https://bizweb.dktcdn.net/100/438/408/products/stm5045-tra03.jpg?v=1669887911010',N'2023-12-20','TS14'),
('IMG15',N'https://bizweb.dktcdn.net/100/438/408/products/ao-thun-nam-stm6033-tra-4-yodyvn.jpg?v=1680937506003',N'2023-12-20','TS15'),
('IMG16',N'https://bizweb.dktcdn.net/100/438/408/products/atm5091-nav-6.jpg?v=1668848976703',N'2023-12-20','TS16'),
('IMG17',N'https://bizweb.dktcdn.net/100/438/408/products/ao-thun-nu-tsn6288-nav-4.jpg?v=1690163417873',N'2023-12-20','TS17'),
('IMG18',N'https://bizweb.dktcdn.net/100/438/408/products/atn4502-reu-qan4128-xah-4.jpg?v=1639015651683',N'2023-12-20','TS18'),
('IMG19',N'https://bizweb.dktcdn.net/100/438/408/products/apn3326-nan-cjn3070-txa-5.jpg?v=1668138353997',N'2023-12-20','TS19'),
('IMG20',N'https://bizweb.dktcdn.net/100/438/408/products/ao-thun-nu-tsn6330-tra-2.jpg?v=1701404486167',N'2023-12-20','TS20'),
('IMG21',N'https://bizweb.dktcdn.net/100/438/408/products/atn5130-tan-11.jpg?v=1665823853540',N'2023-12-20','TS21'),
('IMG22',N'https://bizweb.dktcdn.net/100/438/408/products/tsn6128-cam-ssn6020-tit-muu6008-nav-8.jpg?v=1690163392223',N'2023-12-20','TS22'),
('IMG23',N'https://bizweb.dktcdn.net/100/438/408/products/ao-thun-nu-tsn6082-tr1-sjn4020-xah-3-of-10-yody.jpg?v=1692606016533',N'2023-12-20','TS23'),
('IMG24',N'https://bizweb.dktcdn.net/100/438/408/products/tsn6012-den-sjn4020-xah-9.jpg?v=1690163531707',N'2023-12-20','TS24'),
('IMG25',N'https://bizweb.dktcdn.net/100/438/408/products/tsn5332-den1.jpg?v=1668416213323',N'2023-12-20','TS25'),
('IMG26',N'https://bizweb.dktcdn.net/100/438/408/products/tsn4430-hog-4.jpg?v=1636618613457',N'2023-12-20','TS26'),
('IMG27',N'https://bizweb.dktcdn.net/100/438/408/products/ao-thun-nu-tsn6032-xng-5.jpg?v=1690163482547',N'2023-12-20','TS27'),
('IMG28',N'https://bizweb.dktcdn.net/100/438/408/products/apn3324-bee2.jpg?v=1667466141553',N'2023-12-20','TS28'),
('IMG29',N'https://bizweb.dktcdn.net/100/438/408/products/apn6184-nau-4.jpg?v=1692606008840',N'2023-12-20','TS29'),
('IMG30',N'https://bizweb.dktcdn.net/100/438/408/products/ao-thun-nu-tsn6038-dn1-2.jpg?v=1690163504870',N'2023-12-20','TS30'),
('IMG31',N'https://bizweb.dktcdn.net/100/438/408/products/stn6006-tra-6.jpg?v=1688723283280',N'2023-12-20','TS31'),
('IMG32',N'https://bizweb.dktcdn.net/100/438/408/products/ao-thun-tre-em-tsk6102-tpr-11-yody.jpg?v=1689904334913',N'2023-12-20','TS32'),
('IMG33',N'https://bizweb.dktcdn.net/100/438/408/products/atk5203-hog-4.jpg?v=1690163627067',N'2023-12-20','TS33'),
('IMG34',N'https://bizweb.dktcdn.net/100/438/408/products/ao-thun-dai-tay-tre-em-atk6014-hog-3.jpg?v=1699239194817',N'2023-12-20','TS34'),
('IMG35',N'https://bizweb.dktcdn.net/100/438/408/products/ao-thun-tre-em-tsk6244-tra-8.jpg?v=1690163404930',N'2023-12-20','TS35'),
('IMG36',N'https://bizweb.dktcdn.net/100/438/408/products/tsk6142-tr1-3.jpg?v=1690163421320',N'2023-12-20','TS36'),
('IMG37',N'https://bizweb.dktcdn.net/100/438/408/products/tsk6090-den-14.jpg?v=1690163489417',N'2023-12-20','TS37'),
('IMG38',N'https://bizweb.dktcdn.net/100/438/408/products/ao-thun-tre-em-tsk6314-tim-6.jpg?v=1690163499733',N'2023-12-20','TS38'),
('IMG39',N'https://bizweb.dktcdn.net/100/438/408/products/tsk6164-tr1-8.jpg?v=1690163512063',N'2023-12-20','TS39'),
('IMG40',N'https://bizweb.dktcdn.net/100/438/408/products/ao-thun-tre-em-tsk6152-xdu-3.jpg?v=1690163523450',N'2023-12-20','TS40'),
('IMG41',N'https://bizweb.dktcdn.net/100/438/408/products/tsk6246-xbi-5.jpg?v=1690163531937',N'2023-12-20','TS41'),
('IMG42',N'https://bizweb.dktcdn.net/100/438/408/products/ao-thun-dai-tay-tre-em-yody-atk6022-nau-8.jpg?v=1697253656423',N'2023-12-20','TS42'),
('IMG43',N'https://bizweb.dktcdn.net/100/438/408/products/atk6176-kem-2.jpg?v=1696324684483',N'2023-12-20','TS43'),
('IMG44',N'https://bizweb.dktcdn.net/100/438/408/products/atk5201-van.jpg?v=1690163639160',N'2023-12-20','TS44'),
('IMG45',N'https://bizweb.dktcdn.net/100/438/408/products/atk5205-hog-2.jpg?v=1690163640353',N'2023-12-20','TS45'),
('IMG46',N'https://bizweb.dktcdn.net/100/438/408/products/atk5030-gtr-5.jpg?v=1690163642127',N'2023-12-20','TS46'),
('IMG47',N'https://bizweb.dktcdn.net/100/438/408/products/tsk5119-den-5.jpg?v=1653616643263',N'2023-12-20','TS47');
------------Jacket--------------
insert into ProductIMG (IMGID, url,createDateIMG,productID) values
('IMG48',N'https://bizweb.dktcdn.net/100/438/408/products/skm5055-xcv-ao-khoac-nam-yody-6.jpg?v=1701757459833',N'2023-12-20','JA1'),
('IMG49',N'https://bizweb.dktcdn.net/100/438/408/products/akm5047-ddo-4.jpg?v=1690163627300',N'2023-12-20','JA2'),
('IMG50',N'https://bizweb.dktcdn.net/100/438/408/products/skm5035-tra-5.jpg?v=1690163635310',N'2023-12-20','JA3'),
('IMG51',N'https://bizweb.dktcdn.net/100/438/408/products/ao-khoac-nam-swm6005-den-2.jpg?v=1696646210557',N'2023-12-20','JA4'),
('IMG52',N'https://bizweb.dktcdn.net/100/438/408/products/akm5017-den-15-ao-khoac-nam.jpg?v=1690163634530',N'2023-12-20','JA5'),
('IMG53',N'https://bizweb.dktcdn.net/100/438/408/products/swm6015-nav-3.jpg?v=1698897779530',N'2023-12-20','JA6'),
('IMG54',N'https://bizweb.dktcdn.net/100/438/408/products/phm3000-dod-3.jpg?v=1636940455133',N'2023-12-20','JA7'),
('IMG55',N'https://bizweb.dktcdn.net/100/438/408/products/akm5041-ghs-9.jpg?v=1693039332207',N'2023-12-20','JA8'),
('IMG56',N'https://bizweb.dktcdn.net/100/438/408/products/sdm5007-nav-7.jpg?v=1700213818337',N'2023-12-20','JA9'),
('IMG57',N'https://bizweb.dktcdn.net/100/438/408/products/akm4027-xah-qjm3077-xde-1.jpg?v=1690163864163',N'2023-12-20','JA10'),
('IMG58',N'https://bizweb.dktcdn.net/100/438/408/products/phm5017-xcv-02.jpg?v=1677142189040',N'2023-12-20','JA11'),
('IMG59',N'https://bizweb.dktcdn.net/100/438/408/products/akm5037-den-1.jpg?v=1700349203937',N'2023-12-20','JA12'),
('IMG60',N'https://bizweb.dktcdn.net/100/438/408/products/ao-khoac-nam-phm6029-tit-5.jpg?v=1699843431770',N'2023-12-20','JA13'),
('IMG61',N'https://bizweb.dktcdn.net/100/438/408/products/ao-khoac-nam-akm6017-tit-6.jpg?v=1696039679727',N'2023-12-20','JA14'),
('IMG62',N'https://bizweb.dktcdn.net/100/438/408/products/pvm6003-nav-sdm6091-den-atm6010-tra-15.jpg?v=1702610975323',N'2023-12-20','JA15'),
('IMG63',N'https://bizweb.dktcdn.net/100/438/408/products/phm4003-dgh-qjm3051-den-6.jpg?v=1669888079097',N'2023-12-20','JA16'),
('IMG64',N'https://bizweb.dktcdn.net/100/438/408/products/ao-mang-to-nu-yody-mtn4008-den-4.jpg?v=1690164885687',N'2023-12-20','JA17'),
('IMG65',N'https://bizweb.dktcdn.net/100/438/408/products/akn6038-den-cvn6188-den-2.jpg?v=1698895033777',N'2023-12-20','JA18'),
('IMG66',N'https://bizweb.dktcdn.net/100/438/408/products/ao-khoac-nu-the-thao-tui-hop-yody-skn6016-den-bln6036-cam-ssn6022-xng-5-of-7-8.jpg?v=1696324329663',N'2023-12-20','JA19'),
('IMG67',N'https://bizweb.dktcdn.net/100/438/408/products/akn5006-reu-3.jpg?v=1690163654390',N'2023-12-20','JA20'),
('IMG68',N'https://bizweb.dktcdn.net/100/438/408/products/akn1924-tra-1.jpg?v=1667464392390',N'2023-12-20','JA21'),
('IMG69',N'https://bizweb.dktcdn.net/100/438/408/products/swn6024-bee-cvn6224-nau-12.jpg?v=1696818119213',N'2023-12-20','JA22'),
('IMG70',N'https://bizweb.dktcdn.net/100/438/408/products/skn5008-den-3.jpg?v=1690163628227',N'2023-12-20','JA23'),
('IMG71',N'https://bizweb.dktcdn.net/100/438/408/products/ao-khoac-nu-akn6040-hog-2.jpg?v=1696816927530',N'2023-12-20','JA24'),
('IMG72',N'https://bizweb.dktcdn.net/100/438/408/products/akn6012-xth-1.jpg?v=1697426534613',N'2023-12-20','JA25'),
('IMG73',N'https://bizweb.dktcdn.net/100/438/408/products/ao-khoac-long-cuu-yody-skn6048-tra-8.jpg?v=1702706934950',N'2023-12-20','JA26'),
('IMG74',N'https://bizweb.dktcdn.net/100/438/408/products/swn6004-hog-aln6030-tay-cvn6224-xgi-01.jpg?v=1697526829620',N'2023-12-20','JA27'),
('IMG75',N'https://bizweb.dktcdn.net/100/438/408/products/ao-khoac-nu-skn6004-hog-21.jpg?v=1698641337493',N'2023-12-20','JA28'),
('IMG76',N'https://bizweb.dktcdn.net/100/438/408/products/ao-khoac-ni-the-thao-nu-yody-swn6010-tit-atn6006-nav-cvn6224-xag-01.jpg?v=1696902467160',N'2023-12-20','JA29'),
('IMG77',N'https://bizweb.dktcdn.net/100/438/408/products/akn5042-vag-1.jpg?v=1690163746210',N'2023-12-20','JA30'),
('IMG78',N'https://bizweb.dktcdn.net/100/438/408/products/akn5040-cam-10-3174e8ca-37fa-4b4f-b134-3a6b85cb1592.jpg?v=1699328154250',N'2023-12-20','JA31'),
('IMG79',N'https://bizweb.dktcdn.net/100/438/408/products/phn3000-dod-4.jpg?v=1667555400953',N'2023-12-20','JA32'),
('IMG80',N'https://bizweb.dktcdn.net/100/438/408/products/ao-khoac-tre-em-pvk6008-ddo-5.jpg?v=1700535294243',N'2023-12-20','JA33'),
('IMG81',N'https://bizweb.dktcdn.net/100/438/408/products/ao-khoac-tre-em-akk6030-vag-1.jpg?v=1696038056140',N'2023-12-20','JA34'),
('IMG82',N'https://bizweb.dktcdn.net/100/438/408/products/ao-khoac-tre-em-yody-akk6028-ddo-1.jpg?v=1696583715923',N'2023-12-20','JA35'),
('IMG83',N'https://bizweb.dktcdn.net/100/438/408/products/ao-khoac-tre-em-3c-pro-yody-akk6006-dod-1-2.jpg?v=1696037812930',N'2023-12-20','JA36'),
('IMG84',N'https://bizweb.dktcdn.net/100/438/408/products/ao-khoac-tre-em-akk4001-cam-7.jpg?v=1690163864477',N'2023-12-20','JA37'),
('IMG85',N'https://bizweb.dktcdn.net/100/438/408/products/akk5019-hog-14.jpg?v=1688723410207',N'2023-12-20','JA38'),
('IMG86',N'https://bizweb.dktcdn.net/100/438/408/products/akk5021-cam-11.jpg?v=1690163745090',N'2023-12-20','JA39'),
('IMG87',N'https://bizweb.dktcdn.net/100/438/408/products/akk5023-xat-5.jpg?v=1688723404517',N'2023-12-20','JA40'),
('IMG88',N'https://bizweb.dktcdn.net/100/438/408/products/ao-phao-gile-tre-em-yody-pvk6006-den-1.jpg?v=1696903215527',N'2023-12-20','JA41'),
('IMG89',N'https://bizweb.dktcdn.net/100/438/408/products/phk4002-hog-1-6acac8db-2255-4594-a808-ca6a1b4a377f.jpg?v=1665461220413',N'2023-12-20','JA42'),
('IMG90',N'https://bizweb.dktcdn.net/100/438/408/products/phk5009-bha-5.jpg?v=1699328107733',N'2023-12-20','JA43'),
('IMG91',N'https://bizweb.dktcdn.net/100/438/408/products/phk5009-xng-3.jpg?v=1689652006253',N'2023-12-20','JA44'),
('IMG92',N'https://bizweb.dktcdn.net/100/438/408/products/phk6002-den-5.jpg?v=1696325464807',N'2023-12-20','JA45'),
('IMG93',N'https://bizweb.dktcdn.net/100/438/408/products/phk5001-den-4.jpg?v=1673076059913',N'2023-12-20','JA46');
------------Jeans--------------
insert into ProductIMG (IMGID, url,createDateIMG,productID) values
('IMG94',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jeans-nam-yody-qjm6061-xah-atm6o81-nav-1.jpg?v=1699004632973',N'2023-12-20','JE1'),
('IMG95',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jean-nam-qjm6065-xnh-4.jpg?v=1696645706360',N'2023-12-20','JE2'),
('IMG96',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jeans-nam-yody-qjm6023-xah-4.jpg?v=1699866341637',N'2023-12-20','JE3'),
('IMG97',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jean-nu-qjn4026-dek-6.jpg?v=1690163839010',N'2023-12-20','JE4'),
('IMG98',N'https://bizweb.dktcdn.net/100/438/408/products/sjm3067-xah-2.jpg?v=1662797001593',N'2023-12-20','JE5'),
('IMG99',N'https://bizweb.dktcdn.net/100/438/408/products/qjm6033-xdm-22-quan-jean-nam-yodyvn-11.jpg?v=1680936298093',N'2023-12-20','JE6'),
('IMG100',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jeans-nam-yody-qjm6037-xnh-gut6090-cvt-4.jpg?v=1696584608257',N'2023-12-20','JE7'),
('IMG101',N'https://bizweb.dktcdn.net/100/438/408/products/qjm6007-dek-1.jpg?v=1690163541437',N'2023-12-20','JE8'),
('IMG102',N'https://bizweb.dktcdn.net/100/438/408/products/qjm5005-xdm-13.jpg?v=1690163614863',N'2023-12-20','JE9'),
('IMG103',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jeans-nam-slim-cotton-usa-71-qjm5071-xdm-10.jpg?v=1690163603700',N'2023-12-20','JE10'),
('IMG104',N'https://bizweb.dktcdn.net/100/438/408/products/qjm5043-xah-3.jpg?v=1690163747417',N'2023-12-20','JE11'),
('IMG105',N'https://bizweb.dktcdn.net/100/438/408/products/qjm5021-xam-2.jpg?v=1690163755733',N'2023-12-20','JE12'),
('IMG106',N'https://bizweb.dktcdn.net/100/438/408/products/qjm5033-xah2.jpg?v=1690163834653',N'2023-12-20','JE13'),
('IMG107',N'https://bizweb.dktcdn.net/100/438/408/products/sjm3065-xah-2.jpg?v=1690163734230',N'2023-12-20','JE14'),
('IMG108',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jean-nam-qjm6047-xtu-1.jpg?v=1702516998730',N'2023-12-20','JE15'),
('IMG109',N'https://bizweb.dktcdn.net/100/438/408/products/qjm6041-xad-1.jpg?v=1698896957127',N'2023-12-20','JE16'),
('IMG110',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jeans-nu-qjn6050-den-6.jpg?v=1690163450897',N'2023-12-20','JE17'),
('IMG111',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jean-nu-qjn4026-dek-6.jpg?v=1690163839010',N'2023-12-20','JE18'),
('IMG112',N'https://bizweb.dktcdn.net/100/438/408/products/qjn5084-xdm-2.jpg?v=1690163636007',N'2023-12-20','JE19'),
('IMG113',N'https://bizweb.dktcdn.net/100/438/408/products/qjn3126-den-tsn3792-tra-1.jpg?v=1645073399477',N'2023-12-20','JE20'),
('IMG114',N'https://bizweb.dktcdn.net/100/438/408/products/quan-short-jeans-nu-sjn4020-xah-1-yodyvn.jpg?v=1690163539780',N'2023-12-20','JE21'),
('IMG115',N'https://bizweb.dktcdn.net/100/438/408/products/qjn4010-dni-apn3890-gre-2.jpg?v=1666165295057',N'2023-12-20','JE22'),
('IMG116',N'https://bizweb.dktcdn.net/100/438/408/products/qjn6018-xdm-aln6046-den-1.jpg?v=1698897080323',N'2023-12-20','JE23'),
('IMG117',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jeans-nu-qjn6038-xnh-4.jpg?v=1697538660760',N'2023-12-20','JE24'),
('IMG118',N'https://bizweb.dktcdn.net/100/438/408/products/qjn6034-xdm-3.jpg?v=1689039472177',N'2023-12-20','JE25'),
('IMG119',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jeans-nu-baggy-cap-chun-mem-mai-qjn5096-xah-yodyvn-1.jpg?v=1690163606107',N'2023-12-20','JE26'),
('IMG120',N'https://bizweb.dktcdn.net/100/438/408/products/qjn5068-xdm-4.jpg?v=1690163629327',N'2023-12-20','JE27'),
('IMG121',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jean-nu-qjn5094-xah-2-yodyvn.jpg?v=1681440224177',N'2023-12-20','JE28'),
('IMG122',N'https://bizweb.dktcdn.net/100/438/408/products/qjn5098-xdm-7.jpg?v=1690163653460',N'2023-12-20','JE29'),
('IMG123',N'https://bizweb.dktcdn.net/100/438/408/products/qjn5092-xdm-2.jpg?v=1690163653723',N'2023-12-20','JE30'),
('IMG124',N'https://bizweb.dktcdn.net/100/438/408/products/aln5032-tra-plus-qjn5102-xah-3.jpg?v=1690163662610',N'2023-12-20','JE31'),
('IMG125',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jean-nu-qjn5066-xdm-plus-atn5170-tra-9-yodyvn.jpg?v=1690163739060',N'2023-12-20','JE32'),
('IMG126',N'https://bizweb.dktcdn.net/100/438/408/products/apk5207-bee-plus-qjk5033-den-14-3ae3d6a6-4205-4985-8ed1-e89f6ba318b1.jpg?v=1690163598660',N'2023-12-20','JE33'),
('IMG127',N'https://bizweb.dktcdn.net/100/438/408/products/qjk5043-xah-3.jpg?v=1690163604127',N'2023-12-20','JE34'),
('IMG128',N'https://bizweb.dktcdn.net/100/438/408/products/qjk6016-xdm-apk6024-tra-01.jpg?v=1701404057713',N'2023-12-20','JE35'),
('IMG129',N'https://bizweb.dktcdn.net/100/438/408/products/qjk5009-xdm-3.jpg?v=1690163836653',N'2023-12-20','JE36'),
('IMG130',N'https://bizweb.dktcdn.net/100/438/408/products/sjk5008-xah-02.jpg?v=1690163606997',N'2023-12-20','JE37'),
('IMG131',N'https://bizweb.dktcdn.net/100/438/408/products/sjk5004-xdm1.jpg?v=1690163615623',N'2023-12-20','JE38'),
('IMG132',N'https://bizweb.dktcdn.net/100/438/408/products/sjk5000-xdm2-yody-vn.jpg?v=1690163756980',N'2023-12-20','JE39'),
('IMG133',N'https://bizweb.dktcdn.net/100/438/408/products/sjk5010-xah-6c6aab4b-bf67-4b84-9a54-30c8471ad707.jpg?v=1652863497840',N'2023-12-20','JE40'),
('IMG134',N'https://bizweb.dktcdn.net/100/438/408/products/sjk5052-xdm-203.jpg?v=1690163769697',N'2023-12-20','JE41'),
('IMG135',N'https://bizweb.dktcdn.net/100/438/408/products/qjk5011-xah-kid4129-hog-10.jpg?v=1648128899957',N'2023-12-20','JE42');
------------Sweatshirts--------------
insert into ProductIMG (IMGID, url,createDateIMG,productID) values
('IMG136',N'https://bizweb.dktcdn.net/100/438/408/products/sum5021-cam-4.jpg?v=1701843754737',N'2023-12-20','SW1'),
('IMG137',N'https://bizweb.dktcdn.net/100/438/408/products/sum6019-tra-qjm6021-xnh-1.jpg?v=1695366116763',N'2023-12-20','SW2'),
('IMG138',N'https://bizweb.dktcdn.net/100/438/408/products/ao-khoac-nam-swm6005-den-2.jpg?v=1696646210557',N'2023-12-20','SW3'),
('IMG139',N'https://bizweb.dktcdn.net/100/438/408/products/atm5069-tra-4.jpg?v=1668847974540',N'2023-12-20','SW4'),
('IMG140',N'https://bizweb.dktcdn.net/100/438/408/products/swm6015-nav-btm6147-ghd-1.jpg?v=1698897779530',N'2023-12-20','SW5'),
('IMG141',N'https://bizweb.dktcdn.net/100/438/408/products/atm5095-cba-4.jpg?v=1683699245307',N'2023-12-20','SW6'),
('IMG142',N'https://bizweb.dktcdn.net/100/438/408/products/ao-thun-nam-sum6003-tra-6-8.jpg?v=1696221812233',N'2023-12-20','SW7'),
('IMG143',N'https://bizweb.dktcdn.net/100/438/408/products/sdm5007-nav-5.jpg?v=1690163636803',N'2023-12-20','SW8'),
('IMG144',N'https://bizweb.dktcdn.net/100/438/408/products/ao-ni-nam-atm6113-nav-6.jpg?v=1699237410980',N'2023-12-20','SW9'),
('IMG145',N'https://bizweb.dktcdn.net/100/438/408/products/ao-thun-nam-atm6016-tra-1.jpg?v=1696315200867',N'2023-12-20','SW10'),
('IMG146',N'https://bizweb.dktcdn.net/100/438/408/products/atm5119-cba-3.jpg?v=1670029125843',N'2023-12-20','SW11'),
('IMG147',N'https://bizweb.dktcdn.net/100/438/408/products/atm5109-dkt-6.jpg?v=1689651615643',N'2023-12-20','SW12'),
('IMG148',N'https://bizweb.dktcdn.net/100/438/408/products/atm5009-tkc-5.jpg?v=1678352652220',N'2023-12-20','SW13'),
('IMG149',N'https://bizweb.dktcdn.net/100/438/408/products/atn5064-xdu-5.jpg?v=1667959500997',N'2023-12-20','SW14'),
('IMG150',N'https://bizweb.dktcdn.net/100/438/408/products/swn6024-bee-cvn6224-nau-12.jpg?v=1696818119213',N'2023-12-20','SW15'),
('IMG151',N'https://bizweb.dktcdn.net/100/438/408/products/atn5110-cb1-4.jpg?v=1670231765203',N'2023-12-20','SW16'),
('IMG152',N'https://bizweb.dktcdn.net/100/438/408/products/atn5046-xng-4.jpg?v=1666691878323',N'2023-12-20','SW17'),
('IMG153',N'https://bizweb.dktcdn.net/100/438/408/products/atn5050-den-6.jpg?v=1664000102270',N'2023-12-20','SW18'),
('IMG154',N'https://bizweb.dktcdn.net/100/438/408/products/atn5154-tim-4.jpg?v=1668503823860',N'2023-12-20','SW19'),
('IMG155',N'https://bizweb.dktcdn.net/100/438/408/products/atn4422-bee-3.jpg?v=1668486817893',N'2023-12-20','SW20'),
('IMG156',N'https://bizweb.dktcdn.net/100/438/408/products/ao-khoac-nu-akn6040-hog-2.jpg?v=1696816927530',N'2023-12-20','SW21'),
('IMG157',N'https://bizweb.dktcdn.net/100/438/408/products/atn5062-xah-19.jpg?v=1676694311197',N'2023-12-20','SW22'),
('IMG158',N'https://bizweb.dktcdn.net/100/438/408/products/swn6004-hog-aln6030-tay-cvn6224-xgi-01.jpg?v=1697526829620',N'2023-12-20','SW23'),
('IMG159',N'https://bizweb.dktcdn.net/100/438/408/products/ao-khoac-ni-the-thao-nu-yody-swn6010-tit-atn6006-nav-cvn6224-xag-01.jpg?v=1696902467160',N'2023-12-20','SW24'),
('IMG160',N'https://bizweb.dktcdn.net/100/438/408/products/sdn5010-den-00772.jpg?v=1690163656720',N'2023-12-20','SW25'),
('IMG161',N'https://bizweb.dktcdn.net/100/438/408/products/atn5068-xdm-6.jpg?v=1666666830993',N'2023-12-20','SW26'),
('IMG162',N'https://bizweb.dktcdn.net/100/438/408/products/ao-thun-nu-atn6138-ddo-2.jpg?v=1698460715283',N'2023-12-20','SW27'),
('IMG163',N'https://bizweb.dktcdn.net/100/438/408/products/hdk5069-xn1-9.jpg?v=1690163608670',N'2023-12-20','SW28'),
('IMG164',N'https://bizweb.dktcdn.net/100/438/408/products/atk5119-cba-3.jpg?v=1669887748900',N'2023-12-20','SW29'),
('IMG165',N'https://bizweb.dktcdn.net/100/438/408/products/atk5157-moo-plus-qnk5017-den06.jpg?v=1690163647373',N'2023-12-20','SW30'),
('IMG166',N'https://bizweb.dktcdn.net/100/438/408/products/atk5095-thm-1.jpg?v=1690163639407',N'2023-12-20','SW31'),
('IMG167',N'https://bizweb.dktcdn.net/100/438/408/products/atk5044-tim-14.jpg?v=1690163655353',N'2023-12-20','SW32'),
('IMG168',N'https://bizweb.dktcdn.net/100/438/408/products/atk5143-cba-2.jpg?v=1690163658753',N'2023-12-20','SW33'),
('IMG169',N'https://bizweb.dktcdn.net/100/438/408/products/atk5066-xah-5.jpg?v=1690163643803',N'2023-12-20','SW34'),
('IMG170',N'https://bizweb.dktcdn.net/100/438/408/products/atk5093-vag-30.jpg?v=1690163646397',N'2023-12-20','SW35'),
('IMG171',N'https://bizweb.dktcdn.net/100/438/408/products/atk5173-den-3.jpg?v=1690163655100',N'2023-12-20','SW36'),
('IMG172',N'https://bizweb.dktcdn.net/100/438/408/products/ao-ni-tre-em-theu-chu-tomorrow-hdk5267-vag-yodyvn-16.jpg?v=1690163540040',N'2023-12-20','SW37'),
('IMG173',N'https://bizweb.dktcdn.net/100/438/408/products/atk5005-xn1-07.jpg?v=1690163656023',N'2023-12-20','SW38'),
('IMG174',N'https://bizweb.dktcdn.net/100/438/408/products/suk5001-den-4.jpg?v=1701843734947',N'2023-12-20','SW39'),
('IMG175',N'https://bizweb.dktcdn.net/100/438/408/products/atk5076-dca-4.jpg?v=1690163649440',N'2023-12-20','SW40'),
('IMG176',N'https://bizweb.dktcdn.net/100/438/408/products/atk5159-moo-4-1.jpg?v=1690163658247',N'2023-12-20','SW41'),
('IMG177',N'https://bizweb.dktcdn.net/100/438/408/products/hdk5070-cb1-5.jpg?v=1690163628463',N'2023-12-20','SW42'),
('IMG178',N'https://bizweb.dktcdn.net/100/438/408/products/hdk5125-bee-5.jpg?v=1690163623043',N'2023-12-20','SW43');
------------Trousers--------------
insert into ProductIMG (IMGID, url,createDateIMG,productID) values
('IMG179',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jeans-nam-yody-qjm6061-xah-atm6o81-nav-1.jpg?v=1699004632973',N'2023-12-20','TR1'),
('IMG180',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jean-nam-qjm6065-xnh-4.jpg?v=1696645706360',N'2023-12-20','TR2'),
('IMG181',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jeans-nam-yody-qjm6023-xah-4.jpg?v=1699866341637',N'2023-12-20','TR3'),
('IMG182',N'https://bizweb.dktcdn.net/100/438/408/products/qjm6033-xdm-22-quan-jean-nam-yodyvn-11.jpg?v=1680936298093',N'2023-12-20','TR4'),
('IMG183',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jeans-nam-yody-qjm6037-xnh-gut6090-cvt-4.jpg?v=1696584608257',N'2023-12-20','TR5'),
('IMG184',N'https://bizweb.dktcdn.net/100/438/408/products/qjm6007-dek-1.jpg?v=1690163541437',N'2023-12-20','TR6'),
('IMG185',N'https://bizweb.dktcdn.net/100/438/408/products/qjm5005-xdm-13.jpg?v=1690163614863',N'2023-12-20','TR7'),
('IMG186',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jeans-nam-slim-cotton-usa-71-qjm5071-xdm-10.jpg?v=1690163603700',N'2023-12-20','TR8'),
('IMG187',N'https://bizweb.dktcdn.net/100/438/408/products/qjm5043-xah-3.jpg?v=1690163747417',N'2023-12-20','TR9'),
('IMG188',N'https://bizweb.dktcdn.net/100/438/408/products/qjm5021-xam-2.jpg?v=1690163755733',N'2023-12-20','TR10'),
('IMG189',N'https://bizweb.dktcdn.net/100/438/408/products/qjm5033-xah2.jpg?v=1690163834653',N'2023-12-20','TR11'),
('IMG190',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jean-nam-qjm6047-xtu-1.jpg?v=1702516998730',N'2023-12-20','TR12'),
('IMG191',N'https://bizweb.dktcdn.net/100/438/408/products/qjm6041-xad-1.jpg?v=1698896957127',N'2023-12-20','TR13'),
('IMG192',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jeans-nu-qjn6050-den-6.jpg?v=1690163450897',N'2023-12-20','TR14'),
('IMG193',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jean-nu-qjn4026-dek-6.jpg?v=1690163839010',N'2023-12-20','TR15'),
('IMG194',N'https://bizweb.dktcdn.net/100/438/408/products/qjn5084-xdm-2.jpg?v=1690163636007',N'2023-12-20','TR16'),
('IMG195',N'https://bizweb.dktcdn.net/100/438/408/products/qjn3126-den-tsn3792-tra-1.jpg?v=1645073399477',N'2023-12-20','TR17'),
('IMG196',N'https://bizweb.dktcdn.net/100/438/408/products/qjn4010-dni-apn3890-gre-2.jpg?v=1666165295057',N'2023-12-20','TR18'),
('IMG197',N'https://bizweb.dktcdn.net/100/438/408/products/qjn6018-xdm-aln6046-den-1.jpg?v=1698897080323',N'2023-12-20','TR19'),
('IMG198',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jeans-nu-qjn6038-xnh-4.jpg?v=1697538660760',N'2023-12-20','TR20'),
('IMG199',N'https://bizweb.dktcdn.net/100/438/408/products/qjn6034-xdm-3.jpg?v=1689039472177',N'2023-12-20','TR21'),
('IMG200',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jeans-nu-baggy-cap-chun-mem-mai-qjn5096-xah-yodyvn-1.jpg?v=1690163606107',N'2023-12-20','TR22'),
('IMG201',N'https://bizweb.dktcdn.net/100/438/408/products/qjn5068-xdm-4.jpg?v=1690163629327',N'2023-12-20','TR23'),
('IMG202',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jean-nu-qjn5094-xah-2-yodyvn.jpg?v=1681440224177',N'2023-12-20','TR24'),
('IMG203',N'https://bizweb.dktcdn.net/100/438/408/products/qjn5098-xdm-7.jpg?v=1690163653460',N'2023-12-20','TR25'),
('IMG204',N'https://bizweb.dktcdn.net/100/438/408/products/qjn5092-xdm-2.jpg?v=1690163653723',N'2023-12-20','TR26'),
('IMG205',N'https://bizweb.dktcdn.net/100/438/408/products/aln5032-tra-plus-qjn5102-xah-3.jpg?v=1690163662610',N'2023-12-20','TR27'),
('IMG206',N'https://bizweb.dktcdn.net/100/438/408/products/quan-jean-nu-qjn5066-xdm-plus-atn5170-tra-9-yodyvn.jpg?v=1690163739060',N'2023-12-20','TR28'),
('IMG207',N'https://bizweb.dktcdn.net/100/438/408/products/apk5207-bee-plus-qjk5033-den-14-3ae3d6a6-4205-4985-8ed1-e89f6ba318b1.jpg?v=1690163598660',N'2023-12-20','TR29'),
('IMG208',N'https://bizweb.dktcdn.net/100/438/408/products/qjk5043-xah-3.jpg?v=1690163604127',N'2023-12-20','TR30'),
('IMG209',N'https://bizweb.dktcdn.net/100/438/408/products/qjk6016-xdm-apk6024-tra-01.jpg?v=1701404057713',N'2023-12-20','TR31'),
('IMG210',N'https://bizweb.dktcdn.net/100/438/408/products/qjk5009-xdm-3.jpg?v=1690163836653',N'2023-12-20','TR32'),
('IMG211',N'https://bizweb.dktcdn.net/100/438/408/products/qjk5011-xah-kid4129-hog-10.jpg?v=1648128899957',N'2023-12-20','TR33');
------------Kitwears--------------
insert into ProductIMG (IMGID, url,createDateIMG,productID) values
('IMG212',N'https://bizweb.dktcdn.net/100/438/408/products/sbm5047-dgh-7.jpg?v=1681438493480',N'2023-12-20','KI1'),
('IMG213',N'https://bizweb.dktcdn.net/100/438/408/products/do-bo-the-thao-nam-sbm6043-trd-17.jpg?v=1690163439160',N'2023-12-20','KI2'),
('IMG214',N'https://bizweb.dktcdn.net/100/438/408/products/do-bo-nam-sbm6033-dee-4.jpg?v=1690163434223',N'2023-12-20','KI3'),
('IMG215',N'https://bizweb.dktcdn.net/100/438/408/products/sbm5003-xdu-9.jpg?v=1663561427727',N'2023-12-20','KI4'),
('IMG216',N'https://bizweb.dktcdn.net/100/438/408/products/btm5113-xar-03.jpg?v=1678352464133',N'2023-12-20','KI5'),
('IMG217',N'https://bizweb.dktcdn.net/100/438/408/products/sdm5003-den-4.jpg?v=1675313419640',N'2023-12-20','KI6'),
('IMG218',N'https://bizweb.dktcdn.net/100/438/408/products/bo-do-the-thao-nam-sbm6045-tr1-yody-11.jpg?v=1691124169317',N'2023-12-20','KI7'),
('IMG219',N'https://bizweb.dktcdn.net/100/438/408/products/sdm6061-den-5.jpg?v=1699243133870',N'2023-12-20','KI8'),
('IMG220',N'https://bizweb.dktcdn.net/100/438/408/products/bo-do-the-thao-nam-sdm6053-na1-1.jpg?v=1702893391173',N'2023-12-20','KI9'),
('IMG221',N'https://bizweb.dktcdn.net/100/438/408/products/sdm6091-xad-5.jpg?v=1702612799860',N'2023-12-20','KI10'),
('IMG222',N'https://bizweb.dktcdn.net/100/438/408/products/bo-do-the-thao-nam-yody-sdm6025-den-3-of-13.jpg?v=1697536076607',N'2023-12-20','KI11'),
('IMG223',N'https://bizweb.dktcdn.net/100/438/408/products/gub6002-bee-6.jpg?v=1698896850313',N'2023-12-20','KI12'),
('IMG224',N'https://bizweb.dktcdn.net/100/438/408/products/do-bo-nu-sbn6012-tca-8.jpg?v=1690163434637',N'2023-12-20','KI13'),
('IMG225',N'https://bizweb.dktcdn.net/100/438/408/products/btn6048-hgd-5.jpg?v=1700349623103',N'2023-12-20','KI14'),
('IMG226',N'https://bizweb.dktcdn.net/100/438/408/products/bdn6074-htg-3.jpg?v=1690163512837',N'2023-12-20','KI15'),
('IMG227',N'https://bizweb.dktcdn.net/100/438/408/products/bo-do-nu-sbn6016-dvn-4-of-13-yody.jpg?v=1689904629047',N'2023-12-20','KI16'),
('IMG228',N'https://bizweb.dktcdn.net/100/438/408/products/bo-do-nu-the-thao-sieu-nhe-yody-sbn6020-trx-4.jpg?v=1689907453377',N'2023-12-20','KI17'),
('IMG229',N'https://bizweb.dktcdn.net/100/438/408/products/bo-do-nu-sport-sbn6024-txu-3-of-13-yody.jpg?v=1689925869817',N'2023-12-20','KI18'),
('IMG230',N'https://bizweb.dktcdn.net/100/438/408/products/do-bo-nu-sdn6072-den-1.jpg?v=1701404589030',N'2023-12-20','KI19'),
('IMG231',N'https://bizweb.dktcdn.net/100/438/408/products/do-bo-nu-bdn6022-xde-4.jpg?v=1690163445160',N'2023-12-20','KI20'),
('IMG232',N'https://bizweb.dktcdn.net/100/438/408/products/bo-do-nu-bdn6028-bee-5-yodyvn.jpg?v=1681107270573',N'2023-12-20','KI21'),
('IMG233',N'https://bizweb.dktcdn.net/100/438/408/products/sbn5006-hog07.jpg?v=1656296847700',N'2023-12-20','KI22'),
('IMG234',N'https://bizweb.dktcdn.net/100/438/408/products/bo-do-the-thao-nu-yody-sdn6046-cdt-6.jpg?v=1699955045527',N'2023-12-20','KI23'),
('IMG235',N'https://bizweb.dktcdn.net/100/438/408/products/bo-thu-dong-dai-tay-tre-em-yody-btk6164-ghd-5-of-9.jpg?v=1698400274240',N'2023-12-20','KI24'),
('IMG236',N'https://bizweb.dktcdn.net/100/438/408/products/bo-do-tre-em-bdk6094-ddo-7.jpg?v=1690163498433',N'2023-12-20','KI25'),
('IMG237',N'https://bizweb.dktcdn.net/100/438/408/products/sbk6020-xah-16-bo-do-the-theo-tre-em-yody.jpg?v=1682475175637',N'2023-12-20','KI26'),
('IMG238',N'https://bizweb.dktcdn.net/100/438/408/products/bo-do-tre-em-bdk6204-xot-5.jpg?v=1690163501510',N'2023-12-20','KI27'),
('IMG239',N'https://bizweb.dktcdn.net/100/438/408/products/bo-do-tre-em-bdk6052-vag-1.jpg?v=1690163501720',N'2023-12-20','KI28'),
('IMG240',N'https://bizweb.dktcdn.net/100/438/408/products/bo-do-tre-em-bdk6074-tca-3-9648ae3c-4ee8-461e-a109-bc201b3a8534.jpg?v=1690163506377',N'2023-12-20','KI29'),
('IMG241',N'https://bizweb.dktcdn.net/100/438/408/products/btk5069-tht-5.jpg?v=1665818230247',N'2023-12-20','KI30'),
('IMG242',N'https://bizweb.dktcdn.net/100/438/408/products/bo-do-tre-em-btk6084-xlu-5.jpg?v=1698803307063',N'2023-12-20','KI31'),
('IMG243',N'https://bizweb.dktcdn.net/100/438/408/products/bdk6060-txo-bo-do-tre-em-yody-1.jpg?v=1689931743393',N'2023-12-20','KI32'),
('IMG244',N'https://bizweb.dktcdn.net/100/438/408/products/bdk6230-dn1-bo-do-tre-em-yody-2.jpg?v=1690163454790',N'2023-12-20','KI33'),
('IMG245',N'https://bizweb.dktcdn.net/100/438/408/products/bo-do-tre-em-bdk6186-xde-5-yody.jpg?v=1680924687880',N'2023-12-20','KI34'),
('IMG246',N'https://bizweb.dktcdn.net/100/438/408/products/bdk6130-tla-9-bo-do-tre-em-yody.jpg?v=1690163484743',N'2023-12-20','KI35'),
('IMG247',N'https://bizweb.dktcdn.net/100/438/408/products/bdk5081-be2-9.jpg?v=1690163643197',N'2023-12-20','KI36'),
('IMG248',N'https://bizweb.dktcdn.net/100/438/408/products/btk5003-xdm-17.jpg?v=1666057509777',N'2023-12-20','KI37');
-------------Accessories-------------
insert into ProductIMG (IMGID, url,createDateIMG,productID) values
('IMG249',N'https://bizweb.dktcdn.net/100/438/408/products/tui-unisex-the-thao-xach-tay-yody-tuu6012-den-2.jpg?v=1692770628893',N'2023-12-20','AC1'),
('IMG250',N'https://bizweb.dktcdn.net/100/438/408/products/tuu5005-den-2.jpg?v=1666062896967',N'2023-12-20','AC2'),
('IMG251',N'https://bizweb.dktcdn.net/100/438/408/products/khan-len-nu-phoi-ke-yody-khn6002-tik-atn6034-nav-qjn6038-xnh-2-of-4-1.jpg?v=1697509739913',N'2023-12-20','AC3'),
('IMG252',N'https://bizweb.dktcdn.net/100/438/408/products/phu-kien-nam-khac-tui-unisex-tuu6014-ddo-10.jpg?v=1690163385337	',N'2023-12-20','AC4'),
('IMG253',N'https://bizweb.dktcdn.net/100/438/408/products/muu6002-den-4.jpg?v=1683536013387',N'2023-12-20','AC5'),
('IMG254',N'https://bizweb.dktcdn.net/100/438/408/products/muu6008-den-2.jpg?v=1684916084903',N'2023-12-20','AC6'),
('IMG255',N'https://bizweb.dktcdn.net/100/438/408/products/tuu6016-xah-8.jpg?v=1685671395173',N'2023-12-20','AC7'),
('IMG256',N'https://bizweb.dktcdn.net/100/438/408/products/phu-kien-nam-muu6006-nav-2.jpg?v=1684918250157',N'2023-12-20','AC8'),
('IMG257',N'https://bizweb.dktcdn.net/100/438/408/products/phu-kien-nu-khac-tui-nu-tuu6018-tra-5.jpg?v=1685670973260',N'2023-12-20','AC9'),
('IMG258',N'https://bizweb.dktcdn.net/100/438/408/products/kinh-mat-nu-thoi-trang-kin6004-dch-2-yody.jpg?v=1686908918747',N'2023-12-20','AC10'),
('IMG259',N'https://bizweb.dktcdn.net/100/438/408/products/kinh-mat-nu-thoi-trang-kin6002-nau-1-yody.jpg?v=1685064601127',N'2023-12-20','AC11'),
('IMG260',N'https://bizweb.dktcdn.net/100/438/408/products/phu-kien-nu-khac-tui-unisex-tuu6008-dm1-1.jpg?v=1685671435523',N'2023-12-20','AC12'),
('IMG261',N'https://bizweb.dktcdn.net/100/438/408/products/phu-kien-nam-tui-unisex-tuu6006-dm1-5.jpg?v=1685671273853',N'2023-12-20','AC13'),
('IMG262',N'https://bizweb.dktcdn.net/100/438/408/products/mu-nam-vai-bo-mum5008-nav-5.jpg?v=1678528002797',N'2023-12-20','AC14'),
('IMG263',N'https://bizweb.dktcdn.net/100/438/408/products/mum5010-den-1-d2271825-0489-45cc-a1f9-105c48599bb1.jpg?v=1690164716197',N'2023-12-20','AC15'),
('IMG264',N'https://bizweb.dktcdn.net/100/438/408/products/mum5006-xde-10.jpg?v=1677315378490',N'2023-12-20','AC16'),
('IMG265',N'https://bizweb.dktcdn.net/100/438/408/products/tui-unisex-deo-cheo-da-pu-tuu5011-crd0-yodyvn.jpg?v=1670467649417',N'2023-12-20','AC17'),
('IMG266',N'https://bizweb.dktcdn.net/100/438/408/products/mtm4003-3.jpg?v=1648534013257',N'2023-12-20','AC18'),
('IMG267',N'https://bizweb.dktcdn.net/100/438/408/products/mtm4005-2.jpg?v=1648534112067',N'2023-12-20','AC19'),
('IMG268',N'https://bizweb.dktcdn.net/100/438/408/products/mtm4009-2.jpg?v=1648534300760',N'2023-12-20','AC20');
