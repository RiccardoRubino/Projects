-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: textpazdb
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `commento`
--

DROP TABLE IF EXISTS `commento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_post` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `data_ora` datetime NOT NULL,
  `testo` text,
  `immagine` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_post` (`id_post`),
  KEY `username` (`username`),
  CONSTRAINT `commento_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `commento_ibfk_2` FOREIGN KEY (`username`) REFERENCES `utente` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commento`
--

LOCK TABLES `commento` WRITE;
/*!40000 ALTER TABLE `commento` DISABLE KEYS */;
INSERT INTO `commento` VALUES (1,1,'giuliabianchi','2024-12-14 11:00:00','Preferisco lui','immagini/allegri.png'),(2,1,'lucaverdi','2024-12-14 11:30:00','Il migliore, anche come allenatore è Iachini',''),(3,2,'mariorossi','2024-12-14 12:30:00','Sono d\'accordo',''),(4,4,'alessandreneri','2024-12-14 13:00:00','Talento cristallino, mi ricorda lui','immagini/ronaldinho.jpg'),(5,3,'giuliabianchi','2024-12-13 15:00:00','Hai ragione',''),(96,28,'giuliabianchi','2024-12-17 09:42:48','Real','null'),(97,30,'giuliabianchi','2024-12-17 09:56:00','è uno schifo!','null'),(98,27,'giuliabianchi','2024-12-17 09:58:17','boh','null'),(99,31,'giuliabianchi','2024-12-17 10:00:40','Indimenticabile','null'),(100,13,'giuliabianchi','2024-12-17 10:03:43','A me non piace completamente!','null'),(104,51,'giuliabianchi','2024-12-17 12:48:09','(Ovviamente non originale?)','null'),(105,53,'giuliabianchi','2024-12-17 12:58:37','??','null'),(106,55,'giuliabianchi','2024-12-18 12:45:32','Ludopatico! Non si gioca d\'azzardo','null'),(107,12,'giuliabianchi','2024-12-19 11:56:23','Si hai ragione','null'),(132,28,'giuliabianchi','2024-12-22 09:42:02','Real','null'),(133,28,'giuliabianchi','2024-12-22 09:42:08','Reale','uploads/a8d52c7b-fd09-4ed5-beb3-3b7be4d336df_17340243457598.jpg'),(140,28,'giuliabianchi','2024-12-22 09:42:08','boh','null'),(141,4,'giuliabianchi','2024-12-23 19:05:01','fortissimo','uploads/d0f3a073-9357-4d72-9a74-58dc3c171ca4_Nico Paz Como.jpg'),(142,60,'giuliabianchi','2024-12-23 19:05:51','miglior giocatore della storia','null'),(143,60,'giuliabianchi','2024-12-23 19:06:02','i 2 re del calcio','null'),(144,60,'giuliabianchi','2024-12-23 19:06:07','incredibili','null'),(145,60,'giuliabianchi','2024-12-23 19:06:13','assurdo','null'),(146,1,'giuliabianchi','2024-12-23 19:06:52','assurdo','null'),(147,1,'giuliabianchi','2024-12-23 19:06:59','incredibile','null'),(148,58,'giuliabianchi','2024-12-23 19:07:19','benvenuto','null'),(149,53,'giuliabianchi','2024-12-23 20:07:18','assurdo','null'),(150,53,'giuliabianchi','2024-12-23 20:07:26','miglior giocatore della storia','null'),(151,53,'giuliabianchi','2024-12-23 20:08:13','miglior giocatore della storia','null'),(152,1,'giuliabianchi','2024-12-23 21:01:02','vero','null'),(153,56,'giuliabianchi','2024-12-23 21:02:06','sempre','null'),(154,62,'giuliabianchi','2024-12-23 21:13:50','il migliore','null'),(155,62,'giuliabianchi','2024-12-23 21:14:18','in assoluto','null'),(156,62,'giuliabianchi','2024-12-23 21:14:48','in assoluto','null'),(157,5,'giuliabianchi','2024-12-23 21:18:00','non credo','null'),(158,5,'giuliabianchi','2024-12-23 21:18:08','credo','null'),(159,5,'giuliabianchi','2024-12-23 21:18:12','non credo','null'),(160,5,'giuliabianchi','2024-12-23 21:18:14','credo','null'),(161,5,'giuliabianchi','2024-12-23 21:18:23','ciao','null'),(162,2,'giuliabianchi','2024-12-24 15:41:06','in assoluto','null'),(163,2,'giuliabianchi','2024-12-24 15:43:15','in assoluto','null'),(164,57,'giuliabianchi','2024-12-24 15:43:27','in assoluto','null'),(165,62,'CR7','2025-01-06 12:27:02','sono d\'accordo','null'),(166,63,'CR7','2025-01-06 12:44:06','lo giuro','null'),(167,6,'CR7','2025-01-07 16:06:21','sono d\'accordo','uploads/ca1a7358-d8eb-49a2-bc08-c944b053ba32_mou.jpeg'),(168,65,'CR7','2025-01-07 16:17:48','ma che vuol dire?','null'),(169,68,'fabrizioromano','2025-01-07 17:40:53','lo giuro','null'),(170,68,'CR7','2025-01-07 17:41:26','ho sempre sognato di giocare per questo club...','null');
/*!40000 ALTER TABLE `commento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_post`
--

DROP TABLE IF EXISTS `like_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_post` (
  `id_like` int NOT NULL AUTO_INCREMENT,
  `id_post` int NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`id_like`),
  UNIQUE KEY `id_post` (`id_post`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `like_post_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `like_post_ibfk_2` FOREIGN KEY (`username`) REFERENCES `utente` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_post`
--

LOCK TABLES `like_post` WRITE;
/*!40000 ALTER TABLE `like_post` DISABLE KEYS */;
INSERT INTO `like_post` VALUES (95,1,'CR7'),(50,1,'giuliabianchi'),(2,1,'lucaverdi'),(4,2,'alessandreneri'),(100,2,'CR7'),(3,2,'mariorossi'),(5,3,'giuliabianchi'),(6,4,'mariorossi'),(94,6,'CR7'),(44,6,'giuliabianchi'),(93,7,'CR7'),(25,7,'giuliabianchi'),(101,10,'CR7'),(105,10,'fabrizioromano'),(12,10,'giuliabianchi'),(38,11,'giuliabianchi'),(49,30,'giuliabianchi'),(103,31,'CR7'),(35,53,'giuliabianchi'),(84,53,'luigirossi'),(85,53,'riccardorubino03'),(33,56,'giuliabianchi'),(36,57,'giuliabianchi'),(104,58,'CR7'),(39,58,'giuliabianchi'),(69,59,'gabrielebaiamonte'),(70,59,'giacomocolombo'),(67,59,'giuliabianchi'),(71,59,'luigirossi'),(68,59,'riccardorubino03'),(75,60,'gabrielebaiamonte'),(90,60,'giuliabianchi'),(73,60,'mariorossi'),(86,60,'riccardorubino03'),(88,61,'giuliabianchi'),(87,61,'mariorossi'),(91,63,'giuliabianchi'),(96,64,'CR7'),(99,65,'CR7'),(98,65,'Dele-Bashiru'),(102,66,'Conceicao'),(109,67,'CR7'),(107,68,'CR7'),(106,68,'fabrizioromano');
/*!40000 ALTER TABLE `like_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usernamecreatore` varchar(50) NOT NULL,
  `data_ora` datetime NOT NULL,
  `testo` text,
  `immaginepost` varchar(255) DEFAULT NULL,
  `numerolike` int DEFAULT '0',
  `numerocommenti` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `usernamecreatore` (`usernamecreatore`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`usernamecreatore`) REFERENCES `utente` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'mariorossi','2024-12-14 10:30:00','Come analizza lui il calcio, Nessuno!!!','immagini/adani.jpg',3,4),(2,'giuliabianchi','2024-12-14 12:00:00','Miglior giocatore della storia','immagini/totti.jpg',3,2),(3,'lucaverdi','2024-12-13 14:45:00','Tecnico come lui nessuno al mondo, il migore in assoluto','immagini/messi.jpg',1,1),(4,'alessandreneri','2024-12-12 09:00:00','In serie A nessuno meglio di lui, il Como ha veramento fatto un affare','immagini/paz.jpg',1,2),(5,'lucaverdi','2024-12-13 17:45:00','Lo scudetto è della Lazio quest\'anno',NULL,0,5),(6,'mariorossi','2024-12-17 09:00:00','La Roma ha davvero bisogno di un nuovo allenatore, il progetto non sta decollando.','',2,1),(7,'giuliabianchi','2024-12-17 11:00:00','Cristiano Ronaldo è ancora un campione, nonostante l\'età. Merita sempre rispetto!','',2,0),(8,'lucaverdi','2024-12-17 13:30:00','Il Napoli quest\'anno sembra davvero forte, ma il Milan non è da meno. Chi è il vostro favorito?','',0,0),(9,'alessandreneri','2024-12-17 15:00:00','L\'Atalanta continua a sorprendermi con il suo gioco offensivo. Una squadra da temere!','',0,0),(10,'giuliabianchi','2024-12-17 16:30:00','Mourinho ha fatto un buon lavoro alla Roma, ma servono altri rinforzi per essere competitivi.','',3,0),(11,'mariorossi','2024-12-18 08:45:00','Il campionato italiano è il più bello d\'Europa, ma la Juventus è sempre la squadra da battere!','',1,0),(12,'lucaverdi','2024-12-18 10:15:00','La Premier League sta dominando quest\'anno. Manchester City e Liverpool sono inarrestabili!','',0,1),(13,'alessandreneri','2024-12-18 12:30:00','Vedere un giovane come Vlahovic crescere è una soddisfazione. Ha un futuro brillante davanti a sé.','',0,1),(14,'giuliabianchi','2024-12-18 14:00:00','Il calcio femminile sta crescendo, ma dobbiamo fare di più per dargli la visibilità che merita.','',0,0),(15,'mariorossi','2024-12-18 16:00:00','La lotta per il capocannoniere è sempre affascinante! Chi pensate che vincerà quest\'anno?','',0,0),(27,'riccardorubino03','2024-12-16 16:29:46','Com\'è possibile vincere col city e pareggiare con il venezia','uploads/hq720.jpg',0,1),(28,'gabrielebaiamonte','2024-12-16 16:29:46','Che fallaccio!!','uploads/he102_CAL5F5_1741278-0190-keuB-U300214058662pWF-620x349@Gazzetta-Web_articolo.jpg',0,4),(29,'lucaverdi','2024-12-17 09:48:46','Il GOAT sbarca anche su fortnite!','uploads/17340243457598.jpg',0,0),(30,'mariorossi','2024-12-17 09:50:46','Ennesima prestazione delundente...','uploads/image_750x_675efcddb0b8e.jpg',1,1),(31,'alessandreneri','2024-12-17 08:50:46','Ve la ricordate la corsa di mazzone?','uploads/mazzone.jpg',1,1),(51,'giuliabianchi','2024-12-17 12:47:04','Guardate che bella maglia ho comprato?','uploads/39fd7dcf-df62-4a0a-a98a-7962b8279cfb_1_89c8b87b-b485-40ab-b837-e9028c819552_grande.webp',0,1),(53,'fabrizioromano','2024-12-17 13:47:18','HERE-WE-GO De Bruyne al Palermo','uploads/IMG-20241211-WA0021.webp',3,4),(55,'Pengwin','2024-12-19 11:47:18','Preso over 0.5 Real-Bagheria under 12. Ciao poveri??','',0,1),(56,'mariorossi','2024-12-11 11:47:18','Anche nelle difficolta, forza Palermo sempre!',NULL,1,1),(57,'giacomocolombo','2024-12-11 11:47:18','Dionisi OUT',NULL,1,1),(58,'CR7','2024-12-11 11:47:18','Ci sono anche io su TextPaz!','uploads/cricri.25.jpeg',2,1),(59,'CR7','2024-12-11 13:47:18','Ho sempre sognato di giocare con il Palermo','uploads/cr7palermo.webp',5,0),(60,'CR7','2024-12-11 15:47:18','Io con il mio mito','uploads/mc.webp',4,4),(61,'CR7','2024-12-11 18:47:18','Messi è un ladro!!!',NULL,2,0),(62,'giuliabianchi','2024-12-23 19:09:37','Per me il migliore era lui','uploads/19e52080-76c8-482e-a14d-c5ac35e3b836_sanabria.jpeg',0,3),(63,'CR7','2025-01-06 12:43:39','Giocherò anche i prossimi mondiali',NULL,1,1),(64,'CR7','2025-01-07 16:08:46','Quando mi chiedono il mio giocatore preferito del momento? Ovviamente rispondo con il fisayo dele-bashiru.','uploads/d8bd4dec-cdd5-40a0-8ccd-48f1988029af_dele.jpg',1,0),(65,'Dele-Bashiru','2025-01-07 16:17:22','Quando ho segnato all\'atalanta ho subito pensato: “O pioggia silenziosa che gli alberi amano\r\nda\' all\'anima le stesse nebbie e risonanze\r\nche lasci nell\'anima addormentata del paesaggio!”',NULL,2,1),(66,'Conceicao','2025-01-07 16:24:36','l\'unico intervento difensivo che ha fatto Emerson Royal nella sua vita è stato ieri sera contro di me... Comunque Forza Milan!','uploads/1006a577-c731-4562-bfc9-759be6c1a8b3_095724024-786a3492-71e5-414f-bec7-a3e695afc730.avif',1,0),(67,'CR7','2025-01-07 16:41:14','Forza mialn','uploads/f5230baf-6bb7-4287-a32a-1cd9a1f1cf71_Schermata del 2025-01-07 16-25-29.png',1,0),(68,'fabrizioromano','2025-01-07 17:40:13','HERE-WE-GO Ronaldo alla Carrarese',NULL,2,2);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `data_nascita` date NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `foto_profilo` varchar(255) DEFAULT NULL,
  `biografia` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail` (`mail`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'Mario','Rossi','mario.rossi@example.com','1985-05-15','mariorossi','$2b$12$IqrgGANae3GpPxbigkw6AOn.nQnCxPC8ncdhr2kWZrdPv7Xk1XvCG','uploads/palermo.jpg','Ciao, sono Mario!'),(2,'Giulia','Bianchi','giulia.bianchi@example.com','1990-03-22','giuliabianchi','$2b$12$URZ6i9IvUUy4BpAiSfzzGO7K60.QO9FezCjuf4Q3LGpCoIfvWekPe','uploads/fc7c4527-4625-4cb3-8e8c-0446683fa66e_Nico Paz Como.jpg','viva el futbol'),(3,'Luca','Verdi','luca.verdi@example.com','1992-07-10','lucaverdi','$2b$12$ia1wLv9pVIEZcVb96ks2j.a.r1AuJGeqsVWL9h0OulMxUC9g4OtOK','uploads/utente2.jpg','Programmatore e amante della tecnologia.'),(4,'Alessandra','Neri','alessandra.neri@example.com','1987-11-30','alessandreneri','$2b$12$a2PicdP8MUnwC/VRrvd64eEowoBTMBwpNq0p93Huq8aBYdIfV/mjK','uploads/utente2.jpg','Nella vita ci vuole equilibrio!'),(5,'Riccardo','aaa','riccardo.rubino@example.com','2003-03-24','riccardorubino03','$2b$12$d38lQTa.3DQ3XGk2Y1PCEOL0.f69tNXkkx3X/9x9QEyTbjz4hmD2S','uploads/a8d52c7b-fd09-4ed5-beb3-3b7be4d336df_17340243457598.jpg','Yidliz==Pato'),(6,'Gabriele','Baiamonte','gabriele.baiamonte@example.com','1987-11-30','gabrielebaiamonte','$2b$12$4H/WZdswfubsl7n9KZ2lU.Kc.l7.iR2/XrOxTz5EJFVz.qePP0rOq','uploads/sddefault.jpg','Per vivere devo vedere almeno una volta al giorno \"Nico Paz goals & skills\"'),(7,'Fabrizio','Romano','fabrizio.romano@example.com','1987-11-30','fabrizioromano','$2b$12$AzjpHgOA.mkeKi5i9jQKPe/uf9J7K7slHc/dsvixYlevVXPmKxrR6','uploads/romano.jpeg','Giornalista sportivo'),(8,'Simone','Ribisi','simone.ribisi@example.com','1992-07-10','TheCaptain','$2b$12$k1.BErjI5d.41.iLUMqeHuURpk0zMti9o7LEZNcQesxjql5Kq2ZZW','uploads/re.jpeg','Sono di Marineo.'),(10,'Kristiano','Rossi','kristinao.aaa@example.com','1987-11-30','Pengwin','$2b$12$nBsH1lI.xfQ0gy9PTWJCXe/8Z5pXjR/71bYVOqcWLlc8pDkxTGV1q','uploads/pinguino.jpg','Bet4Ever'),(11,'giacomo','colombo','giacomo.colombo@example.com','2000-01-12','giacomocolombo','$2b$12$F8FJ7kwfhbJm9AJ.dYwf5e.C/d.ah/B8CGq7y8cAeex3/.4mGDJ72','uploads/utente2.jpg',NULL),(12,'Cristiano','Ronaldo','cristiano.ronaldo@example.com','2001-01-01','CR7','$2b$12$mWR2vhWJ.gcrMNgjZ7okyeSSA6mYHVA4Z.ug2ygAe9JsX9ruAhfY.','uploads/557adb19-dd95-449f-8d5b-03ce210a328b_Cristiano-Ronaldo-Ballon-dor-meme-5.jpg','il migliore della storia, non quel mediocre di Messi. Viva il calcio'),(13,'luigi','rossi','luigi.rossi@example.com','2000-12-12','luigirossi','$2b$12$7hfNjAitub1AcBFXQCKlpORXcy7rJBjpp28sFg3QR2yqNTuX0.y1.','uploads/utente2.jpg',NULL),(14,'Fisayo','Dele-Bashiru','fisayoforzalazio@example.com','2001-02-03','Dele-Bashiru','$2a$10$kONOeiQAJ0x4GPgMKbIVr.J0BNWWik3jXyfAAluz1N.8oN.nT3bAC','uploads/1e8ba504-9128-4f6e-92d5-87c540e82f24_Dele-Bashiru-Lazio.webp','Filosofo e nel tempo libero calciatore della SS Lazio'),(15,'Sergio ','Conceicao','conceicao@example.com','1974-11-02','Conceicao','$2a$10$k5ZoBysSkzqpk6fxgnEEDus1YMVW.BxNUnf9Uc5FAriHUMznunZO.','uploads/93561083-8f18-4507-ab2d-27f0eba0e8e8_Schermata del 2025-01-07 16-25-29.png','Migliore amico di Fonseca');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-07 17:45:49
