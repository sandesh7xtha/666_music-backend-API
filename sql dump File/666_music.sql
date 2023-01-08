-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2022 at 09:29 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `666_music`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_to_cart`
--

CREATE TABLE `add_to_cart` (
  `user_id` int(11) NOT NULL,
  `sp_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `advertisement`
--

CREATE TABLE `advertisement` (
  `adv_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(500) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `sponser` varchar(50) DEFAULT 'sponsored'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `advertisement`
--

INSERT INTO `advertisement` (`adv_id`, `image`, `title`, `description`, `date`, `sponser`) VALUES
(4, 'http://localhost:4000/public\\advertisementIMG\\1650907608830.png', 'Spotify', 'Listen to Your Favorite Artists, Songs and Albums for Free. Try Spotify® Today! Find Your Favorite Albums. Play Music for Free. Discover Great New Music. Listen on Several Devices. Curated Playlists.', '2022-4-25', 'sponsored');

-- --------------------------------------------------------

--
-- Table structure for table `comment_shp`
--

CREATE TABLE `comment_shp` (
  `cmt_id` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shp_id` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `comment_sp`
--

CREATE TABLE `comment_sp` (
  `cmt_id` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sp_id` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment_sp`
--

INSERT INTO `comment_sp` (`cmt_id`, `message`, `user_id`, `sp_id`, `date`) VALUES
(8, 'good', 7, 18, '2022-4-24');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `payment_id` varchar(255) NOT NULL,
  `sp_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`payment_id`, `sp_id`, `quantity`) VALUES
('Dzxyv9ymz5PJuRUPrZhrNF', 18, 1),
('Dzxyv9ymz5PJuRUPrZhrNF', 24, 4);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `new_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(500) NOT NULL,
  `date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`new_id`, `image`, `title`, `description`, `date`) VALUES
(22, 'http://localhost:4000/public\\newsIMG\\1650694976599.png', 'Avenged Sevenfold', 'Avenged Sevenfold (abbreviated as A7X) is an American heavy metal band from Huntington Beach, California, formed in 1999. The band\'s current lineup consists of lead vocalist M. Shadows, rhythm guitarist and backing vocalist Zacky Vengeance, lead guitarist and backing vocalist Synyster Gates, bassist and backing vocalist Johnny Christ, and drummer Brooks Wackerman.', '2022-4-23'),
(23, 'http://localhost:4000/public\\newsIMG\\1650695596423.png', 'Download Festival', 'mammoth five day rock event,\r\nbased at the spiritual home of rock Donington Park. begin on\r\nFriday, June 10 and ends on Sunday, June 12.', '2022-4-23'),
(24, 'http://localhost:4000/public\\newsIMG\\1650907114164.png', 'Jinjer Tour Cancelled', 'Dear Brothers and Sisters of Latin America, it is with heavy hearts and great sadness that we have to cancel our upcoming tour in May and have decided to not book any new tourdates there for the time being. Thanks to the promoters for believing in the band so much and to each and every one of you for keeping your tickets for the last two years but we do not want to ask you to hold them any longer … we promise that we will meet again one day ', '2022-4-25');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` varchar(255) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contactNumber` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `totalAmount` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `fullName`, `address`, `contactNumber`, `city`, `province`, `zip`, `totalAmount`, `date`, `user_id`) VALUES
('Dzxyv9ymz5PJuRUPrZhrNF', 'Sandesh Shrestha', 'thana Road,damak-6', 2147483647, 'damak,jhapa', 'province no -1', '57217', 54, '2022-4-25', 7);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `re_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shp_id` int(11) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`re_id`, `user_id`, `shp_id`, `message`, `date`) VALUES
(6, 7, 60, 'bad', '2022-4-24');

-- --------------------------------------------------------

--
-- Table structure for table `secondhand_product`
--

CREATE TABLE `secondhand_product` (
  `shp_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` float(100,5) NOT NULL,
  `used_duration` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `secondhand_product`
--

INSERT INTO `secondhand_product` (`shp_id`, `title`, `image`, `description`, `category`, `price`, `used_duration`, `contact_number`, `email`, `location`, `date`, `user_id`) VALUES
(55, 'ANGEL Guitar | Accostic', 'http://localhost:4000/public\\secondhandIMG\\1650802497660.png', 'Good just as new . i have keep good care of guitar.', 'Guitar', 13000.00000, '6 month', '9811111111', 'sandesh7xtha@gmail.com', 'Jorpati, Boudha Road, Gokarneshwor, Nepal', '2022-4-24', 7),
(56, 'Tama | Drum | Brown', 'http://localhost:4000/public\\secondhandIMG\\1650802970852.png', 'Good just as new . i have keep good care of Drum.', 'Drum', 20000.00000, '3 month', '9811111111', 'sandesh7xtha@gmail.com', 'Jyatha Inn, Kathmandu, Nepal', '2022-4-24', 7),
(57, 'Casio Keyboard | piano 4400 ctk ', 'http://localhost:4000/public\\secondhandIMG\\1650803193519.png', 'Good just as new . i have keep good care of keyboard.', 'Keyboard', 9500.00000, '1 year', '9811111111', 'sandesh7xtha@gmail.com', ' Degu Dyo Marg, Lalitpur 44700, Nepal', '2022-4-24', 7),
(58, 'Focusrite scarlett 2i4 audio interface', 'http://localhost:4000/public\\secondhandIMG\\1650803386983.png', 'Imported from Australia.\r\nWorks perfectly fine.\r\nin excellent condition.\r\nUsed at home studio. used by me only ', 'Accessories', 12500.00000, '1 year', '9822222222', 'sandesh7xtha@gmail.com', ' Sallaghari, Suryabinayak 44800, Nepal', '2022-4-24', 7),
(59, 'Yamaha bass guitar | black', 'http://localhost:4000/public\\secondhandIMG\\1650803619489.png', 'Yamaha bass guitar  in good condition.\r\nFresh strings added recently.\r\nGoing abroad so selling now.', 'Bass', 12000.00000, '2 year', '9844444444', 'sandesh7xtha@gmail.com', 'Thana Road, damak-6,Jhapa', '2022-4-24', 7),
(60, 'Shure UG 10 Microphone', 'http://localhost:4000/public\\secondhandIMG\\1650803924695.png', 'i have just brought new mic so i am selling old mic but it work good still. i am selling it on 70% deprecation', 'Microphone', 10000.00000, '3 year', '9811111111', 'sandesh7xtha@gmail.com', 'CHABAHIL PLAZA, Ring Road, Kathmandu, Nepal', '2022-4-24', 7),
(62, 'Laney Ironheart Tube Amp Head Irt120 And Laney Speaker Cabinet', 'http://localhost:4000/public\\secondhandIMG\\1650870263639.png', 'his is one of the best and most versatile amps you can find in the market. This is brand new Stock clearance sale. Laney Irt120 head costs around 1400 us dollars but i am selling both head and cabinet at 1 lakh 20 thousand only.', 'Accessories', 120000.00000, '1 year', '9811111111', 'sandesh7xtha@gmail.com', ' Kantipath, Jamal, Kathmandu', '2022-4-25', 7);

-- --------------------------------------------------------

--
-- Table structure for table `shop_product`
--

CREATE TABLE `shop_product` (
  `sp_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` float(100,5) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `visibility` varchar(10) DEFAULT 'true',
  `discount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shop_product`
--

INSERT INTO `shop_product` (`sp_id`, `title`, `image`, `description`, `category`, `price`, `stock`, `date`, `visibility`, `discount`) VALUES
(18, 'Puffin - ST Custom Guitar | Black | Electric Guitar | Batman theme', 'http://localhost:4000/public\\shopIMG\\1650788128274.png', 'Product details of ST Custom Puffin Electric Guitar with Solid Mahogany Body, Black\nBrand: ST Custom ( Brand of Nepal)\nOne year warranty in Neck (Tross Rod)\nConstructed of high-quality Mahogany wood\nHumbucker pickup\nTune-O-Matic-style Bridge\nRosewood fingerboard with 22 frets\nBody and set-in Neck: Mahogany, natural high gloss finish\nFingerboard: Rosewood with Pearloid white square inlays, 22 frets\nNeck & body binding: Vintage white\nPickups: 2x B&W, Zebra humbucker\nControls: 2 x volume + 2 x tone\nPickup selector switch: 3-way \"toggle switch\"\nBridge: Tune-o-Matic with stop tail piece\nMachine heads: Kluson-style\nNut: NuBone, white\nStrings: D\'Addario\nColour: Black\n\nSpecifications of ST Custom Puffin Electric Guitar with Solid Mahogany Body, Black\n\nBrand-ST Custom \nBodyFinish-Mahogany Number of Fret-22 Warranty Policy EN-Neck (Tross Rod)', 'Guitar', 34.00000, 4, '2022-4-24', 'true', 3),
(19, 'Pearl Stage Drum Full Sets | Black |', 'http://localhost:4000/public\\shopIMG\\1650789431328.png', 'Peavey Stage Drum Full Sets\r\n\r\n7mm, 6ply 100% Poplar Shells\r\nPrecision Bearing Edges\r\nOriginal Small Lugs\r\nGlue-adhered wraps\r\nBD Spurs with height calirbration\r\nUltra low-mass tom brackets\r\nColour red black and blue\r\nSpecifications of Peavey Stage Drum Full Sets\r\nBrand-prearl Brand SKU-112225919_NP-1030372149', 'Drum', 144.00000, 4, '2022-4-24', 'true', 4),
(21, 'Focusrite Scarlett Solo(3rd Gen) USB Audio Interface Pro performance ', 'http://localhost:4000/public\\shopIMG\\1650789872738.png', ' Focusrite Scarlett 2i2 (3rd Gen) USB Audio Interface\r\nPro performance with the finest pre-amps - Achieve a brighter and a more open recording thanks to the best performing mic pre-amps the Scarlett range has ever seen. A switchable Air mode will add extra clarity to your acoustic instruments when recording with your Scarlett 2i2.\r\nGet the perfect guitar and vocal take - There’s no need to sacrifice your tone with two high-headroom instrument inputs to plug in your guitar or bass so that they shine through. Capture your voice with clarity and your instruments in all their glory without any unwanted clipping or distortion thanks to our Gain Halos.\r\nLow-noise for crystal clear listening - Two low-noise balanced outputs provide clean audio playback. Hear all the details and nuances of your own track or music from Spotify, Apple Music and Amazon Music. Plug-in your own headphones via the output for private listening in high-fidelity.\r\nStudio quality recording for your music and podcasts - You can achieve professional sounding recordings with Scarlett’s high-performance converters which enable you to record and mix at up to 24-bit/192kHz. Your recordings will retain all of their sonic qualities so that you can sound like the artists you admire.\r\nEasy Start - It’s easier than ever to get up and running with your Scarlett with our online tool, Easy Start. Whether you’re looking to record or playback audio, we will help you get started.\r\nAll the tools you need to start recording right, now - We’ve partnered with our favourite industry partners to provide you with plenty of sound content and software so that you can create and record music right away.', 'Accessories', 55.00000, 12, '2022-4-24', 'true', 7),
(22, 'Casio KS46 Portable Keyboard With 61 Keys, CT-S200BK', 'http://localhost:4000/public\\shopIMG\\1650790343720.png', 'Casio KS46 Portable Keyboard With 61 Keys, CT-S200BK\r\nKeyboard : 61 standard size keys\r\nMaximum Polyphony : 48\r\nTones : Built-in tones: 400 ( 13 Indian)\r\nDigital Effects Reverb: 1 to 10, off\r\nBeats per measure: 0 to 16\r\nTempo range: 20 to 255\r\nBuilt-in songs: 60\r\nPart off function: left-hand, right-hand, both-hand\r\nAuto Accompaniment : Built-in rhythms: 77 ( 14 Indian)\r\nDance Music Mode Built-in patterns: 50\r\nDance Music Voice: 12\r\nTranspose: ±1 octaves (-12 to +12 semitones)\r\nTuning: A4 = 415.5 to 465.9 Hz (Initial default: 440.0 Hz)\r\nOne Touch Preset: 77\r\nSustain button\r\nLCD display (adjustable contrast)\r\nMy Setup: 1\r\nAPP Function : Chordana Play\r\nMIDI : 16 multi-timbre received, GM Level 1 standard\r\nPower Jack : 9.5V DC\r\n6 AA-size alkaline batteries or AA-size rechargeable nickel metal hydride batteries, Continuous operation: approximately 16 hours (alkaline batteries), approximately 13 hours (rechargeable nickel metal hydride batteries)\r\nSpeakers : 13cm x 6cm (oval) x 2 (Output: 2.0W + 2.0W)\r\nPower Consumption : 5.5 W\r\nDimensions : 93.0 (W) x 25.6 (D) x 7.3 (H) cm', 'Keyboard', 66.00000, 8, '2022-4-24', 'true', 4),
(24, 'Ernie Ball Electric Guitar Strings (11-48)', 'http://localhost:4000/public\\shopIMG\\1650790635049.png', 'Ernie Ball Electric Guitar Strings (11-48)\r\nMade from nickel wound\r\nSteel wire wrapped around a hex shaped steel core wire\r\nQuality Guitar Strings\r\nMade With Quality Material', 'Accessories', 5.00000, 8, '2022-4-24', 'true', 1),
(25, 'Shure Sv200Q-X Dynamic Vocal Microphone', 'http://localhost:4000/public\\shopIMG\\1650790771924.png', 'Shure Sv200Q-X Dynamic Vocal Microphone\r\nCardioid pickup pattern helps to reduce feedback\r\nFeatures wide frequency response and high output for excellent sound quality\r\nThis versatile microphone can be used for a variety of performances including lead and backup vocals, karaoke and high quality\r\nSV200 Vocal Microphone delivers crisp, clear and vibrant sound optimized for lead and backup vocals, karaoke performance and high-quality presentations. The unidirectional (cardioid) pickup pattern of the SV200 helps reduce feedback, while the widefrequency response and high output deliver crisp, clear and vibrant sound.', 'Microphone', 12.00000, 7, '2022-4-24', 'true', 9),
(26, 'JOYO ZOMBIE Amplifier 20 Watt Hybrid Mini Tube Head Bluetooth BanTamp Series', 'http://localhost:4000/public\\shopIMG\\1650868877289.png', '20 Watt amplifier with single 12AX7 preamp\r\nControls: gain, tone and volume\r\nFix loop, Bluetooth, 8 or 16 Ohm loudspeaker output, 3. 5 mm mini-jack headphone\r\nDimensions: 163 x 110 x 140 mm caline weight 1. 2 kg power supply included\r\n', 'Accessories', 35000.00000, 7, '2022-4-25', 'true', 12),
(27, 'Ktaxon 5-color Beginner Electric Bass Guitar Musical Instruments Leader', 'http://localhost:4000/public\\shopIMG\\1650869280968.png', 'Features:\r\n\r\nNew and in good condition\r\n\r\nComfortable hand feeling, stylish outlook, stable performance and melodious sound\r\n\r\nCompared with ordinary guitar, it has thicker strings and larger string tension\r\n\r\nA perfect instrument for emitting wonderful bass effect\r\n\r\nIt has a silky balance to the tone that supports vocals beautifully\r\n\r\nCan be a nice gift for your friends or families\r\n\r\n\r\nSpecifications:\r\n\r\nFingerboard Material: Rosewood\r\n\r\nStyle: Bass\r\n\r\nColor: Sunset Color/Blue/White/Black/Red\r\n\r\nGuitar Dimensions: (45.66 x 12.99 x 2.75)\" / (116 x 33 x 7)cm (L x W x H)\r\n\r\nGuitar Weight: 109.34oz / 3100g\r\n\r\nFace Material: Basswood\r\n\r\nBack Material: Basswood\r\n\r\nSide Panel Material: Basswood', 'Bass', 120000.00000, 7, '2022-4-25', 'true', 12);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `createdAt`) VALUES
(7, 'apple xtha', 'apple1@gmail.com', '$2b$10$R3iuqBIHCZTEEXzZprATvO3nt7LCVPGio3tlVt9.dSrx2B2wzv9a.', '2022-1-27'),
(13, 'sandesh sherstha', 'sandesh777@gmail.com', '$2b$10$kU1uaUFiCpC3vf/aGip.t.fHqiN5K18aC.73Rt42sDSMADeajmbIu', '2022-2-27'),
(14, 'sanjay chor', 'sanjay69@gmail.com', '$2b$10$EJpUZGmJpXmIO1pK/.sr7eyyMcwWLM7JQdrOrVaeKyoEYgH3XHe2u', '2022-3-11'),
(25, 'sandesh shrestha', 'sandesh7xtha@gmail.com', '$2b$10$DjpU6N3TLNmxLc37o5GRb.HntREZ2eZ7Op5gjj9wuOsjK6D2qhuTC', '2022-4-24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_to_cart`
--
ALTER TABLE `add_to_cart`
  ADD PRIMARY KEY (`user_id`,`sp_id`),
  ADD KEY `sp_id` (`sp_id`);

--
-- Indexes for table `advertisement`
--
ALTER TABLE `advertisement`
  ADD PRIMARY KEY (`adv_id`);

--
-- Indexes for table `comment_shp`
--
ALTER TABLE `comment_shp`
  ADD PRIMARY KEY (`cmt_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `shp_id` (`shp_id`);

--
-- Indexes for table `comment_sp`
--
ALTER TABLE `comment_sp`
  ADD PRIMARY KEY (`cmt_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `sp_id` (`sp_id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`payment_id`,`sp_id`),
  ADD KEY `sp_id` (`sp_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`new_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`re_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `shp_id` (`shp_id`);

--
-- Indexes for table `secondhand_product`
--
ALTER TABLE `secondhand_product`
  ADD PRIMARY KEY (`shp_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `shop_product`
--
ALTER TABLE `shop_product`
  ADD PRIMARY KEY (`sp_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD UNIQUE KEY `email_3` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisement`
--
ALTER TABLE `advertisement`
  MODIFY `adv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comment_shp`
--
ALTER TABLE `comment_shp`
  MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `comment_sp`
--
ALTER TABLE `comment_sp`
  MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `new_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `re_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `secondhand_product`
--
ALTER TABLE `secondhand_product`
  MODIFY `shp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `shop_product`
--
ALTER TABLE `shop_product`
  MODIFY `sp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `add_to_cart`
--
ALTER TABLE `add_to_cart`
  ADD CONSTRAINT `add_to_cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `add_to_cart_ibfk_2` FOREIGN KEY (`sp_id`) REFERENCES `shop_product` (`sp_id`);

--
-- Constraints for table `comment_shp`
--
ALTER TABLE `comment_shp`
  ADD CONSTRAINT `comment_shp_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `comment_shp_ibfk_2` FOREIGN KEY (`shp_id`) REFERENCES `secondhand_product` (`shp_id`);

--
-- Constraints for table `comment_sp`
--
ALTER TABLE `comment_sp`
  ADD CONSTRAINT `comment_sp_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `comment_sp_ibfk_2` FOREIGN KEY (`sp_id`) REFERENCES `shop_product` (`sp_id`);

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`sp_id`) REFERENCES `shop_product` (`sp_id`),
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`shp_id`) REFERENCES `secondhand_product` (`shp_id`);

--
-- Constraints for table `secondhand_product`
--
ALTER TABLE `secondhand_product`
  ADD CONSTRAINT `secondhand_product_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
