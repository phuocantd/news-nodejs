-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: DemoDB
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Editors_Posts`
--

DROP TABLE IF EXISTS `Editors_Posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Editors_Posts` (
  `UserId` int(11) NOT NULL,
  `PostId` int(11) NOT NULL,
  `State` int(11) DEFAULT NULL,
  `Time` datetime NOT NULL,
  PRIMARY KEY (`UserId`,`PostId`,`Time`),
  KEY `fk_Editors_Posts_2_idx` (`PostId`),
  CONSTRAINT `fk_Editors_Posts_1` FOREIGN KEY (`UserId`) REFERENCES `Users` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Editors_Posts_2` FOREIGN KEY (`PostId`) REFERENCES `Posts` (`PostId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Editors_Posts`
--

LOCK TABLES `Editors_Posts` WRITE;
/*!40000 ALTER TABLE `Editors_Posts` DISABLE KEYS */;
INSERT INTO `Editors_Posts` VALUES (4,1,4,'2019-05-01 00:00:00'),(4,5,4,'2019-04-01 00:05:00');
/*!40000 ALTER TABLE `Editors_Posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Editors_Tags`
--

DROP TABLE IF EXISTS `Editors_Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Editors_Tags` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `TagId` int(11) NOT NULL,
  PRIMARY KEY (`UserId`,`TagId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Editors_Tags`
--

LOCK TABLES `Editors_Tags` WRITE;
/*!40000 ALTER TABLE `Editors_Tags` DISABLE KEYS */;
INSERT INTO `Editors_Tags` VALUES (4,1),(4,3),(4,5),(4,9),(4,10);
/*!40000 ALTER TABLE `Editors_Tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Posts`
--

DROP TABLE IF EXISTS `Posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Posts` (
  `PostId` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) NOT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Author` int(11) DEFAULT NULL,
  `Content` longtext,
  `DraftDate` date NOT NULL,
  `PublishedDate` date DEFAULT NULL,
  `State` int(11) NOT NULL,
  PRIMARY KEY (`PostId`),
  UNIQUE KEY `Id_UNIQUE` (`PostId`),
  KEY `fk_Posts_1_idx` (`State`),
  KEY `fk_Posts_2_idx` (`Author`),
  FULLTEXT KEY `Title` (`Title`,`Description`),
  CONSTRAINT `fk_Posts_1` FOREIGN KEY (`State`) REFERENCES `States` (`StateId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Posts_2` FOREIGN KEY (`Author`) REFERENCES `Users` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Posts`
--

LOCK TABLES `Posts` WRITE;
/*!40000 ALTER TABLE `Posts` DISABLE KEYS */;
INSERT INTO `Posts` VALUES (1,'Pixel 3 phones aren\'t selling, and it\'s probably Verizon\'s fault','Commentary: Google\'s carrier exclusive with Verizon isn\'t doing Pixel sales any favors',1,'<p>\n                Google says it\'s sold\n                <a href=\"https://www.cnet.com/news/googles-pricey-pixel-phones-arent-selling-even-at-steep-discounts/\">fewer\n                    Pixel phones year over year</a>\n                due to fierce smartphone competition on the high end, but that probably isn\'t the entire story. There\'s\n                a good chance that the company\'s agreement to make Verizon the Pixel\'s exclusive US carrier plays a\n                role.\n                <br><br>\n                On Monday, Ruth Porat, CFO of Google\'s parent company Alphabet, explained declining Pixel sales as due\n                in part to \"heavy promotional activity industry-wide\" and \"recent pressures in the premium smartphone\n                market.\" Even with deep discounts, people just aren\'t buying Pixel phones, despite best-in-class camera\n                performance and glowing recommendations from CNET and other outlets.\n                <br><br>\n                The Pixel 3 was CNET\'s top Android phone of 2018. So why haven\'t buyers been snapping it up like\n                hotcakes?\n                <br>\n            </p>\n            <img src=\"{{ \'/Demo-Pictures/google-pixel-3-02.jpg\' | relative_url }}\" alt=\"ERROR\">\n            <p>\n                <br>\n                There might be a few reasons for this. First, times are tough across the board. The smartphone market\n                has been slowing down. Apple just announced that it sold fewer iPhones than it did a year ago. People\n                are keeping their phones longer between upgrades, and prices are skyrocketing year over year. New phones\n                are entering the market, like T-Mobile\'s \"premium affordable\" OnePlus 6T, and buyers may be holding\n                their collective breath to see how foldable phones and 5G networks pan out in 2019. (Hint: not too great\n                so far.)\n                <br><br>\n                But for the Pixel phones in particular, Verizon\'s exclusive backing might be almost as much of a\n                hindrance in getting the word out as it is a benefit. Verizon is the US\' largest carrier, which gives\n                the Pixel the advantage of being discovered when buyers walk into a shop or peruse the carrier\'s\n                website.\n                <br><br>\n                But the Pixel is also plagued by a strong misperception that Verizon is the exclusive seller, period. In\n                fact, you can buy the Pixel 3 phones through Google\'s online store for use with any US carrier, as well\n                as Google\'s own hybrid Fi network.\n                <br><br>\n                Limiting carrier exposure surely doesn\'t help get the word out, and you would think that Google would\n                have as much clout as Apple and Samsung in getting its phones on any wireless provider it chooses.\n                <br><br>\n                Google\'s mostly-direct-to-consumer-except-for-Verizon sales model clearly isn\'t working, and I\'m not\n                surprised. The vast majority of people -- we\'re talking about well into 90% -- buy their handset from a\n                carrier, not from a phone-maker, even one with as much pull as Google. If your carrier doesn\'t have a\n                particular phone, why not just get another pretty good alternative instead?\n                <br>\n            </p>\n            <img src=\"{{ \'/Demo-Pictures/google-pixel-3-03.jpg\' | relative_url }}\" alt=\"ERROR\">\n            <p>\n                <br>\n                The rumored Google Pixel 3A is said to come to T-Mobile as well as Verizon, which, if true, will put the\n                Pixel in front of more buyers. (T-Mobile is also trying to mute Verizon\'s thunder with its\n                <a href=\"https://support.t-mobile.com/docs/DOC-35609\">#GetOutofTheRed campaign</a> .)\n                <br><br>\n                Exiting an <a\n                    href=\"https://www.cnet.com/news/at-t-prepares-for-the-end-to-iphone-exclusivity/\">exclusivity\n                    contract with AT&T</a>\n                on the very first iPhone helped Apple create the boom that\n                made its smartphone one of the most iconic, sought-after phones in the world. Google can only hope that\n                expanding into T-Mobile would do the same.\n                <br><br>\n                For Google\'s sake, I hope the Pixel\'s rumored carrier parade won\'t stop there.\n                <br><br>\n                Verizon said, \"We don\'t comment on future contracts nor would we comment on sales.\" Google did not\n                comment.\n                <br>\n            </p>\n            <img src=\"{{ \'/Demo-Pictures/google-pixel-3-04.jpg\' | relative_url }}\" alt=\"ERROR\">\n            <h6><br>MENTIONED ABOVE</h6>\n            <h3><strong>Google Pixel (128GB, Quite Black)</strong></h3>','2019-05-01','2019-05-01',4),(2,'Best gaming laptops 2019: the 10 top gaming laptops we\'ve reviewed','Find the best gaming laptop to suit your fragging needs',2,'<p>The best gaming laptops have changed so much in such a short amount of time, and now they’re more powerful than ever\n    before. Thanks to additions like Nvidia RTX graphics, the best gaming laptops can push the best <a\n        href=\"https://www.techradar.com/news/gaming/10-best-pc-games-the-must-play-titles-you-can-t-afford-to-miss-1292327\"\n        data-mce-href=\"https://www.techradar.com/news/gaming/10-best-pc-games-the-must-play-titles-you-can-t-afford-to-miss-1292327\">PC\n        games</a> at higher resolutions and frame rates. You don’t need to put together the <a\n        href=\"https://www.techradar.com/news/computing/pc/10-of-the-best-gaming-pcs-you-can-buy-in-2015-1304263\"\n        data-mce-href=\"https://www.techradar.com/news/computing/pc/10-of-the-best-gaming-pcs-you-can-buy-in-2015-1304263\">best\n        gaming PC</a> to get high specs and performance anymore. Plus, the best gaming laptops come in every shape and\n    size. <br><br>That’s why you shouldn’t judge a gaming laptop by its cover. Thanks to Nvidia Turing Max-Q graphics\n    for laptops, there are a ton of gaming laptops that can hide in plain sight. Just look at the aptly named MSI GS65\n    Stealth. Don’t worry, if you want a beastly desktop replacement, that option is still open to you, with devices like\n    the MSI GT75 that demand attention from anyone that steps in the room. <br><br>So, whether you want a thicc desktop\n    replacement, packed with the most powerful graphics and processors so that you can run the Division 2 and Sekiro:\n    Shadows Die Twice with the settings cranked, you’re in luck. Or, if you just want a thin and light gaming laptop\n    that’ll let you play your favorite games on the road, we’ve got a few up your alley. There are even some more\n    affordable laptops like the Dell G3. And, don’t worry, we’ve tested these gaming laptops ourselves, so you know\n    they’ll be up to snuff. <br></p>\n<div>\n    <h2>1. Asus ROG Zephyrus S GX701</h2>\n    <h3>Power and beauty</h3>\n    <p><strong>CPU:</strong> Intel Core i7 | <strong>Graphics:</strong> Nvidia GeForce GTX 2080 MAX-Q (8GB GDDR6 VRAM) |\n        <strong>RAM:</strong> 8-24GB | <strong> Screen:</strong> 17.3-inch FHD (1,920 x 1,080) 144Hz panel with G-Sync |\n        <strong>Storage:</strong> 1TB M.2 PCIe x4 SSD</p><img\n        src=\"https://cdn.mos.cms.futurecdn.net/LxZCrUqHaSFZARDyxyP9tS-650-80.jpg\" alt=\"ERROR\"\n        data-mce-src=\"https://cdn.mos.cms.futurecdn.net/LxZCrUqHaSFZARDyxyP9tS-650-80.jpg\" width=\"650\" height=\"433\">\n</div>\n<div>\n    <p>If you want to play some of the best PC games on the move, but you don’t want everyone to know you’re playing\n        games, the MSI GS65 Stealth is the best gaming laptop for you. Coming in at just .69 inches thick and featuring\n        impressive hardware like Intel Coffee Lake processors and Nvidia GeForce GTX 10-series – refreshed with RTX\n        20-series graphics at CES – the MSI GS65 Stealth packs a ton of power into a very svelte package. There’s\n        nothing you won’t be able to throw at this thing that’ll slow it down. And, thanks to the subdued design, you’ll\n        be able to bring this beefy rig everywhere you go, making it the best gaming laptop on the market right now.</p>\n</div>\n<div>\n    <h2>2. MSI GS65 Stealth</h2>\n    <h3>Thin. Beautiful. Powerful.</h3>\n    <p><strong>CPU:</strong> Intel Core i7 | <strong>Graphics:</strong> Nvidia GeForce GTX 1070 (8GB GDDR5X VRAM, Max-Q)\n        | <strong>RAM:</strong> 16GB | <strong>Screen:</strong> 15.6-inch FHD (1,920 x 1,080) anti-glare, wide-view\n        144Hz panel | <strong>Storage:</strong> 512GB M.2 SSD</p><img\n        src=\"https://cdn.mos.cms.futurecdn.net/5Hg2RbMX5hFez5mxGMnnxW-650-80.jpg\" alt=\"ERROR\"\n        data-mce-src=\"https://cdn.mos.cms.futurecdn.net/5Hg2RbMX5hFez5mxGMnnxW-650-80.jpg\" width=\"650\" height=\"366\">\n</div>\n<div>\n    <p>If you want to play some of the best PC games on the move, but you don’t want everyone to know you’re playing\n        games, the MSI GS65 Stealth is the best gaming laptop for you. Coming in at just .69 inches thick and featuring\n        impressive hardware like Intel Coffee Lake processors and Nvidia GeForce GTX 10-series – refreshed with RTX\n        20-series graphics at CES – the MSI GS65 Stealth packs a ton of power into a very svelte package. There’s\n        nothing you won’t be able to throw at this thing that’ll slow it down. And, thanks to the subdued design, you’ll\n        be able to bring this beefy rig everywhere you go, making it the best gaming laptop on the market right now.</p>\n</div>\n<div>\n    <h2>3. Razer Blade</h2>\n    <h3>The best Blade yet</h3>\n    <p><strong>CPU:</strong> Intel Core i7-8750H | <strong>Graphics:</strong> Nvidia GeForce RTX 2060 (6GB GDDR6 VRAM) -\n        Nvidia GeForce RTX 2080 (8GB GDDR6 VRAM) | <strong>RAM:</strong> 16GB | <strong>Screen:</strong> Up to 15.6-inch\n        UHD (3,840 x 2,160) 60Hz touch display | <strong>Storage:</strong> 256GB - 512GB M.2 SSD</p><img\n        src=\"https://cdn.mos.cms.futurecdn.net/p2SsprrRPN2EYMugKEnZEm-650-80.jpg\" alt=\"ERROR\"\n        data-mce-src=\"https://cdn.mos.cms.futurecdn.net/p2SsprrRPN2EYMugKEnZEm-650-80.jpg\" width=\"650\" height=\"366\">\n</div>\n<div>\n    <p>For a few years now, the Razer Blade has been among the best gaming laptops on the market, filled with powerful\n        components, beautiful displays and an elegant chassis. That’s all true for the 2019 model, too, which now rocks\n        up to an Nvidia GeForce RTX 2080. That is, frankly, a ton of power for a laptop this thin and light. Plus, even\n        if that’s not enough GPU horsepower for you, you can use the Razer Core for future expansion. It’s an expensive\n        device, but it might be worth it if style and power are equally as important to you.</p>\n</div>\n<div>\n    <h2>4. Lenovo Legion Y7000P</h2>\n    <h3>The budget warrior</h3>\n    <p><strong>CPU:</strong> Intel Core i7 – 8750H | <strong>Graphics:</strong> Nvidia GeForce GTX 1060 (6GB GDDR5 VRAM)\n        | <strong>RAM:</strong> 8GB – 16GB | <strong>Screen:</strong> 15.6-inch FHD (1,920 x 1,080) |\n        <strong>Storage:</strong> 256GB SSD – 256GB SSD + 1TB HDD</p><img\n        src=\"https://cdn.mos.cms.futurecdn.net/9jtKYfAVydhmV2qH5VF6Zg-650-80.jpg\" alt=\"ERROR\"\n        data-mce-src=\"https://cdn.mos.cms.futurecdn.net/9jtKYfAVydhmV2qH5VF6Zg-650-80.jpg\" width=\"650\" height=\"366\">\n</div>\n<div>\n    <p>The best gaming laptops keep getting more expensive every day. Especially now that Nvidia RTX graphics are\n        available, getting a powerful gaming laptop carries quite the toll. Luckily, laptops like the Lenovo Legion\n        Y7000P are here to lighten the load. This budget-minded gaming laptop features an Nvidia GeForce GTX 1060, which\n        should be just fine for its 1080p 60Hz display. When it’s a question of getting the essentials in order to save\n        some cash, the Lenovo Legion Y7000P is a no-brainer.</p>\n</div>\n<div>\n    <h2>5. MSI GT75 Titan</h2>\n    <h3>The big one</h3>\n    <p><strong>CPU:</strong> 8th-generation Intel Core i7-i9 | <strong>Graphics:</strong> Nvidia GeForce GTX 1080 (8GB\n        GDDR5X VRAM) | <strong>RAM:</strong> Up to 32GB | <strong>Screen:</strong> 17.3-inch FHD - UHD (1,920 x 1,080 -\n        3,840 x 2,160) | <strong>Storage:</strong> 1TB, 1TB HDD</p><img\n        src=\"https://cdn.mos.cms.futurecdn.net/mshe2Fg8qjeY6DvNQAghnB-650-80.jpg\" alt=\"ERROR\"\n        data-mce-src=\"https://cdn.mos.cms.futurecdn.net/mshe2Fg8qjeY6DvNQAghnB-650-80.jpg\" width=\"650\" height=\"366\">\n</div>\n<div>\n    <p>Some gaming laptops just don’t pull any punches, enabling you to run any game you can imagine without breaking a\n        sweat – and the MSI GT75 Titan is one of these laptops. It’s a titanic desktop replacement packing 6-core Intel\n        Coffee Lake processors, plenty of RAM and powerful Nvidia Pascal graphics. You’re not going to be able to carry\n        it around with you, and it’s not going to be something you’ll be caught with in a coffee shop, but if raw power\n        is what you’re after, look no further. Just be ready to break open your piggy bank.</p>\n</div>\n<div>\n    <h2>6. Asus ROG G703GI</h2>\n    <h3>The behemoth</h3>\n    <p><strong>CPU:</strong> Intel Core i7-i9 | <strong>Graphics:</strong> Nvidia GeForce GTX 1080 (8GB GDDR5X VRAM) |\n        <strong>RAM:</strong> 64GB | <strong>Screen:</strong> 17.3-inch FHD (1,920 x 1,080)144Hz |\n        <strong>Storage:</strong> 3 x 512GB SSD (M.2, RAID 0), 2TB HDD</p><img\n        src=\"https://cdn.mos.cms.futurecdn.net/bf20bd5c2294ade84abd646aada7d238-650-80.jpg\" alt=\"ERROR\"\n        data-mce-src=\"https://cdn.mos.cms.futurecdn.net/bf20bd5c2294ade84abd646aada7d238-650-80.jpg\" width=\"650\"\n        height=\"366\">\n</div>\n<div>\n    <p>Thin and light gaming laptops are everywhere right now, but if you don’t care about that, and want a thick, heavy\n        and monstrous laptop that can demolish any game you throw at it – the Asus ROG G703GI is for you. This is a\n        massive – and expensive – laptop, but it justifies its size and price with gaming performance that rivals the\n        best gaming PCs. Just don’t think you’ll be able to haul it along with you to your local coffee shop without its\n        two power bricks – or awkward stares.</p>\n</div>\n<div>\n    <h2>7. Asus ROG Strix GL502</h2>\n    <h3>It\'s hard not to love a gaming laptop this good</h3>\n    <p><strong>CPU:</strong>Intel Core i7 | <strong>Graphics:</strong> Nvidia GeForce GTX 1060 - 1070 |\n        <strong>RAM:</strong> 16GB DDR4 | <strong>Screen:</strong> 15.6-inch full HD 1,920 x 1,080 IPS |\n        <strong>Storage:</strong> 128GB - 256GB SSD, 1TB HDD</p><img\n        src=\"https://cdn.mos.cms.futurecdn.net/QQPdNCvAgLXNU39ZRLvYsF-650-80.jpg\" alt=\"ERROR\"\n        data-mce-src=\"https://cdn.mos.cms.futurecdn.net/QQPdNCvAgLXNU39ZRLvYsF-650-80.jpg\" width=\"650\" height=\"366\">\n</div>\n<div>\n    <p>It may not boast the most innovative design, substituting the usual black and red aesthetic for one that makes it\n        feel like Halloween all year round (no complaints here). But, it’s undoubtedly one of the best when it comes to\n        gaming in 1080p. In fact, we were able to crank the setting s all the way up in Overwatch without ever straying\n        below 60fps. It doesn’t feature the longest battery life, but the screen, power and onboard sound system more\n        than make up for it.</p>\n</div>\n<div>\n    <h2>8. Acer predator Helios 500</h2>\n    <h3>Big and powerful</h3>\n    <p><strong>CPU:</strong> Intel Core i7-i9 or AMD Ryzen 7 2700 | <strong>Graphics:</strong> AMD Vega 10 - Nvidia\n        GeForce GTX 1070 (8GB GDDR5X VRAM) | <strong>RAM:</strong> 16GB | <strong>Screen:</strong> 17.3-inch FHD (1,920\n        x 1,080) anti-glare, 144Hz panel | <strong>Storage:</strong> 256GB - 1 TB M.2 SSD</p><img\n        src=\"https://cdn.mos.cms.futurecdn.net/uKe6DENqStT3nrNUnN7w4c-650-80.jpg\" alt=\"ERROR\"\n        data-mce-src=\"https://cdn.mos.cms.futurecdn.net/uKe6DENqStT3nrNUnN7w4c-650-80.jpg\" width=\"650\" height=\"366\">\n</div>\n<div>\n    <p>If you’re looking for a powerful gaming laptop, and you don’t want to spring for one of those svelte thin and\n        light gamign laptops, the Acer Predator Helios 500 is a good option. Packed with up to an Intel Core i9\n        processor and full-fat Nvidia GeForce GTX 1070 graphics, this gaming laptop will be able to handle any game you\n        throw at it – even if it’s not the most portable device in the world. If you can get past the mediocre speakers\n        and trackpad, there’s a lot to love here.</p>\n</div>\n<div>\n    <h2>9. Dell G3 15</h2>\n    <h3>Gaming great on a budget</h3>\n    <p><strong>CPU:</strong> Intel Core i5 8300H - Core i7-8750H | <strong>Graphics:</strong> Nvidia GeForce GTX 1050 -\n        GTX 1060 | <strong>RAM:</strong> 8GB – 16GB | <strong>Screen:</strong> 15.6-inch, FHD (1,920 x 1,080) |\n        <strong>Storage:</strong> 1TB SSHD - 512GB PCIe SSD</p><img\n        src=\"https://cdn.mos.cms.futurecdn.net/mtY6zDcS4zozs7hFhC4VMW-650-80.jpg\" alt=\"ERROR\"\n        data-mce-src=\"https://cdn.mos.cms.futurecdn.net/mtY6zDcS4zozs7hFhC4VMW-650-80.jpg\" width=\"650\" height=\"380\">\n</div>\n<div>\n    <p>When you’re setting out to buy one of the best gaming laptops, one of the first things you’ll likely notice is\n        how expensive they can get. Luckily, the Dell G3 15 is not just extremely affordable, but it punches above its\n        weight class with great 1080p gaming performance. With up to an Nvidia GTX 1060 GPU, you’ll be able to play all\n        the latest games at 1080p without breaking a sweat, even if it’s not at max settings all the time. And, that\n        blue on black color combo is quite a looker, if that’s your aesthetic.</p>\n</div>\n<div>\n    <h2>10. Gigabyte Aero 15</h2>\n    <h3>Thin. Light. Powerful.</h3>\n    <p><strong>CPU:</strong> Intel Core i7 8750H - Intel Core i9-8950HK | <strong>Graphics:</strong> Nvidia GeForce RTX\n        2070 (8GB GDDR6) - GeForce RTX 2080 (8GB GDDR6) | <strong>RAM:</strong>8GB – 32GB | <strong>Screen:</strong>\n        15.6-inch, FHD (1,920 x 1,080) LCD anti-glare 144Hz - UHD (3,840 x 2,160) 60Hz | <strong>Storage:</strong> 1TB -\n        2TB NVMe SSD</p>\n</div>\n<div>\n    <p>Over the last couple of years, there’s been a trend among the best gaming laptops to make them as thin as\n        possible. And, the Gigabyte Aero 15 definitely fits the bill, while delivering top-end gaming performance. This\n        laptop is just 0.74 inches thick, while delivering up to an Nvidia GeForce RTX 2080 and an Intel Core i9 CPU.\n        However, this thinness is a double-edged sword: the Core i9 gets way too hot and can throttle. So, just keep\n        that in mind if you plan on doing any sustained creative work, like editing all your gaming videos.</p>\n</div>','2019-05-03','2019-05-03',4),(3,'Tuyệt chiêu xem ghi chú iPhone trên Gmail','Thông thường bạn chỉ có thể xem ghi chú iOS trên iPhone và iPad, bài viết sau đây sẽ hướng dẫn bạn cách xem nó trên Gmail',6,'<p>\n                <br>\n                Apple tích hợp sẵn rất nhiều ứng dụng hữu ích trên iPhone và iPad, và Notes (Ghi chú) là một trong số chúng. Nó chứa rất nhiều tính năng ghi chú hay ho và xứng đáng có mặt trên các nền tảng khác. Tuy nhiên, ứng dụng này chỉ có mặt trên hệ sinh thái Apple. Nếu bạn muốn sử dụng nó trên các nền tảng khác, bạn phải nhờ đến iCloud.\n            </p>\n            <p>\n                <br>\n                Theo đó, bạn cần mở iCloud trên các thiết bị khác và xem ghi chú tại đó. Mặc dù vậy, không phải người dùng nào cũng thích sử dụng nhiều dịch vụ hoặc trang web trong khi công việc có thể hoàn thành chỉ với một ứng dụng hoặc dịch vụ duy nhất. Vậy, tại sao không đồng bộ ghi chú từ iPhone/iPad với dịch vụ bạn sử dụng thường xuyên nhất - Gmail. Liệu điều này có khả thi?\n                <br><br>\n                Câu trả lời là có, bạn hoàn toàn có thể thực hiện việc này. Quy trình tổng thể sẽ bao gồm thêm tài khoản Gmail vào iPhone, bật tùy chọn đồng bộ Notes (Ghi chú) trên Gmail, tạo ghi chú và cuối cùng là xem chúng trên Gmail.\n                <br><br><b>1. Thêm tài khoản Gmail</b>\n                <br><br>\n                Việc đầu tiên bạn cần làm là thêm tài khoản Gmail vào iPhone/iPad. Nếu bạn đã thêm nó rồi, bạn có thể bỏ qua bước này. Ngược lại, hãy làm theo các bước dưới đây:\n                <br><br>\n                <b>Bước 1:</b> Mở ứng dụng Settings (Cài đặt) trên thiết bị iOS. Di chuyển đến phần Passwords & Accounts (Mật khẩu & Tài khoản).\n            </p>\n            <p>\n                <br><b>Bước 2:</b> Chọn Add account (Thêm tài khoản) và sau đó chọn Google.\n            </p>\n            <p>\n                <br>\n                <b>Bước 3:</b> Nhập thông tin đăng nhập tài khoản Google và làm theo các bước hướng dẫn trên màn hình.\n                <br><br>\n                Hoàn tất, bạn sẽ thấy nhãn Gmail bên dưới cài đặt Passwords & Accounts (Mật khẩu & Tài khoản).\n            </p>\n            <p>\n                <br><b>2. Kích hoạt tùy chọn Notes trên Gmail</b>\n                <br><br>\n                Bây giờ để đồng bộ dữ liệu từ ứng dụng Notes sang Gmail, bạn cần bật đồng bộ trên Gmail.\n                <br><br>\n                Để thực hiện, bạn truy cập vào Settings (Cài đặt) > Passwords & Accounts (Mật khẩu & Tài khoản). Chọn Gmail và bật công tắc bên cạnh tùy chọn Notes (Ghi chú).\n            </p>\n            <p>\n                <br>\n                <b>3. Tạo ghi chú đồng bộ với Gmail</b>\n                <br><br>\n                Khi bạn bật tùy chọn Notes (Ghi chú) trên Gmail, tất cả các ghi chú hiện tại sẽ không đồng bộ sang Gmail. Thay vào đó, ứng dụng Notes (Ghi chú) sẽ tạo ra một phần mới có tên Gmail, và chỉ những ghi chú trong phần này được đồng bộ sang Gmail.\n                <br><br>\n                Chính vì vậy, bạn hãy mở ứng dụng Notes và chọn tùy chọn Notes bên dưới phần Gmail mới. Sau đó bấm nút Add (Thêm) và bắt đầu nhập nội dung ghi chú.\n            </p>\n            <p>\n                <br>Nên nhớ rằng bạn không thể tạo thư mục bên dưới phần Gmail mới như cách bạn làm với iCloud. Mặc định, tất cả ghi chú sẽ chỉ nằm trong thư mục Notes.\n                <br><br>\n                <b>4. Xem ghi chú trên Gmail</b>\n                <br><br>Bước cuối cùng là xem ghi chú trên Gmail. Chúng sẽ xuất hiện bên dưới nhãn Notes (Ghi chú) trên giao diện web và ứng dụng di động của Gmail.\n                <br><br>Để xem ghi chú, bạn đăng nhập vào Gmail trên web hoặc ứng dụng. Từ giao diện web, bạn tìm nhãn Notes (Ghi chú) ở thanh bên trái. Trên ứng dụng di động, bạn vuốt sang phải từ thanh bên trái và chọn Notes (Ghi chú).\n            </p>\n            <p>\n                <br>Các ghi chú xuất hiện như thể một email thông thường. Bạn hãy nhấp chuột hoặc chạm lên email để xem nội dung ghi chú.\n            </p>\n            <p>\n                <br>\n                Đến đây, bạn đã biết cách đồng bộ ghi chú từ thiết bị iOS sang Gmail. Tiếp theo, bạn cần lưu ý một số việc quan trọng dưới đây.\n                <br><br><b>Chỉnh sửa ghi chú</b>\n                <br><br>Bạn chỉ có thể chỉnh sửa ghi chú trên các thiết bị iOS. Nghĩa là, mặc dù bạn có thể xem ghi chú trên Gmail từ thiết bị bất kỳ, nhưng bạn không thể chỉnh sửa chúng. Apple chỉ cho phép bạn đồng bộ một chiều từ iOS sang Gmail, bạn không thể đồng bộ theo chiều ngược lại.\n            </p>\n            <p>\n                <b>Xóa ghi chú</b>\n                <br><br>Không giống như thao tác chỉnh sửa ghi chú, bạn có thể xóa ghi chú từ ứng dụng Notes cũng như trên Gmail. Nếu bạn xóa một ghi chú trên Gmail, ghi chú đó sẽ biến mất khỏi ứng dụng Notes trên iPhone và ngược lại. Do đó, bạn hãy nghĩ thật kỹ trước khi bấm nút xóa.\n                <br><br>Quá trình xóa ghi chú sẽ không diễn ra tức thời. Bạn cần tải lại Gmail và ứng dụng Notes để cập nhật các thay đổi.\n                <br><br><b>Ghi chú iCloud</b>\n                <br><br>Các ghi chú xuất hiện bên dưới phần iCloud của ứng dụng Notes sẽ không được đồng bộ với Gmail, và những ghi chú nằm bên dưới phần Gmail cũng sẽ không đồng bộ với iCloud. Bởi vậy, chúng sẽ không có mặt trên trang web iCloud và các thiết bị iOS khác.\n                <br><br><b>Di chuyển ghi chú từ Gmail sang iCloud</b>\n                <br><br>May thay, bạn có thể dễ dàng di chuyển ghi chú bạn đã lưu trên Gmail sang iCloud. Để làm thế, bạn mở ứng dụng Notes và chọn thư mục Notes bên dưới phần Gmail. Sau đó, bạn bấm nút Edit (Sửa).\n            </p>\n            <p>\n                <br>Tiếp theo, bạn chọn ghi chú và bấm nút Move to (Di chuyển đến). Cuối cùng, bạn chọn thư mục iCloud.\n            </p>\n            <p>\n                <br>Tiếc là bạn không thể di chuyển ghi chú iCloud sang Gmail.\n            </p>','2019-05-20','2019-06-11',4),(4,'iOS 13 có tính năng giúp tăng tuổi thọ pin trên iPhone','Apple vừa bổ sung một tính năng mới giúp tối ưu hóa việc sạc pin trên iOS 13. Điều này hứa hẹn sẽ giúp giải quyết tình trạng sập nguồn khi máy phải xử lý một tác vụ phức tạp',7,'<p>\n                <br>\n                Những chiếc iPhone của Apple sử dụng pin Lithium-ion. Để đảm bảo duy trì tuổi thọ pin được lâu dài, Apple đặt ra một hạn mức về tốc độ sạc. Theo đó, 80% pin sẽ được sạc với tốc độ nhanh, trong khi 20% pin còn lại được sạc theo kiểu nhỏ giọt.\n            </p>\n            <p>\n                <br>Trong trường hợp người dùng tiếp tục cắm sạc khi máy đã đầy 100% pin, những chiếc iPhone sẽ tiếp tục được sạc theo kiểu nhỏ giọt. Điều này có thể rút ngắn tuổi thọ của pin trên iPhone.\n                <br><br>Với iOS 13, Apple đã phát triển một tính năng mới cho phép máy có thể ghi nhớ thói quen sạc của người dùng. Theo đó, nếu bạn thường sạc điện thoại trước khi đi ngủ và thức dậy lúc 7h sáng, chiếc iPhone sẽ tự tính toán việc sạc nhỏ giọt sao cho thiết bị sạc đầy pin vào đúng 7h. Do không phải sạc liên tục sau khi đã đầy, pin của máy sẽ duy trì được tuổi thọ.\n                <br><br>Theo giải thích của Apple, hãng này đã sử dụng công nghệ học máy để thiết bị có thể hiểu được thói quen sạc của người sử dụng. Người dùng iPhone sẽ thấy tính năng mới được bật mặc định trong phần cài đặt pin của những máy đã nâng cấp lên iOS 13.\n            </p>','2019-05-01','2019-05-03',4),(5,'Samsung sẽ vượt phần còn lại của thị trường di động trong cuộc chiến 5G?','Trong khi các nhà sản xuất khác vẫn đang loay hoay tìm nguồn cung, Samsung đã ở trạng thái sẵn sàng cho việc ra mắt những mẫu smartphone chạy trên nền tảng công nghệ 5G',6,'<p>\n                <br>\n                Theo Phonearena, chiếc Galaxy Note 10 sắp ra mắt trong tháng 8 của Samsung sẽ có một phiên bản được tích hợp công nghệ 5G. Một phiên bản 5G tương tự cũng sẽ được ra mắt cùng với Galaxy S11. Chiếc điện thoại này nhiều khả năng sẽ sử dụng con chip Snapdragon 865 tích hợp 5G do Qualcomm cung cấp.\n                <br><br>\n                Những tin tức mới nhất từ Hàn Quốc còn cho thấy, Samsung đang rất tích cực trong việc đưa công nghệ 5G vào trong dòng chip xử lý Exynos của mình. Nhà sản xuất Hàn Quốc đang tăng tốc phát triển nhằm cho ra đời hệ thống chip 5G đầu tiên cho thị trường di động.\n            </p>\n            <p>\n                <br>\n                Người đứng đầu bộ phận vi mạch mật độ tích hợp cao (LSI), nơi phát triển chip Exynos của Samsung cho biết, Samsung đã thương mại hóa chipset 5G lần đầu tiên vào tháng 8 năm ngoái, giờ là lúc hãng tập trung cho SoC 5G trên di động.\n                <br><br>\n                Nhiều khả năng Samsung sẽ vượt qua nhiều đối thủ nặng ký như Qualcomm hay MediaTek trong cuộc chiến sản xuất chip 5G. Với việc Huawei bị loại khỏi cuộc đua 5G do những căng thẳng đến từ mối quan hệ Mỹ - Trung, Samsung có thể tận dụng điều này trong cuộc chiến cạnh tranh trên thị trường di động.\n            </p>\n            <p>\n                <br>Lý do cho sự ra đời các phiên bản 5G bởi moderm và anten cho 5G tách biệt hoàn toàn với hệ thống chip SoC. Các thành phần bổ sung cho nó, dù nhỏ nhưng vẫn cần thêm không gian, cần được làm mát và cách ly nhiễu.\n                <br><br>\n                Do vậy, các mẫu máy tích hợp 5G thường nặng hơn, cồng kềnh hơn và có giá thành cao hơn so với các phiên bản thông thường chỉ được tích hợp 4G. Mức giá cho các phiên bản này có thể cao hơn khoảng 20-30% so với phiên bản có cấu hình cơ bản.\n                <br><br>\n                Apple đang xem xét khả năng mua lại Infeneon - công ty nắm giữ mảng sản xuất modem không dây của Intel. Nếu điều này thành công, Táo khuyết có thể loại bỏ sự phụ thuộc đối với Qualcomm và bắt tay vào việc sản xuất moderm 5G. Việc tạo ra chip 5G khó khăn hơn nhiều so với một con chip di động thông thường. Do vậy, quá trình sản xuất chip 5G của Apple sẽ khó có thể mang lại kết quả ngay trong tương lai gần.\n            </p>','2019-05-20','2019-06-11',4),(6,'Doanh số điện thoại Huawei đang sụt giảm với tốc độ phi mã','Huawei từng phủ nhận thông tin phải cắt giảm sản lượng sản xuất smartphone tại các nhà máy. Tuy vậy, thực tế cho thấy doanh số điện thoại Huawei đã giảm mạnh trong một tháng trở lại đây.',1,'   <p><br>Sau lệnh cấm của chính phủ Mỹ, nhiều công ty công nghệ đã cắt đứt mối quan hệ làm ăn với Huawei. Do còn lượng lớn linh kiện dự trữ trong kho, việc bị các bạn hàng quay lưng chưa thực sự ảnh hưởng đến quá trình sản xuất của tập đoàn công nghệ hàng đầu Trung Quốc. Thế nhưng, thực tế lại hoàn toàn khác ở mặt trận kinh doanh.<br><br>Theo Phonearena, nhiều người dùng hiện đang giữ thái độ nghe ngóng trước những tin tức xấu về Huawei. Nhu cầu sở hữu những chiếc điện thoại Huawei đã giảm mạnh. Điều này có thể dễ dàng nhận thấy tại các nước Châu Âu, thị trường quốc tế chính của những chiếc điện thoại Huawei.</p><img src=\"https://vnn-imgs-f.vgcloud.vn/2019/05/27/13/toan-canh-huawei-va-con-ac-mong-toi-tu-nuoc-my-1.jpg\" alt=\"ERROR\"><p><br>Báo cáo của WinFuture cho thấy, doanh số smartphone Huawei tại Đức đã giảm mạnh chỉ vài tuần sau lệnh cấm vận thương mại của chính phủ Mỹ. Cụ thể, Huawei chỉ chiếm khoảng 12% thị phần điện thoại được bán ra tại Đức trong tuần cuối của tháng 5/2019. Mức thị phần này đã giảm quá nửa so với con số 26% hồi đầu tháng. <br><br> Không giống như Mỹ, nơi các dòng smartphone đời mới đều được khóa mã và bán theo đường nhà mạng, thị trường di động Đức là cuộc chiến của nhà mạng cùng những nhà bán lẻ. Tuy nhiên, doanh số điện thoại Huawei tại các nhà bán lẻ hàng đầu nước Đức là Saturn và Mediamarkt đều đã giảm khoảng 50% trong mấy tuần gần đây. Tương tự với Huawei là Honor, nhãn hàng do Huawei sở hữu đã giảm tới 40% doanh số. <br><br> Thông thường, trong trường hợp nhu cầu của thị trường yếu, các nhà bán lẻ có thể giảm giá bán một chút để kích cầu. Tuy vậy, trong trường hợp của Huawei, cả nhà bán lẻ và nhà mạng đều không muốn giảm giá vì lượng hàng tồn kho được mua với mức giá trước khi chính phủ Mỹ ban hành lệnh cấm thương mại. Điều này cũng có nghĩa, bất kỳ hoạt động giảm giá nào cũng có thể kéo theo sự sụt giảm về lợi nhuận.</p>','2019-06-17','2019-06-17',4),(7,'Huawei xuất xưởng 1 triệu smartphone dùng hệ điều hành HongMeng','Theo các nguồn tin mới đây cho biết, Huawei đã xuất xưởng 1 triệu smartphone mới có cài sẵn hệ điều hành tự phát triển của hãng HongMeng OS.',2,'<p><br>Theo hãng nghiên cứu thị trường Rosenblatt Securities, các thiết bị được cài hệ điều hành HongMeng OS của Huawei không rõ là đã tung ra thị trường hay chỉ là những thiết bị đang trong quá trình thử nghiệm.<br><br> Báo cáo cũng tiết lộ, thiết bị chạy hệ điều hành HongMeng OS tương thích với tất cả các ứng dụng Android hiện tại và tăng cường chức năng bảo mật dữ liệu cá nhân. </p> <img src=\"https://vnn-imgs-f.vgcloud.vn/2019/06/12/14/huawei-xuat-xuong-1-trieu-thiet-bi-dung-he-dieu-hanh-hongmeng.jpg\" alt=\"ERROR\"><p> <br>Trang China Daily trước đó dẫn lời CEO Huawei, ông Yu Chengdong (Richard Yu), cho biết, hệ điều hành của Huawei sẽ ra mắt sớm nhất vào mùa thu này hoặc mùa xuân tới. <br><br>  HongMeng OS được phát triển để cài đặt trên điện thoại di động, máy tính, máy tính bảng, TV, ô tô, thiết bị đeo và mọi thiết bị khác có thể dùng hệ điều hành, Yu chia sẻ với các chuyên gia Internet qua WeChat.<br><br>Mặc dù Mỹ đã hoãn lệnh cấm giao dịch với Huawei trong 3 tháng kể từ ngày 20/5, nhà sản xuất có trụ sở tại Thâm Quyến không thể chỉ ngồi chờ một giải pháp. Họ đẩy nhanh việc đưa hệ điều hành tự phát triển vài năm nay vào thử nghiệm.<br><br> Trang web chuyên thu thập thông tin về Huawei, Huawei Central, cho biết Huawei đã đăng ký thương hiệu HongMeng OS tại một loạt quốc gia trên thế giới như Canada, các quốc gia châu Âu, Hàn Quốc và Mexico... <br><br> Cái tên HongMeng không có vẻ không mang tính quốc tế cho lắm, mặc dù nghĩa đen của nó là bình minh trong sương mù. Còn theo Wikipedia, HongMeng OS được đặt theo tên của một nhân vật trong thần thoại Trung Quốc, tượng trưng cho sự hỗn loạn nguyên thủy của thế giới trước khi tạo ra. </p>','2019-06-17','2019-06-18',2),(8,'Galaxy S10+ có thêm màu bạc đa sắc phiên bản Park Hang-seo','Hậu King’s Cup, phiên bản Galaxy S10+ Park Hang-seo hứa hẹn sẽ là chiếc smartphone đặc biệt dành cho fan công nghệ cũng như fan của đổi tuyển bóng đá Việt Nam.',1,'<p><br />Samsung đ&atilde; tr&igrave;nh l&agrave;ng th&ecirc;m một phi&ecirc;n bản giới hạn cho chiếc Galaxy S10+ c&oacute; t&ecirc;n Park Hang-seo &ndash; HLV đội tuyển quốc gia Việt Nam. Đ&acirc;y sẽ l&agrave; phi&ecirc;n bản d&agrave;nh ri&ecirc;ng cho thị trường Việt Nam, như một m&oacute;n qu&agrave; d&agrave;nh cho những kỳ t&iacute;ch v&agrave; h&agrave;nh tr&igrave;nh đ&aacute;ng nhớ của thầy tr&ograve; &ocirc;ng Park trong thời gian qua.</p>\r\n<p><img src=\"https://vnn-imgs-f.vgcloud.vn/2019/06/14/15/galaxy-s10-co-them-mau-bac-da-sac-phien-ban-park-hang-seo.jpg\" alt=\"ERROR\" /></p>\r\n<p><br />Vỏ hộp của Galaxy S10+ phi&ecirc;n bản Park Hang-seo sẽ c&oacute; m&agrave;u đỏ đặc biệt với h&igrave;nh ảnh HLV Park Hang-seo v&agrave; chữ kỹ được in tr&ecirc;n hộp. B&ecirc;n trong, bộ sản phẩm bao gồm một chiếc Galaxy S10+ m&agrave;u Prism Silver (bạc đa sắc). Phi&ecirc;n bản bao gồm phụ kiện đi k&egrave;m: một ốp lưng nhựa m&agrave;u đỏ cũng in h&igrave;nh HLV Park Hang-seo, một pin dự ph&ograve;ng USB-C dung lượng 10.000mAh, sạc c&aacute;p v&agrave; tai nghe AKG. <br /><br />Khi gắn chiếc ốp lưng n&agrave;y v&agrave;o Galaxy S10+, lập tức giao diện tr&ecirc;n m&aacute;y sẽ tự chuyển đổi qua giao diện Park Hang Seo rất ấn tượng nhờ kết nối NFC. M&aacute;y sẽ hiển thị bộ icon đặc biệt với m&agrave;u xanh s&acirc;n cỏ l&agrave;m chủ đạo. Bộ icon, thanh th&ocirc;ng b&aacute;o, c&aacute;c ứng dụng mặc định của Galaxy S10+ đều được chuyển đổi th&agrave;nh thiết kế đặc trưng.</p>\r\n<p><img src=\"https://vnn-imgs-f.vgcloud.vn/2019/06/14/15/galaxy-s10-co-them-mau-bac-da-sac-phien-ban-park-hang-seo-3.jpg\" alt=\"ERROR\" /></p>\r\n<p><br />Việt Nam l&agrave; thị trường thứ 2, sau Hong Kong m&agrave; Samsung b&aacute;n ra Galaxy S10+ phi&ecirc;n bản m&agrave;u bạc đa sắc. Dự đo&aacute;n sau King&rsquo;s Cup, phi&ecirc;n bản n&agrave;y sẽ thu h&uacute;t người m&ecirc; b&oacute;ng đ&aacute; tại Việt Nam, ri&ecirc;ng m&agrave;u sắc của chiếc điện thoại n&agrave;y cũng đủ hấp dẫn người ti&ecirc;u d&ugrave;ng. Với hiệu ứng đa sắc, mặt lưng của phi&ecirc;n bản n&agrave;y c&oacute; m&agrave;u v&agrave;ng, hồng hoặc xanh t&ugrave;y v&agrave;o g&oacute;c nh&igrave;n v&agrave; &aacute;nh s&aacute;ng phản chiếu.</p>\r\n<p><img src=\"https://vnn-imgs-f.vgcloud.vn/2019/06/14/15/galaxy-s10-co-them-mau-bac-da-sac-phien-ban-park-hang-seo-2.jpg\" alt=\"ERROR\" /></p>\r\n<p><br />Về cấu h&igrave;nh phần cứng, Galaxy S10+ phi&ecirc;n bản Park Hang Seo sẽ c&oacute; cấu h&igrave;nh RAM 8GB + 128GB duy nhất. Ngo&agrave;i kh&aacute;c biệt về bộ nhớ,c&aacute;c th&ocirc;ng số c&ograve;n lại của phi&ecirc;n bản n&agrave;y sẽ vẫn giống hệt so với phi&ecirc;n bản thường, bao gồm một m&agrave;n h&igrave;nh 6.4 inch Dynamic AMOLED độ ph&acirc;n giải QHD+, chạy tr&ecirc;n chip Exynos 9820 8nm. M&aacute;y c&oacute; 3 camera ch&iacute;nh 12MP + 16MP +12MP gồm từ ống k&iacute;nh g&oacute;c rộng cho tới tele v&agrave; camera selfie k&eacute;p 10MP + 8MP ở mặt trước. Vi&ecirc;n pin của m&aacute;y c&oacute; dung lượng 4100mAh</p>\r\n<p><img src=\"https://vnn-imgs-f.vgcloud.vn/2019/06/14/15/galaxy-s10-co-them-mau-bac-da-sac-phien-ban-park-hang-seo-1.jpg\" alt=\"ERROR\" /></p>\r\n<p><br />Galaxy S10+ Park Hang Seo Limited Edition sẽ ch&iacute;nh thức được b&aacute;n ra v&agrave;o ng&agrave;y 16/6 tới đ&acirc;y với mức gi&aacute; 23.990.000 đồng. Trước đ&oacute;, fan b&oacute;ng đ&aacute; c&oacute; cơ hội giao lưu với HLV Park Hang-seo tại Samsung Showcase, TP.HCM v&agrave;o ng&agrave;y 15/6 v&agrave; trải nghiệm phi&ecirc;n bản đặc biệt n&agrave;y. s</p>','2019-06-18','2019-06-13',2),(9,'Rò rỉ video Pixel 4 XL, nhưng người dùng hi vọng đây là tin giả','Smartphone của Google chưa bao giờ là sản phẩm bán chạy nhất. Nhưng trên thực tế, nhiều fan hâm mộ điện thoại của Google lại chờ đợi Pixel 4 XL hơn cả các flagship của Apple và Samsung.',2,'<p> <br> Google Pixel được biết đến là chiếc smartphone có cấu hình mạnh mẽ, nhưng thiết kế thường không hiện đại. Lợi thế của dòng smartphone Pixel là dòng điện thoại thông minh duy nhất được đảm bảo có quyền nâng cấp Android bản mới nhất của Google, ngay khi vừa phát hành.<br><br> Đó có lẽ là lý do tại sao những người hâm mộ Android khó tính rất hào hứng với việc chờ đợi Pixel 4 và Pixel 4 XL sắp ra mắt.<br><br>  Một video rò rỉ mới đây được cho là hình ảnh thực tế về chiếc smartphone hàng đầu của Google, Pixel 4 XL, chưa được ra mắt. Đoạn video xuất hiện trên trang Twitter có tên AshRaF Hossain Lipu, sau đó được trang Slashleaks chuyên tin rò rỉ dẫn lại.</p><img src=\"https://vnn-imgs-f.vgcloud.vn/2019/06/11/11/ro-ri-video-pixel-4-xl-nguoi-dung-hi-vong-day-la-tin-gia.jpg\" alt=\"ERROR\"> <p><br>Hình ảnh trong video cho thấy, chiếc smartphone được giới thiệu có khá nhiều điểm tương đồng với Pixel 4 và Pixel 4 XL từng xuất hiện trong các tin đồn trước đó. Nhưng nó cũng bao gồm những chi tiết thiết kế khá xấu, không phù hợp với những thông tin tiết lộ về Pixel 4 sắp ra mắt. <br><br>Rất may, nhiều bằng chứng cho thấy, video này là giả mạo.<br><br> Pixel 4 và Pixel 4 XL dự kiến ​​sẽ có các thiết kế toàn màn hình, viền màn hình rất mỏng và camera selfie đục lỗ giống như trên smartphone của Samsung. Chiếc smartphone trong đoạn video rò rỉ có khoảng trống trên màn hình - vị trí cho camera trước, nhưng khó có thể chắc chắn về điều này. <br><br>Trên thực tế đây có thể chỉ là Pixel 3 XL với màn hình được làm giả giống như smartphone có thiết kế phần lỗ khuyết cho camera selfie dạng kép. Người xem cần lưu ý đến vùng tối bao phủ phía trên màn hình chiếc smartphone này, nơi có thể chứa tai thỏ của Pixel 3 XL.  <br><br>  Chất lượng thấp của video cùng vị trí tay cầm của người giới thiệu cũng là một yếu tố để che giấu phần \"notch\" ở đó.  <br><br>  Ngoài ra, chiếc smartphone này có cụm camera trước và sau nằm trong cùng một góc. Nhưng không gian bên trong của một smartphone sẽ không bao giờ đủ khoảng trống để đặt cả camera trước và camera sau vào cùng một vị trí. <br><br>  Vì thế, những người hâm mộ Pixel 4 và Pixel 4 XL của Google không cần quá lo lắng vì thiết kế xấu xí của chiếc smartphone trong video được cho là điện thoại sắp ra mắt của Google.</p>','2019-06-15','2019-06-19',2),(10,'Ốp lưng xác nhận thiết kế mới của Galaxy Note 10','Những thông tin rò rỉ về Galaxy Note 10 tiếp tục xác nhận thiết kế mới của smartphone này sau khi hình ảnh ốp lưng vừa được tiết lộ.',2,'<p><br>Tuần trước, cả Galaxy Note 10 và Galaxy Note 10 Pro đã lộ diện qua những hình ảnh render đầu tiên. Những hình ảnh này cho thấy, flagship sắp ra mắt của Samsung sẽ có những thay đổi về hệ thống camera cả mặt trước và mặt sau.<br><br> Camera mặt trước được đặt ở chính giữa thông qua công nghệ màn hình đục lỗ Infinity O và 3 camera sau được sắp xếp theo chiều dọc ở góc bên trái của Galaxy Note 10. </p><img src=\"https://vnn-imgs-f.vgcloud.vn/2019/06/10/15/op-lung-galaxy-note-10-xac-nhan-thiet-ke-flagship-sap-ra-mat-cua-samsung-2.jpg\" alt=\"ERROR\"> <p> <br>Trong khi Galaxy Note 9 năm ngoái có thiết lập camera phía sau được gắn theo chiều ngang. Nhưng bố cục này không lặp lại trên Note 10.<br><br> Các đường cắt tạo khoảng trống ở mặt sau của ốp lưng trùng khớp với vị trí camera trên hình ảnh render được tiết lộ bởi Slashleaks. </p><img src=\"https://vnn-imgs-f.vgcloud.vn/2019/06/10/15/op-lung-galaxy-note-10-xac-nhan-thiet-ke-flagship-sap-ra-mat-cua-samsung-3.jpg\" alt=\"ERROR\"><p> <br>Galaxy Note 10 có thể được trang bị màn hình AMOLED 6,3 inch, chip Snapdragon 855 hoặc Exynos 9820, cảm biến vân tay quang học trong màn hình, 3 camera sau, không còn nút Bixby và jack 3.5mm, còn bản Note 10 Pro có màn hình 6.75 inch và 4 camera sau. <br><bR> Hệ thống camera gồm một ống kính chính 12 MP cho phép thay đổi khẩu độ, một ống kính góc siêu rộng 12 MP và một ống kính tele 16 MP hỗ trợ zoom quang học 2x. Phiên bản Note 10 Pro có thêm một cảm biến ToF phía dưới đèn flash LED.</p> <img src=\"https://vnn-imgs-f.vgcloud.vn/2019/06/10/15/op-lung-galaxy-note-10-xac-nhan-thiet-ke-flagship-sap-ra-mat-cua-samsung-1.jpg\" alt=\"ERROR\"> <p>  <br> Ngoài ra, Galaxy Note 10 có thể được trang bị pin 3.400 mAh, trong khi pin của Note10 Pro là 4.500 mAh, hỗ trợ sạc nhanh 45W , tức là cao hơn 3 lần so với S10. <br><br> Hôm qua, thông tin từ ETNews cho biết, Galaxy Note 10 sẽ được ra mắt vào ngày 10/8 tới với cả phiên bản Galaxy Note 10 Pro.</p>','2019-06-15','2019-06-15',2);
/*!40000 ALTER TABLE `Posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Posts_Tags`
--

DROP TABLE IF EXISTS `Posts_Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Posts_Tags` (
  `PostId` int(11) NOT NULL,
  `TagId` int(11) NOT NULL,
  PRIMARY KEY (`PostId`,`TagId`),
  KEY `fk_Posts_Tags_2_idx` (`TagId`),
  CONSTRAINT `fk_Posts_Tags_1` FOREIGN KEY (`PostId`) REFERENCES `Posts` (`PostId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Posts_Tags_2` FOREIGN KEY (`TagId`) REFERENCES `Tags` (`TagId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Posts_Tags`
--

LOCK TABLES `Posts_Tags` WRITE;
/*!40000 ALTER TABLE `Posts_Tags` DISABLE KEYS */;
INSERT INTO `Posts_Tags` VALUES (1,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(1,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3),(3,4),(4,4),(2,5);
/*!40000 ALTER TABLE `Posts_Tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Roles`
--

DROP TABLE IF EXISTS `Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Roles` (
  `RoleId` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` VALUES (1,'Premium'),(2,'Writter'),(3,'Editor'),(4,'Admin');
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `States`
--

DROP TABLE IF EXISTS `States`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `States` (
  `StateId` int(11) NOT NULL AUTO_INCREMENT,
  `StateName` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`StateId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `States`
--

LOCK TABLES `States` WRITE;
/*!40000 ALTER TABLE `States` DISABLE KEYS */;
INSERT INTO `States` VALUES (1,'Not Approved'),(2,'Not Yet Approved'),(3,'Approved & Waiting to Publish'),(4,'Published');
/*!40000 ALTER TABLE `States` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tags`
--

DROP TABLE IF EXISTS `Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tags` (
  `TagId` int(11) NOT NULL AUTO_INCREMENT,
  `TagName` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`TagId`),
  FULLTEXT KEY `TagName` (`TagName`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tags`
--

LOCK TABLES `Tags` WRITE;
/*!40000 ALTER TABLE `Tags` DISABLE KEYS */;
INSERT INTO `Tags` VALUES (1,'News'),(2,'Phones'),(3,'Android'),(4,'iOS'),(5,'Laptops'),(6,'Asus'),(7,'Dell'),(8,'HP'),(9,'MSI'),(10,'Technology');
/*!40000 ALTER TABLE `Tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `UserName` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(100) CHARACTER SET utf8 NOT NULL,
  `Email` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Address` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `Phone` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'zzz zzz','zzz','$2b$10$RfNfTnp2VybhxxCy0Ke8yOGy/G4m3wyQIMC5BSxBdMAuOCt9nLxl2','1612107@student.hcmus.edu.vn','123, 321','0997337090','2019-06-07 00:00:00'),(2,'premium nè','premium','$2b$10$NHr.UR7lr1l2QZ2MEjKKz.M4QqxLECHdNu0pKeWbaXmWN/w.2kC1S','premium@news.com','hcmus','0123456879','2000-07-11 00:00:00'),(3,'writer đó','writer','$2b$10$oyfNifV3OtJIlmB2r8fZXuRlDT1RKJ2ISZVjPs86kBAI0LI7LanDa','writter@news.com','hcmus','0147852369','2005-05-03 00:00:00'),(4,'editor nha','editor','$2b$10$WDMpjRPbcWZEqdd7iv5gJOE2.wFDVssjunh5HR6dp/X4sRnVXcjaS','editor@news.com','hcmc','0963852741','1999-02-10 00:00:00'),(5,'admin đó nha','admin','$2b$10$8unFS8UykgQN9QTW/M2dG.anD1ZtBzUSFRReS4FhdzEicwLpu4lku','admin@news.com','hcms','0145632789','1995-06-28 00:00:00'),(6,'Ca Tieu','000','000','','','',NULL),(7,'Tuan Nghia','000','000','','','',NULL),(8,'zzz zzz','zzz','$2b$10$RfNfTnp2VybhxxCy0Ke8yOGy/G4m3wyQIMC5BSxBdMAuOCt9nLxl2','1612107@student.hcmus.edu.vn','123, 321','0997337090','2019-06-07 00:00:00');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users_Premium`
--

DROP TABLE IF EXISTS `Users_Premium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users_Premium` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `ExpiredDate` datetime NOT NULL,
  PRIMARY KEY (`UserId`),
  CONSTRAINT `fk_Users_Premium_1` FOREIGN KEY (`UserId`) REFERENCES `Users` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users_Premium`
--

LOCK TABLES `Users_Premium` WRITE;
/*!40000 ALTER TABLE `Users_Premium` DISABLE KEYS */;
INSERT INTO `Users_Premium` VALUES (1,'2019-06-17 17:27:50'),(2,'2019-06-18 10:06:10'),(5,'2019-06-18 10:09:10'),(8,'2019-06-18 22:39:57');
/*!40000 ALTER TABLE `Users_Premium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users_Roles`
--

DROP TABLE IF EXISTS `Users_Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users_Roles` (
  `UserId` int(11) NOT NULL,
  `RoleId` int(11) NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `fk_Users_Roles_2_idx` (`RoleId`),
  CONSTRAINT `fk_Users_Roles_1` FOREIGN KEY (`UserId`) REFERENCES `Users` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Users_Roles_2` FOREIGN KEY (`RoleId`) REFERENCES `Roles` (`RoleId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users_Roles`
--

LOCK TABLES `Users_Roles` WRITE;
/*!40000 ALTER TABLE `Users_Roles` DISABLE KEYS */;
INSERT INTO `Users_Roles` VALUES (1,1),(2,1),(8,1),(1,2),(3,2),(6,2),(7,2),(8,2),(1,3),(4,3),(7,3),(1,4),(5,4),(7,4),(8,4);
/*!40000 ALTER TABLE `Users_Roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-23 22:12:16
