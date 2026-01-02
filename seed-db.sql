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
Category TEXT,
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
	
insert into menuitem (name, price, category, image) values
	('Espresso', 2.00, 'Hot Coffee', 'espressoUrl'),
	('Cappuccino', 2.30, 'Hot Coffee', 'cappuccinoUrl'),
	('Flat White', 2.50, 'Hot Coffee', 'flatWhiteUrl'),
	('Latte', 3.00, 'Hot Coffee', 'latteUrl'),

	('Freddo Espresso', 2.00, 'Cold Coffee', 'freddoEspressoUrl'),
	('Freddo Cappuccino', 2.30, 'Cold Coffee', 'freddoCapuccinoUrl'),
	('Cold Brew', 2.50, 'Cold Coffee', 'coldBrewUrl'),
	('Iced Latte', 3.50, 'Cold Coffee', 'icedLatteUrl'),

	('Black Tea', 2.00, 'Tea', 'blackTeaUrl'),
	('Green Tea', 2.00, 'Tea', 'greenTeaUrl'),
	('Jasmine Tea', 2.00, 'Tea', 'jasmineTeaUrl'),
	('Matcha Tea', 2.00, 'Tea', 'matchaTeaUrl'),

	('Chocolate', 2.00, 'Chocolate', 'chocolateUrl'),
	('White Chocolate', 2.50, 'Chocolate', 'whiteChocolateUrl'),
	('Dark Chocolate', 2.50, 'Chocolate', 'darkChocolateUrl'),

	('Fresh Organge Juice', 2.00, 'Beverages', 'orangeJuiceUrl'),
	('Fresh Lemonade', 2.50, 'Beverages', 'lemonadeUrl'),
	('Sparkling Water', 2.00, 'Beverages', 'sparklingWaterUrl'),

	('Grilled Cheese', 2.00, 'Salty Snacks', 'grilledCheseUrl'),
	('Spanakopita', 2.50, 'Salty Snacks', 'spanakopitaUrl'),
	('Avocado Toast', 3.00, 'Salty Snacks', 'avocadoToastUrl'),
	('Ham & Cheese Croissant', 2.50, 'Salty Snacks', 'saltyCroissantUrl'),

	('Pain au chocolate', 2.00, 'Sweet Snacks', 'painChocolateUrl'),
	('Banana Bread', 2.50, 'Sweet Snacks', 'bananaBreadUrl'),
	('Blueberry Scones', 2.00, 'Sweet Snacks', 'bluberrySconesUrl'),
	('Brownies', 2.50, 'Sweet Snacks', 'browniesUrl');


	




