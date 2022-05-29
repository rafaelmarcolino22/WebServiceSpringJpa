create table payment (moment timestamp, order_id int8 not null, primary key (order_id));
create table product_category (product_id int8 not null, category_id int8 not null, primary key (product_id, category_id));
create table tb_category (id int8 generated by default as identity, name varchar(255), primary key (id));
create table tb_order (id int8 generated by default as identity, moment timestamp, order_status int4, cliente_id int8, primary key (id));
create table tb_order_item (price float8, quantity int4, product_id int8 not null, order_id int8 not null, primary key (order_id, product_id));
create table tb_product (id int8 generated by default as identity, desciption varchar(255), img_url varchar(255), name varchar(255), price float8, primary key (id));
create table tb_users (id int8 generated by default as identity, email varchar(255), name varchar(255), password varchar(255), phone varchar(255), primary key (id));
alter table if exists payment add constraint FKldxyfrkgocxt41phgejfxwck4 foreign key (order_id) references tb_order;
alter table if exists product_category add constraint FK2incqmxabucegvya2ji9ytfhl foreign key (category_id) references tb_category;
alter table if exists product_category add constraint FKgsymqnqga2qdjc84tj0m71u3s foreign key (product_id) references tb_product;
alter table if exists tb_order add constraint FKbbg9llyx79irsodjgvx82mydt foreign key (cliente_id) references tb_users;
alter table if exists tb_order_item add constraint FK4h5xid5qehset7qwe5l9c997x foreign key (product_id) references tb_product;
alter table if exists tb_order_item add constraint FKgeobgl2xu916he8vhljktwxnx foreign key (order_id) references tb_order;
