BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `weights` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name_ar`	varchar NOT NULL,
	`name_en`	varchar NOT NULL,
	`created_at`	datetime,
	`updated_at`	datetime
);
CREATE TABLE IF NOT EXISTS `users` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar NOT NULL,
	`email`	varchar NOT NULL,
	`password`	varchar NOT NULL,
	`remember_token`	varchar,
	`created_at`	datetime,
	`updated_at`	datetime,
	`level`	enum DEFAULT 'user'
);
INSERT INTO `users` VALUES (2,'user2','user2@user.com','$2y$10$hi8940clY0Dj.0Cdvdb3teJiWId0yZQrB7dEzjzn24UlJE5fOWrPi',NULL,'2018-03-22 23:27:37','2018-03-22 23:27:37','user');
INSERT INTO `users` VALUES (3,'vendor','store@user.com','$2y$10$cFbXzpMjfVNBO/OIsxgn9.EjWOexjD.2X67uPt9gaO7T68/yD4na6',NULL,'2018-03-22 23:28:05','2018-03-22 23:28:05','vendor');
INSERT INTO `users` VALUES (4,'شركة شحن ١','ship@ship.com','$2y$10$Dda0Ea/h56QVvV7p98WE/.7LqM/74mfK.Sk4jJV9O8JpdNrbNDude',NULL,'2018-08-18 19:57:09','2019-04-09 12:46:26','company');
INSERT INTO `users` VALUES (5,'Armand Wheeler','dyqe@mailinator.net','$2y$10$OHNkUcOY3MFTIO12nbLNku0I4yh9WOatJc.U0BDQqZ6jsyqaTErk.',NULL,'2019-04-09 12:04:45','2019-04-09 12:04:45','vendor');
INSERT INTO `users` VALUES (6,'Armand Wheeler','dyqe@mailinjator.net','$2y$10$Hkhfk0kRVUM.RkK89NZykuUlvvSqnu8gtbIopu94.hKkVLlHRO.q.',NULL,'2019-04-09 12:05:11','2019-04-09 12:05:11','vendor');
INSERT INTO `users` VALUES (7,'Jessamine Matthews','hirupakyb@mailinator.com','$2y$10$KgJgN9QfO/HlNRt/h9EYl.7iK8UFLyreoaNRnBUusp1wWqtJMJeQm',NULL,'2019-04-09 12:18:36','2019-04-09 12:18:36','company');
CREATE TABLE IF NOT EXISTS `trade_marks` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name_ar`	varchar NOT NULL,
	`name_en`	varchar NOT NULL,
	`logo`	varchar,
	`created_at`	datetime,
	`updated_at`	datetime
);
INSERT INTO `trade_marks` VALUES (2,'ابل','Aipl','trademarks/jo47JE9lJzdBvzSGA6Z1vfHmpShCGHYuKyZlSOFQ.gif','2019-02-05 19:56:26','2019-02-05 19:56:59');
CREATE TABLE IF NOT EXISTS `states` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`state_name_ar`	varchar NOT NULL,
	`state_name_en`	varchar NOT NULL,
	`city_id`	integer NOT NULL,
	`country_id`	integer NOT NULL,
	`created_at`	datetime,
	`updated_at`	datetime,
	FOREIGN KEY(`city_id`) REFERENCES `cities`(`id`) on delete cascade,
	FOREIGN KEY(`country_id`) REFERENCES `countries`(`id`) on delete cascade
);
CREATE TABLE IF NOT EXISTS `sizes` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name_ar`	varchar NOT NULL,
	`name_en`	varchar NOT NULL,
	`department_id`	integer,
	`is_public`	varchar NOT NULL,
	`created_at`	datetime,
	`updated_at`	datetime,
	FOREIGN KEY(`department_id`) REFERENCES `departments`(`id`) on delete cascade
);
INSERT INTO `sizes` VALUES (6,'بوصه','inche',9,'yes','2019-02-01 16:16:44','2019-02-01 16:16:44');
INSERT INTO `sizes` VALUES (8,'ملى متر','Male Metr',13,'yes','2019-02-02 01:45:59','2019-02-02 01:45:59');
INSERT INTO `sizes` VALUES (10,'سنتى متر','cm',15,'no','2019-02-02 01:50:55','2019-02-02 01:50:55');
CREATE TABLE IF NOT EXISTS `shippings` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name_ar`	varchar NOT NULL,
	`name_en`	varchar NOT NULL,
	`user_id`	integer NOT NULL,
	`lat`	varchar,
	`lng`	varchar,
	`icon`	varchar,
	`created_at`	datetime,
	`updated_at`	datetime,
	FOREIGN KEY(`user_id`) REFERENCES `users`(`id`) on delete cascade
);
INSERT INTO `shippings` VALUES (2,'موبيكا','Mobeca',4,'30.034024628931657','31.24238681793213','shipping/wHS4O3VwqKUcCSs66QCLzCgbaRhFzAxFvTO0xJqB.jpeg','2019-02-05 20:19:32','2019-02-05 20:22:47');
INSERT INTO `shippings` VALUES (3,'زارا','Zddd',4,'30.034024628931657','31.24238681793213','shipping/x2KzVb3aeBcHwbUmUJHOsZWqw54p3JuQiz87cAIH.jpeg','2019-02-05 20:31:58','2019-02-05 20:31:58');
INSERT INTO `shippings` VALUES (4,'النكلاوى','Nklawy',4,'30.034024628931657','31.24238681793213','shipping/yNBJnY3jRH7irSGtw6eWt3Mz25pleFFyEVA287n6.jpeg','2019-02-05 20:43:34','2019-02-05 20:43:34');
INSERT INTO `shippings` VALUES (6,'موبيكا','Mobeca',4,'30.034024628931657','31.24238681793213',NULL,'2019-02-05 20:44:57','2019-02-05 20:44:57');
CREATE TABLE IF NOT EXISTS `settings` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`sitename_ar`	varchar NOT NULL,
	`sitename_en`	varchar NOT NULL,
	`logo`	varchar,
	`icon`	varchar,
	`email`	varchar,
	`main_lang`	varchar NOT NULL DEFAULT 'ar',
	`description`	text,
	`keywords`	text,
	`status`	varchar NOT NULL DEFAULT 'open',
	`message_maintenance`	text,
	`created_at`	datetime,
	`updated_at`	datetime
);
INSERT INTO `settings` VALUES (1,'اسم عربى','En name','settings/SKrRu4h5Cj2xcfu85eVTTLfhTRM2lHMLtc9H8RwB.png','settings/uRTowBMAciZW2UcBYrGHXCHbn8ZMI8Ju5uR7cEJF.png','admin@test.com','ar','test','test','close','الموقع مغلق فى الوقت الحالى برجاء الرجوع فى وقت اخر','2018-03-30 00:42:16','2018-05-18 12:28:40');
CREATE TABLE IF NOT EXISTS `productsAdmin` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`desc_ar`	varchar,
	`desc_en`	varchar,
	`product_name_ar`	text,
	`product_name_en`	text,
	`photo`	varchar,
	`department_id`	integer,
	`trade_id`	integer,
	`nun_sms`	integer,
	`num_member`	integer,
	`date_month`	integer,
	`price`	numeric NOT NULL DEFAULT '0',
	`other_data`	text,
	`created_at`	datetime,
	`updated_at`	datetime,
	FOREIGN KEY(`department_id`) REFERENCES `departments`(`id`) on delete cascade,
	FOREIGN KEY(`trade_id`) REFERENCES `trade_marks`(`id`) on delete cascade
);
INSERT INTO `productsAdmin` VALUES (2,'وصف العاميل',NULL,'محمد سعيد فرج يعقوب',NULL,NULL,19,NULL,1111177170,1140025208,5,1000,NULL,'2019-04-28 13:22:37','2019-04-28 13:22:37');
CREATE TABLE IF NOT EXISTS `products` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`desc_ar`	varchar,
	`product_name_ar`	text,
	`photo`	varchar,
	`department_id`	integer,
	`trade_id`	integer,
	`price`	numeric NOT NULL DEFAULT '0',
	`nun_sms`	integer,
	`num_member`	integer,
	`date_month`	integer,
	`other_data`	text,
	`created_at`	datetime,
	`updated_at`	datetime,
	FOREIGN KEY(`trade_id`) REFERENCES `trade_marks`(`id`) on delete cascade,
	FOREIGN KEY(`department_id`) REFERENCES `departments`(`id`) on delete cascade
);
INSERT INTO `products` VALUES (5,'وصف العاميل','محمد سعيد فرج يعقوب',NULL,10,NULL,4785,1111177170,1140025208,5,NULL,'2019-04-09 23:28:38','2019-04-09 23:28:38');
INSERT INTO `products` VALUES (6,'Dolorem eaque quis l','Gage Patrick',NULL,11,NULL,286,'Eum Nam tenetur temp','Nihil sit laudantium',4,NULL,'2019-04-09 23:36:35','2019-04-09 23:36:35');
INSERT INTO `products` VALUES (7,'وصف العاميل','محمد سعيد فرج يعقوب',NULL,10,NULL,4,1111177170,1140025208,5,NULL,'2019-04-10 08:53:16','2019-04-10 08:53:16');
INSERT INTO `products` VALUES (10,'Reiciendis consequat','Hilda Bowman',NULL,9,NULL,995,'Ea dolor asperiores','At id tempor officia',4,NULL,'2019-04-22 12:53:20','2019-04-22 12:53:20');
INSERT INTO `products` VALUES (11,'Eveniet in aut volu','Orli Elliott',NULL,9,NULL,399,'Laudantium do et an','Nulla fugiat aut un',8,NULL,'2019-04-22 12:56:14','2019-04-22 12:56:14');
INSERT INTO `products` VALUES (12,'Repudiandae repellen','Leroy Snow',NULL,9,NULL,855,'Harum nobis nemo nul','Ullamco debitis opti',12,NULL,'2019-04-22 13:08:49','2019-04-22 13:08:49');
INSERT INTO `products` VALUES (13,'حلوه','محمد',NULL,18,NULL,599,1235659552,12354697,5,NULL,'2019-04-27 09:23:12','2019-04-27 09:23:12');
INSERT INTO `products` VALUES (14,'وصف العاميل','محمد سعيد فرج يعقوب',NULL,9,NULL,1000,1529863983,1140025208,5,NULL,'2019-04-28 12:50:38','2019-04-28 12:50:38');
INSERT INTO `products` VALUES (15,'Doloremque eligendi','Kevin Osborne',NULL,9,NULL,592,'Amet impedit bland','Sequi voluptatem qui',5,NULL,'2019-05-09 15:16:21','2019-05-09 15:16:21');
CREATE TABLE IF NOT EXISTS `pproducts` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`product_name_ar`	varchar NOT NULL,
	`product_name_en`	varchar NOT NULL,
	`desc_name_ar`	varchar NOT NULL,
	`desc_name_en`	varchar NOT NULL,
	`created_at`	datetime,
	`updated_at`	datetime
);
CREATE TABLE IF NOT EXISTS `password_resets` (
	`email`	varchar NOT NULL,
	`token`	varchar NOT NULL,
	`created_at`	datetime
);
INSERT INTO `password_resets` VALUES ('Ahamed@Ahamed.com','$2y$10$sZ52TPl7BfdQVf2M6678OOGsi6YAOAWOUikNaIpuaYAg.1/8lZ/HC','2019-05-04 16:12:34');
INSERT INTO `password_resets` VALUES ('Ahamed@Ahamed.com','898a6c88376d9c551d0c656991b3b6b69dc4d0ae45f54ea4a684cf2efd922e5e','2019-05-04 16:12:35');
INSERT INTO `password_resets` VALUES ('admin@test.com','$2y$10$CYxG3wuKOiQm2YD9PJD2Iue0nB71A7fFMwgKlhw1k/XhExAEGQSUO','2019-05-09 22:33:39');
INSERT INTO `password_resets` VALUES ('admin@test.com','fca2c3d9fe72b84e18a10878acedc96fbfeae63ea3563c6fc63d6535bfbf4c57','2019-05-09 22:33:39');
CREATE TABLE IF NOT EXISTS `migrations` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`migration`	varchar NOT NULL,
	`batch`	integer NOT NULL
);
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1);
INSERT INTO `migrations` VALUES (2,'2014_10_12_100000_create_password_resets_table',1);
INSERT INTO `migrations` VALUES (3,'2018_02_23_212935_create_admins_table',1);
INSERT INTO `migrations` VALUES (4,'2018_03_30_002607_create_settings_table',2);
INSERT INTO `migrations` VALUES (5,'2018_03_31_112715_create_files_table',3);
INSERT INTO `migrations` VALUES (7,'2018_05_25_131215_create_countries_table',4);
INSERT INTO `migrations` VALUES (8,'2018_05_25_131216_create_cities_table',5);
INSERT INTO `migrations` VALUES (9,'2018_06_22_073004_state',6);
INSERT INTO `migrations` VALUES (12,'2018_06_22_145313_create_departments_table',7);
INSERT INTO `migrations` VALUES (13,'2018_06_28_152409_create_trade_marks_table',8);
INSERT INTO `migrations` VALUES (16,'2018_06_29_155040_create_manufacturers_table',9);
INSERT INTO `migrations` VALUES (17,'2018_08_18_195939_create_shippings_table',10);
INSERT INTO `migrations` VALUES (19,'2018_08_23_100756_create_malls_table',11);
INSERT INTO `migrations` VALUES (20,'2018_09_05_132600_create_colors_table',12);
INSERT INTO `migrations` VALUES (21,'2019_01_27_104440_create_sizes_table',13);
INSERT INTO `migrations` VALUES (31,'2019_01_27_192027_create_weights_table',14);
INSERT INTO `migrations` VALUES (60,'2019_01_27_104441_create_weights_table',15);
INSERT INTO `migrations` VALUES (62,'2019_02_06_142232_create_pproducts_table',15);
INSERT INTO `migrations` VALUES (72,'2019_01_27_184513_create_products_table',16);
INSERT INTO `migrations` VALUES (74,'2019_01_27_184513_create_productsAdmin_table',17);
CREATE TABLE IF NOT EXISTS `manufacturers` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name_ar`	varchar NOT NULL,
	`name_en`	varchar NOT NULL,
	`facebook`	varchar,
	`twitter`	varchar,
	`website`	varchar,
	`contact_name`	varchar,
	`address`	varchar,
	`mobile`	varchar,
	`email`	varchar,
	`lat`	varchar,
	`lng`	varchar,
	`icon`	varchar,
	`created_at`	datetime,
	`updated_at`	datetime
);
INSERT INTO `manufacturers` VALUES (2,'موبيكا','Mobeca',NULL,NULL,NULL,'مهندس محمد السعيد','3 الناصريه، الحنفي، السيدة زينب، محافظة القاهرة‬، مصر','0123659852','admin@test.com','30.034024628931657','31.24238681793213','manufacturers/Ayqpo8D59zvvw6rt3bFiBgepN1XHnRUFSSyw2iRp.jpeg','2019-02-05 12:21:27','2019-05-09 20:37:23');
INSERT INTO `manufacturers` VALUES (3,'توشيبا','tshapa',NULL,NULL,NULL,'مهندس   محمد  سعيد','3 الناصريه، الحنفي، السيدة زينب، محافظة القاهرة‬، مصر','541614564161','A@A.com','30.034024628931657','31.24238681793213','manufacturers/a691iZ49xSSIb8Rr4Ug0fknmOmpskT2GkVtET0s1.jpeg','2019-02-05 12:31:26','2019-05-09 20:39:47');
INSERT INTO `manufacturers` VALUES (4,'زارا','22Zddd',NULL,NULL,NULL,'Mayar Amr','3 الناصريه، الحنفي، السيدة زينب، محافظة القاهرة‬، مصر','0123659852','Amr@Amr.com','30.034024628931657','31.24238681793213','manufacturers/litY9U7WbhDRyIwhhOrBLrVP5AXkkjfMfCxPzgCo.jpeg','2019-02-05 12:35:30','2019-05-09 20:41:25');
INSERT INTO `manufacturers` VALUES (5,'Mohamed Saeed','Mohamed Saeed',NULL,NULL,NULL,'Mohamed Saeed','3 الناصريه، الحنفي، السيدة زينب، محافظة القاهرة‬، مصر','122555555','kyqabuq@mailinator.net','30.034024628931657','31.24238681793213','manufacturers/T9QhM6i70AsUabFZIeHkIBNHNYLhEjzzkpQL7jkr.jpeg','2019-04-09 12:09:04','2019-05-09 20:42:09');
INSERT INTO `manufacturers` VALUES (6,'Nichole Olson','Edan Fowler',NULL,NULL,NULL,'Neil Fuentes','Minus nesciunt dolo','111111','lebidegohi@mailinator.com','30.034024628931657','31.24238681793213',NULL,'2019-04-09 12:21:41','2019-04-09 12:21:41');
CREATE TABLE IF NOT EXISTS `malls` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name_ar`	varchar NOT NULL,
	`name_en`	varchar NOT NULL,
	`facebook`	varchar,
	`twitter`	varchar,
	`website`	varchar,
	`contact_name`	varchar,
	`address`	varchar,
	`mobile`	varchar,
	`email`	varchar,
	`lat`	varchar,
	`lng`	varchar,
	`icon`	varchar,
	`country_id`	integer NOT NULL,
	`created_at`	datetime,
	`updated_at`	datetime,
	FOREIGN KEY(`country_id`) REFERENCES `countries`(`id`) on delete cascade
);
INSERT INTO `malls` VALUES (3,'مول العرب','Arab  moll',NULL,NULL,NULL,'مهندس   مالك عمرو','3 El-Nasereya, Al Hanafi, El-Sayeda Zainab, Cairo Governorate, Egypt','0123659852','A@A.com','30.034024628931657','31.24238681793213','malls/v4lXO01gawIwJRpNWXTSysUlcYpzQgg3sSzkZvef.png',16,'2019-02-05 20:48:09','2019-02-05 20:48:09');
CREATE TABLE IF NOT EXISTS `files` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar NOT NULL,
	`size`	varchar NOT NULL,
	`file`	varchar NOT NULL,
	`path`	varchar NOT NULL,
	`full_file`	varchar NOT NULL,
	`mime_type`	varchar NOT NULL,
	`file_type`	varchar NOT NULL,
	`relation_id`	integer NOT NULL,
	`created_at`	datetime,
	`updated_at`	datetime
);
INSERT INTO `files` VALUES (1,'129089_download.png','15207','IdX0lyQMmSEtIxPqWe1DYXGwjT5kLlk7ymGVX3XN.png','products/11','products/11/
IdX0lyQMmSEtIxPqWe1DYXGwjT5kLlk7ymGVX3XN.png','image/png','product',11,'2019-01-30 09:03:18','2019-01-30 09:03:18');
INSERT INTO `files` VALUES (2,'20 فولدر  تسطيب فيو مع بزت استراب.png','13823','foUgSPuuUbEZcvfu4CtHqMh026Ii6gayafQiJFX3.png','products/12','products/12foUgSPuuUbEZcvfu4CtHqMh026Ii6gayafQiJFX3.png','image/png','product',12,'2019-01-30 10:42:41','2019-01-30 10:42:41');
INSERT INTO `files` VALUES (3,'49577031_1516342188497823_6182908617218326528_o.jpg','35223','qMSHRj3ElxCzgRzlh4jUxc5iZObVf8Sm9eRgFRHu.jpeg','products/14','products/14qMSHRj3ElxCzgRzlh4jUxc5iZObVf8Sm9eRgFRHu.jpeg','image/jpeg','product',14,'2019-01-30 11:07:17','2019-01-30 11:07:17');
INSERT INTO `files` VALUES (4,'49029572_387128595428844_140377355347558400_n.jpg','9972','kr60hORDcmCypA66LUErAG98lOxLeJ7TnM3NKgUM.jpeg','products/11','products/11kr60hORDcmCypA66LUErAG98lOxLeJ7TnM3NKgUM.jpeg','image/jpeg','product',11,'2019-01-30 11:32:37','2019-01-30 11:32:37');
INSERT INTO `files` VALUES (6,'مرتبب.png','538372','1K16tIDecXIdw2K12OWWEmAYGq2XGbZhrCd1Sn3b.png','products/12','products/121K16tIDecXIdw2K12OWWEmAYGq2XGbZhrCd1Sn3b.png','image/png','product',12,'2019-01-30 11:42:56','2019-01-30 11:42:56');
INSERT INTO `files` VALUES (7,'download.png','749835','Mx6as29fREv10KTMU5UUAim8oPxNQznoNe2d8vmu.png','products/16','products/16/Mx6as29fREv10KTMU5UUAim8oPxNQznoNe2d8vmu.png','image/png','product',16,'2019-01-30 13:58:01','2019-01-30 13:58:01');
INSERT INTO `files` VALUES (8,'تشجيع.png','102025','ph3Y9Lb0aTIpL4eeO4N5y7BncVwTmwMejhNZ8mZL.png','products/16','products/16/ph3Y9Lb0aTIpL4eeO4N5y7BncVwTmwMejhNZ8mZL.png','image/png','product',16,'2019-01-30 14:00:51','2019-01-30 14:00:51');
INSERT INTO `files` VALUES (9,'Screenshot_2.png','310360','9kiQ65uW9BLXE3I1hIIUMxSo3eD5aCkYCSgS3Xga.png','products/16','products/16/9kiQ65uW9BLXE3I1hIIUMxSo3eD5aCkYCSgS3Xga.png','image/png','product',16,'2019-01-30 14:02:49','2019-01-30 14:02:49');
INSERT INTO `files` VALUES (10,'Screenshot_1.png','299699','9wHF7gRUEwAC3f6slZ0jGo0cM0pkYrUUUqgkaNMd.png','products/16','products/16/9wHF7gRUEwAC3f6slZ0jGo0cM0pkYrUUUqgkaNMd.png','image/png','product',16,'2019-01-30 14:14:29','2019-01-30 14:14:29');
INSERT INTO `files` VALUES (11,'Screenshot_2.png','310360','92RVA1AnZdY8tVX131HDCyRPlHWO7FsLEtXSY94X.png','products/16','products/16/92RVA1AnZdY8tVX131HDCyRPlHWO7FsLEtXSY94X.png','image/png','product',16,'2019-01-30 14:16:47','2019-01-30 14:16:47');
INSERT INTO `files` VALUES (12,'Screenshot_2.png','310360','24c06aY4NQnIVP6L1jkLpWdgnbPGc5OUvL5COWFV.png','products/16','products/16/24c06aY4NQnIVP6L1jkLpWdgnbPGc5OUvL5COWFV.png','image/png','product',16,'2019-01-30 14:28:34','2019-01-30 14:28:34');
INSERT INTO `files` VALUES (13,'Screenshot_1.png','299699','n5Ta8d5qX6CSjIunMSpCS7Vl7d15hzWz8dLXveSR.png','products/16','products/16/n5Ta8d5qX6CSjIunMSpCS7Vl7d15hzWz8dLXveSR.png','image/png','product',16,'2019-01-30 14:37:13','2019-01-30 14:37:13');
INSERT INTO `files` VALUES (14,'49577031_1516342188497823_6182908617218326528_o.jpg','35223','uVv5PiyMvNFs7etmfMCBfOCgpC8YyoHc1yBrNUYP.jpeg','products/16','products/16/uVv5PiyMvNFs7etmfMCBfOCgpC8YyoHc1yBrNUYP.jpeg','image/jpeg','product',16,'2019-01-30 15:20:30','2019-01-30 15:20:30');
INSERT INTO `files` VALUES (15,'49029572_387128595428844_140377355347558400_n.jpg','9972','W667PlI1lVKPfH6swvOtnMrwOTt4elLo9UX4FWPR.jpeg','products/16','products/16/W667PlI1lVKPfH6swvOtnMrwOTt4elLo9UX4FWPR.jpeg','image/jpeg','product',16,'2019-01-30 15:25:05','2019-01-30 15:25:05');
INSERT INTO `files` VALUES (16,'1.jpg','139292','fTTokqgKROJkMr4kW50Vp9rZB270BrSpIUevrBMQ.jpeg','products/18','products/18/fTTokqgKROJkMr4kW50Vp9rZB270BrSpIUevrBMQ.jpeg','image/jpeg','product',18,'2019-01-30 15:47:59','2019-01-30 15:47:59');
INSERT INTO `files` VALUES (17,'1.jpg','139292','8TqHdm5vMTfEhOXB0zgIJ71rFrhlhZbOkHlXvTD0.jpeg','products/16','products/16/8TqHdm5vMTfEhOXB0zgIJ71rFrhlhZbOkHlXvTD0.jpeg','image/jpeg','product',16,'2019-01-30 18:04:46','2019-01-30 18:04:46');
INSERT INTO `files` VALUES (18,'3.png','46596','cXrK6WZHK4U1MnkC7TbI5gfnovJG2KY8kYlL5X4g.png','products/16','products/16/cXrK6WZHK4U1MnkC7TbI5gfnovJG2KY8kYlL5X4g.png','image/png','product',16,'2019-01-30 18:12:08','2019-01-30 18:12:08');
INSERT INTO `files` VALUES (19,'20 -2فولدر  تسطيب فيو مع بزت استراب.png','52203','6nW1QDz7zcPCY1ZAP7sapeU60lRuega4ZFT0jwjQ.png','products/19','products/19/6nW1QDz7zcPCY1ZAP7sapeU60lRuega4ZFT0jwjQ.png','image/png','product',19,'2019-01-30 18:12:47','2019-01-30 18:12:47');
INSERT INTO `files` VALUES (20,'1.jpg','139292','ae89Dzi0bL4UhqUMsQz2JyM9Swo0lreVg7YQUzpr.jpeg','products/19','products/19/ae89Dzi0bL4UhqUMsQz2JyM9Swo0lreVg7YQUzpr.jpeg','image/jpeg','product',19,'2019-01-30 18:14:45','2019-01-30 18:14:45');
INSERT INTO `files` VALUES (21,'1.jpg','139292','2Xg0Ey93OsxxDp4yu2TaXMOE6Ljk1KOSTXgwCREn.jpeg','products/19','products/19/2Xg0Ey93OsxxDp4yu2TaXMOE6Ljk1KOSTXgwCREn.jpeg','image/jpeg','product',19,'2019-01-30 18:33:58','2019-01-30 18:33:58');
INSERT INTO `files` VALUES (22,'Capture.JPG','91926','yJN2UiVsdZ6NP29XW3cCDP20l3avJvGbZwajRUU6.jpeg','products/18','products/18/yJN2UiVsdZ6NP29XW3cCDP20l3avJvGbZwajRUU6.jpeg','image/jpeg','product',18,'2019-01-31 09:24:17','2019-01-31 09:24:17');
INSERT INTO `files` VALUES (23,'٢٠١٧١٢١٠_٠٨٢٣٣٨-1.jpg','643454','Nn3mylNnxV5bd8Sqtbo4RuwcdSz7rzDfqIEQipM4.jpeg','products/17','products/17/Nn3mylNnxV5bd8Sqtbo4RuwcdSz7rzDfqIEQipM4.jpeg','image/jpeg','product',17,'2019-01-31 11:42:07','2019-01-31 11:42:07');
INSERT INTO `files` VALUES (24,'50229538_2270995046519468_7329877009390108672_n.jpg','32384','il5nWNcnNveBRLXGQi55EDGsfwrCDn4GjZLOwMzF.jpeg','products/17','products/17/il5nWNcnNveBRLXGQi55EDGsfwrCDn4GjZLOwMzF.jpeg','image/jpeg','product',17,'2019-01-31 11:42:29','2019-01-31 11:42:29');
INSERT INTO `files` VALUES (25,'1.jpg','139292','MLTCwkxDwUCW8tFEhBxKdVaypEOKEamrGvHmx76U.jpeg','products/17','products/17/MLTCwkxDwUCW8tFEhBxKdVaypEOKEamrGvHmx76U.jpeg','image/jpeg','product',17,'2019-01-31 11:49:19','2019-01-31 11:49:19');
INSERT INTO `files` VALUES (26,'49949208_804149946583601_1280811178116775936_n.jpg','35330','XrsvGmUMoURMq3g0JPDxdICS9tHVnBzcqJBDECaZ.jpeg','products/17','products/17/XrsvGmUMoURMq3g0JPDxdICS9tHVnBzcqJBDECaZ.jpeg','image/jpeg','product',17,'2019-01-31 11:50:34','2019-01-31 11:50:34');
INSERT INTO `files` VALUES (27,'49949208_804149946583601_1280811178116775936_n.jpg','35330','1HBgxLNHERILVK5RCAJKZQEobelxoBqWwgCbpkxE.jpeg','products/18','products/18/1HBgxLNHERILVK5RCAJKZQEobelxoBqWwgCbpkxE.jpeg','image/jpeg','product',18,'2019-01-31 12:21:56','2019-01-31 12:21:56');
INSERT INTO `files` VALUES (28,'Screenshot_2.png','310360','aqdaJMypBIS1zWIjZFlcoLOsU7huDLoZ0QL7edNq.png','products/18','products/18/aqdaJMypBIS1zWIjZFlcoLOsU7huDLoZ0QL7edNq.png','image/png','product',18,'2019-01-31 12:28:53','2019-01-31 12:28:53');
INSERT INTO `files` VALUES (29,'download.png','749835','KazS6z3EX3KDHK1VFtdMUDteThP55AbbBVj5dJ94.png','products/18','products/18/KazS6z3EX3KDHK1VFtdMUDteThP55AbbBVj5dJ94.png','image/png','product',18,'2019-01-31 12:31:15','2019-01-31 12:31:15');
INSERT INTO `files` VALUES (30,'50229538_2270995046519468_7329877009390108672_n.jpg','32384','56jWl09HlXvBnHsatbnMfvaHUKGzpAhuNLnzh1Yt.jpeg','products/18','products/18/56jWl09HlXvBnHsatbnMfvaHUKGzpAhuNLnzh1Yt.jpeg','image/jpeg','product',18,'2019-01-31 13:02:44','2019-01-31 13:02:44');
INSERT INTO `files` VALUES (31,'49577031_1516342188497823_6182908617218326528_o.jpg','35223','oEbY8u18EbbehgiJXl4o3GXWZ1i5DWTP29GlcdBq.jpeg','products/18','products/18/oEbY8u18EbbehgiJXl4o3GXWZ1i5DWTP29GlcdBq.jpeg','image/jpeg','product',18,'2019-01-31 13:02:58','2019-01-31 13:02:58');
INSERT INTO `files` VALUES (32,'٢٠١٧١٢١٠_٠٨٢٣٣٨-1.jpg','643454','nq3qLiLqHxaWu15hiD8BhTPTYCD5mCDWh4IiokqW.jpeg','products/18','products/18/nq3qLiLqHxaWu15hiD8BhTPTYCD5mCDWh4IiokqW.jpeg','image/jpeg','product',18,'2019-01-31 13:03:16','2019-01-31 13:03:16');
INSERT INTO `files` VALUES (33,'1.jpg','139292','LrodRibIxoPAbVDNf9fMu95GGclqhi1AjI641Jrf.jpeg','products/18','products/18/LrodRibIxoPAbVDNf9fMu95GGclqhi1AjI641Jrf.jpeg','image/jpeg','product',18,'2019-01-31 13:03:42','2019-01-31 13:03:42');
INSERT INTO `files` VALUES (34,'51195325_1947422485306511_4593139409045422080_n.jpg','56979','Pw4ET4yzLvGZykDpyWe1cY29bLlARuP6oxY99z6z.jpeg','products/18','products/18/Pw4ET4yzLvGZykDpyWe1cY29bLlARuP6oxY99z6z.jpeg','image/jpeg','product',18,'2019-01-31 13:04:01','2019-01-31 13:04:01');
INSERT INTO `files` VALUES (35,'23.png','64001','2lA3SzPCv6srSvPVtRY5DrVD67sMMneFpCLsEpO5.png','products/18','products/18/2lA3SzPCv6srSvPVtRY5DrVD67sMMneFpCLsEpO5.png','image/png','product',18,'2019-01-31 13:05:41','2019-01-31 13:05:41');
INSERT INTO `files` VALUES (36,'2.png','398575','VIaYxwgfHSoRndKXwaCgO6DcLUBOnoOC9JsDSj4A.png','products/18','products/18/VIaYxwgfHSoRndKXwaCgO6DcLUBOnoOC9JsDSj4A.png','image/png','product',18,'2019-01-31 13:06:18','2019-01-31 13:06:18');
INSERT INTO `files` VALUES (37,'49029572_387128595428844_140377355347558400_n.jpg','9972','R3vQu1UwJIsM5LvSE1590Ya8NJHoMyuOqy935YcQ.jpeg','products/18','products/18/R3vQu1UwJIsM5LvSE1590Ya8NJHoMyuOqy935YcQ.jpeg','image/jpeg','product',18,'2019-01-31 13:07:16','2019-01-31 13:07:16');
INSERT INTO `files` VALUES (38,'This is confusing! .jpg','49457','6LccofSwQ5knemfGTG7SVFQwzpWtPL0GFbWiEAvy.jpeg','products/18','products/18/6LccofSwQ5knemfGTG7SVFQwzpWtPL0GFbWiEAvy.jpeg','image/jpeg','product',18,'2019-01-31 13:07:50','2019-01-31 13:07:50');
INSERT INTO `files` VALUES (39,'96647_2.jpg','30012','AE0GXv5uC4P8lZcPAGLwRkgGdp0OzXGFxgsMrWxM.jpeg','products/18','products/18/AE0GXv5uC4P8lZcPAGLwRkgGdp0OzXGFxgsMrWxM.jpeg','image/jpeg','product',18,'2019-01-31 13:32:03','2019-01-31 13:32:03');
INSERT INTO `files` VALUES (40,'5 tawzeef - Apply for employment - 5 توظيف (2).png','1152998','F5x4mGDTuXPxIiCX605G2IHPZsh8KMWKKEXllOXk.png','products/18','products/18/F5x4mGDTuXPxIiCX605G2IHPZsh8KMWKKEXllOXk.png','image/png','product',18,'2019-01-31 13:44:59','2019-01-31 13:44:59');
INSERT INTO `files` VALUES (41,'agence-olloweb-520953-unsplash.jpg','1729714','TFpPG3ZDqpaHeXR0xmlozoXf9cg4ITyv2FC1mbcx.jpeg','products/20','products/20/TFpPG3ZDqpaHeXR0xmlozoXf9cg4ITyv2FC1mbcx.jpeg','image/jpeg','product',20,'2019-01-31 13:49:10','2019-01-31 13:49:10');
INSERT INTO `files` VALUES (42,'20258241_525600121105556_1632462290031763852_n.jpg','27680','RKPmqHHxZP2p8oMqvRSKgJbKUa6Nhqx1SZ19ndg3.jpeg','products/21','products/21/RKPmqHHxZP2p8oMqvRSKgJbKUa6Nhqx1SZ19ndg3.jpeg','image/jpeg','product',21,'2019-01-31 13:50:46','2019-01-31 13:50:46');
INSERT INTO `files` VALUES (43,'41375485_2185953258352407_3881515499065966592_n.jpg','48742','6u8lgjBkxeqsw8JZYo0YTTTPqjyiDF6NCkr3tngA.jpeg','products/21','products/21/6u8lgjBkxeqsw8JZYo0YTTTPqjyiDF6NCkr3tngA.jpeg','image/jpeg','product',21,'2019-01-31 13:50:59','2019-01-31 13:50:59');
INSERT INTO `files` VALUES (44,'96647_2.jpg','30012','EfBYRMYV6I80qz2ez9cP3elPcDtiiERbCrTPJ0Ny.jpeg','products/21','products/21/EfBYRMYV6I80qz2ez9cP3elPcDtiiERbCrTPJ0Ny.jpeg','image/jpeg','product',21,'2019-01-31 13:51:52','2019-01-31 13:51:52');
INSERT INTO `files` VALUES (45,'43226022_10217384515186535_3182008211519569920_n.jpg','38493','acJqRDvKAIOIrbKIJRR4cmhjI0MT6x7Vd7Rn5EVQ.jpeg','products/21','products/21/acJqRDvKAIOIrbKIJRR4cmhjI0MT6x7Vd7Rn5EVQ.jpeg','image/jpeg','product',21,'2019-01-31 13:53:04','2019-01-31 13:53:04');
INSERT INTO `files` VALUES (46,'5 tawzeef - Apply for employment - 5 توظيف (1).png','1065452','M764GSogjIj72G0mAMflPwoF6PfDyPCB8wkjP7Mz.png','products/21','products/21/M764GSogjIj72G0mAMflPwoF6PfDyPCB8wkjP7Mz.png','image/png','product',21,'2019-01-31 14:16:19','2019-01-31 14:16:19');
INSERT INTO `files` VALUES (47,'_سجود السهو له ثلاث حالات_👇 الزيادة_النقص_الشك.... - محمود جلال البنا.png','2085223','nEPmQ2sCzYbusoTSBva16qe6pRdtB6DiYpo7ZeI7.png','products/22','products/22/nEPmQ2sCzYbusoTSBva16qe6pRdtB6DiYpo7ZeI7.png','image/png','product',22,'2019-01-31 14:21:00','2019-01-31 14:21:00');
INSERT INTO `files` VALUES (48,'96647_2.jpg','30012','DCsfgsW4AFm83WxFBZaemltNWkIpGHsTWnHlYvSZ.jpeg','products/22','products/22/DCsfgsW4AFm83WxFBZaemltNWkIpGHsTWnHlYvSZ.jpeg','image/jpeg','product',22,'2019-01-31 14:22:24','2019-01-31 14:22:24');
INSERT INTO `files` VALUES (49,'51195325_1947422485306511_4593139409045422080_n.jpg','56979','6dSfOezihdeEDoeMd4vgyFyzAPA7LpHugHflfgt1.jpeg','products/23','products/23/6dSfOezihdeEDoeMd4vgyFyzAPA7LpHugHflfgt1.jpeg','image/jpeg','product',23,'2019-01-31 14:25:07','2019-01-31 14:25:07');
INSERT INTO `files` VALUES (50,'مرتب.png','90038','kPKffnrA6mH7pQbLtFIQiKjwnRz9BIsm0wJKfjm9.png','products/23','products/23/kPKffnrA6mH7pQbLtFIQiKjwnRz9BIsm0wJKfjm9.png','image/png','product',23,'2019-01-31 14:25:36','2019-01-31 14:25:36');
INSERT INTO `files` VALUES (51,'nEPmQ2sCzYbusoTSBva16qe6pRdtB6DiYpo7ZeI7.png','2085223','rKsdbfTbJavoGmdPINoj5qNVWbdbBnDf7BU1O8lZ.png','products/23','products/23/rKsdbfTbJavoGmdPINoj5qNVWbdbBnDf7BU1O8lZ.png','image/png','product',23,'2019-01-31 14:28:10','2019-01-31 14:28:10');
INSERT INTO `files` VALUES (52,'_سجود السهو له ثلاث حالات_👇 الزيادة_النقص_الشك.... - محمود جلال البنا.png','2085223','nO02Ma5gOwp5JRUoDClfuRTq3YP9FBOdo8ajK9FQ.png','products/23','products/23/nO02Ma5gOwp5JRUoDClfuRTq3YP9FBOdo8ajK9FQ.png','image/png','product',23,'2019-01-31 14:28:31','2019-01-31 14:28:31');
INSERT INTO `files` VALUES (53,'96647_2.jpg','30012','4XHeNzIRZVdzQIPaa1umlf4cf9vUL0NlgRyekdxj.jpeg','products/23','products/23/4XHeNzIRZVdzQIPaa1umlf4cf9vUL0NlgRyekdxj.jpeg','image/jpeg','product',23,'2019-01-31 14:29:41','2019-01-31 14:29:41');
INSERT INTO `files` VALUES (54,'96647_2.jpg','30012','raixDcoH50xeK8mz6wPEwynuTtFlsW9suUo2NbbZ.jpeg','products/26','products/26/raixDcoH50xeK8mz6wPEwynuTtFlsW9suUo2NbbZ.jpeg','image/jpeg','product',26,'2019-01-31 14:37:21','2019-01-31 14:37:21');
INSERT INTO `files` VALUES (55,'زياد.jpg','30543','lGjOJHnBXoJkIM2Ue2mqIQJ3tiGf8IHqztSJTtRA.jpeg','products/26','products/26/lGjOJHnBXoJkIM2Ue2mqIQJ3tiGf8IHqztSJTtRA.jpeg','image/jpeg','product',26,'2019-01-31 14:40:11','2019-01-31 14:40:11');
INSERT INTO `files` VALUES (56,'43226022_10217384515186535_3182008211519569920_n.jpg','38493','q41uTEDDpkY0M8IkftIGvsg8WI47q6qCFdDHsxeO.jpeg','products/27','products/27/q41uTEDDpkY0M8IkftIGvsg8WI47q6qCFdDHsxeO.jpeg','image/jpeg','product',27,'2019-01-31 14:41:16','2019-01-31 14:41:16');
INSERT INTO `files` VALUES (57,'96647_2.jpg','30012','BU7yUmLq1hiPTcOtJfXADvEsD15UffUb74E7sqmz.jpeg','products/27','products/27/BU7yUmLq1hiPTcOtJfXADvEsD15UffUb74E7sqmz.jpeg','image/jpeg','product',27,'2019-01-31 14:50:09','2019-01-31 14:50:09');
INSERT INTO `files` VALUES (58,'96647_2.jpg','30012','XtH55JRLvVcw5pLBeLaTmaVJjfZ1yqRHm1ejw87p.jpeg','products/27','products/27/XtH55JRLvVcw5pLBeLaTmaVJjfZ1yqRHm1ejw87p.jpeg','image/jpeg','product',27,'2019-01-31 14:50:18','2019-01-31 14:50:18');
INSERT INTO `files` VALUES (59,'_سجود السهو له ثلاث حالات_👇 الزيادة_النقص_الشك.... - محمود جلال البنا.png','2085223','DY710iSrdVgNlUVViKoTRMUDImr0o95IAYg9vijC.png','products/27','products/27/DY710iSrdVgNlUVViKoTRMUDImr0o95IAYg9vijC.png','image/png','product',27,'2019-01-31 14:51:02','2019-01-31 14:51:02');
INSERT INTO `files` VALUES (60,'41375485_2185953258352407_3881515499065966592_n.jpg','48742','IyzWKR0DpMlMKGLkR8yTii7CPzF47e0dJ9sSf97k.jpeg','products/27','products/27/IyzWKR0DpMlMKGLkR8yTii7CPzF47e0dJ9sSf97k.jpeg','image/jpeg','product',27,'2019-01-31 14:51:46','2019-01-31 14:51:46');
INSERT INTO `files` VALUES (61,'96647_2.jpg','30012','2ljMuKInREhClI7TXCbvPAPE6KkZsThEkW8YkUqL.jpeg','products/27','products/27/2ljMuKInREhClI7TXCbvPAPE6KkZsThEkW8YkUqL.jpeg','image/jpeg','product',27,'2019-01-31 14:53:07','2019-01-31 14:53:07');
INSERT INTO `files` VALUES (62,'41375485_2185953258352407_3881515499065966592_n.jpg','48742','wKpRxu3Cty4k2PmBs5eHuH8S6b6uqpYLYuuMbepI.jpeg','products/30','products/30/wKpRxu3Cty4k2PmBs5eHuH8S6b6uqpYLYuuMbepI.jpeg','image/jpeg','product',30,'2019-01-31 14:57:08','2019-01-31 14:57:08');
INSERT INTO `files` VALUES (99,'96647_2.jpg','30012','2Mcc0E6z3ZjOy2EC7HPJnlPmxaUheohHPanLq9A2.jpeg','products/32','products/32/2Mcc0E6z3ZjOy2EC7HPJnlPmxaUheohHPanLq9A2.jpeg','image/jpeg','product',32,'2019-01-31 21:39:55','2019-01-31 21:39:55');
INSERT INTO `files` VALUES (100,'43226022_10217384515186535_3182008211519569920_n.jpg','38493','YBFLzj2cjqJHNk9rYsch3uw1EH5MJFz4ET0xDV2P.jpeg','products/32','products/32/YBFLzj2cjqJHNk9rYsch3uw1EH5MJFz4ET0xDV2P.jpeg','image/jpeg','product',32,'2019-01-31 21:40:01','2019-01-31 21:40:01');
INSERT INTO `files` VALUES (101,'m2.jpg','29527','r670UyaE9zZ94sOUPu5LSUt5pSiNLwnVXZbDG8H9.jpeg','products/32','products/32/r670UyaE9zZ94sOUPu5LSUt5pSiNLwnVXZbDG8H9.jpeg','image/jpeg','product',32,'2019-01-31 21:40:14','2019-01-31 21:40:14');
INSERT INTO `files` VALUES (102,'m.jpg','79298','dHjnc6wJOv2oSR63wYgm9jsW40vUWJHFl8MWdSEY.jpeg','products/32','products/32/dHjnc6wJOv2oSR63wYgm9jsW40vUWJHFl8MWdSEY.jpeg','image/jpeg','product',32,'2019-01-31 21:40:21','2019-01-31 21:40:21');
INSERT INTO `files` VALUES (103,'photo-1534972195531-d756b9bfa9f2.jpg','120142','43ertcLDZaYAtH95dkgiFS2PUpENnWRZujXyfbx9.jpeg','products/32','products/32/43ertcLDZaYAtH95dkgiFS2PUpENnWRZujXyfbx9.jpeg','image/jpeg','product',32,'2019-01-31 21:40:25','2019-01-31 21:40:25');
INSERT INTO `files` VALUES (104,'home-banner-top-02.jpg','500700','86oWt59PzcJW4Q6Y0iCmUNuFiyngWEiCR9NvKaL1.jpeg','products/32','products/32/86oWt59PzcJW4Q6Y0iCmUNuFiyngWEiCR9NvKaL1.jpeg','image/jpeg','product',32,'2019-01-31 21:40:37','2019-01-31 21:40:37');
INSERT INTO `files` VALUES (108,'51195325_1947422485306511_4593139409045422080_n.jpg','56979','oUcFM6OroC53KCRrVoLrMRf87Wo6VahXJJ7oJRxX.jpeg','products/39','products/39/oUcFM6OroC53KCRrVoLrMRf87Wo6VahXJJ7oJRxX.jpeg','image/jpeg','product',39,'2019-02-06 10:49:32','2019-02-06 10:49:32');
INSERT INTO `files` VALUES (109,'This is confusing! .jpg','49457','8c6GXjCwTauwFCoIU71nDu0cc6NOxaIbWNN5bAV7.jpeg','products/39','products/39/8c6GXjCwTauwFCoIU71nDu0cc6NOxaIbWNN5bAV7.jpeg','image/jpeg','product',39,'2019-02-06 10:49:40','2019-02-06 10:49:40');
INSERT INTO `files` VALUES (111,'M.jpg','47646','LSdBv91UOZhZ6XVkJK8jOe1blxDR7mqVXC7sp5hW.jpeg','products/39','products/39/LSdBv91UOZhZ6XVkJK8jOe1blxDR7mqVXC7sp5hW.jpeg','image/jpeg','product',39,'2019-02-06 10:49:56','2019-02-06 10:49:56');
INSERT INTO `files` VALUES (112,'H.jpg','58012','HhPBAfdhW56tYzZiIoTY0j1ISYxw5Sx2lavyzBVX.jpeg','products/39','products/39/HhPBAfdhW56tYzZiIoTY0j1ISYxw5Sx2lavyzBVX.jpeg','image/jpeg','product',39,'2019-02-06 10:49:57','2019-02-06 10:49:57');
INSERT INTO `files` VALUES (113,'1.jpg','139292','EkW7XFCf8xAocGFR1bX7za8hEEf4LxH0rnnpu9vh.jpeg','products/40','products/40/EkW7XFCf8xAocGFR1bX7za8hEEf4LxH0rnnpu9vh.jpeg','image/jpeg','product',40,'2019-02-06 11:49:24','2019-02-06 11:49:24');
INSERT INTO `files` VALUES (114,'20 -2فولدر  تسطيب فيو مع بزت استراب.png','52203','2J5gtR8PLfO7bH9ulltLvKId1uYU6TRyM3ayxP4N.png','products/40','products/40/2J5gtR8PLfO7bH9ulltLvKId1uYU6TRyM3ayxP4N.png','image/png','product',40,'2019-02-06 11:49:26','2019-02-06 11:49:26');
INSERT INTO `files` VALUES (115,'23.png','64001','zhZnNM3A7gwNHogwlbF421MvtDCflWbGmF4KDpA1.png','products/40','products/40/zhZnNM3A7gwNHogwlbF421MvtDCflWbGmF4KDpA1.png','image/png','product',40,'2019-02-06 11:49:27','2019-02-06 11:49:27');
INSERT INTO `files` VALUES (116,'5.png','1323143','3OGcQfUw1p9qoO7SGYT9giGxDUDfhhqlhTzcAFMK.png','products/40','products/40/3OGcQfUw1p9qoO7SGYT9giGxDUDfhhqlhTzcAFMK.png','image/png','product',40,'2019-02-06 11:49:31','2019-02-06 11:49:31');
INSERT INTO `files` VALUES (117,'1.jpg','139292','kkG7CsAuP5RqbATKkCC0UtlyejkqrdveuykEe4EY.jpeg','products/40','products/40/kkG7CsAuP5RqbATKkCC0UtlyejkqrdveuykEe4EY.jpeg','image/jpeg','product',40,'2019-02-06 11:49:34','2019-02-06 11:49:34');
INSERT INTO `files` VALUES (118,'٢٠١٧١٢١٠_٠٨٢٣٣٨-1.jpg','643454','5YQZDnEdFUuanKUlqR3LeoXQ15eXVWPp5rrqP0VF.jpeg','products/1','products/1/5YQZDnEdFUuanKUlqR3LeoXQ15eXVWPp5rrqP0VF.jpeg','image/jpeg','product',1,'2019-02-06 18:05:31','2019-02-06 18:05:31');
INSERT INTO `files` VALUES (119,'٢٠١٧١٢١٠_٠٨٢٣٣٨-1.jpg','643454','xuCPhiqQKeq5JK80ujJy6xrvj0RBtidfONgVxSps.jpeg','products/1','products/1/xuCPhiqQKeq5JK80ujJy6xrvj0RBtidfONgVxSps.jpeg','image/jpeg','product',1,'2019-02-06 18:05:36','2019-02-06 18:05:36');
INSERT INTO `files` VALUES (120,'222.png','358988','JT2auRNyuAtxHiLSz19hIoM2pGhnMLuF1ULeRsJg.png','products/1','products/1/JT2auRNyuAtxHiLSz19hIoM2pGhnMLuF1ULeRsJg.png','image/png','product',1,'2019-02-06 18:05:38','2019-02-06 18:05:38');
INSERT INTO `files` VALUES (121,'222 - Copy.png','358988','ZL1ol71zZTlemuGtN8SudQvNZ7ANTXvKW1HUDb0k.png','products/1','products/1/ZL1ol71zZTlemuGtN8SudQvNZ7ANTXvKW1HUDb0k.png','image/png','product',1,'2019-02-06 18:05:40','2019-02-06 18:05:40');
INSERT INTO `files` VALUES (122,'40  شكل ال اقسام على ال  الشكل التانى.png','151319','BJF9cSlArYKQTBIJ1rFdo7ZeYV0TryjuXlVO5AMl.png','products/1','products/1/BJF9cSlArYKQTBIJ1rFdo7ZeYV0TryjuXlVO5AMl.png','image/png','product',1,'2019-02-06 18:05:42','2019-02-06 18:05:42');
INSERT INTO `files` VALUES (123,'40  شكل ال اقسام على ال  الشكل التانى.png','151319','9jDJO1lm1VKHVRC7rBnT2utk7jY4Q6G13CCe1IHv.png','products/1','products/1/9jDJO1lm1VKHVRC7rBnT2utk7jY4Q6G13CCe1IHv.png','image/png','product',1,'2019-02-06 18:05:44','2019-02-06 18:05:44');
INSERT INTO `files` VALUES (124,'222 - Copy.png','358988','9zGw2h8URKIVOEm3hDogkqT7dNF9sjRsx2Z2jKu4.png','products/1','products/1/9zGw2h8URKIVOEm3hDogkqT7dNF9sjRsx2Z2jKu4.png','image/png','product',1,'2019-02-06 18:05:45','2019-02-06 18:05:45');
INSERT INTO `files` VALUES (125,'٢٠١٧١٢١٠_٠٨٢٣٣٨-1.jpg','643454','ccVBZbApAtRPtoq3SX4pftJPbJ3Rg2u1Wc1VkXuu.jpeg','products/1','products/1/ccVBZbApAtRPtoq3SX4pftJPbJ3Rg2u1Wc1VkXuu.jpeg','image/jpeg','product',1,'2019-02-06 18:05:47','2019-02-06 18:05:47');
INSERT INTO `files` VALUES (126,'٢٠١٧١٢١٠_٠٨٢٣٣٨-1.jpg','643454','QnESoBDLbVU9MCjmMZb5epM3FIibInxZVZ7EuTMP.jpeg','products/1','products/1/QnESoBDLbVU9MCjmMZb5epM3FIibInxZVZ7EuTMP.jpeg','image/jpeg','product',1,'2019-02-06 18:05:49','2019-02-06 18:05:49');
INSERT INTO `files` VALUES (127,'50229538_2270995046519468_7329877009390108672_n.jpg','32384','v2U5nU9MMEYGEvR0Y4UW7ePYXNbzoFiLrPT8r3AG.jpeg','products/6','products/6/v2U5nU9MMEYGEvR0Y4UW7ePYXNbzoFiLrPT8r3AG.jpeg','image/jpeg','product',6,'2019-02-06 20:53:00','2019-02-06 20:53:00');
INSERT INTO `files` VALUES (128,'٢٠١٧١٢١٠_٠٨٢٣٣٨-1.jpg','643454','9MoxazGBHZks70cVdtqZCobfmTPjsD81yT5CBUqn.jpeg','products/6','products/6/9MoxazGBHZks70cVdtqZCobfmTPjsD81yT5CBUqn.jpeg','image/jpeg','product',6,'2019-02-06 20:53:02','2019-02-06 20:53:02');
INSERT INTO `files` VALUES (130,'3.PNG','183821','LCj19vusCwEIHTUpk91Lg2FIMNlFkdSq791pAtN6.png','products/9','products/9/LCj19vusCwEIHTUpk91Lg2FIMNlFkdSq791pAtN6.png','image/png','product',9,'2019-02-06 21:58:14','2019-02-06 21:58:14');
INSERT INTO `files` VALUES (131,'3.PNG','183821','qbVVyBy8W9doe5VFfNKSQNJ0YJ7RPTb210L84qSu.png','products/9','products/9/qbVVyBy8W9doe5VFfNKSQNJ0YJ7RPTb210L84qSu.png','image/png','product',9,'2019-02-06 21:58:18','2019-02-06 21:58:18');
INSERT INTO `files` VALUES (132,'2.png','1258734','kvHSyp7Si9na8sHDB3uyWlEu6K5iIdPrxbuUdOa5.png','products/9','products/9/kvHSyp7Si9na8sHDB3uyWlEu6K5iIdPrxbuUdOa5.png','image/png','product',9,'2019-02-06 21:58:19','2019-02-06 21:58:19');
INSERT INTO `files` VALUES (133,'49029572_387128595428844_140377355347558400_n.jpg','9972','J86g5FBf6V4ZXf4D0Kyr8ZpPMHhNNrkCglE10cLu.jpeg','products/13','products/13/J86g5FBf6V4ZXf4D0Kyr8ZpPMHhNNrkCglE10cLu.jpeg','image/jpeg','product',13,'2019-02-08 09:01:39','2019-02-08 09:01:39');
INSERT INTO `files` VALUES (134,'50229538_2270995046519468_7329877009390108672_n.jpg','32384','pyWdm99UbMahyRnvivzAu1VVVlLhflow2yiATr6k.jpeg','products/15','products/15/pyWdm99UbMahyRnvivzAu1VVVlLhflow2yiATr6k.jpeg','image/jpeg','product',15,'2019-02-08 10:02:05','2019-02-08 10:02:05');
INSERT INTO `files` VALUES (135,'1.jpg','139292','xg2o96TCVNp4Q9C1R7e1P7gRSowN7HEXYMnkLvH1.jpeg','products/3','products/3/xg2o96TCVNp4Q9C1R7e1P7gRSowN7HEXYMnkLvH1.jpeg','image/jpeg','product',3,'2019-02-08 11:56:01','2019-02-08 11:56:01');
INSERT INTO `files` VALUES (136,'1.jpg','139292','mGjlp0HXhK8vL35uk4FUcuCTbbYwsWcsb8fAMolJ.jpeg','products/3','products/3/mGjlp0HXhK8vL35uk4FUcuCTbbYwsWcsb8fAMolJ.jpeg','image/jpeg','product',3,'2019-02-08 11:56:03','2019-02-08 11:56:03');
INSERT INTO `files` VALUES (137,'1.jpg','139292','MbAsrSchxkqGBKSptCb3PnKm2N73jNFQc29vs573.jpeg','products/3','products/3/MbAsrSchxkqGBKSptCb3PnKm2N73jNFQc29vs573.jpeg','image/jpeg','product',3,'2019-02-08 11:56:05','2019-02-08 11:56:05');
INSERT INTO `files` VALUES (138,'50229538_2270995046519468_7329877009390108672_n.jpg','32384','XaXIjFQs5zIaeRjk6igXRgqLn0uqYrytlZxxnFB0.jpeg','products/5','products/5/XaXIjFQs5zIaeRjk6igXRgqLn0uqYrytlZxxnFB0.jpeg','image/jpeg','product',5,'2019-02-08 11:57:34','2019-02-08 11:57:34');
CREATE TABLE IF NOT EXISTS `departments` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`dep_name_ar`	varchar NOT NULL,
	`dep_name_en`	varchar NOT NULL,
	`icon`	varchar,
	`description`	varchar,
	`keyword`	varchar,
	`parent`	integer,
	`created_at`	datetime,
	`updated_at`	datetime,
	FOREIGN KEY(`parent`) REFERENCES `departments`(`id`) on delete cascade
);
INSERT INTO `departments` VALUES (9,'اتصالات','Itsal','departments/6GLyc0P4PnM3HS7dOSUOu1XkUYE4pLeKwjs9HTEr.jpeg','hglwvdi gghjwghj','ccccccccccccccc',NULL,'2018-06-28 15:11:08','2019-04-09 16:03:11');
INSERT INTO `departments` VALUES (10,'My Life','My Life',NULL,'باقات My Life استمتع بدقائق و رسائل محلية و جيجا بايتس بلا حدود، و كمان اتفرج مجانا على اجدد افلام السينما كل شهر و سافر الى اوروبا او تسوق من اكبر الماركات العالمية في مصر او جدد تليفونك كل سنة بدون اي مصاريف اضافية. تبدا من
150 جنيه
زر اقرب فرع
تفاصيل النظام
استمتع بكل الدقائق والرسائل لأى رقم في مصر استمتع بالإنترنت بلا حدود على موبايلك و التابلت
مزايا شهرية و سنوية خاصة لك بدون اى مصاريف اضافية فى مجلات السفر والتسوق والترفيه اعرف مين حاول الاتصال بك و موبايلك مغلق او مشغول من خلال خدمة حفظ المكالمات المجانية
اتحكم في الارقام اللي هتتصل بك و امنع أي معاكسات خلال خدمة ناس و ناس المجانية رقم خاص لخدمة العملاء 900 والدخول تلقائيا في برنامج النقاط MORE
خطة الاسعار','قسم فرعى 1',9,'2019-01-27 11:32:45','2019-04-09 16:17:21');
INSERT INTO `departments` VALUES (11,'حكايه','حكايه',NULL,NULL,NULL,9,'2019-02-01 16:14:11','2019-04-09 16:09:38');
INSERT INTO `departments` VALUES (12,'لابتوب','labtop',NULL,NULL,'لاب توب',11,'2019-02-02 00:38:25','2019-02-02 00:38:25');
INSERT INTO `departments` VALUES (13,'ماك برو','Mac pro',NULL,NULL,NULL,12,'2019-02-02 01:21:30','2019-02-02 01:21:30');
INSERT INTO `departments` VALUES (14,'ديل','Dell',NULL,NULL,NULL,12,'2019-02-02 01:23:34','2019-02-02 01:23:34');
INSERT INTO `departments` VALUES (15,'اتش بى','Hp',NULL,NULL,NULL,12,'2019-02-02 01:27:00','2019-02-02 01:27:00');
INSERT INTO `departments` VALUES (16,'ايفون','Apil',NULL,NULL,NULL,10,'2019-02-05 20:54:59','2019-02-05 20:57:48');
INSERT INTO `departments` VALUES (17,'اوبو','oppo',NULL,NULL,NULL,10,'2019-02-05 20:59:16','2019-02-05 20:59:16');
INSERT INTO `departments` VALUES (18,'Jenette Mckay','Nero Young',NULL,'Error ad amet paria','Excepteur qui et adi',9,'2019-04-09 12:06:05','2019-04-09 12:06:05');
INSERT INTO `departments` VALUES (19,'Hope Ewing','William Gonzales',NULL,'Veritatis libero ill','Molestiae quidem vit',9,'2019-04-09 12:19:35','2019-04-09 12:19:35');
INSERT INTO `departments` VALUES (20,'Diana Chambers','Stewart Gaines',NULL,'Officia distinctio','Rerum reprehenderit',19,'2019-05-09 17:36:32','2019-05-09 17:36:32');
INSERT INTO `departments` VALUES (21,'فودافون','فودافون',NULL,NULL,NULL,NULL,'2019-05-09 20:45:55','2019-05-09 20:45:55');
CREATE TABLE IF NOT EXISTS `countries` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`country_name_ar`	varchar NOT NULL,
	`country_name_en`	varchar NOT NULL,
	`mob`	varchar NOT NULL,
	`code`	varchar NOT NULL,
	`logo`	varchar,
	`created_at`	datetime,
	`updated_at`	datetime,
	`currency`	varchar
);
INSERT INTO `countries` VALUES (4,'تونس','touns.','002','EG','countries/azGianwStcKsyKN5JWw4Y2IAdWvD704cBZEBhtAg.jpeg','2018-06-22 07:43:32','2019-02-04 20:21:57','EGP');
INSERT INTO `countries` VALUES (8,'مصر الحبيبه','Egypt','Eg','002','countries/D1UuUcsFtbytU2BM23NrWzAaS3FIo1FLwY9AnOpF.jpeg','2019-02-03 18:10:31','2019-02-03 23:11:05','EGP');
INSERT INTO `countries` VALUES (13,'السعوديه','saoudArabya','ٍSery','002','countries/xO4ybeqLJkO9wqbrYshI4PSQH4JeKnj6rqdBRVti.png','2019-02-04 19:26:57','2019-02-04 19:30:35','EGP');
INSERT INTO `countries` VALUES (14,'المانيا','Germany','Ger','009','countries/sIb9BemCpuCwvyOxOPK29nLsXSkbSC9Qw7vkFLXs.jpeg','2019-02-04 20:07:52','2019-02-04 20:07:52','USA');
INSERT INTO `countries` VALUES (16,'سوريه الغاليه','serya','Se','006','countries/JZMjkUNUNY2U0x6SFddP5VRRyc1Bu55EBc042V7a.png','2019-02-04 22:56:06','2019-02-04 23:19:21','SE');
INSERT INTO `countries` VALUES (17,'امريكا','USA','USA','006','countries/pzPmgNzTOGg9t5Pc4U4dTPGWtKxqIhY33IKJNQWx.png','2019-02-04 23:20:51','2019-02-04 23:21:34','USA');
INSERT INTO `countries` VALUES (18,'اختبار','test','test','002',NULL,'2019-02-04 23:25:27','2019-02-04 23:25:27','test');
INSERT INTO `countries` VALUES (20,'الهند','Haind','98/525','H',NULL,'2019-02-05 01:44:28','2019-02-05 01:44:28','H');
INSERT INTO `countries` VALUES (21,'مصر','Egypt','REl','EG','countries/HrlDN1uumvcOUbNwTEQJNGoRyxvecUTzLTv3l7kN.jpeg','2019-02-22 19:43:29','2019-03-02 05:14:01','SE');
INSERT INTO `countries` VALUES (22,'test','Egypt','Eg','002',NULL,'2019-03-02 05:15:23','2019-03-02 05:15:23','2USA');
CREATE TABLE IF NOT EXISTS `colors` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name_ar`	varchar NOT NULL,
	`name_en`	varchar NOT NULL,
	`color`	varchar NOT NULL,
	`created_at`	datetime,
	`updated_at`	datetime
);
INSERT INTO `colors` VALUES (2,'zdddd','Mobeca','#808000','2019-01-27 12:37:34','2019-01-27 12:37:34');
CREATE TABLE IF NOT EXISTS `cities` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`city_name_ar`	varchar NOT NULL,
	`city_name_en`	varchar NOT NULL,
	`country_id`	integer NOT NULL,
	`created_at`	datetime,
	`updated_at`	datetime,
	FOREIGN KEY(`country_id`) REFERENCES `countries`(`id`) on delete cascade
);
CREATE TABLE IF NOT EXISTS `admins` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar NOT NULL,
	`email`	varchar NOT NULL,
	`password`	varchar NOT NULL,
	`remember_token`	varchar,
	`created_at`	INTEGER,
	`updated_at`	datetime,
	`icon`	varchar,
	`group_id`	TEXT
);
INSERT INTO `admins` VALUES (0,'admin','admin@test.com','$2y$10$.cc6pBZDxJrFlDCHaX/hIuDlVGyR.MiZcejU7UsKucneVIs2yXRPK','cM5GRLdlaOKVYXSaZlH36VCKDnJ0zWhdxrgrJbx8XiwM8rFEOCbysfqLApRc','2018-02-23 21:37:19','2019-04-22 23:36:27','','5');
INSERT INTO `admins` VALUES (1,'shrif','sh@sh.com','$2y$10$tDwtnH2PV.JQr3NYE8MUr.Jxa2pO6PkBBfu//T7BnsX1SFjkXlXpy','YPqY4g20923ORAMDbL2zBNbKYPkIYNdaASQMuBXczm4BMwY5F39f5w291I8g','2019-04-09 12:41:56','2019-04-23 20:05:48','5','1');
INSERT INTO `admins` VALUES (2,'Mohamed Saeed','m@m.com','$2y$10$or/Ks2y9mdLwXUF6sSfM9umF08OCO34XJ981IMTFnB68K45XDeiha','NzvTl6RQzP2LXwCWaP8mMmvje5zhW7LPBnHU8eCivTGT6tVqi1wqX0rLE8nX','2019-04-10 12:47:10','2019-04-23 20:34:25','1','2');
INSERT INTO `admins` VALUES (3,'Ahmed','Ahamed@Ahamed.com','$2y$10$mZj2bHLZxqRa9cxd.w3meeSisJ.d/IArEdTX2Lx8M4ZfMY6UcEGI2','y0rZwkzykMgNBAiDMNdMSSt3XflknMRRCbU1OcxSDMhUJ5foyAGMkoPuDfUt','2018-03-14 00:00:59','2019-04-23 20:02:55','2','3');
INSERT INTO `admins` VALUES (10,'Unity Parsons','mylusamy@mailinator.net','$2y$10$KBf4wHB3nA9LeMXuZUvV3OxfrjcVu3XiYfbFLimANCHo.nhX43B2K',NULL,'2019-05-09 23:04:50','2019-05-09 23:04:50',NULL,'Est expedita adipis');
CREATE UNIQUE INDEX IF NOT EXISTS `users_email_unique` ON `users` (
	`email`
);
CREATE INDEX IF NOT EXISTS `password_resets_email_index` ON `password_resets` (
	`email`
);
CREATE UNIQUE INDEX IF NOT EXISTS `admins_email_unique` ON `admins` (
	`email`
);
COMMIT;
