-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: projets3
-- ------------------------------------------------------
-- Server version	8.0.15
CREATE DATABASE IF NOT EXISTS projets3; 
USE projets3 ; 

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
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `club` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(56) NOT NULL,
  `description` text,
  `validite` varchar(56) DEFAULT NULL,
  `logo` varchar(128) DEFAULT NULL,
  `gerant_id` int(11) DEFAULT NULL,
  `ecole` varchar(128) DEFAULT NULL,
  `ecole_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gerant_id` (`gerant_id`),
  KEY `ecole` (`ecole_id`),
  CONSTRAINT `club_ibfk_1` FOREIGN KEY (`gerant_id`) REFERENCES `eleve` (`id`),
  CONSTRAINT `club_ibfk_2` FOREIGN KEY (`ecole_id`) REFERENCES `ecole` (`id`),
  CONSTRAINT `ecole` FOREIGN KEY (`ecole_id`) REFERENCES `ecole` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES (7,'Club Japonais','Notre club s\'interesse par tout ce qui est culture japonaise ! ','True','japonais.jpg',2,'ENSIAS',1),(9,'CINDH','789','Dead','465',1,'ENSIAS',1),(13,'Olympiades','Notre club organise l\'évenment sportif inter-écoles majeur de l\'année estudiantine. C\'est une grande manifestation sportive, culturelle et artistique qui réunit des écoles d\'ingénierie et de commerce de grande renommée au sein de l\'Ecole Nationale Supérieure d\'Informatique et d\'Analyse des Systèmes.','True','olympiades.jpg',10,'ENSIAS',1),(22,'IT Club','Notre club organise des conférences régulières sur les nouvelles technologies, mène plusieurs formations dans diverses disciplines (Design, Bureautique, langages de programmation...) au profit des élèves. ','True','ItHass.png',11,'EHTP',15),(23,'CINDH','CINDH est un club social à but non lucratif, constitué des élèves-ingénieurs et lauréats de lENSIAS.\r\nSon but principal consiste à aider au maximum les autres.\r\nNotre club a pour but dapporter un peu de joie et de réconfort aux personnes défavorisées.\r\n-Nos valeurs:\r\n* Solidarité : Lesprit déquipe sexprime à travers la solidarité de tous les membres\r\n* Engagement : Nous nous engageons à aller au bout des projets les plus difficiles\r\n* Respect : Les échanges sappuient sur un respect mutuel et lacceptation de la diversité des opinions','Dead','cindh.jpg',1,'ENSIAS',1),(24,'CINDH','CINDH est un club social à but non lucratif, constitué des élèves-ingénieurs et lauréats de lENSIAS.\r\nSon but principal consiste à aider au maximum les autres.\r\nNotre club a pour but dapporter un peu de joie et de réconfort aux personnes défavorisées.\r\n-Nos valeurs:\r\n* Solidarité : Lesprit déquipe sexprime à travers la solidarité de tous les membres\r\n* Engagement : Nous nous engageons à aller au bout des projets les plus difficiles\r\n* Respect : Les échanges sappuient sur un respect mutuel et lacceptation de la diversité des opinions','True','cindh.jpg',14,'ENSIAS',1),(25,'ENSIARTS ','ENSIARTS est le club artistique de l\'ENSIAS .','True','ensiarts.jpg',2,'ENSIAS',1),(26,'Vintage','Le Club Vintage est le fruit dune fusion entre plusieurs idées de projets mûrement réfléchis, tous inspirées des années 60, 70 et 80, trois glorieuses décennies qui ont changé le monde! Et bien plus que la nostalgie dun prétendu âge dor, cest cette énergie qui nous a fascinés comme des milliers dautres jeunes aujourd\'hui encore, c\'est cette énergie qui nous a fait rêver de ce club. Le Club Vintage est convaincu que la passion est une source inépuisable dinspiration, et que la philosophie des commencements est à même de réveiller la plus stérile des imaginations, et de pousser un esprit avide de savoir au-delà de toutes les limites quil peut se fixer. L\'ENSIAS se pare aujourd\'hui de son club Select qui vénère linventivité, qui adore lintellect et limagination.','True','vintage.jpg',7,'ENSIAS',1),(27,'HAHAHAH','hahahah','Dead','ehtp.jpg',1,'ENSIAS',1),(28,'robotics','','Dead','robotics.png',1,'ENSIAS',1),(29,'Robotics','','Dead','robotics.png',2,'ENSIAS',1),(37,'Robotics','Ce club vise à partager le savoir technique informatique et électronique avec toute personne ayant une passion pour cela , il est destiné à tous les ENSIASTES quelles que soit leurs formations et filières et a pour finalité de mettre en applications les acquisitions des cours en réalisant différents projets techniques et en participant au  nom de l\'ENSIAS aux différentes compétions de la robotique. ','True','robotics.png',29,'ENSIAS',1);
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecole`
--

DROP TABLE IF EXISTS `ecole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ecole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(128) NOT NULL,
  `description` varchar(255) NOT NULL,
  `adresse` varchar(128) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecole`
--

LOCK TABLES `ecole` WRITE;
/*!40000 ALTER TABLE `ecole` DISABLE KEYS */;
INSERT INTO `ecole` VALUES (1,'ENSIAS','L\'école nationale d\'informatique et d\'analyse des systèmes est une grade école d\'ingénieurs à Rabat.','Al Irfane','ensias.jpg'),(2,'EMI','L\'école Mohammedia des ingénieurs est une grade école d\'ingénieurs à Rabat.','Agdal','emi.jpg'),(3,'INPT','L\'institut nationale des postes et télecoms est une grade école d\'ingénieurs à Rabat.','Al Irfane','inpt.jpg'),(4,'ENIM','L\'école nationale des mines est une grade école d\'ingénieurs à Rabat.','Agdal','enim.jpg'),(15,'EHTP','L\'école Hassania des Travaux Pratiques est une grande école d\'ingénieurs à Casablanca.','Casablanca','ehtp.jpg');
/*!40000 ALTER TABLE `ecole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `eleve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(56) DEFAULT NULL,
  `login` varchar(56) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `telephone` varchar(56) DEFAULT NULL,
  `ecole` varchar(128) DEFAULT NULL,
  `ecole_id` int(11) DEFAULT NULL,
  `validite` varchar(56) DEFAULT 'unban',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `ecole_id` (`ecole_id`),
  CONSTRAINT `eleve_ibfk_1` FOREIGN KEY (`ecole_id`) REFERENCES `ecole` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eleve`
--

LOCK TABLES `eleve` WRITE;
/*!40000 ALTER TABLE `eleve` DISABLE KEYS */;
INSERT INTO `eleve` VALUES (1,'Administrateur','admin','789456123','adminparascolaire@gmail.com','0661609066','ENSIAS',1,'unban'),(2,'Khalfaoui Oussama','Oussama','789456123','oussamakhalfaoui1@gmail.com','0661906066','ENSIAS',1,'unban'),(7,'Ahmed','Ahmed','789456123','Ahmed123@gmail.com','0660505050','ENSIAS',1,'ban'),(8,'Mohammed Ali','ali','789456123','123@gmail.com','0661609066','EMI',2,'unban'),(9,'Driss','Troll','Troll','Troll@gmail.com','066508090','ENSIAS',1,'ban'),(10,'El Hadri Ranya','Ranya','789456123','elhadriranya@gmail.com','0661506070','ENSIAS',1,'unban'),(11,'Bakali Rasha','Rasha','789456123','Rasha123@gmail.com','0660906090','EHTP',15,'unban'),(13,'Akil Bouchera','Bouchera','789456123','bouchera@gmail.com','0660504010','INPT',3,'unban'),(14,'Mohammed Riyan','Mhamed','789456123','mhamedryan@gmail.com','0661809070','ENSIAS',1,'unban'),(29,'Said','said','789456123','said@gmail.com','0661609060','ENSIAS',1,'unban');
/*!40000 ALTER TABLE `eleve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eleve_club`
--

DROP TABLE IF EXISTS `eleve_club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `eleve_club` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eleve_id` int(11) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  `validite` varchar(56) DEFAULT 'false',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eleve_id` (`eleve_id`),
  KEY `club_id` (`club_id`),
  CONSTRAINT `eleve_club_ibfk_1` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`id`) ON DELETE CASCADE,
  CONSTRAINT `eleve_club_ibfk_2` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eleve_club`
--

LOCK TABLES `eleve_club` WRITE;
/*!40000 ALTER TABLE `eleve_club` DISABLE KEYS */;
INSERT INTO `eleve_club` VALUES (8,7,13,'true','2020-01-14 20:49:09'),(10,9,13,'false','2020-01-23 11:34:10'),(11,7,24,'false','2020-02-03 11:11:04'),(12,7,25,'deny','2020-02-03 11:20:47'),(14,2,24,'deny','2020-02-03 11:26:49'),(15,2,26,'false','2020-02-03 11:33:44'),(27,29,7,'true','2020-02-06 00:40:06'),(28,2,13,'true','2020-02-07 00:25:00');
/*!40000 ALTER TABLE `eleve_club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evenement`
--

DROP TABLE IF EXISTS `evenement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `evenement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) DEFAULT NULL,
  `activite` mediumtext,
  `description` mediumtext,
  `datedebut` datetime DEFAULT NULL,
  `datefin` datetime DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  `ecole_id` int(11) DEFAULT NULL,
  `ecole_nom` varchar(56) DEFAULT NULL,
  `type` varchar(56) DEFAULT NULL,
  `image` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `club_id` (`club_id`),
  KEY `ecole_id` (`ecole_id`),
  CONSTRAINT `evenement_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`) ON DELETE CASCADE,
  CONSTRAINT `evenement_ibfk_2` FOREIGN KEY (`ecole_id`) REFERENCES `ecole` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evenement`
--

LOCK TABLES `evenement` WRITE;
/*!40000 ALTER TABLE `evenement` DISABLE KEYS */;
INSERT INTO `evenement` VALUES (7,'Olympiades ENSIAS V6','Diverses compétions sportives :\r\nCompétion Football avec des Equipes de 6.\r\nCompétition Basketball avec des equipes de 5.\r\nChasse au trésor.\r\nCompétion Gaming : League et autres.\r\nEtc. Les prix et les horaires seront communiqués très prochainement.','La sixième édition des OLYMPIADES ENSIAS sera l\'événement phare de Madinat Al Irfane au mois de Mars! \r\nUne multitude d\'activités hors du commun, une ambiance festive qui rend hommage au sport, à la culture, et à l\'art. Un événement qui met en avant toutes nos capacités informatiques, qui joint l\'utile à l\'agréable, et nous réunit tous, élèves ingénieurs, dans un cadre d\'échange et d\'intéraction.\r\nSoyez tous au rendez-vous pour célébrer nos ressemblances mais surtout nos différences, pour manifester notre désir de se voir tous unis.\r\nNotre événement a pour thème : \"TRUE TO OUR ROOTS\", pour rappeler à tous que nous sommes fiers de nos racines. ','2020-02-28 01:45:00','2020-02-29 06:45:00',13,1,'ENSIAS','Public','maxresdefault.jpg'),(8,'Game Fest','-Compétition LOL. Prize : 800DH. Commence à 9H.\r\nCompétition PES. Prize 900DH. Commence à 11H.','Soirée de Gaming entre ENSIASTES. De nombreux jeux disponibles : \r\n-League of Legends\r\n-PES\r\n-FIFA\r\n-TEKKEN\r\n','2020-03-27 01:45:00','2020-03-28 10:50:00',7,1,'ENSIAS','Privé','gamefest.jpg'),(14,'Japan Day','Compétition Shogi.\r\nCompétition Karaoke.\r\nCompétition Gaming League of Legends et Counter Strike.\r\nChasse au trésor.\r\nEt autres. Les détails des prix à remporter et les horaires de chaque activité seront communiqués prochainement ! ','ENSIAS JAPAN DAY est un événement culturel ouvert pour tout public et un rendez-vous incontournable pour les  passionnés de la culture nippone et des mangas.','2020-04-01 09:00:00','2020-04-01 21:00:00',7,1,'ENSIAS','Public','japanday.jpg'),(16,'Compétition de programmation','','Le but de ce concours est avant tout de s\'amuser en résolvant de petits problèmes. C\'est aussi une occasion de progresser, et bien sûr de se faire une idée de son niveau en algorithmique et en programmation. ','2020-02-13 08:00:00','2020-02-13 16:00:00',22,15,'EHTP','Public','prog.jpg'),(17,'123','','','2020-01-20 13:45:00','2020-01-20 14:45:00',7,1,'ENSIAS','Privé',''),(32,'Anime Night','','Watch a movie at ENSIAS with your friends for only 10DH (Popcorn included).','2020-02-07 00:00:00','2020-02-07 00:00:00',7,1,'ENSIAS','Privé','animenight.jpg'),(33,'Anime Night','','Watch a movie at ENSIAS with your friends for only 10DH (Popcorn included).','2021-03-01 22:00:00','2021-03-01 12:00:00',7,1,'ENSIAS','Privé','animenight.jpg');
/*!40000 ALTER TABLE `evenement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `inscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eleve_id` int(11) DEFAULT NULL,
  `evenement_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eleve_id` (`eleve_id`),
  KEY `evenement_id` (`evenement_id`),
  CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`id`) ON DELETE CASCADE,
  CONSTRAINT `inscription_ibfk_2` FOREIGN KEY (`evenement_id`) REFERENCES `evenement` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscription`
--

LOCK TABLES `inscription` WRITE;
/*!40000 ALTER TABLE `inscription` DISABLE KEYS */;
INSERT INTO `inscription` VALUES (15,2,14,'2020-02-03 12:32:47'),(16,10,14,'2020-02-03 12:39:08'),(17,2,8,'2020-02-03 12:51:41'),(18,10,7,'2020-02-03 12:57:58'),(19,1,7,'2020-02-03 15:03:50'),(30,29,14,'2020-02-06 00:39:57'),(34,2,33,'2021-01-03 12:46:58');
/*!40000 ALTER TABLE `inscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1024) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  `eleve_id` int(11) DEFAULT NULL,
  `eleve_nom` varchar(56) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `club_id` (`club_id`),
  KEY `eleve_id` (`eleve_id`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (4,'Hi drari, donc 3andna réunion ghda le 20 à 21h, khass kolchi yji !',13,10,'El Hadri Ranya','2020-01-19 09:54:11'),(6,'Bonnes vacances ! Alors, après les vacs, on aura une réunion le Lundi à 20h pour discuter les prochains évenements.',13,10,'El Hadri Ranya','2020-01-21 17:50:36'),(9,'Hey, on aura une réunion demain le mardi 04/02/2020 afin de discuter le futur du club et les évenements qui nous attendent.',7,2,'Khalfaoui Oussama','2020-02-03 11:54:04'),(15,'Salut!',7,2,'Khalfaoui Oussama','2020-12-27 20:20:53');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reponse`
--

DROP TABLE IF EXISTS `reponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reponse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1024) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  `eleve_id` int(11) DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL,
  `eleve_nom` varchar(56) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `club_id` (`club_id`),
  KEY `eleve_id` (`eleve_id`),
  KEY `message_id` (`message_id`),
  CONSTRAINT `reponse_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reponse_ibfk_2` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reponse_ibfk_3` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reponse`
--

LOCK TABLES `reponse` WRITE;
/*!40000 ALTER TABLE `reponse` DISABLE KEYS */;
INSERT INTO `reponse` VALUES (1,'Ah, et jibo m3akom vos pc ',NULL,1,4,'Oussama & Ranya','2020-01-19 09:59:37'),(2,'Ok chef !',NULL,7,4,'Ahmed','2020-01-19 10:09:38'),(3,'A quelle heure ?',NULL,7,9,'Ahmed','2020-02-03 12:09:24'),(4,'Probablement vers 17H.',NULL,2,9,'Khalfaoui Oussama','2020-02-03 12:10:53'),(11,'Hello :)',NULL,2,15,'Khalfaoui Oussama','2020-12-27 20:21:19');
/*!40000 ALTER TABLE `reponse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-03 14:20:15
