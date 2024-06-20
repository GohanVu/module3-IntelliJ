delimiter //
drop procedure if exists `findAllCustomers`//
create procedure findAllCustomer()
begin
    select * from customers where customerNumber=175;
end //