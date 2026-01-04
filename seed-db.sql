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
SelectedAddress TEXT,
TotalCost DECIMAL(12,2) not null,

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
	('Admin', 'Admin', 'admin@admin.com', '123456789', '$2a$10$98LA6/cJad0pFu3kc8EP.OfIjU3ErDsiULM2zergfjO4MvkzU5QVe');
	
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
	('Brownies', 2.50, 'Sweet Snacks', 'browniesUrl'),

    ('1+1 Cappuccino', 2.30, 'Promotion', 'cappuccino_offer.jpg'),
    ('30% off Latte', 2.10, 'Promotion', 'latte.jpg'),
    ('Combo! Cappuccino & Brownies', 4.50, 'Promotion', 'combo_brownie.jpg');

insert into CustomerOrder (CustomerId, SelectedAddress, TotalCost) values
	(1, 'myAddress1' , 9),
	(1, 'myAddress2' , 2.5),
	(1, 'myAddress1' , 15.5),
	(1, 'myAddress3' , 23.3),
	(1, 'myAddress2' , 30.5);

insert into Favorite (CustomerId, ItemId) values
	(1, 1),
	(1, 2),
	(1, 15);

insert into OrderedItem (OrderId, ItemId, Amount) values
	(1, 1, 2),
	(1, 3, 1),
	(1, 15, 1),
	(2, 3, 1),
	(3, 7, 3),
	(3, 9, 4),
	(4, 12, 5),
	(4, 2, 1),
	(4, 21, 3),
	(4, 9, 1),
	(5, 8, 7),
	(5, 21, 2);





