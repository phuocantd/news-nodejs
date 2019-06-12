CREATE DATABASE  IF NOT EXISTS `demodb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `demodb`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: demodb
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `posts` (
  `PostId` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Author` int(11) DEFAULT NULL,
  `Content` varchar(20000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DraftDate` date NOT NULL,
  `PublishedDate` date DEFAULT NULL,
  `State` int(11) NOT NULL,
  PRIMARY KEY (`PostId`),
  UNIQUE KEY `Id_UNIQUE` (`PostId`),
  KEY `fk_Posts_1_idx` (`State`),
  KEY `fk_Posts_2_idx` (`Author`),
  CONSTRAINT `fk_Posts_1` FOREIGN KEY (`State`) REFERENCES `states` (`StateId`),
  CONSTRAINT `fk_Posts_2` FOREIGN KEY (`Author`) REFERENCES `users` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Pixel 3 phones aren\'t selling, and it\'s probably Verizon\'s fault','Commentary: Google\'s carrier exclusive with Verizon isn\'t doing Pixel sales any favors',1,'<p>\n                Google says it\'s sold\n                <a href=\"https://www.cnet.com/news/googles-pricey-pixel-phones-arent-selling-even-at-steep-discounts/\">fewer\n                    Pixel phones year over year</a>\n                due to fierce smartphone competition on the high end, but that probably isn\'t the entire story. There\'s\n                a good chance that the company\'s agreement to make Verizon the Pixel\'s exclusive US carrier plays a\n                role.\n                <br><br>\n                On Monday, Ruth Porat, CFO of Google\'s parent company Alphabet, explained declining Pixel sales as due\n                in part to \"heavy promotional activity industry-wide\" and \"recent pressures in the premium smartphone\n                market.\" Even with deep discounts, people just aren\'t buying Pixel phones, despite best-in-class camera\n                performance and glowing recommendations from CNET and other outlets.\n                <br><br>\n                The Pixel 3 was CNET\'s top Android phone of 2018. So why haven\'t buyers been snapping it up like\n                hotcakes?\n                <br>\n            </p>\n            <img src=\"{{ \'/Demo-Pictures/google-pixel-3-02.jpg\' | relative_url }}\" alt=\"ERROR\">\n            <p>\n                <br>\n                There might be a few reasons for this. First, times are tough across the board. The smartphone market\n                has been slowing down. Apple just announced that it sold fewer iPhones than it did a year ago. People\n                are keeping their phones longer between upgrades, and prices are skyrocketing year over year. New phones\n                are entering the market, like T-Mobile\'s \"premium affordable\" OnePlus 6T, and buyers may be holding\n                their collective breath to see how foldable phones and 5G networks pan out in 2019. (Hint: not too great\n                so far.)\n                <br><br>\n                But for the Pixel phones in particular, Verizon\'s exclusive backing might be almost as much of a\n                hindrance in getting the word out as it is a benefit. Verizon is the US\' largest carrier, which gives\n                the Pixel the advantage of being discovered when buyers walk into a shop or peruse the carrier\'s\n                website.\n                <br><br>\n                But the Pixel is also plagued by a strong misperception that Verizon is the exclusive seller, period. In\n                fact, you can buy the Pixel 3 phones through Google\'s online store for use with any US carrier, as well\n                as Google\'s own hybrid Fi network.\n                <br><br>\n                Limiting carrier exposure surely doesn\'t help get the word out, and you would think that Google would\n                have as much clout as Apple and Samsung in getting its phones on any wireless provider it chooses.\n                <br><br>\n                Google\'s mostly-direct-to-consumer-except-for-Verizon sales model clearly isn\'t working, and I\'m not\n                surprised. The vast majority of people -- we\'re talking about well into 90% -- buy their handset from a\n                carrier, not from a phone-maker, even one with as much pull as Google. If your carrier doesn\'t have a\n                particular phone, why not just get another pretty good alternative instead?\n                <br>\n            </p>\n            <img src=\"{{ \'/Demo-Pictures/google-pixel-3-03.jpg\' | relative_url }}\" alt=\"ERROR\">\n            <p>\n                <br>\n                The rumored Google Pixel 3A is said to come to T-Mobile as well as Verizon, which, if true, will put the\n                Pixel in front of more buyers. (T-Mobile is also trying to mute Verizon\'s thunder with its\n                <a href=\"https://support.t-mobile.com/docs/DOC-35609\">#GetOutofTheRed campaign</a> .)\n                <br><br>\n                Exiting an <a\n                    href=\"https://www.cnet.com/news/at-t-prepares-for-the-end-to-iphone-exclusivity/\">exclusivity\n                    contract with AT&T</a>\n                on the very first iPhone helped Apple create the boom that\n                made its smartphone one of the most iconic, sought-after phones in the world. Google can only hope that\n                expanding into T-Mobile would do the same.\n                <br><br>\n                For Google\'s sake, I hope the Pixel\'s rumored carrier parade won\'t stop there.\n                <br><br>\n                Verizon said, \"We don\'t comment on future contracts nor would we comment on sales.\" Google did not\n                comment.\n                <br>\n            </p>\n            <img src=\"{{ \'/Demo-Pictures/google-pixel-3-04.jpg\' | relative_url }}\" alt=\"ERROR\">\n            <h6><br>MENTIONED ABOVE</h6>\n            <h3><strong>Google Pixel (128GB, Quite Black)</strong></h3>','2019-05-01','2019-05-01',4),(2,'Best gaming laptops 2019: the 10 top gaming laptops we\'ve reviewed','Find the best gaming laptop to suit your fragging needs',2,'<p>\n                The best gaming laptops have changed so much in such a short amount of time, and now they’re more\n                powerful than ever before.\n                Thanks to additions like Nvidia RTX graphics, the best gaming laptops can push the best <a\n                    href=\"https://www.techradar.com/news/gaming/10-best-pc-games-the-must-play-titles-you-can-t-afford-to-miss-1292327\">PC\n                    games</a> at higher resolutions and frame rates.\n                You don’t need to put together the <a\n                    href=\"https://www.techradar.com/news/computing/pc/10-of-the-best-gaming-pcs-you-can-buy-in-2015-1304263\">best\n                    gaming PC</a> to get high specs and performance anymore.\n                Plus, the best gaming laptops come in every shape and size.\n                <br><br>\n                That’s why you shouldn’t judge a gaming laptop by its cover.\n                Thanks to Nvidia Turing Max-Q graphics for laptops, there are a ton of gaming laptops that can hide in\n                plain sight.\n                Just look at the aptly named MSI GS65 Stealth. Don’t worry,\n                if you want a beastly desktop replacement, that option is still open to you,\n                with devices like the MSI GT75 that demand attention from anyone that steps in the room.\n                <br><br>\n                So, whether you want a thicc desktop replacement, packed with the most powerful graphics and processors\n                so that you can run the Division 2 and Sekiro: Shadows Die Twice with the settings cranked, you’re in\n                luck.\n                Or, if you just want a thin and light gaming laptop that’ll let you play your favorite games on the\n                road, we’ve got a few up your alley.\n                There are even some more affordable laptops like the Dell G3. And, don’t worry, we’ve tested these\n                gaming laptops ourselves, so you know they’ll be up to snuff.\n                <br>\n            </p>\n            <div>\n                <h2>1. Asus ROG Zephyrus S GX701 </h2>\n                <h3>Power and beauty</h3>\n                <p><b>CPU:</b> Intel Core i7 | <b>Graphics:</b> Nvidia GeForce GTX 2080 MAX-Q (8GB GDDR6 VRAM) |\n                    <b>RAM:</b> 8-24GB | <b> Screen:</b> 17.3-inch FHD (1,920 x 1,080) 144Hz panel with G-Sync |\n                    <b>Storage:</b> 1TB M.2 PCIe x4 SSD</p>\n                <img src=\"{{ \'/Demo-Pictures/laptop2.jpg\' | relative_url }}\" alt=\"ERROR\">\n            </div>\n            <div>\n                <p>If you want to play some of the best PC games on the move, but you don’t want everyone to know you’re\n                    playing games, the MSI GS65 Stealth is the best gaming laptop for you. Coming in at just .69 inches\n                    thick and featuring impressive hardware like Intel Coffee Lake processors and Nvidia GeForce GTX\n                    10-series – refreshed with RTX 20-series graphics at CES – the MSI GS65 Stealth packs a ton of power\n                    into a very svelte package. There’s nothing you won’t be able to throw at this thing that’ll slow it\n                    down. And, thanks to the subdued design, you’ll be able to bring this beefy rig everywhere you go,\n                    making it the best gaming laptop on the market right now.</p>\n            </div>\n            <div>\n                <h2>2. MSI GS65 Stealth </h2>\n                <h3>Thin. Beautiful. Powerful.</h3>\n                <p> <b>CPU:</b> Intel Core i7 | <b>Graphics:</b> Nvidia GeForce GTX 1070 (8GB GDDR5X VRAM, Max-Q) |\n                    <b>RAM:</b> 16GB | <b>Screen:</b> 15.6-inch FHD (1,920 x 1,080) anti-glare, wide-view 144Hz panel |\n                    <b>Storage:</b> 512GB M.2 SSD</p>\n                <img src=\"{{ \'/Demo-Pictures/laptop3.jpg\' | relative_url }}\" alt=\"ERROR\">\n            </div>\n            <div>\n                <p>If you want to play some of the best PC games on the move, but you don’t want everyone to know you’re\n                    playing games, the MSI GS65 Stealth is the best gaming laptop for you. Coming in at just .69 inches\n                    thick and featuring impressive hardware like Intel Coffee Lake processors and Nvidia GeForce GTX\n                    10-series – refreshed with RTX 20-series graphics at CES – the MSI GS65 Stealth packs a ton of power\n                    into a very svelte package. There’s nothing you won’t be able to throw at this thing that’ll slow it\n                    down. And, thanks to the subdued design, you’ll be able to bring this beefy rig everywhere you go,\n                    making it the best gaming laptop on the market right now.</p>\n            </div>\n            <div>\n                <h2>3. Razer Blade </h2>\n                <h3>The best Blade yet</h3>\n                <p><b>CPU:</b> Intel Core i7-8750H | <b>Graphics:</b> Nvidia GeForce RTX 2060 (6GB GDDR6 VRAM) - Nvidia\n                    GeForce RTX 2080 (8GB GDDR6 VRAM) | <b>RAM:</b> 16GB | <b>Screen:</b> Up to 15.6-inch UHD (3,840 x\n                    2,160) 60Hz touch display | <b>Storage:</b> 256GB - 512GB M.2 SSD</p>\n                <img src=\"{{ \'/Demo-Pictures/laptop4.jpg\' | relative_url }}\" alt=\"ERROR\">\n            </div>\n            <div>\n                <p>For a few years now, the Razer Blade has been among the best gaming laptops on the market, filled\n                    with powerful components, beautiful displays and an elegant chassis. That’s all true for the 2019\n                    model, too, which now rocks up to an Nvidia GeForce RTX 2080. That is, frankly, a ton of power for a\n                    laptop this thin and light. Plus, even if that’s not enough GPU horsepower for you, you can use the\n                    Razer Core for future expansion. It’s an expensive device, but it might be worth it if style and\n                    power are equally as important to you.</p>\n            </div>\n            <div>\n                <h2>4. Lenovo Legion Y7000P</h2>\n                <h3>The budget warrior</h3>\n                <p><b>CPU:</b> Intel Core i7 – 8750H | <b>Graphics:</b> Nvidia GeForce GTX 1060 (6GB GDDR5 VRAM) |\n                    <b>RAM:</b> 8GB – 16GB | <b>Screen:</b> 15.6-inch FHD (1,920 x 1,080) | <b>Storage:</b> 256GB SSD –\n                    256GB SSD + 1TB HDD</p>\n                <img src=\"{{ \'/Demo-Pictures/laptop5.jpg\' | relative_url }}\" alt=\"ERROR\">\n            </div>\n            <div>\n                <p>The best gaming laptops keep getting more expensive every day. Especially now that Nvidia RTX\n                    graphics are available, getting a powerful gaming laptop carries quite the toll. Luckily, laptops\n                    like the Lenovo Legion Y7000P are here to lighten the load. This budget-minded gaming laptop\n                    features an Nvidia GeForce GTX 1060, which should be just fine for its 1080p 60Hz display. When it’s\n                    a question of getting the essentials in order to save some cash, the Lenovo Legion Y7000P is a\n                    no-brainer.</p>\n            </div>\n            <div>\n                <h2>5. MSI GT75 Titan</h2>\n                <h3>The big one</h3>\n                <p><b>CPU:</b> 8th-generation Intel Core i7-i9 | <b>Graphics:</b> Nvidia GeForce GTX 1080 (8GB GDDR5X\n                    VRAM) | <b>RAM:</b> Up to 32GB | <b>Screen:</b> 17.3-inch FHD - UHD (1,920 x 1,080 - 3,840 x 2,160)\n                    | <b>Storage:</b> 1TB, 1TB HDD</p>\n                <img src=\"{{ \'/Demo-Pictures/laptop6.jpg\' | relative_url }}\" alt=\"ERROR\">\n            </div>\n            <div>\n                <p>Some gaming laptops just don’t pull any punches, enabling you to run any game you can imagine without\n                    breaking a sweat – and the MSI GT75 Titan is one of these laptops. It’s a titanic desktop\n                    replacement packing 6-core Intel Coffee Lake processors, plenty of RAM and powerful Nvidia Pascal\n                    graphics. You’re not going to be able to carry it around with you, and it’s not going to be\n                    something you’ll be caught with in a coffee shop, but if raw power is what you’re after, look no\n                    further. Just be ready to break open your piggy bank. </p>\n            </div>\n            <div>\n                <h2>6. Asus ROG G703GI</h2>\n                <h3>The behemoth</h3>\n                <p><b>CPU:</b> Intel Core i7-i9 | <b>Graphics:</b> Nvidia GeForce GTX 1080 (8GB GDDR5X VRAM) |\n                    <b>RAM:</b> 64GB | <b>Screen:</b> 17.3-inch FHD (1,920 x 1,080)144Hz | <b>Storage:</b> 3 x 512GB SSD\n                    (M.2, RAID 0), 2TB HDD</p>\n                <img src=\"{{ \'/Demo-Pictures/laptop7.jpg\' | relative_url }}\" alt=\"ERROR\">\n            </div>\n            <div>\n                <p>Thin and light gaming laptops are everywhere right now, but if you don’t care about that, and want a\n                    thick, heavy and monstrous laptop that can demolish any game you throw at it – the Asus ROG G703GI\n                    is for you. This is a massive – and expensive – laptop, but it justifies its size and price with\n                    gaming performance that rivals the best gaming PCs. Just don’t think you’ll be able to haul it along\n                    with you to your local coffee shop without its two power bricks – or awkward stares.</p>\n            </div>\n            <div>\n                <h2>7. Asus ROG Strix GL502</h2>\n                <h3>It\'s hard not to love a gaming laptop this good</h3>\n                <p><b>CPU:</b>Intel Core i7 | <b>Graphics:</b> Nvidia GeForce GTX 1060 - 1070 | <b>RAM:</b> 16GB DDR4 |\n                    <b>Screen:</b> 15.6-inch full HD 1,920 x 1,080 IPS | <b>Storage:</b> 128GB - 256GB SSD, 1TB HDD</p>\n                <img src=\"{{ \'/Demo-Pictures/laptop8.jpg\' | relative_url }}\" alt=\"ERROR\">\n            </div>\n            <div>\n                <p>It may not boast the most innovative design, substituting the usual black and red aesthetic for one\n                    that makes it feel like Halloween all year round (no complaints here). But, it’s undoubtedly one of\n                    the best when it comes to gaming in 1080p. In fact, we were able to crank the setting s all the way\n                    up in Overwatch without ever straying below 60fps. It doesn’t feature the longest battery life, but\n                    the screen, power and onboard sound system more than make up for it.</p>\n            </div>\n            <div>\n                <h2>8. Acer predator Helios 500</h2>\n                <h3>Big and powerful</h3>\n                <p><b>CPU:</b> Intel Core i7-i9 or AMD Ryzen 7 2700 | <b>Graphics:</b> AMD Vega 10 - Nvidia GeForce GTX\n                    1070 (8GB GDDR5X VRAM) | <b>RAM:</b> 16GB | <b>Screen:</b> 17.3-inch FHD (1,920 x 1,080) anti-glare,\n                    144Hz panel | <b>Storage:</b> 256GB - 1 TB M.2 SSD</p>\n                <img src=\"{{ \'/Demo-Pictures/laptop9.jpg\' | relative_url }}\" alt=\"ERROR\">\n            </div>\n            <div>\n                <p>If you’re looking for a powerful gaming laptop, and you don’t want to spring for one of those svelte\n                    thin and light gamign laptops, the Acer Predator Helios 500 is a good option. Packed with up to an\n                    Intel Core i9 processor and full-fat Nvidia GeForce GTX 1070 graphics, this gaming laptop will be\n                    able to handle any game you throw at it – even if it’s not the most portable device in the world. If\n                    you can get past the mediocre speakers and trackpad, there’s a lot to love here. </p>\n            </div>\n            <div>\n                <h2>9. Dell G3 15</h2>\n                <h3>Gaming great on a budget</h3>\n                <p><b>CPU:</b> Intel Core i5 8300H - Core i7-8750H | <b>Graphics:</b> Nvidia GeForce GTX 1050 - GTX 1060\n                    | <b>RAM:</b> 8GB – 16GB | <b>Screen:</b> 15.6-inch, FHD (1,920 x 1,080) | <b>Storage:</b> 1TB SSHD\n                    - 512GB PCIe SSD</p>\n                <img src=\"{{ \'/Demo-Pictures/laptop10.jpg\' | relative_url }}\" alt=\"ERROR\">\n            </div>\n            <div>\n                <p>When you’re setting out to buy one of the best gaming laptops, one of the first things you’ll likely\n                    notice is how expensive they can get. Luckily, the Dell G3 15 is not just extremely affordable, but\n                    it punches above its weight class with great 1080p gaming performance. With up to an Nvidia GTX 1060\n                    GPU, you’ll be able to play all the latest games at 1080p without breaking a sweat, even if it’s not\n                    at max settings all the time. And, that blue on black color combo is quite a looker, if that’s your\n                    aesthetic. </p>\n            </div>\n            <div>\n                <h2>10. Gigabyte Aero 15</h2>\n                <h3>Thin. Light. Powerful.</h3>\n                <p><b>CPU:</b> Intel Core i7 8750H - Intel Core i9-8950HK | <b>Graphics:</b> Nvidia GeForce RTX 2070\n                    (8GB GDDR6) - GeForce RTX 2080 (8GB GDDR6) | <b>RAM:</b>8GB – 32GB | <b>Screen:</b> 15.6-inch, FHD\n                    (1,920 x 1,080) LCD anti-glare 144Hz - UHD (3,840 x 2,160) 60Hz | <b>Storage:</b> 1TB - 2TB NVMe SSD\n                </p>\n\n            </div>\n            <div>\n                <p>Over the last couple of years, there’s been a trend among the best gaming laptops to make them as\n                    thin as possible. And, the Gigabyte Aero 15 definitely fits the bill, while delivering top-end\n                    gaming performance. This laptop is just 0.74 inches thick, while delivering up to an Nvidia GeForce\n                    RTX 2080 and an Intel Core i9 CPU. However, this thinness is a double-edged sword: the Core i9 gets\n                    way too hot and can throttle. So, just keep that in mind if you plan on doing any sustained creative\n                    work, like editing all your gaming videos. </p>\n            </div>','2019-05-03','2019-05-03',4);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_tags`
--

DROP TABLE IF EXISTS `posts_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `posts_tags` (
  `PostId` int(11) NOT NULL,
  `TagId` int(11) NOT NULL,
  PRIMARY KEY (`PostId`,`TagId`),
  KEY `fk_Posts_Tags_2_idx` (`TagId`),
  CONSTRAINT `fk_Posts_Tags_1` FOREIGN KEY (`PostId`) REFERENCES `posts` (`PostId`),
  CONSTRAINT `fk_Posts_Tags_2` FOREIGN KEY (`TagId`) REFERENCES `tags` (`TagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_tags`
--

LOCK TABLES `posts_tags` WRITE;
/*!40000 ALTER TABLE `posts_tags` DISABLE KEYS */;
INSERT INTO `posts_tags` VALUES (1,2),(1,3),(2,5);
/*!40000 ALTER TABLE `posts_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `RoleId` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Reader'),(2,'Premium'),(3,'Writter'),(4,'Editor'),(5,'Admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `states` (
  `StateId` int(11) NOT NULL AUTO_INCREMENT,
  `StateName` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`StateId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Not Approved'),(2,'Not Yet Approved'),(3,'Approved & Waiting to Publish'),(4,'Published');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tags` (
  `TagId` int(11) NOT NULL AUTO_INCREMENT,
  `TagName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`TagId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'News'),(2,'Phones'),(3,'Android'),(4,'iOS'),(5,'Laptops'),(6,'Asus'),(7,'Dell'),(8,'HP'),(9,'MSI'),(10,'Technology');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` text COLLATE utf8_unicode_ci NOT NULL,
  `Password` text COLLATE utf8_unicode_ci NOT NULL,
  `Name` text COLLATE utf8_unicode_ci NOT NULL,
  `Email` text COLLATE utf8_unicode_ci NOT NULL,
  `Address` text COLLATE utf8_unicode_ci NOT NULL,
  `Phone` text COLLATE utf8_unicode_ci NOT NULL,
  `DOB` date NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users_roles` (
  `UserId` int(11) NOT NULL,
  `RoleId` int(11) NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `fk_Users_Roles_2_idx` (`RoleId`),
  CONSTRAINT `fk_Users_Roles_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`),
  CONSTRAINT `fk_Users_Roles_2` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (2,1),(1,3),(3,3),(4,3),(5,3);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-12 21:18:54
