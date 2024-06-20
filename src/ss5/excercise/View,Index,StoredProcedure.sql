create table products(
    id int primary key ,
    productCode int not null,
    productName varchar(50) not null ,
    productPrice int not null ,
    productAmount int,
    productDescription varchar(255),
    productStatus varchar(100)
);

insert into products values (1,1001,'iPhone 15 Pro Max',35000000,50,'Điện thoại thông minh cao cấp của Apple','Còn hàng');
insert into products values (2,1002,'Samsung Galaxy S23 Ultra',28000000,30,'Điện thoại Android hàng đầu của Samsung','Hết hàng tạm thời');
insert into products values (3,2001,'MacBook Pro M3',45000000,20,'Máy tính xách tay mạnh mẽ của Apple','Còn hàng');
insert into products values (4,2002,'Dell XPS 13 Plus',32000000,15,'Máy tính xách tay mỏng nhẹ, hiệu năng cao của Del','Còn hàng');
insert into products values (5,3001,'Apple Watch Series 9',12000000,80,'Đồng hồ thông minh thế hệ mới của Apple','Mới về');
insert into products values (6,3002,'Samsung Galaxy Watch 6',8000000,60,'Đồng hồ thông minh đa năng của Samsung	','Còn hàng');
insert into products values (7,4001,'AirPods Pro 2',6000000,100,'Tai nghe không dây cao cấp của Apple','Đang khuyến mãi');
insert into products values (8,4002	,'Sony WH-1000XM5',9000000,40,'Tai nghe chống ồn hàng đầu của Sony','Còn hàng');
insert into products values (9,5001,'iPad Air 5',15000000,25,'Máy tính bảng đa năng của Apple','Ngừng kinh doanh');
insert into products values (10,5002,'Samsung Galaxy Tab S9',18000000,35,'Máy tính bảng Android cao cấp của Samsung','Sắp ra mắt');



