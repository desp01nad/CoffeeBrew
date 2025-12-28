create table Customer (
CustomerId SERIAL primary key,
FirstName TEXT not null,
LastName TEXT not null,
Email TEXT unique not null,
Phone VARCHAR(20),
Password TEXT not NULL
);

create table MenuItem (
ItemId SERIAL primary key,
Name TEXT not null,
Price DECIMAL(12,2) not null,
Image TEXT
);

create table CustomerOrder (
OrderId SERIAL primary key,
CustomerId INT,
OrderedAt TIMESTAMP default NOW(),

constraint FK_CustomerOrder_Customer
	foreign KEY(CustomerId)
	references Customer(CustomerId)
);

create table OrderedItem (
OrderedItemId SERIAL primary key,
ItemId INT,
Amount INT,
OrderId INT,

constraint FK_OrderedItem_MenuItem
	foreign KEY(ItemId)
	references MenuItem(ItemId),
	
constraint FK_OrderedItem_CustomerOrder
	foreign key(OrderId)
	REFERENCES CustomerOrder(OrderId)
);

create table Favorite (
FavoriteId SERIAL primary key,
CustomerId INT,
ItemId INT,

constraint FK_Favorite_Customer
	foreign KEY(CustomerId)
	references Customer(CustomerId),
	
	constraint FK_Favorite_MenuItem
	foreign KEY(ItemId)
	references MenuItem(ItemId)
);

insert into customer (firstname, lastname, email, phone, password) values
	('Admin', 'Admin', 'admin@admin.com', '123456789', '12345');
	
insert into menuitem (name, price, image) values
	('Cappuccino', '2.50', 'cappuccinoUrl'),
	('Latte', '3.00', 'latteUrl');
	




