--

INSERT OR REPLACE INTO catalog_producttype VALUES
  (1, "Компьютеры",  12132.1, "Компьютеры, планшеты, ноутбуки..."),
  (2, "Электроника", 19911.1, "Телевизоры, фото и видеокамеры, сотовые телефоны,..."),
  (3, "Бытовая техника", 14121.1, "Холодильники, стиральные машины, микроволновки,..."),
  (4, "Детские товары", 6121.1, " "),
  (5, "Зоотовары", 5234.0, " "),
  (6, "Дом, дача, ремонт", 6234.1, " "),
  (7, "Одежда и обувь", 9342.1, "Обувь, верхняя одежда, спортивная одежда..."),
  (8, "Красота и здоровье", 2324.1, ""),
  (9, "Авто", 4232.1, "Новые и подержанные автомобили"),
  (10, "Досуг и развлечения", 2322.2, ""),
  (11, "Спорт и отдых", 456.3, "");

INSERT INTO catalog_subproducttype (id, name, raiting, type_id_id, description) VALUES
  (1, "Ноутбуки", 1211, 1, "Ноутбуки разных фирм и размеров"),
  (2, "Планшеты", 777, 1, "Планшеты всех модификаций"),
  (3, "Персональные компьютеры", 543, 1, "Различные варианты персональных компьютеров"),
  (4, "Сетевое оборудование", 343, 1, "Свитчи, коммутаторы и прочее сетевое оборудование"),
  (11, "Холодильники", 632, 3,"");

insert into catalog_product (id, sub_type_id, name, manufacture, raiting, image_url, parameters) values  -- computer_product_types: 3
  (1, 3, "IBM 280", "IBM", 4.8, "desktop0001.jpg", '{"cpu_number": 4, "graphics_card": "AMD Radeon 530", "hard_drive_type": "HDD", "weight": 3.221, "screen_resolution": 17.5, "cpu_model": "Core i5", "frequency": 2000, "hard_drive_size": "1500Gb"}'),
  (2, 3, "Toshiba 341", "Toshiba", 3.2, "desktop0002.jpg", '{"cpu_number": 2, "graphics_card": "AMD Radeon 500", "hard_drive_type": "HDD", "weight": 3.221, "screen_resolution": 17.5, "cpu_model": "Core i7", "frequency": 2200, "hard_drive_size": "500Gb"}'),
  (3, 3, "Zx12 RT", "Asus", 1.8, "desktop0003.jpg", '{"cpu_number": 4, "graphics_card": "AMD Radeon 530", "hard_drive_type": "HDD", "weight": 3.221, "screen_resolution": 17.5, "cpu_model": "Core i5", "frequency": 1400, "hard_drive_size": "2500Gb"}'),
  (4, 1, "Samsung 01", "Samsung", 4.2, "laptop0001.jpg", '{"cpu_number": 4, "graphics_card": "AMD Radeon 530", "hard_drive_type": "HDD", "weight": 3.221, "screen_resolution": 17.5, "cpu_model": "Core i5", "frequency": 2000, "hard_drive_size": "800Gb"}'),
  (5, 1, "Samsung 02", "Samsung", 3.2, "laptop0002.jpg", '{"cpu_number": 4, "graphics_card": "AMD Radeon 530", "hard_drive_type": "HDD", "weight": 3.221, "screen_resolution": 17.5, "cpu_model": "Core i5", "frequency": 2200, "hard_drive_size": "3500Gb"}'),
  (6, 1, "RedRaptorX", "Asus", 1.8, "laptop0003.jpg", '{"cpu_number": 4, "graphics_card": "AMD Radeon 530", "hard_drive_type": "HDD", "weight": 3.221, "screen_resolution": 17.5, "cpu_model": "Core i5", "frequency": 1000, "hard_drive_size": "1500Gb"}'),
  (7, 11, "Бирюса 118", "Бирюса", 2.33, "refrigerator0001.jpg", '{"dimensions": "48x60.5x145 см", "number_of_sections": 2, "number_of_doors": 2, "efficiency": "класс А", "value_of_cold_store": 145, "value_of_freezer": 35, "weight": 52, "noise_level": "до 41 дБ"}');

INSERT INTO catalog_shop VALUES
  (1, "Eldorado", "Moscow Golovlev Street 28", 4.2, 1, '+7-903-812-17-18', 'Завтра, 300р по Москве', 'https://eldorado1.ru'),
  (2, "Electro-shop", "Moscow Tverskaja Street 18", 3.25, 0, '+7(495)345-2332', "5 дней, бесплатно", "https://electro-shop.com"),
  (3, "Pleer.ru", "Moscow Levoberejnaja naberezhnaja 1", 3.77, 1,'8-495-456-1111', '1-3 дня, 200-400р', 'https://pleer-pleer.ru');

--INSERT or IGNORE INTO catalog_salevariant (id, product_id, shop_id, price, amount, special_parameters, url) VALUES
INSERT INTO catalog_salevariant (id, product_id, shop_id, price, amount, special_parameters, url) VALUES
  --PC:
  (1, 1, 1, 19000.00, 100, "{}", "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij"),
  (2, 1, 2, 19500.00, 2, "{}", "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij"),
  (3, 1, 3, 22500.00, 23, "{}", "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij"),
  (4, 2, 1, 23300.00, 10, "{}", "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij"),
  (5, 2, 3, 21500.00, 10, "{}",  "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij"),
  (6, 3, 1, 17300.00, 1, "{}",  "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij"),
  (7, 3, 2, 17300.00, 23, "{}",  "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij"),
  (8, 3, 3, 17700.00, 2, "{}",  "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij"),
  --Laptops:
  (9, 4, 1, 17340.00, 2, "{}",  "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij/"),
  (10, 5, 2, 37700.00, 22, "{}",  "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij/"),
  (11, 6, 1, 27700.00, 12, "{}",  "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij/"),
  (12, 6, 2, 28700.00, 23, "{}",  "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij/"),
  (13, 6, 3, 25100.00, 212, "{}",  "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij/");

