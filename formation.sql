-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mar 10 Janvier 2017 à 14:19
-- Version du serveur :  5.7.14-log
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `formation`
--

-- --------------------------------------------------------

--
-- Structure de la table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `addresstype` enum('courrier','domicile','facturation','livraison') COLLATE utf8_bin NOT NULL,
  `num` varchar(16) COLLATE utf8_bin NOT NULL,
  `street` varchar(128) COLLATE utf8_bin NOT NULL,
  `pc` varchar(5) COLLATE utf8_bin NOT NULL,
  `city` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `idcustomer` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `addresses`
--

INSERT INTO `addresses` (`id`, `addresstype`, `num`, `street`, `pc`, `city`, `idcustomer`) VALUES
(1, 'domicile', '3ter', 'rue du mesnil', '30000', 'Nîmes', 1),
(2, 'domicile', '3ter', 'rue du mesnil', '30000', 'Nîmes', 2),
(3, 'domicile', '15', 'chemin de la tramontane', '30210', 'Marguerittes', 3),
(4, 'domicile', '150', 'rue de la source', '30210', 'Marguerittes', 5),
(5, 'facturation', '6', 'rue de la source', '30210', 'Marguerittes', 5),
(6, 'domicile', '15', 'boulevard Pied de Nez', '30000', 'Nîmes', 4),
(7, 'domicile', '125', 'rue du chemin', '30000', 'Nîmes', 6),
(8, 'domicile', '3', 'rue du circuit', '30210', 'Ledenon', 7),
(9, 'domicile', '35', 'rue haute', '30210', 'Ledenon', 8),
(10, 'domicile', '54', 'yt', '30000', 'htrfhd', 9),
(11, 'domicile', '54', 'fds', '15456', 'dsfs', 10),
(12, 'domicile', '44', 'jhg', '56456', 'ghj jh', 11),
(13, 'domicile', '154', 'zt', '156', 'ert', 12),
(14, 'domicile', '45', 'jhlk', '54', 'mlùk', 13),
(15, 'domicile', '15', 'uy', '12300', 'yiu', 14),
(16, 'domicile', '561', 'uyi', '25000', 'uyituyi', 15);

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(32) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(64) COLLATE utf8_bin NOT NULL,
  `email` varchar(96) COLLATE utf8_bin NOT NULL,
  `civility` enum('Madame','Monsieur') COLLATE utf8_bin NOT NULL,
  `phone` varchar(9) COLLATE utf8_bin DEFAULT NULL,
  `ordernumber` int(4) UNSIGNED ZEROFILL DEFAULT '0001',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `customers`
--

INSERT INTO `customers` (`id`, `firstname`, `lastname`, `email`, `civility`, `phone`, `ordernumber`, `deleted`) VALUES
(1, 'léon', 'machin', 'leon.machin@monmail.com', 'Monsieur', '605243598', 0001, 0),
(2, 'anita', 'machin', 'anita.leroy@monmail.com', 'Madame', '605225588', 0001, 0),
(3, 'georges', 'roux', 'g.roux235@testmail.com', 'Monsieur', '455223366', 0001, 0),
(4, 'ludivine', 'plean', 'lulu.pl@monmail.com', 'Madame', '123456789', 0001, 0),
(5, 'émilie', 'leclerc', 'emy.leclerc@gmail.com', 'Madame', '987654321', 0001, 0),
(6, 'tamara', 'bol', 'tamara.bol33@gmail.com', 'Madame', '987321654', 0001, 0),
(7, 'laetitia', 'nini', 'leati.nini@monmaillointain.com', 'Madame', '456321987', 0001, 0),
(8, 'roger', 'fin', 'roger.fin@gmail.com', 'Monsieur', NULL, 0001, 0),
(9, 'yui', 'ytu', 'n@n.fr', 'Madame', '061235478', 0001, 0),
(10, 'ert', 'ert', 'df@gh.gt', 'Monsieur', '5764', 0001, 0),
(11, 'fgh', 'gfh', 'dsf@ghj.hg', 'Monsieur', '46545', 0001, 0),
(12, 'ezr', 'ezr', 'reg', 'Monsieur', '54', 0001, 0),
(13, 'tr', 'ytr', 'trhy', 'Monsieur', '41456456', 0001, 0),
(14, 'dgfh', 'hgfd', 'fds@iu.ui', 'Monsieur', '612790053', 0001, 0),
(15, 'yti', 'yuit', 'ury@ui.ii', 'Monsieur', '612790025', 0001, 0);

-- --------------------------------------------------------

--
-- Structure de la table `cyrapp_users`
--

CREATE TABLE `cyrapp_users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `role` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ROLE_USER'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `cyrapp_users`
--

INSERT INTO `cyrapp_users` (`id`, `username`, `password`, `email`, `is_active`, `role`) VALUES
(6, 'leon', 'machin', 'leon.machin@monmail.com', 1, 'ROLE_USER'),
(7, 'toto', 'toto', 'n@n.fr', 1, 'ROLE_ADMIN'),
(8, 'test', 'test', 'test', 1, 'ROLE_USER'),
(9, 'rtytrt', 'dsf', 'df@gh.gt', 1, 'ROLE_USER'),
(10, 'fhgghf', 'gfh', 'dsf@ghj.hg', 1, 'ROLE_USER'),
(11, 'ezr', 'ezz', 'reg', 1, 'ROLE_USER'),
(12, 'try', 'try', 'trhy', 1, 'ROLE_USER'),
(13, 'hgfdhg', 'gfhd', 'fds@iu.ui', 1, 'ROLE_USER'),
(14, 'yuit', '1111', 'ury@ui.ii', 1, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Structure de la table `cyrcontact_form`
--

CREATE TABLE `cyrcontact_form` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `email` varchar(32) COLLATE utf8_bin NOT NULL,
  `subject` varchar(200) COLLATE utf8_bin NOT NULL,
  `emailnotification` tinyint(1) NOT NULL DEFAULT '1',
  `resolved` tinyint(1) NOT NULL DEFAULT '0',
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `cyrcontact_form`
--

INSERT INTO `cyrcontact_form` (`id`, `name`, `email`, `subject`, `emailnotification`, `resolved`, `creationdate`) VALUES
(1, 'trytr', 'cyrilbouchez@gmail.com', 'undefined', 1, 1, '2016-11-30 14:22:01'),
(2, 'jhgghjhgj', 'cyrilbouchez@gmail.com', ' jhghjjgh  gh jg hg jg jgh jgjg jhg', 1, 1, '2016-11-30 14:25:00'),
(3, 'kn ', 'cyrilbouchez@gmail.com', ' j', 1, 1, '2016-12-01 08:14:24'),
(11, 'fds', 'cyril@maipee.com', ' sdf', 1, 0, '2016-12-12 09:23:49'),
(12, 'RET', 'fd@df.fr', ' TER', 1, 0, '2016-12-12 15:45:35'),
(13, 'fds', 'dfs@hj.jh', ' gfh', 1, 0, '2016-12-12 15:46:53'),
(14, 'fgd', 'fdg@uy.hy', ' dfg', 1, 0, '2016-12-12 15:48:17'),
(15, 'yu', 'ytu@ui.ju', ' tryetry', 1, 0, '2016-12-13 08:31:20'),
(16, 'aaaaaaaaaaaaa', 'cccccccccc@de.fr', 'drghdfhgdfhgdf', 1, 0, '2017-01-05 11:17:43'),
(17, 'bbbbbbbbbbbb', 'cyril@maipee.com', 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', 1, 0, '2017-01-05 12:07:50'),
(18, 'nnnnn', 'nnnnn@nn.nn', 'nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn', 1, 0, '2017-01-05 12:25:30'),
(19, '\'+name+\'', 'cyril@maipee.com', '\'+subject+\'', 1, 0, '2017-01-05 13:18:22'),
(20, 'wwwww', 'cyril@maipee.com', 'wwwww', 1, 0, '2017-01-05 13:19:26'),
(21, 'qsfgqsfdg', 'sdfgsdfg@sdfgzsd.gsdf', 'sdfgsdfg', 1, 0, '2017-01-05 13:24:07'),
(22, 'qsfdgqsfd', 'cyril@maipee.com', 'qDSFqsd', 1, 0, '2017-01-05 13:25:44'),
(23, 'gggggg', 'gggggg@fr.bb', 'nnppppppppppppppppppppp', 1, 0, '2017-01-05 13:49:29'),
(24, 'tutu', 'toto@toto.to', 'vvvvvvvvvvvvvvvvvvvvvvvvvv', 1, 0, '2017-01-05 14:13:04'),
(25, 'jklmjkl:', 'jhklmjklm@sefg.sdfg', 'hhhhhhhhhhhhhhhhhhhhhh', 1, 0, '2017-01-05 14:27:07'),
(26, 'sdfgsdfg', 'cyril@maipee.com', 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', 1, 0, '2017-01-05 14:31:21'),
(27, 'sdfgsdfg', 'cyril.maipee@gmail.com', 'asqdfqasdfqsdf', 1, 0, '2017-01-05 14:58:50'),
(28, 'azsqdfqsdf', 'cyril.maipee@gmail.com', 'qsdfqsdf', 1, 0, '2017-01-05 15:17:25'),
(29, 'aqzdfqsdfq', 'cyril.maipee@gmail.com', 'qdsQSDFqsd', 1, 0, '2017-01-05 15:26:26'),
(30, 'cvgbxfc', 'cyril@maipee.com', 'qsdfqsdfgqsdfgqsdf', 1, 0, '2017-01-06 08:36:56'),
(31, 'fdshgdfhg', 'cyril@maipee.com', 'azefdQSFDqf', 1, 0, '2017-01-06 08:39:25'),
(32, 'sqdfgqsdf', 'cyril@maipee.com', 'qsdfqsdfqsdf', 1, 0, '2017-01-06 08:49:47'),
(33, 'qsdfgqsdf', 'cyril@maipee.com', 'azertqsdfgqsdf', 1, 0, '2017-01-06 08:59:18'),
(34, 'sdhgsd', 'cyrilbouchez@yahoo.fr', 'qsfgqsdfq', 1, 0, '2017-01-06 09:18:30'),
(35, 'sgfrsdefg', 'sdfgsdfg@fvg.gt', 'qsfdqsdgfqsdgf', 1, 0, '2017-01-06 09:23:41'),
(36, 'sdfqsdf', 'cyril@maipee.com', 'qsdfqsdfqsdf', 1, 0, '2017-01-06 09:25:47'),
(37, 'sdfgsdfg', 'cyrilbouchez@yahoo.fr', 'aazefazsef', 1, 0, '2017-01-06 09:28:26'),
(38, 'wfdsgdsqfg', 'cyrilbouchez@yahoo.fr', 'qsdfqsdfvqsdfvgqdsfgsqdf', 1, 0, '2017-01-06 09:52:20'),
(39, 'dsfhgsdfhg', 'sdfhsdhg@sdfg.fr', 'qdsfqsdfqsdf', 1, 0, '2017-01-06 09:53:43'),
(40, 'qdfgsqdfg', 'sqdfgsqdfg@sdf.fr', 'qsdfqsdfq', 1, 0, '2017-01-06 09:55:13'),
(41, 'qsdfgqsfd', 'cyrilbouchez@yahoo.fr', 'qsdfqsdf', 1, 0, '2017-01-06 09:56:07'),
(42, 'sdfgsdf', 'sdfgsdfgsdf@de.fr', 'qsfdqsdf', 1, 0, '2017-01-06 09:58:17'),
(43, 'qfsdgqsfd', 'cyrilbouchez@yahoo.fr', 'qsdfqsdfqsdf', 1, 0, '2017-01-06 09:59:38'),
(44, 'qsdfgvqsdf', 'qsdfgqsdf@ef.de', 'qsdfqsdf', 1, 0, '2017-01-06 10:02:11'),
(45, 'qsdfgqsdfg', 'qsdfgqsdgqsdf@fr.fr', 'qsdfqsdfq', 1, 0, '2017-01-06 10:03:17'),
(46, 'sdfgsdf', 'gsdfgsdfgsdf@sq.fr', 'aqzdfqsdfqsd', 1, 0, '2017-01-06 10:17:13'),
(47, 'qsdfvqsdqs', 'qsdfqsdfq@fr.fr', 'dfqsdfqsdfqsdf', 1, 0, '2017-01-06 10:20:18'),
(48, 'sdfgsdfg', 'sdfgsdfg@sdf.gt', 'qsdfqsd', 1, 0, '2017-01-06 10:25:27'),
(49, 'qsdfqsd', 'cyrilbouchez@yahoo.fr', 'zedfqsdf', 1, 0, '2017-01-06 10:26:13'),
(50, 'qsdfq', 'qsdfqsdf@rf.fr', 'qsdfq', 1, 0, '2017-01-06 10:27:06'),
(51, 'qsfdgqs', 'qsdfgqsd@de.de', 'azefqzsefqsdf', 1, 0, '2017-01-06 10:28:14'),
(52, 'qsdfgqsd', 'cyrilbouchez@yahoo.fr', 'qsdfqsdfqsdf', 1, 0, '2017-01-06 10:30:07'),
(53, 'qsdfqsd', 'qsdfqsdfq@ee.de', 'azefqSFQSDFQS', 1, 0, '2017-01-06 10:30:45'),
(54, 'sdfgsdf', 'sdfgsdf@de.fr', 'azdfqsdf', 1, 0, '2017-01-06 10:38:01'),
(55, 'qsfdgqsfdg', 'qsfdgqsf@fref.fzre', 'qazsdfqsdfqsdf', 1, 0, '2017-01-06 10:41:59'),
(56, 'sdfgsdf', 'dfgsdf@sdf.gsdf', 'sdfgsdfg', 1, 0, '2017-01-06 10:42:42'),
(57, 'sdfsdf', 'sdfbsdf@sdf.qs', 'qsdfqsdfqsdf', 1, 0, '2017-01-06 10:46:06'),
(58, 'sdfgs', 'sdfgsdfg@sqdfg.qs', 'qsdfqsdfqsdf', 1, 0, '2017-01-06 10:47:26'),
(59, 'sthgsdgrt', 'qdsfgqsfd@ferzf.fr', 'asdfqsdf', 1, 0, '2017-01-06 10:50:14'),
(60, 'qsergfqsdfg', 'sqdfgqsfd@de.de', 'sqdfgsqdfgsdfg', 1, 0, '2017-01-06 10:52:08'),
(61, 'qsdfqsdf', 'qsdfqsdf@qsdf.dsf', 'fqsdfqsdfqsdf', 1, 0, '2017-01-06 11:36:18'),
(62, 'azrfgqsdf', 'qsdfqsdfq@efe.de', 'azedfqsdfqsef', 1, 0, '2017-01-06 11:38:38'),
(63, 'qsdfqsdf', 'qsdfqsdfgqsdf@qsdf.fr', 'rzfqsfdqsdfqsdfqsdfqsdfqsdf', 1, 0, '2017-01-06 11:41:07'),
(64, 'zaergtazsretg', 'aezrtzaert@sqfd.zer', 'zefgaqsdfgqsdf', 1, 0, '2017-01-06 11:42:14'),
(65, 'qsdfgqsdf', 'qsdfqsdfq@aqzrqat.fr', 'azergtqzsdfgtqsdgfqsdfgqdsf', 1, 0, '2017-01-06 11:44:13'),
(66, 'xxxxxxxx', 'xxxxxxxxxx@xx.xx', 'xxxxxxxxxxxxxxxxxx', 1, 0, '2017-01-06 12:17:55'),
(67, 'wwwwwwwwwww', 'wwwwwwwwww@ww.ww', 'wwwwwwwwwwwwwwww', 1, 0, '2017-01-06 12:20:01'),
(68, 'eeeeeeeeee', 'eeeeeeeeee@ee.ee', 'eeeeeeeeeeeeee', 1, 0, '2017-01-06 12:24:47'),
(69, 'aaaaaaaaaaaaaaa', 'aaaaaaa@aa.aa', 'qsdfqsdfqsdfqsdf', 1, 0, '2017-01-06 12:25:48'),
(70, 'vvvv', 'vvvv@vvw.vvw', 'vvvvvvvvvvvvvv', 1, 0, '2017-01-06 12:29:36'),
(71, 'qqqqqq', 'qqqqq@qq.qq', 'qqqqqqqqqqqqq', 1, 0, '2017-01-06 12:30:46'),
(72, 'bbbbbbb', 'bbbbbb@bb.bb', 'bbbbbb', 1, 0, '2017-01-06 12:34:45'),
(73, 'cccccccccccccccc', 'ccccccc@cc.cc', 'ccccccccccccccccccccccccccccccc', 1, 0, '2017-01-06 12:35:57'),
(74, 'zaerfazerezar', 'zergfzergfzerg@dze.fr', 'qszdfqsdfqsdf', 1, 0, '2017-01-06 14:43:26'),
(75, 'qsfdgvqsfdg', 'qsdzfqsdf@qsd.fr', 'qfsdfqsdf', 1, 0, '2017-01-06 14:45:03'),
(76, 'sdfgsdfgs', 'qsdfgsdfgqsdfqgs@qsfdg.qsdf', 'azedfqsdfqsdf', 1, 0, '2017-01-06 14:46:00'),
(77, 'qwsfdgwsdfg', 'sdfgsdf@sdfg.df', 'qsdfqsdf', 1, 0, '2017-01-06 14:47:45'),
(78, 'qsdfqsdqsdf', 'cyrilbouchez@gmail.com', 'sdfgsdfghsdf', 1, 0, '2017-01-06 14:50:03'),
(79, 'sqdfgsqdf', 'cyrilbouchez@gmail.com', 'qsdfqsdfqs', 1, 0, '2017-01-06 14:52:50'),
(80, 'zeqrazre', 'azertaz@qzsef.ed', 'azetazer', 1, 0, '2017-01-10 11:10:16');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(60) COLLATE utf8_bin NOT NULL,
  `adresse` text COLLATE utf8_bin NOT NULL,
  `ville` varchar(50) COLLATE utf8_bin NOT NULL,
  `num` varchar(16) COLLATE utf8_bin NOT NULL,
  `street` varchar(128) COLLATE utf8_bin NOT NULL,
  `pc` varchar(5) COLLATE utf8_bin NOT NULL,
  `phone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id`, `label`, `email`, `adresse`, `ville`, `num`, `street`, `pc`, `phone`) VALUES
(1, 'Les rocher & compagnie', 'rocher@repotre.fr', 'cedex 2', 'Avignon', '5', 'rue de Oliviers', '84521', 466751786),
(2, 'les rossignols du Sud', 'rosignoldusud@retro.fr', '13ième arrondissement', 'Marseille', '256', 'Avenue de l\'ecluse', '13000', 466651786),
(3, 'Doratez Frere', 'doratez@rere.fr', '', 'Nimes', '154', 'rue de la Gare', '30000', 466761786),
(4, 'La Redoute', 'redoute@gtr.fr', '', 'Aix en Provence', '55', 'Avenue frontgnan', '58900', 468751786),
(5, 'Glarical', 'glarical@gt.fr', 'cedex3', 'Beaucaire', '66', 'rue des fous', '30320', 466751786);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `idcustomer` bigint(20) UNSIGNED NOT NULL,
  `idproduct` bigint(20) UNSIGNED NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `codeorder` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `statusdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('annulée','en caddie','en attente de paiement','en préparartion','en cours de livraison','livré') COLLATE utf8_bin DEFAULT NULL,
  `price` float NOT NULL DEFAULT '0',
  `fournisseur` tinyint(1) NOT NULL DEFAULT '0',
  `encours2livr` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `orders`
--

INSERT INTO `orders` (`id`, `quantity`, `idcustomer`, `idproduct`, `deleted`, `codeorder`, `statusdate`, `status`, `price`, `fournisseur`, `encours2livr`) VALUES
(1, 100, 1, 5, 0, '555555', '2016-11-30 14:31:26', 'en caddie', 178.75, 0, 0),
(2, 40, 1, 5, 1, '555555', '2016-12-01 11:00:55', 'livré', 143, 0, 0),
(3, 1, 11, 6, 0, '555555', '2016-11-30 14:36:29', 'livré', 35.75, 0, 0),
(4, 10, 5, 10, 1, '555555', '2016-11-08 11:00:50', 'livré', 357.5, 0, 0),
(5, 1, 5, 2, 1, '555555', '2016-11-26 11:00:46', 'en cours de livraison', 35.75, 0, 0),
(6, 3, 11, 2, 1, '555555', '2016-11-15 10:49:28', 'livré', 107.25, 0, 0),
(7, 60, 1, 5, 1, '555555', '2016-12-01 10:49:20', 'annulée', 2145, 0, 0),
(8, 1, 4, 9, 1, '555555', '2016-11-14 10:49:18', 'livré', 35.75, 0, 0),
(9, 6, 4, 3, 1, '555555', '2016-12-02 10:42:16', 'livré', 214.5, 0, 0),
(10, 20, 4, 9, 0, '555555', '2016-12-03 10:52:34', 'livré', 35.75, 0, 0),
(11, 100, 1, 3, 1, '555555', '2016-12-01 14:05:00', 'annulée', 3575, 0, 0),
(12, 59, 13, 10, 1, '555555', '2016-12-08 11:21:43', 'livré', 3575, 0, 0),
(13, 1, 6, 11, 0, '1', '2016-12-09 11:07:41', 'livré', 35.75, 0, 0),
(14, 1, 4, 10, 0, '1', '2016-12-10 11:11:17', 'livré', 35.75, 0, 0),
(15, 1, 12, 8, 0, '1', '2016-12-12 11:13:02', 'livré', 35.75, 0, 0),
(16, 4, 4, 3, 0, '1', '2016-12-13 11:13:32', 'en caddie', 143, 0, 0),
(17, 1, 3, 5, 0, '1', '2016-10-03 11:20:30', 'livré', 175.55, 0, 0),
(18, 1, 3, 8, 0, '1', '2016-10-11 11:20:44', 'livré', 99.9, 0, 0),
(19, 1, 8, 12, 0, '1', '2016-10-19 11:21:08', 'livré', 99.9, 0, 0),
(20, 1, 2, 6, 0, '1', '2016-11-01 12:21:10', 'livré', 99.9, 0, 0),
(21, 1, 4, 8, 0, '1', '2016-11-08 12:21:11', 'livré', 99.9, 0, 0),
(22, 1, 3, 12, 0, '1', '2016-11-22 12:21:14', 'livré', 99.9, 0, 0),
(23, 1, 5, 7, 0, '1', '2016-11-30 12:21:14', 'livré', 99.9, 0, 0),
(24, 1, 12, 6, 0, '1', '2016-11-28 12:21:14', 'livré', 99.9, 0, 0),
(25, 1, 4, 9, 0, '1', '2016-12-01 12:21:14', 'livré', 99.9, 0, 0),
(26, 1, 7, 12, 0, '1', '2016-12-06 12:21:15', 'livré', 99.9, 0, 0),
(27, 1, 5, 11, 0, '1', '2016-12-08 12:21:15', 'livré', 99.9, 0, 0),
(28, 1, 5, 12, 0, '1', '2016-12-05 12:21:15', 'livré', 99.9, 0, 0),
(29, 1, 5, 6, 0, '1', '2016-12-08 12:21:15', 'livré', 99.9, 0, 0),
(30, 3, 6, 13, 0, '1', '2016-12-10 12:21:20', 'livré', 299.7, 0, 0),
(31, 1, 3, 5, 0, '1', '2016-11-16 12:21:49', 'livré', 175.55, 0, 0),
(32, 1, 5, 12, 0, '1', '2016-10-03 11:21:55', 'livré', 175.55, 0, 0),
(33, 1, 8, 8, 0, '1', '2016-10-17 11:21:56', 'livré', 175.55, 0, 0),
(34, 1, 12, 7, 0, '1', '2016-11-07 12:21:56', 'livré', 175.55, 0, 0),
(35, 1, 10, 7, 0, '1', '2016-09-05 11:21:58', 'livré', 175.55, 0, 0),
(36, 1, 5, 10, 0, '1', '2016-12-01 12:21:58', 'livré', 175.55, 0, 0),
(37, 1, 10, 13, 0, '1', '2016-12-09 12:21:58', 'livré', 175.55, 0, 0),
(38, 1, 4, 6, 0, '1', '2016-12-02 12:21:58', 'livré', 175.55, 0, 0),
(39, 1, 12, 5, 0, '1', '2016-12-03 12:21:59', 'livré', 175.55, 0, 0),
(40, 1, 3, 5, 0, '1', '2016-12-11 12:21:59', 'livré', 175.55, 0, 0),
(41, 1, 10, 12, 0, '1', '2016-12-13 12:29:30', 'livré', 175.55, 0, 0),
(42, 1, 6, 10, 0, '1', '2016-12-11 12:29:33', 'livré', 175.55, 0, 0),
(43, 1, 7, 11, 0, '1', '2016-12-13 12:29:36', 'livré', 175.55, 0, 0),
(44, 1, 7, 12, 0, '1', '2016-12-13 12:29:38', 'livré', 175.55, 0, 0),
(45, 1, 8, 5, 0, '1', '2016-12-12 09:26:29', 'livré', 99.9, 0, 0),
(46, 1, 9, 12, 0, '9', '2016-12-13 12:55:59', 'livré', 58, 0, 0),
(47, 3, 11, 10, 0, '9', '2016-12-13 12:56:09', 'annulée', 174, 0, 0),
(48, 250, 1, 2, 0, NULL, '2016-11-15 23:00:00', 'en attente de paiement', 5000, 1, 1),
(49, 250, 1, 2, 0, NULL, '2016-11-18 23:00:00', 'en cours de livraison', 5000, 1, 1),
(50, 250, 1, 2, 0, NULL, '2016-11-22 23:00:00', 'livré', 5000, 1, 1),
(51, 100, 1, 2, 0, NULL, '2016-10-13 22:00:00', 'en attente de paiement', 2000, 1, 1),
(52, 100, 1, 2, 0, NULL, '2016-10-17 22:00:00', 'en cours de livraison', 2000, 1, 1),
(53, 100, 1, 2, 0, NULL, '2016-10-20 22:00:00', 'livré', 2000, 1, 1),
(78, 100, 1, 3, 0, 'fds02df', '2016-08-31 22:00:00', 'en attente de paiement', 3000, 1, 1),
(79, 100, 1, 3, 0, 'fds02df', '2016-09-04 22:00:00', 'en cours de livraison', 3000, 1, 1),
(80, 100, 1, 3, 0, 'fds02df', '2016-09-09 22:00:00', 'livré', 3000, 1, 1),
(81, 200, 1, 4, 0, 'de125fdb', '2016-11-30 23:00:00', 'en attente de paiement', 6025, 1, 1),
(82, 200, 1, 4, 0, 'de125fdb', '2016-12-05 23:00:00', 'en cours de livraison', 6025, 1, 1),
(83, 200, 1, 4, 0, 'de125fdb', '2016-12-12 23:00:00', 'livré', 6025, 1, 1),
(84, 300, 2, 4, 0, 'gf361ghf3', '2016-10-02 22:00:00', 'en attente de paiement', 9056, 1, 1),
(85, 300, 2, 4, 0, 'gf361ghf3', '2016-10-05 22:00:00', 'en cours de livraison', 9056, 1, 1),
(86, 300, 2, 4, 0, 'gf361ghf3', '2016-10-09 22:00:00', 'livré', 9056, 1, 1),
(87, 200, 2, 5, 0, 'fdhg2hgf6', '2016-12-03 23:00:00', 'en attente de paiement', 7258, 1, 1),
(88, 200, 2, 5, 0, 'gf361ghf3', '2016-12-08 23:00:00', 'en cours de livraison', 7258, 1, 1),
(89, 200, 2, 5, 0, 'gf361ghf3', '2016-12-12 23:00:00', 'livré', 7258, 1, 1),
(90, 150, 3, 6, 0, 'vc32vcd9', '2016-09-14 22:00:00', 'en attente de paiement', 5281, 1, 1),
(91, 150, 3, 6, 0, 'vc32vcd9', '2016-09-19 22:00:00', 'en cours de livraison', 5281, 1, 1),
(92, 150, 3, 6, 0, 'vc32vcd9', '2016-09-22 22:00:00', 'livré', 5281, 1, 1),
(93, 250, 4, 9, 0, 'gf58df9', '2016-10-14 22:00:00', 'en attente de paiement', 5821, 1, 1),
(94, 250, 4, 9, 0, 'gf58df9', '2016-10-18 22:00:00', 'en cours de livraison', 5821, 1, 1),
(95, 250, 4, 9, 0, 'gf58df9', '2016-10-22 22:00:00', 'livré', 5821, 1, 1),
(96, 220, 5, 12, 0, 'hgf5hg9', '2016-09-19 13:40:17', 'en attente de paiement', 6325, 1, 1),
(97, 220, 5, 12, 0, 'hgf5hg9', '2016-09-23 13:40:17', 'en cours de livraison', 6325, 1, 1),
(98, 0, 5, 12, 0, 'hgf5hg9', '2016-09-27 13:40:17', 'livré', 6325, 1, 1),
(99, 100, 3, 7, 0, 'df11df8', '2016-11-28 14:40:17', 'en attente de paiement', 3652, 1, 1),
(100, 100, 3, 7, 0, 'df11df8', '2016-12-02 14:40:17', 'en cours de livraison', 3652, 1, 1),
(101, 100, 3, 7, 0, 'df11df8', '2016-12-04 14:40:17', 'livré', 3652, 1, 1),
(102, 1, 9, 4, 0, '9', '2016-12-15 10:43:06', 'en cours de livraison', 35.75, 1, 1),
(103, 5, 9, 20, 0, '9', '2016-12-15 10:52:52', 'en cours de livraison', 290, 1, 1),
(104, 3, 9, 3, 0, '9', '2016-12-15 10:53:30', 'livré', 299.7, 1, 1),
(105, 2, 9, 8, 0, '9', '2016-12-15 10:53:49', 'livré', 12, 1, 1),
(106, 1, 9, 12, 0, '9', '2016-12-16 08:21:54', 'en caddie', 58, 1, 1),
(107, 100, 2, 13, 0, '2-13-16-12JA', '2016-12-13 23:00:00', 'en attente de paiement', 6953, 1, 3),
(108, 100, 2, 13, 0, '2-13-16-12JA', '2016-12-17 23:00:00', 'en cours de livraison', 6953, 1, 2),
(109, 200, 4, 6, 0, '4-6-16-12EDE', '2016-12-13 23:00:00', 'en attente de paiement', 10254, 1, 3),
(110, 200, 4, 6, 0, '4-6-16-12EDE', '2016-12-21 23:00:00', 'en cours de livraison', 10254, 1, 2),
(111, 150, 3, 3, 0, '3-3-16-12FG', '2016-12-07 23:00:00', 'en attente de paiement', 5493, 1, 3),
(112, 150, 3, 3, 0, '3-3-16-12FG', '2016-12-27 23:00:00', 'en cours de livraison', 5493, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `orders_status_history`
--

CREATE TABLE `orders_status_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idcustomer` bigint(20) UNSIGNED NOT NULL,
  `codeorder` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `statusdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('annulée','en caddie','en attente de paiement','en préparartion','en cours de livraison','livré') COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `orders_status_history`
--

INSERT INTO `orders_status_history` (`id`, `idcustomer`, `codeorder`, `statusdate`, `status`) VALUES
(1, 1, NULL, '2016-12-01 10:42:16', 'annulée'),
(2, 1, NULL, '2016-12-01 10:49:18', 'annulée'),
(3, 1, NULL, '2016-12-01 10:49:20', 'annulée'),
(4, 1, NULL, '2016-12-01 10:49:28', 'annulée'),
(5, 1, NULL, '2016-12-01 11:00:50', 'annulée'),
(6, 1, NULL, '2016-12-01 11:00:55', 'annulée'),
(7, 1, NULL, '2016-12-01 11:21:43', 'annulée'),
(8, 1, NULL, '2016-12-01 14:05:00', 'annulée');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `ref` varchar(16) COLLATE utf8_bin NOT NULL,
  `price` float NOT NULL DEFAULT '0',
  `picture` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `idvat` bigint(20) UNSIGNED NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `stock` int(11) DEFAULT '0',
  `stockEntrepot` int(11) NOT NULL,
  `idFournisseur` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `products`
--

INSERT INTO `products` (`id`, `label`, `description`, `ref`, `price`, `picture`, `idvat`, `deleted`, `stock`, `stockEntrepot`, `idFournisseur`) VALUES
(2, 'Table basse en noyer massif', 'Table en bois massif, dimension l 40cm * L 40cm * h 30cm', 'TB1235', 175.55, 'images/fa3.jpg', 3, 1, 92, 50, 1),
(3, 'Table basse en hêtre massif', 'Table en bois massif, dimension l 50cm * L 120cm * h 60cm', 'TB1236', 99.9, 'images/waders.jpg', 3, 0, 151, 60, 1),
(4, 'Table basse en pin massif', 'Table en bois massif, dimension l 50cm * L 120cm * h 60cm', 'TB1237', 35.75, 'images/fa2.jpg', 5, 0, 33, 60, 2),
(5, 'Tabouret en pin', 'Tabouret, dimension diamètre 35cm * h 60cm', 'TB1238', 35.75, 'images/fa3.jpg', 3, 0, 230, 10, 2),
(6, 'Chaise en rotin', 'Fauteuil type colonial, diamètre 80cm * L 120cm * h 60cm', 'TB1239', 75.55, 'images/fa4.jpg', 3, 0, 99, 30, 3),
(7, 'Plateau en bois', 'Plateau rectangulaire 20cm * 40cm', 'TB1240', 19, 'images/fa5.jpg', 3, 0, 4, 20, 3),
(8, 'Vase coloré', 'Vase coloré différentes couleurs, diamètre 20cm * h 30cm', 'TB1241', 19, 'images/fa6.jpg', 3, 0, 9, 10, 4),
(9, 'Bhuda stone', 'Statuette en pierre à l\'effigie d\'un boudha', 'TB1242', 22.15, 'images/fa7.jpg', 3, 0, 4, 50, 4),
(10, 'Set de sous-verres', 'Sous verres rectangulaires 10 pièces 10cm * 10cm', 'TB1243', 1, 'images/fa8.jpg', 3, 1, 7, 20, 5),
(11, 'Verre coloré', 'Set de 6 verres colorés', 'TB1244', 6, 'images/fa.jpg', 3, 0, 20, 100, 5),
(12, 'Table jolie', 'Table jolie Table jolie Table jolieTable jolie Table jolie  Table jolie', 'iuyt58ui', 58, 'images/fa.jpg', 3, 0, 49, 100, 5),
(13, 'jardinniere', 'jardinniere jardinnierejardinniere jardinniere jardinniere ', 'ljl6kl6', 6, 'images/fa3.jpg', 3, 0, 2, 332, 2),
(20, 'Tabouret de glace', 'Ne pas laisser dehors !!!', 'uil15lk', 58, 'images/PZ1.jpg', 1, 0, 50, 30, 4),
(32, 'aezrgzaer', 'zergzerg', 'iuop', 174, 'images/waders.jpg', 1, 0, 200, 100, 3);

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE `stock` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idproduct` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `receiptdate` timestamp NOT NULL,
  `idsupplier` bigint(20) UNSIGNED NOT NULL,
  `orderqty` int(11) NOT NULL,
  `orderdate` timestamp NOT NULL,
  `delay` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `stock`
--

INSERT INTO `stock` (`id`, `idproduct`, `qty`, `receiptdate`, `idsupplier`, `orderqty`, `orderdate`, `delay`) VALUES
(1, 1, 20, '2016-12-22 09:13:13', 1, 50, '2016-12-22 09:13:13', 0),
(2, 2, 9, '2016-12-22 09:13:13', 2, 75, '2016-12-22 09:13:13', 0),
(3, 3, 20, '2016-12-22 11:28:11', 1, 150, '2016-12-22 11:28:11', 0),
(4, 4, 80, '2016-12-22 09:13:13', 2, 100, '2016-12-22 09:13:13', 0),
(5, 5, 10, '2016-12-22 10:52:12', 3, 60, '2016-12-22 10:52:12', 0),
(6, 6, 100, '2016-12-22 09:13:13', 4, 45, '2016-12-22 09:13:13', 0);

-- --------------------------------------------------------

--
-- Structure de la table `supply`
--

CREATE TABLE `supply` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `phone` int(11) NOT NULL,
  `idaddress` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(32) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `supply`
--

INSERT INTO `supply` (`id`, `name`, `phone`, `idaddress`, `email`) VALUES
(1, 'Toto furniture', 652123652, 1, 'toto@gmail.com'),
(2, 'City 4', 654879654, 1, 'city4@gmail.com'),
(3, 'Warehouse', 654878121, 1, 'wh@gmail.com'),
(4, 'Contact form fitness', 654875641, 1, 'cff@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `supplyaddress`
--

CREATE TABLE `supplyaddress` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `num` varchar(16) COLLATE utf8_bin NOT NULL,
  `street` varchar(128) COLLATE utf8_bin NOT NULL,
  `pc` varchar(5) COLLATE utf8_bin NOT NULL,
  `city` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `idsupplier` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `supplyaddress`
--

INSERT INTO `supplyaddress` (`id`, `num`, `street`, `pc`, `city`, `idsupplier`) VALUES
(1, '3ter', 'rue du chemin', '31210', 'City', 1);

-- --------------------------------------------------------

--
-- Structure de la table `utils`
--

CREATE TABLE `utils` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` float NOT NULL,
  `label` varchar(64) COLLATE utf8_bin NOT NULL,
  `startdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enddate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `utils`
--

INSERT INTO `utils` (`id`, `amount`, `label`, `startdate`, `enddate`) VALUES
(1, 10, 'frais de port', '2016-11-30 12:11:09', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `vat`
--

CREATE TABLE `vat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vatcode` int(11) NOT NULL,
  `rate` float NOT NULL,
  `label` varchar(24) COLLATE utf8_bin NOT NULL,
  `startdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enddate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `vat`
--

INSERT INTO `vat` (`id`, `vatcode`, `rate`, `label`, `startdate`, `enddate`) VALUES
(1, 1, 20, 'tva normale', '2016-11-30 11:11:08', NULL),
(2, 2, 10, 'tva intermédiaire', '2016-11-30 11:11:08', NULL),
(3, 3, 5.5, 'tva réduite', '2016-11-30 11:11:08', NULL),
(4, 4, 2.5, 'tva super réduite', '2016-11-30 11:11:08', NULL),
(5, -1, 0, 'exonération tva', '2016-11-30 11:11:08', NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `addresses`
--
ALTER TABLE `addresses`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_addresses_id_customer_from_customers_id` (`idcustomer`);

--
-- Index pour la table `customers`
--
ALTER TABLE `customers`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `cyrapp_users`
--
ALTER TABLE `cyrapp_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C2502824F85E0677` (`username`),
  ADD UNIQUE KEY `UNIQ_C2502824E7927C74` (`email`);

--
-- Index pour la table `cyrcontact_form`
--
ALTER TABLE `cyrcontact_form`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_orders_id_customer_from_customers_id` (`idcustomer`),
  ADD KEY `fk_orders_id_product_from_products_id` (`idproduct`);

--
-- Index pour la table `orders_status_history`
--
ALTER TABLE `orders_status_history`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_orders_sh_id_customer_from_customers_id` (`idcustomer`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_products_id_vat_from_vat_id` (`idvat`);

--
-- Index pour la table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Index pour la table `supply`
--
ALTER TABLE `supply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idadress` (`idaddress`);

--
-- Index pour la table `supplyaddress`
--
ALTER TABLE `supplyaddress`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utils`
--
ALTER TABLE `utils`
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `vat`
--
ALTER TABLE `vat`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT pour la table `cyrapp_users`
--
ALTER TABLE `cyrapp_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT pour la table `cyrcontact_form`
--
ALTER TABLE `cyrcontact_form`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT pour la table `orders_status_history`
--
ALTER TABLE `orders_status_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT pour la table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `supply`
--
ALTER TABLE `supply`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `supplyaddress`
--
ALTER TABLE `supplyaddress`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `utils`
--
ALTER TABLE `utils`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `vat`
--
ALTER TABLE `vat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `fk_addresses_id_customer_from_customers_id` FOREIGN KEY (`idcustomer`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_id_customer_from_customers_id` FOREIGN KEY (`idcustomer`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `fk_orders_id_product_from_products_id` FOREIGN KEY (`idproduct`) REFERENCES `products` (`id`);

--
-- Contraintes pour la table `orders_status_history`
--
ALTER TABLE `orders_status_history`
  ADD CONSTRAINT `fk_orders_sh_id_customer_from_customers_id` FOREIGN KEY (`idcustomer`) REFERENCES `customers` (`id`);

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_id_vat_from_vat_id` FOREIGN KEY (`idvat`) REFERENCES `vat` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
