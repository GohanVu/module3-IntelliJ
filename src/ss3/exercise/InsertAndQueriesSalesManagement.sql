use ss1_exercise_sale_management;
insert into customers values (1,'Minh Quan', 10);
insert into customers values (2,'Ngoc Oanh', 20);
insert into customers values (3,'Hong Ha', 50);

insert into products(pName, pPrice) values ('May Giat',3);
insert into products(pName, pPrice) values ('Tu Lanh',5);
insert into products(pName, pPrice) values ('Dieu Hoa',7);
insert into products(pName, pPrice) values ('Quat',1);
insert into products(pName, pPrice) values ('Bep Dien',2);

insert into orders values (1,1,'2006-03-21',100.23);
insert into orders values (2,2,'2006-03-23',99.02);
insert into orders values (3,1,'2006-03-16',110);

# update orders
# set oTotalPrice = null;

insert into orderdetails values (1,1,3);
insert into orderdetails values (1,3,7);
insert into orderdetails values (1,4,2);
insert into orderdetails values (2,1,1);
insert into orderdetails values (3,1,8);
insert into orderdetails values (2,5,4);
insert into orderdetails values (2,3,3);

#Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o.oID, o.oDate, o.oDate, o.oTotalPrice
from orders o;
#Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select  o.oID , c.cName, p.pName
from orders o
join customers c on o.cID = c.cID
join orderdetails od on o.cID = od.oID
join products p on od.pID = p.pID;
#Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.cName
from customers c
left join orders o on c.cID = o.cID
where o.cID is null;

select cName
from customers
where cID not in (select  distinct cID from orders);
#Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng
# giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select o.oID, o.oDate,sum(odQTY*p.pPrice) as totalPrice
from orders o
left join orderdetails od on  o.oID = od.oID
left join products p on p.pID = od.pID
group by o.oID, o.oDate;

