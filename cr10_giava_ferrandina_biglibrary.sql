-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2018 at 12:41 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr10_giava_ferrandina_biglibrary`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(6) UNSIGNED NOT NULL,
  `author_first_name` varchar(20) NOT NULL,
  `author_last_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `author_first_name`, `author_last_name`) VALUES
(1, 'Dan', 'Brown'),
(2, 'Paolo ', 'Coelho'),
(3, 'Joanne', 'K Rowling'),
(4, 'Randall ', 'Wallace'),
(5, 'Nora ', 'Jones'),
(6, 'Elisa', 'Toffoli'),
(7, 'Zucchero ', 'Fornaciari'),
(8, 'Tracy ', 'Chapman'),
(9, 'John Ronald Reuel ', 'Tolkien'),
(10, 'Clive Staples ', 'Lewis'),
(11, 'Tom ', 'Hooper'),
(12, 'Umberto', 'Eco');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `media_id` int(6) UNSIGNED NOT NULL,
  `media_isbn` int(13) DEFAULT NULL,
  `media_title` varchar(30) NOT NULL,
  `media_publish_date` date NOT NULL,
  `media_description` text NOT NULL,
  `media_img` varchar(30) DEFAULT NULL,
  `fk_media_type_id` int(6) UNSIGNED NOT NULL,
  `fk_author_id` int(6) UNSIGNED NOT NULL,
  `fk_publisher_id` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`media_id`, `media_isbn`, `media_title`, `media_publish_date`, `media_description`, `media_img`, `fk_media_type_id`, `fk_author_id`, `fk_publisher_id`) VALUES
(1, 385504209, 'The Da Vinci Code', '2003-03-18', 'The Da Vinci Code is a 2003 mystery thriller novel by Dan Brown. It follows symbologist Robert Langdon and cryptologist Sophie Neveu after a murder in the Louvre Museum in Paris causes them to become involved in a battle between the Priory of Sion and Opus Dei over the possibility of Jesus Christ having been a companion to Mary Magdalene.', 'ilcodicedavinci.jpg', 1, 1, 1),
(2, 62502174, 'L\'alchimista', '1988-09-15', 'The Alchemist (Portuguese: O Alquimista) is a novel by Brazilian author Paulo Coelho which was first published in 1988. Originally written in Portuguese, it became an international bestseller translated into some 70 languages as of 2016.[1][2] An allegorical novel, The Alchemist follows a young Andalusian shepherd in his journey to the pyramids of Egypt, after having a recurring dream of finding treasure there.\r\n\r\nOver the years there have been film and theatrical adaptations of the work and musical interpretations of it.', 'lalchimista.jpg', 1, 2, 2),
(3, 747532699, 'Harry Potter.1', '1997-06-26', 'Harry Potter and the Philosopher\'s Stone is a fantasy novel written by British author J. K. Rowling. It is the first novel in the Harry Potter series and Rowling\'s debut novel, first published in 1997 by Bloomsbury. It was published in the United States as Harry Potter and the Sorcerer\'s Stone by Scholastic Corporation in 1998. The plot follows Harry Potter, a young wizard who discovers his magical heritage as he makes close friends and a few enemies in his first year at the Hogwarts School of Witchcraft and Wizardry. With the help of his friends, Harry faces an attempted comeback by the dark wizard Lord Voldemort, who killed Harry\'s parents, but failed to kill Harry when he was just 15 months old.', 'potter.jpg', 1, 2, 1),
(4, 151446474, 'Il nome della rosa', '1980-09-23', 'The Name of the Rose (Italian: Il nome della rosa [il ?no?me della ?r??za]) is the 1980 debut novel by Italian author Umberto Eco. It is a historical murder mystery set in an Italian monastery, in the year 1327, an intellectual mystery combining semiotics in fiction, biblical analysis, medieval studies and literary theory. It was translated into English by William Weaver in 1983.\r\n\r\nThe novel has sold over 50 million copies worldwide, becoming one of the best-selling books ever published.[1] It has received many international awards and accolades, such as the Strega Prize in 1981 and Prix Medicis Étrangère in 1982, and was ranked 14th on Le Monde\'s 100 Books of the Century list.', 'il-nome-della-rosa.jpg', 1, 12, 3),
(5, 0, 'Herr der Ringe', '2001-12-19', 'The Lord of the Rings is a film series consisting of three high fantasy adventure films directed by Peter Jackson. They are based on the novel The Lord of the Rings by J. R. R. Tolkien. The films are subtitled The Fellowship of the Ring (2001), The Two Towers (2002) and The Return of the King (2003). They are a New Zealand-American venture produced by WingNut Films and The Saul Zaentz Company and distributed by New Line Cinema.', 'Herr-der-ringe1.jpg', 2, 9, 2),
(6, 0, 'Der Hobbit', '2012-12-13', 'The Hobbit is a film series consisting of three high fantasy adventure films directed by Peter Jackson. They are based on the 1937 novel The Hobbit by J. R. R. Tolkien, with large portions of the trilogy inspired by the appendices to The Return of the King, which expand on the story told in The Hobbit, as well as new material and characters written especially for the films. Together they act as a prequel to Jackson\'s The Lord of the Rings film trilogy. The films are subtitled An Unexpected Journey (2012), The Desolation of Smaug (2013), and The Battle of the Five Armies (2014).[4]', 'hobbit.jpg', 2, 9, 3),
(7, 0, ' Die Chroniken von Narnia', '2015-06-09', 'Le cronache di Narnia - Il leone, la strega e l\'armadio (The Chronicles of Narnia: The Lion, the Witch and the Wardrobe) è un film statunitense del 2005 diretto da Andrew Adamson. È basato sul romanzo omonimo che compone il ciclo Le cronache di Narnia di C. S. Lewis. Il film è stato prodotto dalla Walden Media e distribuito dalla Walt Disney Pictures. La pellicola è uscita nelle sale negli Stati Uniti d\'America il 9 dicembre 2005, mentre nelle sale italiane il 21 dicembre 2005.\r\n\r\nIl romanzo fu il primo ad essere pubblicato, nel 1950, ma nella pubblicazione del ciclo nel 1994 la Harper Collins seguì l\'ordine suggerito da Douglas Gresham, figlio adottivo di Lewis, in cui Il leone, la strega e l\'armadio era preceduto da Il nipote del mago.', 'narnia.jpg', 2, 10, 3),
(8, 0, 'The king\'s Speech', '2010-09-06', 'The King\'s Speech is a 2010 British historical drama movie. It is set in the 1930s. It was directed by Tom Hooper and written by David Seidler.\r\n\r\nColin Firth plays King George VI who, to overcome his stammer, sees Lionel Logue. Logue is an Australian speech therapist played by Geoffrey Rush. The two men become friends as they work together. After his brother, Edward VIII, abdicates, the new king relies on Logue to help him make a radio broadcast at the beginning of World War II.', 'kingsSpeech.jpg', 2, 11, 2),
(9, 0, ' Feels like Home', '2004-10-02', 'Feels Like Home is the second studio album by American singer-songwriter Norah Jones, released on February 10, 2004, through Blue Note Records. It serves as the follow up to Jones\' 2002 breakthrough album, Come Away with Me.\r\n\r\nAt the 47th Annual Grammy Awards the album was nominated for Best Pop Vocal Album. \"Sunrise\", the album\'s lead single, won the Grammy Award for Best Female Pop Vocal Performance. \"Creepin\' In\", featuring Dolly Parton, was also nominated for a Grammy, in the category of Best Country Collaboration with Vocals.', 'nora-jones.jpg', 3, 5, 1),
(10, 0, 'L\'anima Vola', '2013-10-15', 'L\'anima vola is the eighth studio album by Italian singer–songwriter Elisa. It was released on October 15, 2013 in Italy. The album peaked at number one in Italy and was certified double platinum by the Federation of the Italian Music Industry.[1]', 'Elisa.jpg', 3, 6, 2),
(11, 0, 'Black cat', '2016-09-24', 'Black Cat is the thirteenth studio album by the Italian blues rock singer-songwriter Zucchero Fornaciari, released on 29 April 2016.[1] It\'s his first full-length studio album in six years, after Chocabeck in 2010, given that La Sesión Cubana (2012) was a mix of unreleased, previously released and cover songs.', 'zucchero.jpg', 3, 7, 1),
(12, 0, 'New Beginning', '1995-11-14', 'New Beginning is the fourth album by singer-songwriter Tracy Chapman, released in 1995 (see 1995 in music). According to Nielsen Soundscan, it is her biggest-selling recording since 1991, with 3.8 million copies sold,[6] and according to the RIAA, it has shipped five million copies in the United States.\r\n\r\nThe album\'s sound consists of Chapman\'s trademark acoustic folk-rock sound and is mainly made up of slow low-key tunes and a few upbeat tracks. One notable exception is the hit \"Give Me One Reason\", which is a blues piece. Most tracks on the album have backup singers, which was very rare in Chapman\'s earlier works.', 'Tracy Chapman.jpg', 3, 8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `media_type`
--

CREATE TABLE `media_type` (
  `media_type_id` int(6) UNSIGNED NOT NULL,
  `media_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media_type`
--

INSERT INTO `media_type` (`media_type_id`, `media_type`) VALUES
(1, 'Book'),
(2, 'DVD'),
(3, 'CD');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(6) UNSIGNED NOT NULL,
  `publisher_name` varchar(30) DEFAULT NULL,
  `publisher_address` varchar(100) NOT NULL,
  `publisher_size` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `publisher_name`, `publisher_address`, `publisher_size`) VALUES
(1, 'Big Publisher', 'Stephansplatz,1 Vienna', 'Big '),
(2, 'Medium Publisher', 'Karlsplatz,1 Vienna', 'Medium '),
(3, 'Small Publisher', ' Schwarzenbergplatz, 1 Vienna', 'Small');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`media_id`),
  ADD KEY `fk_media_type_id` (`fk_media_type_id`),
  ADD KEY `fk_author_id` (`fk_author_id`),
  ADD KEY `fk_publisher_id` (`fk_publisher_id`);

--
-- Indexes for table `media_type`
--
ALTER TABLE `media_type`
  ADD PRIMARY KEY (`media_type_id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `media_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `media_type`
--
ALTER TABLE `media_type`
  MODIFY `media_type_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisher_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`fk_media_type_id`) REFERENCES `media_type` (`media_type_id`),
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`fk_author_id`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `media_ibfk_3` FOREIGN KEY (`fk_publisher_id`) REFERENCES `publisher` (`publisher_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
