--

INSERT INTO product_types VALUES
  (1, "Компьютеры", "computer_types", 12132, "Компьютеры, планшеты, ноутбуки..."),
  (2, "Электроника", "electronic_types",19911, "Телевизоры, фото и видеокамеры, сотовые телефоны,..."),
  (3, "Бытовая техника", "home_devices_types", 14121, "Холодильники, стиральные машины, микроволновки,..."),
  (4, "Детские товары", "child_types", 6121, ""),
  (5, "Зоотовары", "zoo_types", 5234, ""),
  (6, "Дом, дача, ремонт", "home_garden_repair_types", 6234, ""),
  (7, "Одежда и обувь", "clothes_types", 9342, "Обувь, верхняя одежда, спортивная одежда..."),
  (8, "Красота и здоровье", "health_and_beuaty_types", 2324, ""),
  (9, "Авто", "automobile_types", 4232, "Новые и подержанные автомобили"),
  (10, "Досуг и развлечения", "free_time_types", 2322, ""),
  (11, "Спорт и отдых", "sport_types", 456, "");

INSERT INTO computer_types VALUES
  (1, 1, "Ноутбуки", "laptops", 1211, ""),
  (2, 1, "Планшеты", "plane_tables", 777, ""),
  (3, 1, "Персональные компьютеры", "desktops", 543, ""),
  (4, 1, "Сетевое оборудование", "network_devices", 343, "");

insert into desktops values  -- computer_product_types: 3
  (1, 3, "IBM 280", 3281.55, 4.8, "desktop0001.jpg", '{"cpu_number": 4, "graphics_card": "AMD Radeon 530", "hard_drive_type": "HDD", "weight": 3.221, "screen_resolution": 17.5, "cpu_model": "Core i5", "frequency": 2000, "hard_drive_size": "1500Gb"}'),
  (2, 3, "Toshiba 341", 2381.12, 3.2, "desktop0002.jpg", '{"cpu_number": 2, "graphics_card": "AMD Radeon 500", "hard_drive_type": "HDD", "weight": 3.221, "screen_resolution": 17.5, "cpu_model": "Core i7", "frequency": 2200, "hard_drive_size": "500Gb"}'),
  (3, 3, "Zx12 RT", 1111.12, 1.8, "desktop0003.jpg", '{"cpu_number": 4, "graphics_card": "AMD Radeon 530", "hard_drive_type": "HDD", "weight": 3.221, "screen_resolution": 17.5, "cpu_model": "Core i5", "frequency": 1400, "hard_drive_size": "2500Gb"}');

INSERT INTO laptops VALUES -- computer_product_types: 1
  (1, 1, "Samsung 01", 2222.12, 4.2, "laptop0001.jpg", '{"cpu_number": 4, "graphics_card": "AMD Radeon 530", "hard_drive_type": "HDD", "weight": 3.221, "screen_resolution": 17.5, "cpu_model": "Core i5", "frequency": 2000, "hard_drive_size": "800Gb"}'),
  (2, 1, "Samsung 02", 3333.12, 3.2, "laptop0002.jpg", '{"cpu_number": 4, "graphics_card": "AMD Radeon 530", "hard_drive_type": "HDD", "weight": 3.221, "screen_resolution": 17.5, "cpu_model": "Core i5", "frequency": 2200, "hard_drive_size": "3500Gb"}'),
  (3, 1, "RedRaptorX", 4444.12, 1.8, "laptop0003.jpg", '{"cpu_number": 4, "graphics_card": "AMD Radeon 530", "hard_drive_type": "HDD", "weight": 3.221, "screen_resolution": 17.5, "cpu_model": "Core i5", "frequency": 1000, "hard_drive_size": "1500Gb"}');

INSERT INTO shops VALUES
  (1, "Eldorado", "Moscow Golovlev Street 28", 4.2, 1, '+7-903-812-17-18', 'Завтра, 300р по Москве', 'https://eldorado1.ru'),
  (2, "Electro-shop", "Moscow Tverskaja Street 18", 3.25, 0, '+7(495)345-2332', "5 дней, бесплатно", "https://electro-shop.com"),
  (3, "Pleer.ru", "Moscow Levoberejnaja naberezhnaja 1", 3.77, 1,'8-495-456-1111', '1-3 дня, 200-400р', 'https://pleer-pleer.ru');

INSERT INTO sale_variants VALUES
  --PC:
  (1, 1, 3, 1, 1, 19000.00, 100, "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij/"),
  (2, 1, 3, 1, 2, 19500.00, 2, "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij/"),
  (3, 1, 3, 1, 3, 22500.00, 23, "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij/"),
  (4, 1, 3, 2, 1, 23300.00, 10, "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij/"),
  (5, 1, 3, 2, 3, 21500.00, 10, "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij/"),
  (6, 1, 3, 3, 1, 17300.00, 1, "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij/"),
  (7, 1, 3, 3, 2, 17300.00, 23, "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij/"),
  (8, 1, 3, 3, 3, 17700.00, 2, "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij/"),
  --Laptops:
  (9, 1, 1, 1, 1, 17340.00, 2, "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij/"),
  (10, 1, 1, 2, 2, 37700.00, 22, "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij/"),
  (11, 1, 1, 3, 1, 27700.00, 12, "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij/"),
  (12, 1, 1, 3, 2, 28700.00, 23, "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij/"),
  (13, 1, 1, 3, 3, 25100.00, 212, "https://euroset.ru/catalog/phones/smartphones/apple/-/apple-iphone-7-128gb-chernij/");

