create database shopping;
use shopping;

create table shopping_user(
	useremail varchar(300) primary key,
    userpw varchar(300) not null,
    username varchar(300),
    userphone varchar(300),
    postnum varchar(300),
    addr varchar(1000),
    detailaddress varchar(3000),
    seealso varchar(1000)
);
select * from shopping_user;
drop table shopping_user;

create table product(
	productnum int primary key auto_increment,
    productname varchar(300),
    productprice varchar(300),
    productcontents varchar(6000),
	useremail varchar(300),
    constraint user_product foreign key(useremail) references shopping_user(useremail)
);

create table files(
	productnum int,
	filerealname varchar(3000),
    filename varchar(3000),
    fileurl varchar(3000),
    safefile varchar(6000),
    constraint product_files foreign key(productnum) references product(productnum)
);

create table buyproduct(
	useremail varchar(300),
    productnum int,
    productname varchar(300),
	postnum int,
	addr varchar(1000),
    detailaddress varchar(3000),
    seealso varchar(1000)
);
select * from buyproduct;

drop table buyproduct;
select * from files; 
drop table product;
select * from product;
select * from files;
drop table files;
