#Tham số loại IN
delimiter //
create procedure getCusById
(IN cusNum int(11))
begin
    select * from customers where customerNumber = cusNum;
end //
delimiter ;

call getCusById(175);

#Tham số loại OUT
delimiter //
create  procedure GetCustomersCountByCity(
    in in_city varchar(50),
    out total int
)
begin
    select count(customerNumber)
    into total
    from  customers
    where city = in_city;
end //
delimiter ;

call GetCustomersCountByCity('Lyon',@total);
select @total

#Tham số loại INOUT

DELIMITER //
CREATE PROCEDURE SetCounter(
    INOUT counter INT,
    IN inc INT
)
BEGIN
    SET counter = counter + inc;
END//
DELIMITER ;
set @counter = 1;
call SetCounter(@counter,1);
call SetCounter(@counter,1);
call SetCounter(@counter,5);
select @counter
