CREATE DATABASE CSTI_CORP
GO

USE CSTI_CORP
GO

CREATE TABLE TB_CLIENTE(
	id INT IDENTITY(1,1),
	nombre VARCHAR(100),
	estado BIT
	PRIMARY KEY(id)
)
GO

CREATE TABLE TB_PRODUCTO(
	id INT IDENTITY(1,1),
	nombre VARCHAR(100),
	estado BIT,
	PRIMARY KEY(id)
)
GO

CREATE TABLE TB_PEDIDO(
	id INT IDENTITY(1,1),
	idCliente INT,
	nombreCliente VARCHAR(100),
	fechaPedido DATETIME,
	observacion VARCHAR(500),
	total DECIMAL(10,2),
	estado INT,
	PRIMARY KEY(id),
	FOREIGN KEY (idCliente) REFERENCES TB_CLIENTE(id),
)
GO

CREATE TABLE TB_PEDIDO_DETALLE(
	idPedido INT,
	idProducto INT,
	cantidad INT,
	precio DECIMAL(10,2),
	PRIMARY KEY(idPedido, idProducto),
	FOREIGN KEY (idPedido) REFERENCES TB_PEDIDO(id),
	FOREIGN KEY (idProducto) REFERENCES TB_PRODUCTO(id),
)
GO

IF NOT EXISTS(SELECT 1 FROM dbo.TB_CLIENTE WITH(NOLOCK))
BEGIN
	insert into TB_CLIENTE (nombre, estado) values ('Kwinu', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Myworks', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Jaxworks', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Yombu', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Edgeclub', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Miboo', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Wordify', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Buzzster', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Centizu', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Meetz', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Jayo', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Meedoo', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Vipe', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Meezzy', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Leexo', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Brainsphere', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Lajo', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Gabtype', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Mita', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Edgeblab', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Oyope', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Twitterbridge', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Kazu', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Skimia', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Jabbertype', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Camido', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Voonyx', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Jabberstorm', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Centidel', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Brightbean', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Yadel', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Talane', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Lajo', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Yakidoo', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Thoughtbeat', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Feednation', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Dabfeed', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Topiczoom', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Photolist', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Eare', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Voolith', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Eadel', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Wordify', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Brainsphere', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Photobug', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Skalith', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Geba', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Kazu', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Twitternation', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Camido', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Centimia', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Ntag', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Tavu', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Ozu', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Jazzy', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Voonte', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Muxo', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Bluejam', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Rhyloo', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Gigabox', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Zoomcast', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Topdrive', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Skimia', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Jamia', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Photolist', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Devbug', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Rhyzio', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Meevee', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Latz', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Flashdog', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Bubbletube', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Eimbee', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Skaboo', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Tagtune', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Blogpad', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Rhyloo', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Bluejam', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Tagcat', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Centizu', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Devify', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Brightbean', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Skinix', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Teklist', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Kayveo', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Viva', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Avaveo', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Fanoodle', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Vitz', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Tagchat', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Ainyx', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Roomm', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Quinu', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Wikivu', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Fadeo', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Innojam', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Divavu', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Zoozzy', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Jabberbean', 1);
	insert into TB_CLIENTE (nombre, estado) values ('Centizu', 0);
	insert into TB_CLIENTE (nombre, estado) values ('Leexo', 1);
END

IF NOT EXISTS(SELECT 1 FROM dbo.TB_CLIENTE WITH(NOLOCK))
BEGIN
	insert into TB_PRODUCTO(nombre, estado) values ('Ice Cream - Fudge Bars', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Water - Green Tea Refresher', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Pears - Bartlett', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Gatorade - Xfactor Berry', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Sauce - Chili', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Soup - Knorr, Veg / Beef', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Veal - Tenderloin, Untrimmed', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Beef - Rib Eye Aaa', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Miso - Soy Bean Paste', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Myers Planters Punch', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Bread - Rye', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Paste - Black Olive', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Sproutsmustard Cress', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Water - Green Tea Refresher', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Tilapia - Fillets', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Vinegar - Raspberry', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Wine - German Riesling', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Energy Drink', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Amarula Cream', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Peach - Halves', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Pur Value', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Kellogs Raisan Bran Bars', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Flour - Strong', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Lettuce - Escarole', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Chicken - Livers', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Cheese - Parmesan Grated', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Garlic - Primerba, Paste', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Hand Towel', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Otomegusa Dashi Konbu', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Tea - Earl Grey', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Apple - Delicious, Golden', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Basil - Primerba, Paste', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Arctic Char - Fillets', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Icecream - Dibs', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Beans - Navy, Dry', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Oil - Sesame', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Apricots - Dried', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Garbage Bags - Clear', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Soup - Campbells, Chix Gumbo', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Energy Drink - Franks Pineapple', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Coriander - Ground', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Truffle Cups - Brown', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Pepper - Green, Chili', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Juice - Clamato, 341 Ml', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Flour - Strong', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Wine - Magnotta - Red, Baco', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Muffin - Mix - Bran And Maple 15l', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Pork - Smoked Back Bacon', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Wine - Gato Negro Cabernet', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Capon - Whole', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Chutney Sauce - Mango', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Canada Dry', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Jam - Blackberry, 20 Ml Jar', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Energy Drink - Franks Pineapple', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Baking Powder', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Dried Figs', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('White Fish - Filets', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Dr. Pepper - 355ml', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Dawn Professionl Pot And Pan', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Icecream Bar - Del Monte', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Muffin Batt - Carrot Spice', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Turkey - Breast, Boneless Sk On', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Horseradish Root', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Yeast Dry - Fermipan', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Foil Cont Round', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Oil - Olive, Extra Virgin', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Bread - Sour Batard', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Wine - Trimbach Pinot Blanc', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Muffin Batt - Carrot Spice', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Lamb Leg - Bone - In Nz', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Duck - Fat', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Syrup - Golden, Lyles', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Soup - French Onion', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Wine - White, Pelee Island', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Chicken - White Meat With Tender', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Pork - Sausage, Medium', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Icecream - Dstk Strw Chseck', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Broom - Push', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Flour - Fast / Rapid', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Pasta - Lasagna, Dry', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Soap - Mr.clean Floor Soap', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Cookie Double Choco', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Arctic Char - Fresh, Whole', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Jolt Cola - Red Eye', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Sauce - Hollandaise', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Wine - Red, Wolf Blass, Yellow', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Lemonade - Island Tea, 591 Ml', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Potatoes - Idaho 100 Count', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Chevril', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Cardamon Seed / Pod', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Curry Powder', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Plastic Arrow Stir Stick', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Loquat', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Beans - Long, Chinese', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Cheese - Asiago', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Chicken - Ground', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Flour - Masa De Harina Mexican', 1);
	insert into TB_PRODUCTO (nombre, estado) values ('Mop Head - Cotton, 24 Oz', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Tea - Camomele', 0);
	insert into TB_PRODUCTO (nombre, estado) values ('Cherries - Frozen', 0);
END
