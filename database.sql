USE master;
GO
IF DB_ID('ShoppingServiceMVC') IS NOT NULL
BEGIN
    ALTER DATABASE ShoppingServiceMVC SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE ShoppingServiceMVC;
END
GO

CREATE DATABASE ShoppingServiceMVC;
GO
USE ShoppingServiceMVC;
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Category(
    [cate_id] [int] IDENTITY(1,1) NOT NULL,
    [cate_name] [nvarchar](255) NOT NULL,
    [icons] [nvarchar](255) NULL,
    PRIMARY KEY CLUSTERED ([cate_id] ASC)
);
GO

CREATE TABLE [User](
    [id] [int] IDENTITY(1,1) NOT NULL,
    [email] [nvarchar](255) NOT NULL,
    [username] [nvarchar](100) NOT NULL,
    [fullname] [nvarchar](255) NULL,
    [password] [nvarchar](255) NOT NULL,
    [avatar] [nvarchar](255) NULL,
<<<<<<< HEAD
    [roleid] [int] NOT NULL DEFAULT(5), 
    [phone] [nvarchar](20) NULL,
    [createddate] [date] NULL,
    [active] [bit] NOT NULL DEFAULT(0),    
    [otp_code] [nvarchar](10) NULL,         
    [otp_expire] [datetime] NULL,           
=======
    [roleid] [int] NOT NULL DEFAULT(5),
    [phone] [nvarchar](20) NULL,
    [createddate] [date] NULL,
    [active] [bit] NOT NULL DEFAULT(0),
    [otp_code] [nvarchar](10) NULL, 
    [otp_expire] [datetime] NULL,   
>>>>>>> d3a050e200cb6982035a6ecda182116a06b2a67a
    PRIMARY KEY CLUSTERED ([id] ASC)
);
GO

CREATE TABLE Products(
    [product_id] [int] IDENTITY(1,1) NOT NULL,
    [product_name] [nvarchar](255) NOT NULL,
    [price] [decimal](18,2) NOT NULL DEFAULT(0),
    [description] [nvarchar](max) NULL,
    [image] [nvarchar](255) NULL,
    [quantity] [int] NOT NULL DEFAULT(0),
    [createddate] [datetime] NOT NULL DEFAULT(GETDATE()),
    [cate_id] [int] NOT NULL,
    PRIMARY KEY CLUSTERED ([product_id] ASC),
    CONSTRAINT FK_Products_Category FOREIGN KEY ([cate_id]) REFERENCES Category([cate_id])
);
GO

INSERT INTO [User](email, username, fullname, password, avatar, roleid, phone, createddate, active)
VALUES (N'admin@gmail.com', N'admin', N'Quản trị viên', N'123456', NULL, 1, N'0900000000', GETDATE(), 1);

INSERT INTO [User](email, username, fullname, password, avatar, roleid, phone, createddate, active)
VALUES (N'user@gmail.com', N'user01', N'Nguyễn Văn A', N'123456', NULL, 5, N'0900000001', GETDATE(), 1);

INSERT INTO Category(cate_name, icons) VALUES (N'Quần Áo Nam', N'https://i.ibb.co/HZPS59m/22985426e3d4.jpg');
INSERT INTO Category(cate_name, icons) VALUES (N'Quần Áo Nữ', N'https://i.ibb.co/8n0Gwr1d/98f3340ca306.jpg');
INSERT INTO Category(cate_name, icons) VALUES (N'Giày Dép', N'https://i.ibb.co/BHmfYjqw/c0efcdf63722.jpg');
INSERT INTO Category(cate_name, icons) VALUES (N'Túi Xách', N'https://i.ibb.co/rGNm2Jm4/6d5cfb58d7f8.jpg');
INSERT INTO Category(cate_name, icons) VALUES (N'Phụ Kiện', N'https://i.ibb.co/492RpKX/240b866263c4.jpg');
INSERT INTO Category(cate_name, icons) VALUES (N'Đồng Hồ', N'https://i.ibb.co/QFNbnS9m/f8316f90a417.jpg');
GO

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Áo sơ mi nam trắng', 259000, N'Áo sơ mi nam form regular, vải cotton thoáng mát.', N'https://i.ibb.co/V0Kzx3pj/cb694badd5cf.webp', 50, GETDATE(), 1);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Quần jean nam xanh', 399000, N'Quần jean nam ống suông, phong cách trẻ trung.', N'https://i.ibb.co/wrFQdtg4/aadad95e9999.webp', 30, GETDATE(), 1);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Áo thun nam basic', 149000, N'Áo thun cotton 100%, form regular fit, nhiều màu.', N'https://i.ibb.co/DjJ9Jd2/c9c38b3d2a06.jpg', 80, GETDATE(), 1);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Áo khoác nam denim', 459000, N'Áo khoác jean nam form rộng, phối đồ dễ dàng.', N'https://i.ibb.co/MxNt7TKy/b8f7d7d95bdf.jpg', 25, GETDATE(), 1);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Đầm suông nữ', 329000, N'Đầm suông thanh lịch, phù hợp đi làm và dạo phố.', N'https://i.ibb.co/Pvy252bJ/c35bf2e3e77f.webp', 40, GETDATE(), 2);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Chân váy xếp ly', 219000, N'Chân váy xếp ly nữ tính, chất liệu voan mềm mại.', N'https://i.ibb.co/vCkJP86K/3733c38a9658.webp', 25, GETDATE(), 2);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Áo blazer nữ', 499000, N'Áo blazer công sở form vừa, thanh lịch, dễ phối.', N'https://i.ibb.co/xtVv9RQw/28a1d23a3ba3.jpg', 20, GETDATE(), 2);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Quần jogger nữ', 259000, N'Quần jogger nữ năng động, co giãn thoải mái.', N'https://i.ibb.co/1GF4qYPp/4b1fb186c495.jpg', 35, GETDATE(), 2);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Giày sneaker trắng', 599000, N'Giày sneaker unisex, đế êm, dễ phối đồ.', N'https://i.ibb.co/1f8xpCp9/7cb6308626f1.jpg', 20, GETDATE(), 3);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Dép quai ngang', 149000, N'Dép quai ngang nam nữ, chất liệu cao su bền đẹp.', N'https://i.ibb.co/MxrMnymb/9c0167be4aad.jpg', 60, GETDATE(), 3);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Giày cao gót nữ', 449000, N'Giày cao gót 5cm, thiết kế thanh lịch, êm chân.', N'https://i.ibb.co/TqKWm9mx/f443429c1374.jpg', 18, GETDATE(), 3);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Giày thể thao nam', 549000, N'Giày thể thao nam đế cao su chống trượt.', N'https://i.ibb.co/Xk4CrzTM/8b349c1927b2.webp', 28, GETDATE(), 3);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Túi tote vải', 189000, N'Túi tote vải canvas, rộng rãi, tiện dụng hàng ngày.', N'https://i.ibb.co/wfVyF0V/46e95bf363da.webp', 45, GETDATE(), 4);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Túi đeo chéo mini', 259000, N'Túi đeo chéo mini nữ, thiết kế nhỏ gọn, thời trang.', N'https://i.ibb.co/tMyTCbmX/22fce425fe9d.jpg', 30, GETDATE(), 4);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Balo laptop', 379000, N'Balo đựng laptop 15.6 inch, chống nước, nhiều ngăn.', N'https://i.ibb.co/VcRTv89s/fcb565ee2155.jpg', 22, GETDATE(), 4);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Ví da nam', 229000, N'Ví da nam cao cấp, nhiều ngăn đựng thẻ.', N'https://i.ibb.co/Tq7ckB97/7076f1ff43ee.jpg', 40, GETDATE(), 4);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Mũ lưỡi trai', 99000, N'Mũ lưỡi trai unisex, chất liệu kaki bền đẹp.', N'https://i.ibb.co/MkSL1Jyc/e90bb5dd1b9a.jpg', 70, GETDATE(), 5);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Kính mát unisex', 179000, N'Kính mát chống UV, phong cách hiện đại.', N'https://i.ibb.co/QvKqT1Gb/0d5891dd65e0.jpg', 35, GETDATE(), 5);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Thắt lưng da', 199000, N'Thắt lưng da nam mặt khóa kim loại chắc chắn.', N'https://i.ibb.co/VpYVMLyB/6710ba3ceeb3.jpg', 32, GETDATE(), 5);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Khăn choàng cổ', 129000, N'Khăn choàng cổ mềm mại, giữ ấm mùa đông.', N'https://i.ibb.co/wZWFv63M/c5c8352b6f1c.webp', 26, GETDATE(), 5);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Đồng hồ nam dây da', 899000, N'Đồng hồ nam dây da thật, mặt kính chống trầy.', N'https://i.ibb.co/ZzjSCBK0/3efec3fd4c13.webp', 15, GETDATE(), 6);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Đồng hồ nữ mặt tròn', 749000, N'Đồng hồ nữ mặt tròn tối giản, dây thép không gỉ.', N'https://i.ibb.co/cmCBJMM/88c4cbfb486c.webp', 18, GETDATE(), 6);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Đồng hồ thể thao', 649000, N'Đồng hồ thể thao chống nước, bấm giờ chính xác.', N'https://i.ibb.co/Fq8rd9X0/20acd6820414.jpg', 24, GETDATE(), 6);

INSERT INTO Products(product_name, price, description, image, quantity, createddate, cate_id)
VALUES (N'Đồng hồ thông minh', 1290000, N'Smartwatch theo dõi sức khỏe, kết nối Bluetooth.', N'https://i.ibb.co/JRkvNTdV/11f097aeac4d.webp', 12, GETDATE(), 6);
GO

