create table bill ( bill_id number(20) not null, 
					generation_date timestamp not null, 
					subtotal number(17,2) not null, 
					shipping_cost number(7,2) not null, 
					total_price number(17,2) not null, 
					CONSTRAINT bill_constraint PRIMARY KEY (bill_id));
					
create table delivery_detail (  delivery_detail_id number(20) not null, 
								direction varchar2(50) not null,
								delivery_detail_status varchar2(30) not null, 
								guide_number number(20) not null, 
								transportation_company varchar2(50) not null, 
								CONSTRAINT delivery_detail_constraint PRIMARY KEY (delivery_detail_id));
								
create table product (  product_id number(6) not null, 
						description varchar(200) not null, 
						product_cost number(17,2) not null, 
						CONSTRAINT product_constraint PRIMARY KEY (product_id));
						
create table purchase_order (	purchase_order_id number(20) not null, 
								client_id number(10) not null, 
								order_date timestamp not null, 
								direction varchar(50) not null, 
								bill_id number(20) not null REFERENCES bill(bill_id), 
								delivery_detail_id number(20) not null REFERENCES delivery_detail(delivery_detail_id), 
								CONSTRAINT order_constraint PRIMARY KEY (purchase_order_id));
								
create table product_by_order ( purchase_order_id number(20) not null REFERENCES purchase_order(purchase_order_id), 
								product_id number(6) not null REFERENCES product(product_id), 
								CONSTRAINT product_by_order_constraint PRIMARY KEY (purchase_order_id, product_id));

CREATE SEQUENCE bill_sequence
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
CREATE SEQUENCE product_sequence
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
 CREATE SEQUENCE purchase_order_sequence
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
 CREATE SEQUENCE delivery_detail_sequence
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

insert into product (product_id, description, product_cost) values (product_sequence.nextval, 'Polo T-shirt', 50000);
insert into product (product_id, description, product_cost) values (product_sequence.nextval, 'Blue Jeans', 70000);

commit;

select * from bill;
select * from delivery_detail;
select * from purchase_order;
select * from product;
select * from product_by_order;

