#Buoc 3:
#Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
alter table products add index idx_productCode(productCode);

#Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
alter table products add index idx_productName_productPrice(productName,productPrice);

#Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products
where  productName like 'iPhone%' and productPrice> 2000000;

explain select * from products
where  productCode = 1002;

#So sánh câu truy vấn trước và sau khi tạo index
ALTER TABLE products DROP INDEX idx_productCode;
ALTER TABLE products DROP INDEX idx_productName_productPrice;

#Buoc 4
#Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view vw_ProductInfo as
select productCode, productName, productPrice
from products;

select *
from vw_productinfo;

#Tiến hành sửa đổi view
alter view vw_productinfo as
select productCode, productName, products.productStatus
from  products;

#Tiến hành xoá view
drop view vw_productinfo;

#Buoc 5
#Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
drop procedure if exists `DeleteProduct`//
create procedure getAllProducts()
begin
    select * from products;
end //
DELIMITER ;
CALL GetAllProducts();

#Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE AddNewProduct(
    IN id int ,
    IN productCode VARCHAR(50),
    IN productName VARCHAR(255),
    IN productPrice DECIMAL(18, 0),
    IN productAmount INT,
    IN productDescription TEXT,
    IN productStatus VARCHAR(50)
)
BEGIN
    INSERT INTO products (id,productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (id, productCode, productName, productPrice, productAmount, productDescription, productStatus);
END //
DELIMITER ;
CALL AddNewProduct(11,'1003', 'Sản phẩm mới', 15000000, 20, 'Mô tả sản phẩm mới', 'Còn hàng');

#Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE UpdateProduct(
    IN productID INT,
    IN productCode VARCHAR(50),
    IN productName VARCHAR(255),
    IN productPrice DECIMAL(18, 0),
    IN productAmount INT,
    IN productDescription TEXT,
    IN productStatus VARCHAR(50)
)
BEGIN
    UPDATE products
    SET
        productCode = productCode,
        productName = productName,
        productPrice = productPrice,
        productAmount = productAmount,
        productDescription = productDescription,
        productStatus = productStatus
    where id = productID;
END //
DELIMITER ;
CALL UpdateProduct(1, '1003', 'Sản phẩm mới cập nhật', 16000000, 15, 'Mô tả sản phẩm mới đã cập nhật', 'Hết hàng tạm thời');

#Tạo store procedure xoá sản phẩm theo id
DELIMITER //

CREATE PROCEDURE DeleteProduct(
    IN productID INT
)
BEGIN
    DELETE FROM products
    WHERE id = productID;
END //

DELIMITER ;

call DeleteProduct(11);

select *
from products;

