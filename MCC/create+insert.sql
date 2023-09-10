-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 15, 2023 at 08:08 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `renime`
--

-- --------------------------------------------------------

--
-- Table structure for table `animes`
--

CREATE TABLE `animes` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `image` varchar(150) NOT NULL,
  `episodes` int(11) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `animes`
--

INSERT INTO `animes` (`id`, `title`, `image`, `episodes`, `description`) VALUES
(1, 'Mushoku Tensei II: Isekai Ittara Honki Dasu', 'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx146065-1hTpwsW2fQIA.jpg', 13, 'The second season of Mushoku Tensei: Isekai Ittara Honki Dasu.\r\nRudeus heads north with new friends and powers in search of adventure and those he once knew.'),
(2, 'Horimiya: piece', 'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx163132-C220CO5UrTxY.jpg', 13, 'A new anime project adapting popular side stories that were left out from the previous adaptation.'),
(3, 'BORUTO: NARUTO NEXT GENERATIONS', 'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx97938-BnF6M5yTaNB1.jpg', 293, 'Naruto was a young shinobi with an incorrigible knack for mischief. He achieved his dream to become the greatest ninja in the village and his face sits atop the Hokage monument. But this is not his story... A new generation of ninja are ready to take the '),
(4, 'Yesterday wo Utatte', 'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx109020-sRBusiVXbsLH.jpg', 12, 'A story of love and humanity, following four boys and girls trying to live their best lives through hardship and turmoil, in a small town on a private rail line just outside of Shinjuku. Minor misunderstandings lead to big complications, and their various'),
(5, 'Bubble', 'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx142455-0QwdqZahKC8A.jpg', 1, 'In a Tokyo where gravity has broken, a boy and a girl are drawn to each other. The story is set in Tokyo, after bubbles that broke the laws of gravity rained down upon the world. Cut off from the outside world, Tokyo has become a playground for a group '),
(6, 'Zom 100: Zombie ni Naru Made ni Shitai 100 no Koto', 'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx159831-TxAC0ujoLTK6.png', 12, 'Surviving a zombie apocalypse beats being a wage slave any day! After spending years slaving away for a soul-crushing company, Akira\'s life has lost its luster. He lives in a trash-filled apartment, his pay is abysmal, and he can\'t even muster up the nerv'),
(7, 'Jujutsu Kaisen 2nd Season', 'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx145064-5fa4ZBbW4dqA.jpg', 23, 'The second season of Jujutsu Kaisen. The past comes to light when second-year students Satoru Gojou and Suguru Getou are tasked with escorting young Riko Amanai to Master Tengen. But when a non-sorcerer user tries to kill them, their mission to protect th'),
(8, 'BLEACH', 'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx269-KxkqTIuQgJ6v.png', 366, 'Ichigo Kurosaki is a rather normal high school student apart from the fact he has the ability to see ghosts. This ability never impacted his life in a major way until the day he encounters the Shinigami Kuchiki Rukia, who saves him and his family\'s lives '),
(9, 'Kimetsu no Yaiba: Katanakaji no Sato-hen', 'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx145139-rRimpHGWLhym.png', 11, '\r\nAdaptation of the Swordsmith Village Arc. Tanjiro’s journey leads him to the Swordsmith Village, where he reunites with two Hashira, members of the Demon Slayer Corps’ highest-ranking swordsmen - Mist Hashira Muichiro Tokito and Love Hashira Mitsuri Kan'),
(10, 'Jujutsu Kaisen', 'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx113415-bbBWj4pEFseh.jpg', 24, 'Itadori Yuji is a boy with tremendous physical strength, though he lives a completely ordinary high school life. One day, to save a friend who has been attacked by Curses, he eats the finger of the Double-Faced Specter, taking the Curse into his own soul.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `token` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `token`) VALUES
(1, 'ren@gmail.com', 'asd123', 'FdRp7etDpg'),
(2, 'steven@gmail.com', 'asd123', 't5hbPjO97a');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `animes`
--
ALTER TABLE `animes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `animes`
--
ALTER TABLE `animes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
