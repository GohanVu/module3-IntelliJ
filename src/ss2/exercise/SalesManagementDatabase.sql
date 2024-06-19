create database ss1_exercise_sale_management;

use ss1_exercise_sale_management;

create  table customers(
    cID int primary key auto_increment,
    cName varchar(100) not null ,
    cAge int
);
create table products (
    pID int primary key auto_increment,
    pName varchar(100) not null ,
    pPrice decimal(10,2) not null
);
create table orders (
    oID int primary key,
    cID int not null,
    oDate date not null ,
    oTotalPrice decimal(10,2) not null,
    foreign key (cID) references customers(cID)
);
create table orderDetails (
    oID int ,
    pID int,
    odQTY int not null ,
    primary key (oID,pID),
    foreign key (oID) references orders(oID),
    foreign key (pID) references products(pID)
);
alter table orders
modify column oTotalPrice decimal(10,2);