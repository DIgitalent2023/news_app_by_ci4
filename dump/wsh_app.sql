-- phpMyAdmin SQL Dump
-- version 5.1.1deb3+bionic1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 09, 2023 at 08:07 AM
-- Server version: 10.1.48-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wsh_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `content` longtext,
  `date` date DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `url` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `published_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author`, `title`, `description`, `url`, `source`, `image`, `category`, `published_at`) VALUES
(308, 'Zachary Johnston', 'Grocery Store Bratwurst — Grilled, Tasted Blind, And Ranked For Super Bowl Sunday', 'iStockphoto/UPROXX Grilling brats on Super Bowl Sunday is a national pastime. Here\'s the best pack to buy at your local grocery store.', 'https://uproxx.com/life/best-german-style-bratwurst-ranked/', 'hitfix', NULL, 'general', '2023-02-09 00:13:05'),
(309, NULL, 'Metroid Prime Remastered, Classic Game Boy Games, and a New Kirby Demo Now Available on the Switch', 'Metroid Prime Remastered, Classic Game Boy Games, and a New Kirby Demo Now Available on the Switch', 'https://www.pastemagazine.com/games/nintendo-direct-metroid-prime-remastered-game-boy/', 'pastemagazine', NULL, 'general', '2023-02-09 00:15:08'),
(310, 'Reuters', 'Sustainalytics downgrades three Adani companies’ governance scores', 'Sustainalytics downgraded corporate governance-related scores for three of India&#8217;s Adani Group companies on ethics concerns, the sustainability ratings company said on Wednesday, citing questions a short-seller raised last month. The lowered scores, including for Adani Green Energy and Adani Transmission, come after a Jan. 24 report from short-seller Hindenburg Research alleged accounting fraud and stock [&#8230;]', 'https://financialpost.com/pmn/business-pmn/sustainalytics-downgrades-three-adani-companies-governance-scores', 'Financial Post | Canada Business News', NULL, 'business', '2023-02-09 00:10:53'),
(311, 'Makenzi Johnson', 'St. Paul: Public meeting Thursday will reveal upcoming road improvements on Snelling Avenue between Montreal Avenue, Ford Parkway', 'The meeting will be held at the Charles M. Schulz Arena in St. Paul from 4 to 7 p.m. There will be no formal presentation, rather an informational event will showcase the project schedule, road layout and more.', 'https://www.twincities.com/2023/02/08/st-paul-public-meeting-thursday-will-reveal-upcoming-road-improvements-on-snelling-avenue-between-montreal-avenue-ford-parkway/', 'twincities', 'https://www.twincities.com/wp-content/uploads/2016/05/2-roadwork_skybox_roadconstruction_skybox-001.jpg?w=1400px&strip=all', 'general', '2023-02-09 00:13:15'),
(312, 'Jordan Baker', 'It’s the Year of the 23 for Cal Maritime’s Alicia Porter', 'Cal Maritime women\'s basketball player Alicia Porter recently scored her 1,000th career point, becoming just the third player in program history to accomplish the feat.', 'https://www.timesheraldonline.com/2023/02/08/its-the-year-of-the-23-for-cal-maritimes-alicia-porter/', 'timesheraldonline', 'https://www.timesheraldonline.com/wp-content/uploads/2022/12/CALMARITIME2.jpg?w=1400px&strip=all', 'general', '2023-02-09 00:12:10'),
(313, NULL, '23andMe Holding Co. (ME) Q3 2023 Earnings Call Transcript', '23andMe Holding Co. (ME) Q3 2023 Earnings Call Transcript', 'https://seekingalpha.com/article/4576569-23andme-holding-co-me-q3-2023-earnings-call-transcript?source=feed_all_articles', 'Seeking Alpha', NULL, 'general', '2023-02-09 00:11:06'),
(314, 'By Caleb Johnson, News Reporter', 'Lecture at Fatty&#8217;s: The science behind flirting', 'NIU STEAM will host a presentation on the science of flirting as a part of a lecture series called STEM Cafe. This cafe event is to take place at 6:30 p.m. on Feb. 15 at Fatty’s Pub and Grille.This presentation looks at the nuanced and complex nature of flirting and what motivates people to communicate with others in an intimate way.The lecture will be given by David Henningsen, a NIU communications professor and scientist, and will review his (and other’s) scientific research on how people flirt.The presentation will teach participants about the key motivations behind flirting and how this...', 'https://northernstar.info/103243/lifestyle/lecture-at-fattys-the-science-behind-flirting/', 'northernstar', NULL, 'general', '2023-02-09 00:12:13'),
(315, 'Rachel Phillips', 'Community Champions: El Paso High School dominate in the pool to sweep regionals', 'EL PASO, Texas -- For the first time in the programs history, the El Paso Tigers swept the Regional 1-5A titles in the pool. \"I was loading the score over and over on my phone and then I saw that it was finalized and I started crying, I cried in my mums arms,\" El PasoThe post Community Champions: El Paso High School dominate in the pool to sweep regionals appeared first on KVIA.', 'https://kvia.com/sports/2023/02/08/community-champions-el-paso-high-school-dominate-in-the-pool-to-sweep-regionals/', 'kvia', NULL, 'general', '2023-02-09 00:15:15'),
(316, 'Tom Schuba', 'David Brown likely to leave Chicago Police Department', 'David Brown speaks to reporters in April 2020 after Mayor Lori Lightfoot nominated him to be Chicago’s police superintendent.Tyler LaRiviere/Sun-Times Aides to embattled Chicago Police Supt. David Brown have begun preparing a “legacy document” of his accomplishments and goals, apparently laying the groundwork for his exit, a source told the Sun-Times.With crime the top issue on the minds of Chicago voters, all eight mayoral challengers have vowed to fire Brown. Lightfoot has promised to retain him, and has been denying rumors of his imminent exit since a few months after he arrived from...', 'https://chicago.suntimes.com/city-hall/2023/2/8/23589676/brown-chicago-police-superindendent-future-mandatory-retirement-lightfoot-mayor-election', 'suntimes', NULL, 'general', '2023-02-09 00:11:54'),
(317, 'Keri Blakinger', 'New deputy \"gang\" forming in L.A. County Sheriff’s Department, lawsuit alleges', 'Los Angeles County sheriff\'s deputies are forming a new “gang” in the agency\'s East L.A. station, according to a deputy who alleges in a lawsuit he was abused when he refused to join the group.', 'https://www.latimes.com/california/story/2023-02-08/new-deputy-gang-forming-in-l-a-county-sheriffs-department-lawsuit-alleges', 'latimes', NULL, 'general', '2023-02-09 00:16:49'),
(318, 'Ensign Morgan Bollinger', 'USS Howard (DDG 83) Conducts Small Boat Operations [Image 3 of 6]', 'SAGAMI WAN, Japan (Jan. 24, 2023) Boatswain’s Mate Seaman Joshua Nesbit, from Charlotte, North Carolina, handles the rigid inflatable boat (RIB) as the coxswain, and ENS Jordan McDaniel, from Valparaiso, Indiana, leads the RIB crew as the boat officer while transferring passengers from Howard to Jogashima Island. Howard is assigned to Commander, Task Force (CTF) 71/Destroyer Squadron (DESRON) 15, the Navy’s largest forward-deployed DESRON and the U.S. 7th Fleet’s principal surface force. (U.S. Navy photo by Ensign Morgan Bollinger)', 'https://www.dvidshub.net/image/7623875/uss-howard-ddg-83-conducts-small-boat-operations', 'dvidshub', 'https://cdn.dvidshub.net/media/thumbs/photos/2302/7623875/250x167_q75.jpg', 'general', '2023-02-09 00:09:07'),
(319, 'gqlshare', 'Despite sex abuse allegations, former Pomona High coaches continue to work with children, young women', 'Kitrick Taylor is alleged to have sexually abused a 17-year-old but continues work with at-risk children. Mt. SAC coach Brian Crichlow has allegedly sexually abused three teenage students, according to court documents.', 'https://www.pasadenastarnews.com/2023/02/08/despite-sex-abuse-allegations-former-pomona-high-coaches-continue-to-work-with-children-young-women/', 'pasadenastarnews', 'https://www.pasadenastarnews.com/wp-content/uploads/2023/02/0210_SPO_SGN-L-MTSAC07.jpg?w=1400px&strip=all', 'general', '2023-02-09 00:19:56'),
(320, 'Scott M. Reid', 'Despite sex abuse allegations, former Pomona High coaches continue to work with children, young women', 'Kitrick Taylor is alleged to have sexually abused a 17-year-old but continues work with at-risk children. Mt. SAC coach Brian Crichlow has allegedly sexually abused three teenage students, according to court documents.', 'https://www.dailynews.com/2023/02/08/despite-sex-abuse-allegations-former-pomona-high-coaches-continue-to-work-with-children-young-women/', 'dailynews', 'https://www.dailynews.com/wp-content/uploads/2023/02/0210_SPO_SGN-L-MTSAC07.jpg?w=1400px&strip=all', 'general', '2023-02-09 00:19:56'),
(321, 'ezn2_spadmin', 'Auto industry leaders emphasize urgency of Canadian EV response as U.S. cash flows', 'TORONTO — Urgency was the key word at an electric vehicle conference Wednesday as manufacturers emphasized the need for more coordination and government support in order to take advantage of…L’article Auto industry leaders emphasize urgency of Canadian EV response as U.S. cash flows est apparu en premier sur Cornwall Seaway News.', 'https://www.cornwallseawaynews.com/ontario-news/auto-industry-leaders-emphasize-urgency-of-canadian-ev-response-as-u-s-cash-flows/', 'cornwallseawaynews', NULL, 'general', '2023-02-09 00:07:18'),
(322, 'News Team', 'COVID-19 UPDATES: 875 new Idaho COVID-19 cases, 5 new deaths', 'Idaho officials reported 875 new COVID-19 cases and 5 new deaths in the last week.', 'https://localnews8.com/health/coronavirus/2023/02/08/covid-19-updates-875-new-idaho-covid-19-cases-5-new-deaths/', 'localnews8', NULL, 'general', '2023-02-09 00:09:26'),
(323, NULL, 'KYN: It May Be Beneficial To Add Shares Of This CEF To Your Portfolio Today', 'KYN: It May Be Beneficial To Add Shares Of This CEF To Your Portfolio Today', 'https://seekingalpha.com/article/4576556-kyn-it-may-be-beneficial-to-add-shares-of-this-cef-to-your-portfolio-today?source=feed_all_articles', 'Seeking Alpha', NULL, 'general', '2023-02-09 00:16:25'),
(324, NULL, 'B?nh lý tuy?n vú: Vai trò c?a t?m soát, ch?n ?oán, ?i?u tr?', 'B?nh lý tuy?n vú, ?i?n hình là ung th? vú khi?n nhi?u ch? em lo âu v? th?m m?, s?c kh?e, th?m chí h?nh phúc gia ?ình. Tuy nhiên, n?u ???c t?m soát s?m, b?nh nhân s? ???c ?i?u tr? hi?u qu?, b?o t?n tuy?n vú.', 'https://thanhnien.vn/benh-ly-tuyen-vu-vai-tro-cua-tam-soat-chan-doan-dieu-tri-185230208153255043.htm', 'thanhniennews', NULL, 'general', '2023-02-09 01:01:12'),
(325, NULL, 'Nhi?t ?? khu v?c phía nam t?ng cao: M?t m?i m?i khi ra ???ng...', 'Trong tháng 2, d? báo mi?n Nam có th? n?ng nóng c?c b? v?i nhi?t ?? cao nh?t 35 - 36 ?? C. Tr??c th?i ti?t kh?c nghi?t nh? v?y, nhi?u b?n tr? ?ã g?p rút tìm nh?ng bi?n pháp t?t nh?t cho s?c kh?e, ??c bi?t là b?o v? làn da kh?e ??p và tránh nguy c? ung th? da.', 'https://thanhnien.vn/nhiet-do-khu-vuc-phia-nam-tang-cao-met-moi-moi-khi-ra-duong-185230208231021069.htm', 'thanhniennews', NULL, 'general', '2023-02-09 01:01:12'),
(326, 'Sanjeev Singh', 'How to Enable Closed Captioning on Mac', 'How to Enable Closed Captioning on Mac', 'https://www.devicemag.com/closed-caption-mac/', 'devicemag', NULL, 'general', '2023-02-09 01:02:53'),
(327, 'Sanjeev Singh', 'How to Close Camera on Your Android Device', 'How to Close Camera on Your Android Device', 'https://www.devicemag.com/close-the-camera/', 'devicemag', NULL, 'general', '2023-02-09 01:02:53'),
(328, 'Elizabeth Hernandez', 'Firing of Colorado librarian who objected to cancellation of programs for youth of color, LGBTQ teens was illegal, state concludes', 'The division issued determination letters Wednesday to the High Plains Library District, finding it violated state prohibitions on discriminatory firing and retaliation, as well as to three employees, whom the division said violated the law barring the aiding and abetting of discrimination.', 'https://www.denverpost.com/2023/02/08/brooky-parks-high-plains-library-district-discrimination-colorado-civil-rights-division/', 'The Denver Post', 'https://www.denverpost.com/wp-content/uploads/2022/02/TDP-L-brookyparks020322-cha-081.jpg?w=1400px&strip=all', 'general', '2023-02-09 00:59:25'),
(329, NULL, 'Societe Generale: A Slowdown Is Expected In 2023', 'Societe Generale: A Slowdown Is Expected In 2023', 'https://seekingalpha.com/article/4576568-societe-generale-stock-q4-2022-earnings-slowdown-expected-2023?source=feed_all_articles', 'Seeking Alpha', NULL, 'general', '2023-02-09 01:03:50'),
(330, 'Ian Levy', 'Utah Jazz updated draft picks after Russell Westbrook trade', 'The Utah Jazz picked up another first-round draft pick by working themselves into the Russell Westbrook trade. How many future picks do they have now? The Utah Jazz began stockpiling first-round picks this summer with the blockbuster trades of Rudy Gobert and Donovan Mitchell. It seemed likely they would follow that path with some of [&#8230;]Utah Jazz updated draft picks after Russell Westbrook trade - FanSided - FanSided - Sports News, Entertainment, Lifestyle & Technology - 300+ Sites', 'https://fansided.com/2023/02/08/utah-jazz-updated-draft-picks-russell-westbrook-trade/', 'Fansided', NULL, 'sports', '2023-02-09 01:54:39'),
(331, NULL, '\'Baby talk\' could help diagnose autism in toddlers, study says', 'A new study finds toddlers\' attention to high-pitched, sing-songy speech -- or \"baby talk\" -- could provide an early diagnosis and treatment of autism spectrum disorder.', 'https://www.upi.com/Health_News/2023/02/08/study-motherese-toddlers-autism-spectrum-disorder/1431675905715/', 'upiasia', 'https://cdnph.upi.com/ph/st/th/1431675905715/2023/upi_com/04603628f3e084fa5f980090b66793c9/v1.5/Baby-talk-could-help-diagnose-autism-in-toddlers-study-says.jpg', 'general', '2023-02-09 01:51:28'),
(332, 'NBC2 News', '3-year-old child shot inside vehicle in Orange County', 'Residents of the Hidden Creek Villas of South Texas Avenue were shaken Wednesday after a 3-year-old girl was shot while in a vehicle.The post 3-year-old child shot inside vehicle in Orange County appeared first on NBC2 News.', 'https://nbc-2.com/news/crime/2023/02/08/3-year-old-child-shot-inside-vehicle-in-orange-county/', 'nbc-2', NULL, 'general', '2023-02-09 01:53:45');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dob` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `dob`) VALUES
(1, 'John', 'Smith', 'johnsmith@gmail.com', 'johnsmith255', '0000-00-00'),
(2, 'Willium', 'Mackdonalds', 'mattdamon@hotmail.com', 'matt2023', '0000-00-00'),
(3, 'Rama', 'Issa', 'kibambaza@gmail.com', '1234', '0000-00-00'),
(4, 'Francis', 'ben', 'f@gmail.com', 'anskdjahskjdhqiuwk', '0000-00-00'),
(10, 'Kassim', 'Collins', 'kascol@gmail.com', 'collins22', '2000-06-03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_and_user` (`user_id`),
  ADD KEY `comments_and_posts_relation` (`post_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
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
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=333;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comment_and_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_and_posts_relation` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
