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
	('Espresso', 2.00, 'Hot Coffee', '/menu-images/espresso.jpg'),
	('Cappuccino', 2.30, 'Hot Coffee', '/menu-images/cappuccino.jpg'),
	('Flat White', 2.50, 'Hot Coffee', '/menu-images/flat-white.jpg'),
	('Latte', 3.00, 'Hot Coffee', '/menu-images/latte.jpg'),

	('Freddo Espresso', 2.00, 'Cold Coffee', '/menu-images/freddo-espresso.jpg'),
	('Freddo Cappuccino', 2.30, 'Cold Coffee', '/menu-images/freddo-cappuccino.jpg'),
	('Cold Brew', 2.50, 'Cold Coffee', '/menu-images/cold-brew.jpg'),
	('Iced Latte', 3.50, 'Cold Coffee', '/menu-images/iced-latte.jpg'),

	('Black Tea', 2.00, 'Tea', '/menu-images/black-tea.jpg'),
	('Green Tea', 2.00, 'Tea', '/menu-images/green-tea.jpg'),
	('Jasmine Tea', 2.00, 'Tea', '/menu-images/jasmine-tea.jpg'),
	('Matcha Tea', 2.00, 'Tea', '/menu-images/matcha-tea.jpg'),

	('Chocolate', 2.00, 'Chocolate', '/menu-images/chocolate.jpg'),
	('White Chocolate', 2.50, 'Chocolate', '/menu-images/white-chocolate.jpg'),
	('Dark Chocolate', 2.50, 'Chocolate', '/menu-images/dark-chocolate.jpg'),

	('Fresh Orange Juice', 2.00, 'Beverages', '/menu-images/fresh-orange-juice.jpg'),
	('Fresh Lemonade', 2.50, 'Beverages', '/menu-images/fresh-lemonade.jpg'),
	('Sparkling Water', 2.00, 'Beverages', '/menu-images/sparkling-water.jpg'),

	('Grilled Cheese', 2.00, 'Salty Snacks', '/menu-images/grilled-cheese.jpg'),
	('Spanakopita', 2.50, 'Salty Snacks', '/menu-images/spanakopita.jpg'),
	('Avocado Toast', 3.00, 'Salty Snacks', '/menu-images/avocado-toast.jpg'),
	('Ham & Cheese Croissant', 2.50, 'Salty Snacks', '/menu-images/ham-cheese-croissant.jpg'),

	('Pain au chocolat', 2.00, 'Sweet Snacks', '/menu-images/pain-au-chocolat.jpg'),
	('Banana Bread', 2.50, 'Sweet Snacks', '/menu-images/banana-bread.jpg'),
	('Blueberry Scones', 2.00, 'Sweet Snacks', '/menu-images/blueberry-scones.jpg'),
	('Brownies', 2.50, 'Sweet Snacks', '/menu-images/brownies.jpg'),

	('1+1 Cappuccino', 2.30, 'Promotion', '/menu-images/cappuccino.jpg'),
	('30% off Latte', 2.10, 'Promotion', '/menu-images/latte.jpg'),
	('Combo! Cappuccino & Brownies', 4.50, 'Promotion', '/menu-images/combo-cappuccino-brownies.jpg');

insert into CustomerOrder (CustomerId, SelectedAddress, TotalCost) values
	(1, 'Mitropoleos 3, Athens 105 57', 9),
	(1, 'Patriarchou Ioakim 15, Athens 106 75', 2.5),
	(1, 'Mitropoleos 3, Athens 105 57', 15.5),
	(1, 'Ermou 85, Athens 105 55', 23.3),
	(1, 'Patriarchou Ioakim 15, Athens 106 75', 30.5);

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
