-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Serveur: localhost:3306
-- Généré le : Ven 17 Août 2012 à 15:33
-- Version du serveur: 5.1.41
-- Version de PHP: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `euradio`
--

-- --------------------------------------------------------

--
-- Structure de la table `Contact`
--

CREATE TABLE IF NOT EXISTS `Contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `Contact`
--


-- --------------------------------------------------------

--
-- Structure de la table `fos_user_group`
--

CREATE TABLE IF NOT EXISTS `fos_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_583D1F3E5E237E06` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `fos_user_group`
--

INSERT INTO `fos_user_group` (`id`, `name`, `roles`) VALUES
(1, 'admin', 'a:6:{i:0;s:10:"ROLE_ADMIN";i:1;s:9:"ROLE_USER";i:2;s:17:"ROLE_SONATA_ADMIN";i:3;s:16:"ROLE_SUPER_ADMIN";i:4;s:22:"ROLE_ALLOWED_TO_SWITCH";i:5;s:6:"SONATA";}'),
(2, 'test', 'a:6:{i:0;s:10:"ROLE_ADMIN";i:1;s:9:"ROLE_USER";i:2;s:17:"ROLE_SONATA_ADMIN";i:3;s:16:"ROLE_SUPER_ADMIN";i:4;s:22:"ROLE_ALLOWED_TO_SWITCH";i:5;s:6:"SONATA";}');

-- --------------------------------------------------------

--
-- Structure de la table `fos_user_user`
--

CREATE TABLE IF NOT EXISTS `fos_user_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `username_canonical` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_canonical` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `firstname` varchar(64) DEFAULT NULL,
  `lastname` varchar(64) DEFAULT NULL,
  `website` varchar(64) DEFAULT NULL,
  `biography` varchar(255) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `locale` varchar(8) DEFAULT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `facebook_uid` varchar(255) DEFAULT NULL,
  `facebook_name` varchar(255) DEFAULT NULL,
  `facebook_data` longtext,
  `twitter_uid` varchar(255) DEFAULT NULL,
  `twitter_name` varchar(255) DEFAULT NULL,
  `twitter_data` longtext,
  `gplus_uid` varchar(255) DEFAULT NULL,
  `gplus_name` varchar(255) DEFAULT NULL,
  `gplus_data` longtext,
  `token` varchar(255) DEFAULT NULL,
  `two_step_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C560D76192FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_C560D761A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `fos_user_user`
--

INSERT INTO `fos_user_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `created_at`, `updated_at`, `date_of_birth`, `firstname`, `lastname`, `website`, `biography`, `gender`, `locale`, `timezone`, `phone`, `facebook_uid`, `facebook_name`, `facebook_data`, `twitter_uid`, `twitter_name`, `twitter_data`, `gplus_uid`, `gplus_name`, `gplus_data`, `token`, `two_step_code`) VALUES
(1, 'koalas', 'koalas', 'npatard@gmail.com', 'npatard@gmail.com', 1, '14jb1fwetgdcgskwg44kwgk80koco0w', '1DQNbslV7fQVbMqQmyHL+CiOxcf+LBT4TObraO1KPh3N50uhHjSY1n1EYZ0Q3S+g/sLo9mLRouJt/Us3ihfmXw==', '2012-08-16 19:50:53', 0, 0, NULL, '4b2fzqxcr604g0oc0w0ckwcc80ksg8sgsg8swo40kogscgkw0s', NULL, 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}', 0, NULL, '2012-08-02 12:35:46', '2012-08-16 19:50:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL),
(2, 'merguezzz', 'merguezzz', 'antonin.jourdan@webcraft-studio.com', 'antonin.jourdan@webcraft-studio.com', 1, 'cfd3h9qj4ug4wkc0wgwsgwk88ggwssk', 'zfgNhEAJEos1D2kOd0P0FoTOrGUG3y/81hrK5F2wxVqEbyGS1i4rz/6PrmbC+9iRFtBMmxf56p6p+R2NE6oerw==', '2012-08-17 15:14:01', 0, 0, NULL, '67hm1p4n6roksowwgg8wogogs8kw40088k8cwc84s4csoks4gs', NULL, 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}', 0, NULL, '2012-08-17 10:58:26', '2012-08-17 15:14:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `fos_user_user_group`
--

CREATE TABLE IF NOT EXISTS `fos_user_user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `IDX_B3C77447A76ED395` (`user_id`),
  KEY `IDX_B3C77447FE54D947` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `fos_user_user_group`
--

INSERT INTO `fos_user_user_group` (`user_id`, `group_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `Mailing`
--

CREATE TABLE IF NOT EXISTS `Mailing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `senderEmail` varchar(255) NOT NULL,
  `senderName` varchar(255) NOT NULL,
  `sendDate` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `totalCount` int(11) NOT NULL,
  `sentCount` int(11) NOT NULL,
  `errorsCount` int(11) NOT NULL,
  `delayedMailing` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `Mailing`
--


-- --------------------------------------------------------

--
-- Structure de la table `media__gallery`
--

CREATE TABLE IF NOT EXISTS `media__gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `context` varchar(255) NOT NULL,
  `default_format` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `media__gallery`
--


-- --------------------------------------------------------

--
-- Structure de la table `media__gallery_media`
--

CREATE TABLE IF NOT EXISTS `media__gallery_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_80D4C5414E7AF8F` (`gallery_id`),
  KEY `IDX_80D4C541EA9FDD75` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `media__gallery_media`
--


-- --------------------------------------------------------

--
-- Structure de la table `media__media`
--

CREATE TABLE IF NOT EXISTS `media__media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `enabled` tinyint(1) NOT NULL,
  `provider_name` varchar(255) NOT NULL,
  `provider_status` int(11) NOT NULL,
  `provider_reference` varchar(255) NOT NULL,
  `provider_metadata` longtext COMMENT '(DC2Type:array)',
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `length` decimal(10,0) DEFAULT NULL,
  `content_type` varchar(64) DEFAULT NULL,
  `content_size` int(11) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `context` varchar(16) DEFAULT NULL,
  `cdn_is_flushable` tinyint(1) DEFAULT NULL,
  `cdn_flush_at` datetime DEFAULT NULL,
  `cdn_status` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `media__media`
--


-- --------------------------------------------------------

--
-- Structure de la table `news__category`
--

CREATE TABLE IF NOT EXISTS `news__category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `news__category`
--

INSERT INTO `news__category` (`id`, `name`, `enabled`, `slug`, `description`, `count`, `created_at`, `updated_at`) VALUES
(1, 'euradio', 1, 'euradio', 'les articles de euradio', 0, '2012-08-02 12:43:07', '2012-08-02 12:43:07');

-- --------------------------------------------------------

--
-- Structure de la table `news__comment`
--

CREATE TABLE IF NOT EXISTS `news__comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A90210404B89032C` (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `news__comment`
--


-- --------------------------------------------------------

--
-- Structure de la table `news__post`
--

CREATE TABLE IF NOT EXISTS `news__post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `abstract` longtext NOT NULL,
  `content` longtext NOT NULL,
  `raw_content` longtext NOT NULL,
  `content_formatter` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `publication_date_start` datetime DEFAULT NULL,
  `comments_enabled` tinyint(1) NOT NULL,
  `comments_close_at` datetime DEFAULT NULL,
  `comments_default_status` int(11) NOT NULL,
  `comments_count` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7D109BC83DA5256D` (`image_id`),
  KEY `IDX_7D109BC8F675F31B` (`author_id`),
  KEY `IDX_7D109BC812469DE2` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `news__post`
--

INSERT INTO `news__post` (`id`, `image_id`, `author_id`, `category_id`, `title`, `abstract`, `content`, `raw_content`, `content_formatter`, `enabled`, `slug`, `publication_date_start`, `comments_enabled`, `comments_close_at`, `comments_default_status`, `comments_count`, `created_at`, `updated_at`) VALUES
(3, NULL, 1, 1, 'La musique classique', 'La musique classique racontée par Patrick Barbier', '<p>Italianiste et historien de la musique, Patrick Barbier est professeur à l''Université Catholique de l''Ouest (l''UCO à Angers) et membre de l''Académie littéraire de Bretagne et des Pays de la Loire. Il a publié, entre autres, une Histoire des Castrats (en 1989), une biographie de Farinelli (1994) et, dernièrement, en 2009, une biographie de Pauline Viardot.</p>\n', 'Italianiste et historien de la musique, Patrick Barbier est professeur à l''Université Catholique de l''Ouest (l''UCO à Angers) et membre de l''Académie littéraire de Bretagne et des Pays de la Loire. Il a publié, entre autres, une Histoire des Castrats (en 1989), une biographie de Farinelli (1994) et, dernièrement, en 2009, une biographie de Pauline Viardot.', 'markdown', 1, 'la-musique-classique', '2012-08-17 15:14:00', 1, NULL, 2, 0, '2012-08-17 15:15:43', '2012-08-17 15:29:37'),
(4, NULL, 2, 1, 'Portez-vous bien', 'Parler de santé, c''est parler de prise en charge', '<p>Parler de santé, c''est parler de prise en charge et de recherche, de politiques publiques et d''engagements citoyens, de soignés et de soignants... et c''est parler de chacun de nous. Une émission destinée à tous, pour connaître ce qui se fait au plan local, et au plan européen.</p>\n', 'Parler de santé, c''est parler de prise en charge et de recherche, de politiques publiques et d''engagements citoyens, de soignés et de soignants... et c''est parler de chacun de nous. Une émission destinée à tous, pour connaître ce qui se fait au plan local, et au plan européen.', 'markdown', 1, 'portez-vous-bien', '2012-08-17 15:19:00', 1, NULL, 1, 0, '2012-08-17 15:20:12', '2012-08-17 15:20:12');

-- --------------------------------------------------------

--
-- Structure de la table `news__post_tag`
--

CREATE TABLE IF NOT EXISTS `news__post_tag` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `IDX_682B20514B89032C` (`post_id`),
  KEY `IDX_682B2051BAD26311` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `news__post_tag`
--


-- --------------------------------------------------------

--
-- Structure de la table `news__tag`
--

CREATE TABLE IF NOT EXISTS `news__tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `news__tag`
--

INSERT INTO `news__tag` (`id`, `name`, `enabled`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'test', 1, 'test', '2012-08-07 12:49:48', '2012-08-07 12:49:48'),
(2, 'Musique classique', 1, 'musique-classique', '2012-08-17 15:15:28', '2012-08-17 15:15:28'),
(3, 'Santé', 1, 'sant', '2012-08-17 15:19:55', '2012-08-17 15:19:55');

-- --------------------------------------------------------

--
-- Structure de la table `notification__message`
--

CREATE TABLE IF NOT EXISTS `notification__message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `state` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `state` (`state`),
  KEY `createdAt` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `notification__message`
--


-- --------------------------------------------------------

--
-- Structure de la table `page__bloc`
--

CREATE TABLE IF NOT EXISTS `page__bloc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `type` varchar(64) NOT NULL,
  `settings` longtext NOT NULL COMMENT '(DC2Type:array)',
  `enabled` tinyint(1) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FCDC1A97727ACA70` (`parent_id`),
  KEY `IDX_FCDC1A97C4663E4` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Contenu de la table `page__bloc`
--

INSERT INTO `page__bloc` (`id`, `parent_id`, `page_id`, `type`, `settings`, `enabled`, `position`, `created_at`, `updated_at`) VALUES
(12, NULL, 85, 'sonata.page.block.container', 'a:3:{s:4:"name";s:5:"title";s:6:"layout";s:25:"{{ CONTENT }} header left";s:11:"orientation";s:5:"block";}', 1, 1, '2012-08-17 11:08:42', '2012-08-17 15:22:06'),
(13, NULL, 85, 'sonata.page.block.container', 'a:3:{s:4:"name";s:6:"header";s:6:"layout";s:26:"{{ CONTENT }} header right";s:11:"orientation";s:5:"block";}', 1, 1, '2012-08-17 11:08:42', '2012-08-17 15:22:27'),
(14, NULL, 85, 'sonata.page.block.container', 'a:3:{s:4:"name";s:11:"content_top";s:6:"layout";s:25:"{{ CONTENT }} content top";s:11:"orientation";s:5:"block";}', 1, 1, '2012-08-17 11:08:42', '2012-08-17 15:23:58'),
(15, NULL, 69, 'sonata.page.block.container', 'a:3:{s:4:"name";s:11:"content_top";s:6:"layout";s:25:"{{ CONTENT }} top content";s:11:"orientation";s:5:"block";}', 1, 1, '2012-08-17 11:08:42', '2012-08-17 15:27:28'),
(16, NULL, 69, 'sonata.page.block.container', 'a:3:{s:4:"name";s:14:"content_bottom";s:6:"layout";s:29:"{{ CONTENT }}  bottom content";s:11:"orientation";s:5:"block";}', 1, 1, '2012-08-17 11:08:42', '2012-08-17 15:27:33'),
(17, NULL, 85, 'sonata.page.block.container', 'a:3:{s:4:"name";s:14:"content_bottom";s:6:"layout";s:28:"{{ CONTENT }} content bottom";s:11:"orientation";s:5:"block";}', 1, 1, '2012-08-17 11:08:42', '2012-08-17 15:28:04'),
(18, NULL, 85, 'sonata.page.block.container', 'a:3:{s:4:"name";s:6:"footer";s:6:"layout";s:25:"{{ CONTENT }} footer left";s:11:"orientation";s:5:"block";}', 1, 1, '2012-08-17 11:08:42', '2012-08-17 15:24:34'),
(19, NULL, 30, 'sonata.page.block.container', 'a:1:{s:4:"name";s:11:"content_top";}', 1, 1, '2012-08-17 11:08:53', '2012-08-17 11:08:53'),
(20, NULL, 30, 'sonata.page.block.container', 'a:3:{s:4:"name";s:14:"content_bottom";s:6:"layout";s:20:"{{ CONTENT }} youhou";s:11:"orientation";s:5:"block";}', 1, 1, '2012-08-17 11:08:53', '2012-08-17 15:25:40'),
(21, NULL, 71, 'sonata.page.block.container', 'a:1:{s:4:"name";s:11:"content_top";}', 1, 1, '2012-08-17 15:28:41', '2012-08-17 15:28:41'),
(22, NULL, 71, 'sonata.page.block.container', 'a:1:{s:4:"name";s:14:"content_bottom";}', 1, 1, '2012-08-17 15:28:41', '2012-08-17 15:28:41'),
(23, NULL, 82, 'sonata.page.block.container', 'a:1:{s:4:"name";s:11:"content_top";}', 1, 1, '2012-08-17 15:29:51', '2012-08-17 15:29:51'),
(24, NULL, 82, 'sonata.page.block.container', 'a:1:{s:4:"name";s:14:"content_bottom";}', 1, 1, '2012-08-17 15:29:51', '2012-08-17 15:29:51');

-- --------------------------------------------------------

--
-- Structure de la table `page__page`
--

CREATE TABLE IF NOT EXISTS `page__page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `route_name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `decorate` tinyint(1) NOT NULL,
  `edited` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` longtext,
  `url` longtext,
  `custom_url` longtext,
  `request_method` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `javascript` longtext,
  `stylesheet` longtext,
  `raw_headers` longtext,
  `template` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2FAE39EDF6BD1646` (`site_id`),
  KEY `IDX_2FAE39ED727ACA70` (`parent_id`),
  KEY `IDX_2FAE39ED158E0B66` (`target_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=86 ;

--
-- Contenu de la table `page__page`
--

INSERT INTO `page__page` (`id`, `site_id`, `parent_id`, `target_id`, `route_name`, `position`, `enabled`, `decorate`, `edited`, `name`, `slug`, `url`, `custom_url`, `request_method`, `title`, `meta_keyword`, `meta_description`, `javascript`, `stylesheet`, `raw_headers`, `template`, `created_at`, `updated_at`) VALUES
(2, 1, NULL, NULL, 'acme_demo_secured_hello', 1, 1, 1, 0, 'acme_demo_secured_hello', 'demo-secured-hello', '/demo/secured/hello', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:03', '2012-08-13 18:34:44'),
(3, 1, NULL, NULL, 'sonata_media_gallery_index', 1, 1, 1, 0, 'sonata_media_gallery_index', 'media-gallery', '/media/gallery/', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:03', '2012-08-13 18:34:44'),
(4, 1, NULL, NULL, 'sonata_media_gallery_view', 1, 1, 1, 0, 'sonata_media_gallery_view', 'media-gallery-view-id', '/media/gallery/view/{id}', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:03', '2012-08-13 18:34:44'),
(5, 1, NULL, NULL, 'sonata_media_view', 1, 1, 1, 0, 'sonata_media_view', 'media-view-id-format', '/media/view/{id}/{format}', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:03', '2012-08-13 18:34:44'),
(6, 1, NULL, NULL, 'sonata_media_download', 1, 1, 1, 0, 'sonata_media_download', 'media-download-id-format', '/media/download/{id}/{format}', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:03', '2012-08-13 18:34:45'),
(7, 1, NULL, NULL, 'fos_user_security_login', 1, 1, 1, 0, 'fos_user_security_login', 'login', '/login', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:04', '2012-08-13 18:34:45'),
(8, 1, NULL, NULL, 'fos_user_security_check', 1, 1, 1, 0, 'fos_user_security_check', 'login-check', '/login_check', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:04', '2012-08-13 18:34:45'),
(9, 1, NULL, NULL, 'fos_user_security_logout', 1, 1, 1, 0, 'fos_user_security_logout', 'logout', '/logout', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:04', '2012-08-13 18:34:45'),
(10, 1, NULL, NULL, 'sonata_user_profile_show', 1, 1, 1, 0, 'sonata_user_profile_show', 'profile', '/profile/', NULL, 'GET', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:04', '2012-08-13 18:34:45'),
(11, 1, NULL, NULL, 'sonata_user_profile_edit_authentication', 1, 1, 1, 0, 'sonata_user_profile_edit_authentication', 'profile-edit-authentication', '/profile/edit-authentication', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:04', '2012-08-13 18:34:45'),
(12, 1, NULL, NULL, 'sonata_user_profile_edit', 1, 1, 1, 0, 'sonata_user_profile_edit', 'profile-edit-profile', '/profile/edit-profile', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:04', '2012-08-13 18:34:46'),
(13, 1, NULL, NULL, 'fos_user_registration_register', 1, 1, 1, 0, 'fos_user_registration_register', 'register', '/register/', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:04', '2012-08-13 18:34:46'),
(14, 1, NULL, NULL, 'fos_user_registration_check_email', 1, 1, 1, 0, 'fos_user_registration_check_email', 'register-check-email', '/register/check-email', NULL, 'GET', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:04', '2012-08-13 18:34:46'),
(15, 1, NULL, NULL, 'fos_user_registration_confirm', 1, 1, 1, 0, 'fos_user_registration_confirm', 'register-confirm-token', '/register/confirm/{token}', NULL, 'GET', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:04', '2012-08-13 18:34:46'),
(16, 1, NULL, NULL, 'fos_user_registration_confirmed', 1, 1, 1, 0, 'fos_user_registration_confirmed', 'register-confirmed', '/register/confirmed', NULL, 'GET', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:04', '2012-08-13 18:34:46'),
(17, 1, NULL, NULL, 'fos_user_resetting_request', 1, 1, 1, 0, 'fos_user_resetting_request', 'resetting-request', '/resetting/request', NULL, 'GET', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:04', '2012-08-13 18:34:46'),
(18, 1, NULL, NULL, 'fos_user_resetting_send_email', 1, 1, 1, 0, 'fos_user_resetting_send_email', 'resetting-send-email', '/resetting/send-email', NULL, 'POST', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:04', '2012-08-13 18:34:47'),
(19, 1, NULL, NULL, 'fos_user_resetting_check_email', 1, 1, 1, 0, 'fos_user_resetting_check_email', 'resetting-check-email', '/resetting/check-email', NULL, 'GET', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:04', '2012-08-13 18:34:47'),
(20, 1, NULL, NULL, 'fos_user_resetting_reset', 1, 1, 1, 0, 'fos_user_resetting_reset', 'resetting-reset-token', '/resetting/reset/{token}', NULL, 'GET|POST', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:05', '2012-08-13 18:34:47'),
(21, 1, NULL, NULL, 'fos_user_change_password', 1, 1, 1, 0, 'fos_user_change_password', 'profile-change-password', '/profile/change-password', NULL, 'GET|POST', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:05', '2012-08-13 18:34:47'),
(22, 1, NULL, NULL, 'fos_user_group_list', 1, 1, 1, 0, 'fos_user_group_list', 'group-list', '/group/list', NULL, 'GET', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:05', '2012-08-13 18:34:47'),
(23, 1, NULL, NULL, 'fos_user_group_new', 1, 1, 1, 0, 'fos_user_group_new', 'group-new', '/group/new', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:05', '2012-08-13 18:34:48'),
(24, 1, NULL, NULL, 'fos_user_group_show', 1, 1, 1, 0, 'fos_user_group_show', 'group-groupname', '/group/{groupname}', NULL, 'GET', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:05', '2012-08-13 18:34:48'),
(25, 1, NULL, NULL, 'fos_user_group_edit', 1, 1, 1, 0, 'fos_user_group_edit', 'group-groupname-edit', '/group/{groupname}/edit', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:05', '2012-08-13 18:34:48'),
(26, 1, NULL, NULL, 'fos_user_group_delete', 1, 1, 1, 0, 'fos_user_group_delete', 'group-groupname-delete', '/group/{groupname}/delete', NULL, 'GET', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:05', '2012-08-13 18:34:48'),
(27, 1, NULL, NULL, 'sonata_page_exceptions_list', 1, 1, 1, 0, 'sonata_page_exceptions_list', 'exceptions-list', '/exceptions/list', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:05', '2012-08-13 18:34:48'),
(28, 1, NULL, NULL, 'sonata_page_exceptions_edit', 1, 1, 1, 0, 'sonata_page_exceptions_edit', 'exceptions-edit-code', '/exceptions/edit/{code}', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:05', '2012-08-13 18:34:49'),
(29, 1, NULL, NULL, 'sonata_page_cache_esi', 1, 1, 1, 0, 'sonata_page_cache_esi', 'sonata-page-cache-esi-manager-page-id-block-id', '/sonata/page/cache/esi/{manager}/{page_id}/{block_id}', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:05', '2012-08-13 18:34:49'),
(30, 1, NULL, NULL, 'catchAll', 1, 1, 1, 1, 'catchAll', 'path', '/{path}', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:06', '2012-08-17 15:24:40'),
(31, 1, NULL, NULL, '_page_internal_error_not_found', 1, 1, 0, 0, '_page_internal_error_not_found', 'n-a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:06', '2012-08-13 18:34:49'),
(32, 1, NULL, NULL, '_page_internal_error_fatal', 1, 1, 0, 0, '_page_internal_error_fatal', 'n-a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:33:06', '2012-08-13 18:34:49'),
(64, 1, NULL, NULL, 'sonata_news_add_comment', 1, 1, 1, 0, 'sonata_news_add_comment', 'news-add-comment-id', '/news/add-comment/{id}', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:40:24', '2012-08-13 18:40:45'),
(65, 1, NULL, NULL, 'sonata_news_archive_monthly', 1, 1, 1, 0, 'sonata_news_archive_monthly', 'news-archive-year-month-format', '/news/archive/{year}/{month}.{_format}', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:40:24', '2012-08-13 18:40:46'),
(66, 1, NULL, NULL, 'sonata_news_tag', 1, 1, 1, 0, 'sonata_news_tag', 'news-tag-tag-format', '/news/tag/{tag}.{_format}', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:40:24', '2012-08-13 18:40:46'),
(67, 1, NULL, NULL, 'sonata_news_category', 1, 1, 1, 0, 'sonata_news_category', 'news-category-category-format', '/news/category/{category}.{_format}', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:40:24', '2012-08-13 18:40:46'),
(68, 1, NULL, NULL, 'sonata_news_archive_yearly', 1, 1, 1, 0, 'sonata_news_archive_yearly', 'news-archive-year-format', '/news/archive/{year}.{_format}', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:40:24', '2012-08-13 18:40:46'),
(69, 1, NULL, NULL, 'sonata_news_archive', 1, 1, 1, 0, 'sonata_news_archive', 'news-archive-format', '/news/archive.{_format}', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:40:24', '2012-08-17 15:29:10'),
(70, 1, NULL, NULL, 'sonata_news_comment_moderation', 1, 1, 1, 0, 'sonata_news_comment_moderation', 'news-comment-moderation-commentid-hash-status', '/news/comment/moderation/{commentId}/{hash}/{status}', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:40:24', '2012-08-13 18:40:47'),
(71, 1, NULL, NULL, 'sonata_news_view', 1, 1, 1, 0, 'sonata_news_view', 'news-permalink-format', '/news/{permalink}.{_format}', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:40:24', '2012-08-13 18:40:47'),
(72, 1, NULL, NULL, 'sonata_news_home', 1, 1, 1, 0, 'sonata_news_home', 'news', '/news/', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-13 18:40:25', '2012-08-13 18:40:47'),
(82, 1, NULL, NULL, 'appsonata_view_blog', 1, 1, 1, 0, 'appsonata_view_blog', 'blog', '/blog/blog', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-15 13:18:43', '2012-08-15 16:39:00'),
(85, 1, NULL, NULL, '_page_internal_global', 1, 1, 0, 1, 'Internal Page : global', 'n-a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2012-08-17 11:08:42', '2012-08-17 11:08:42');

-- --------------------------------------------------------

--
-- Structure de la table `page__site`
--

CREATE TABLE IF NOT EXISTS `page__site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enabled` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `relative_path` varchar(255) DEFAULT NULL,
  `host` varchar(255) NOT NULL,
  `enabled_from` datetime NOT NULL,
  `enabled_to` datetime NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `locale` varchar(6) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `page__site`
--

INSERT INTO `page__site` (`id`, `enabled`, `name`, `relative_path`, `host`, `enabled_from`, `enabled_to`, `is_default`, `created_at`, `updated_at`, `locale`, `title`, `meta_keywords`, `meta_description`) VALUES
(1, 1, 'Euradio', NULL, 'euradio.webcraft-studio.com', '2011-01-01 00:00:00', '2017-01-01 00:00:00', 1, '2012-08-07 12:48:37', '2012-08-17 11:08:10', 'fre-FR', 'EuradioN@ntes', 'meta, keyword', 'Euradio Nantes meta description');

-- --------------------------------------------------------

--
-- Structure de la table `page__snapshot`
--

CREATE TABLE IF NOT EXISTS `page__snapshot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `route_name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `decorate` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` longtext,
  `parent_id` int(11) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `content` longtext,
  `publication_date_start` datetime DEFAULT NULL,
  `publication_date_end` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3963EF9AF6BD1646` (`site_id`),
  KEY `IDX_3963EF9AC4663E4` (`page_id`),
  KEY `enabled` (`enabled`),
  KEY `publication_enabled` (`publication_date_start`,`publication_date_end`,`enabled`),
  KEY `route_name` (`route_name`),
  KEY `publication_route` (`publication_date_start`,`publication_date_end`,`route_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=567 ;

--
-- Contenu de la table `page__snapshot`
--

INSERT INTO `page__snapshot` (`id`, `site_id`, `page_id`, `route_name`, `position`, `enabled`, `decorate`, `name`, `url`, `parent_id`, `target_id`, `content`, `publication_date_start`, `publication_date_end`, `created_at`, `updated_at`) VALUES
(2, 1, 2, 'acme_demo_secured_hello', 1, 1, 1, 'acme_demo_secured_hello', '/demo/secured/hello', NULL, NULL, '{"id":2,"name":"acme_demo_secured_hello","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875583","slug":"demo-secured-hello","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:44', '2012-08-13 18:40:39', '2012-08-13 18:34:44', '2012-08-13 18:34:44'),
(3, 1, 3, 'sonata_media_gallery_index', 1, 1, 1, 'sonata_media_gallery_index', '/media/gallery/', NULL, NULL, '{"id":3,"name":"sonata_media_gallery_index","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875583","slug":"media-gallery","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:44', '2012-08-13 18:40:39', '2012-08-13 18:34:44', '2012-08-13 18:34:44'),
(4, 1, 4, 'sonata_media_gallery_view', 1, 1, 1, 'sonata_media_gallery_view', '/media/gallery/view/{id}', NULL, NULL, '{"id":4,"name":"sonata_media_gallery_view","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875583","slug":"media-gallery-view-id","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:44', '2012-08-13 18:40:40', '2012-08-13 18:34:44', '2012-08-13 18:34:44'),
(5, 1, 5, 'sonata_media_view', 1, 1, 1, 'sonata_media_view', '/media/view/{id}/{format}', NULL, NULL, '{"id":5,"name":"sonata_media_view","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875583","slug":"media-view-id-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:44', '2012-08-13 18:40:40', '2012-08-13 18:34:44', '2012-08-13 18:34:44'),
(6, 1, 6, 'sonata_media_download', 1, 1, 1, 'sonata_media_download', '/media/download/{id}/{format}', NULL, NULL, '{"id":6,"name":"sonata_media_download","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875583","slug":"media-download-id-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:45', '2012-08-13 18:40:40', '2012-08-13 18:34:45', '2012-08-13 18:34:45'),
(7, 1, 7, 'fos_user_security_login', 1, 1, 1, 'fos_user_security_login', '/login', NULL, NULL, '{"id":7,"name":"fos_user_security_login","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875584","slug":"login","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:45', '2012-08-13 18:40:40', '2012-08-13 18:34:45', '2012-08-13 18:34:45'),
(8, 1, 8, 'fos_user_security_check', 1, 1, 1, 'fos_user_security_check', '/login_check', NULL, NULL, '{"id":8,"name":"fos_user_security_check","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875584","slug":"login-check","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:45', '2012-08-13 18:40:40', '2012-08-13 18:34:45', '2012-08-13 18:34:45'),
(9, 1, 9, 'fos_user_security_logout', 1, 1, 1, 'fos_user_security_logout', '/logout', NULL, NULL, '{"id":9,"name":"fos_user_security_logout","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875584","slug":"logout","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:45', '2012-08-13 18:40:41', '2012-08-13 18:34:45', '2012-08-13 18:34:45'),
(10, 1, 10, 'sonata_user_profile_show', 1, 1, 1, 'sonata_user_profile_show', '/profile/', NULL, NULL, '{"id":10,"name":"sonata_user_profile_show","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875584","slug":"profile","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:45', '2012-08-13 18:40:41', '2012-08-13 18:34:45', '2012-08-13 18:34:45'),
(11, 1, 11, 'sonata_user_profile_edit_authentication', 1, 1, 1, 'sonata_user_profile_edit_authentication', '/profile/edit-authentication', NULL, NULL, '{"id":11,"name":"sonata_user_profile_edit_authentication","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875584","slug":"profile-edit-authentication","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:46', '2012-08-13 18:40:41', '2012-08-13 18:34:45', '2012-08-13 18:34:46'),
(12, 1, 12, 'sonata_user_profile_edit', 1, 1, 1, 'sonata_user_profile_edit', '/profile/edit-profile', NULL, NULL, '{"id":12,"name":"sonata_user_profile_edit","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875584","slug":"profile-edit-profile","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:46', '2012-08-13 18:40:41', '2012-08-13 18:34:46', '2012-08-13 18:34:46'),
(13, 1, 13, 'fos_user_registration_register', 1, 1, 1, 'fos_user_registration_register', '/register/', NULL, NULL, '{"id":13,"name":"fos_user_registration_register","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875584","slug":"register","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:46', '2012-08-13 18:40:41', '2012-08-13 18:34:46', '2012-08-13 18:34:46'),
(14, 1, 14, 'fos_user_registration_check_email', 1, 1, 1, 'fos_user_registration_check_email', '/register/check-email', NULL, NULL, '{"id":14,"name":"fos_user_registration_check_email","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875584","slug":"register-check-email","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:46', '2012-08-13 18:40:42', '2012-08-13 18:34:46', '2012-08-13 18:34:46'),
(15, 1, 15, 'fos_user_registration_confirm', 1, 1, 1, 'fos_user_registration_confirm', '/register/confirm/{token}', NULL, NULL, '{"id":15,"name":"fos_user_registration_confirm","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875584","slug":"register-confirm-token","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:46', '2012-08-13 18:40:42', '2012-08-13 18:34:46', '2012-08-13 18:34:46'),
(16, 1, 16, 'fos_user_registration_confirmed', 1, 1, 1, 'fos_user_registration_confirmed', '/register/confirmed', NULL, NULL, '{"id":16,"name":"fos_user_registration_confirmed","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875584","slug":"register-confirmed","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:46', '2012-08-13 18:40:42', '2012-08-13 18:34:46', '2012-08-13 18:34:46'),
(17, 1, 17, 'fos_user_resetting_request', 1, 1, 1, 'fos_user_resetting_request', '/resetting/request', NULL, NULL, '{"id":17,"name":"fos_user_resetting_request","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875584","slug":"resetting-request","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:47', '2012-08-13 18:40:42', '2012-08-13 18:34:46', '2012-08-13 18:34:47'),
(18, 1, 18, 'fos_user_resetting_send_email', 1, 1, 1, 'fos_user_resetting_send_email', '/resetting/send-email', NULL, NULL, '{"id":18,"name":"fos_user_resetting_send_email","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"POST","created_at":"1344875584","updated_at":"1344875584","slug":"resetting-send-email","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:47', '2012-08-13 18:40:42', '2012-08-13 18:34:47', '2012-08-13 18:34:47'),
(19, 1, 19, 'fos_user_resetting_check_email', 1, 1, 1, 'fos_user_resetting_check_email', '/resetting/check-email', NULL, NULL, '{"id":19,"name":"fos_user_resetting_check_email","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875584","slug":"resetting-check-email","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:47', '2012-08-13 18:40:43', '2012-08-13 18:34:47', '2012-08-13 18:34:47'),
(20, 1, 20, 'fos_user_resetting_reset', 1, 1, 1, 'fos_user_resetting_reset', '/resetting/reset/{token}', NULL, NULL, '{"id":20,"name":"fos_user_resetting_reset","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST","created_at":"1344875585","updated_at":"1344875585","slug":"resetting-reset-token","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:47', '2012-08-13 18:40:43', '2012-08-13 18:34:47', '2012-08-13 18:34:47'),
(21, 1, 21, 'fos_user_change_password', 1, 1, 1, 'fos_user_change_password', '/profile/change-password', NULL, NULL, '{"id":21,"name":"fos_user_change_password","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST","created_at":"1344875585","updated_at":"1344875585","slug":"profile-change-password","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:47', '2012-08-13 18:40:43', '2012-08-13 18:34:47', '2012-08-13 18:34:47'),
(22, 1, 22, 'fos_user_group_list', 1, 1, 1, 'fos_user_group_list', '/group/list', NULL, NULL, '{"id":22,"name":"fos_user_group_list","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875585","updated_at":"1344875585","slug":"group-list","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:47', '2012-08-13 18:40:43', '2012-08-13 18:34:47', '2012-08-13 18:34:48'),
(23, 1, 23, 'fos_user_group_new', 1, 1, 1, 'fos_user_group_new', '/group/new', NULL, NULL, '{"id":23,"name":"fos_user_group_new","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875585","slug":"group-new","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:48', '2012-08-13 18:40:43', '2012-08-13 18:34:48', '2012-08-13 18:34:48'),
(24, 1, 24, 'fos_user_group_show', 1, 1, 1, 'fos_user_group_show', '/group/{groupname}', NULL, NULL, '{"id":24,"name":"fos_user_group_show","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875585","updated_at":"1344875585","slug":"group-groupname","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:48', '2012-08-13 18:40:44', '2012-08-13 18:34:48', '2012-08-13 18:34:48'),
(25, 1, 25, 'fos_user_group_edit', 1, 1, 1, 'fos_user_group_edit', '/group/{groupname}/edit', NULL, NULL, '{"id":25,"name":"fos_user_group_edit","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875585","slug":"group-groupname-edit","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:48', '2012-08-13 18:40:44', '2012-08-13 18:34:48', '2012-08-13 18:34:48'),
(26, 1, 26, 'fos_user_group_delete', 1, 1, 1, 'fos_user_group_delete', '/group/{groupname}/delete', NULL, NULL, '{"id":26,"name":"fos_user_group_delete","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875585","updated_at":"1344875585","slug":"group-groupname-delete","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:48', '2012-08-13 18:40:44', '2012-08-13 18:34:48', '2012-08-13 18:34:48'),
(27, 1, 27, 'sonata_page_exceptions_list', 1, 1, 1, 'sonata_page_exceptions_list', '/exceptions/list', NULL, NULL, '{"id":27,"name":"sonata_page_exceptions_list","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875585","slug":"exceptions-list","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:49', '2012-08-13 18:40:44', '2012-08-13 18:34:48', '2012-08-13 18:34:49'),
(28, 1, 28, 'sonata_page_exceptions_edit', 1, 1, 1, 'sonata_page_exceptions_edit', '/exceptions/edit/{code}', NULL, NULL, '{"id":28,"name":"sonata_page_exceptions_edit","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875585","slug":"exceptions-edit-code","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:49', '2012-08-13 18:40:44', '2012-08-13 18:34:49', '2012-08-13 18:34:49'),
(29, 1, 29, 'sonata_page_cache_esi', 1, 1, 1, 'sonata_page_cache_esi', '/sonata/page/cache/esi/{manager}/{page_id}/{block_id}', NULL, NULL, '{"id":29,"name":"sonata_page_cache_esi","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875585","slug":"sonata-page-cache-esi-manager-page-id-block-id","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:49', '2012-08-13 18:40:45', '2012-08-13 18:34:49', '2012-08-13 18:34:49'),
(30, 1, 30, 'catchAll', 1, 1, 1, 'catchAll', '/{path}', NULL, NULL, '{"id":30,"name":"catchAll","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875586","updated_at":"1344875586","slug":"path","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:49', '2012-08-13 18:40:45', '2012-08-13 18:34:49', '2012-08-13 18:34:49'),
(31, 1, 31, '_page_internal_error_not_found', 1, 1, 0, '_page_internal_error_not_found', NULL, NULL, NULL, '{"id":31,"name":"_page_internal_error_not_found","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":null,"created_at":"1344875586","updated_at":"1344875586","slug":"n-a","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:49', '2012-08-13 18:40:45', '2012-08-13 18:34:49', '2012-08-13 18:34:49'),
(32, 1, 32, '_page_internal_error_fatal', 1, 1, 0, '_page_internal_error_fatal', NULL, NULL, NULL, '{"id":32,"name":"_page_internal_error_fatal","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":null,"created_at":"1344875586","updated_at":"1344875586","slug":"n-a","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:34:50', '2012-08-13 18:40:45', '2012-08-13 18:34:49', '2012-08-13 18:34:50'),
(65, 1, 2, 'acme_demo_secured_hello', 1, 1, 1, 'acme_demo_secured_hello', '/demo/secured/hello', NULL, NULL, '{"id":2,"name":"acme_demo_secured_hello","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"demo-secured-hello","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:39', '2012-08-15 15:59:46', '2012-08-13 18:40:39', '2012-08-13 18:40:39'),
(66, 1, 3, 'sonata_media_gallery_index', 1, 1, 1, 'sonata_media_gallery_index', '/media/gallery/', NULL, NULL, '{"id":3,"name":"sonata_media_gallery_index","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"media-gallery","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:39', '2012-08-15 15:59:46', '2012-08-13 18:40:39', '2012-08-13 18:40:39'),
(67, 1, 4, 'sonata_media_gallery_view', 1, 1, 1, 'sonata_media_gallery_view', '/media/gallery/view/{id}', NULL, NULL, '{"id":4,"name":"sonata_media_gallery_view","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"media-gallery-view-id","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:40', '2012-08-15 15:59:46', '2012-08-13 18:40:40', '2012-08-13 18:40:40'),
(68, 1, 5, 'sonata_media_view', 1, 1, 1, 'sonata_media_view', '/media/view/{id}/{format}', NULL, NULL, '{"id":5,"name":"sonata_media_view","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"media-view-id-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:40', '2012-08-15 15:59:46', '2012-08-13 18:40:40', '2012-08-13 18:40:40'),
(69, 1, 6, 'sonata_media_download', 1, 1, 1, 'sonata_media_download', '/media/download/{id}/{format}', NULL, NULL, '{"id":6,"name":"sonata_media_download","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875685","slug":"media-download-id-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:40', '2012-08-15 15:59:47', '2012-08-13 18:40:40', '2012-08-13 18:40:40'),
(70, 1, 7, 'fos_user_security_login', 1, 1, 1, 'fos_user_security_login', '/login', NULL, NULL, '{"id":7,"name":"fos_user_security_login","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"login","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:40', '2012-08-15 15:59:47', '2012-08-13 18:40:40', '2012-08-13 18:40:40'),
(71, 1, 8, 'fos_user_security_check', 1, 1, 1, 'fos_user_security_check', '/login_check', NULL, NULL, '{"id":8,"name":"fos_user_security_check","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"login-check","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:40', '2012-08-15 15:59:47', '2012-08-13 18:40:40', '2012-08-13 18:40:40'),
(72, 1, 9, 'fos_user_security_logout', 1, 1, 1, 'fos_user_security_logout', '/logout', NULL, NULL, '{"id":9,"name":"fos_user_security_logout","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"logout","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:41', '2012-08-15 15:59:47', '2012-08-13 18:40:41', '2012-08-13 18:40:41'),
(73, 1, 10, 'sonata_user_profile_show', 1, 1, 1, 'sonata_user_profile_show', '/profile/', NULL, NULL, '{"id":10,"name":"sonata_user_profile_show","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875685","slug":"profile","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:41', '2012-08-15 15:59:48', '2012-08-13 18:40:41', '2012-08-13 18:40:41'),
(74, 1, 11, 'sonata_user_profile_edit_authentication', 1, 1, 1, 'sonata_user_profile_edit_authentication', '/profile/edit-authentication', NULL, NULL, '{"id":11,"name":"sonata_user_profile_edit_authentication","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"profile-edit-authentication","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:41', '2012-08-15 15:59:48', '2012-08-13 18:40:41', '2012-08-13 18:40:41'),
(75, 1, 12, 'sonata_user_profile_edit', 1, 1, 1, 'sonata_user_profile_edit', '/profile/edit-profile', NULL, NULL, '{"id":12,"name":"sonata_user_profile_edit","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875686","slug":"profile-edit-profile","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:41', '2012-08-15 15:59:48', '2012-08-13 18:40:41', '2012-08-13 18:40:41'),
(76, 1, 13, 'fos_user_registration_register', 1, 1, 1, 'fos_user_registration_register', '/register/', NULL, NULL, '{"id":13,"name":"fos_user_registration_register","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875686","slug":"register","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:41', '2012-08-15 15:59:48', '2012-08-13 18:40:41', '2012-08-13 18:40:41'),
(77, 1, 14, 'fos_user_registration_check_email', 1, 1, 1, 'fos_user_registration_check_email', '/register/check-email', NULL, NULL, '{"id":14,"name":"fos_user_registration_check_email","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"register-check-email","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:42', '2012-08-15 15:59:49', '2012-08-13 18:40:41', '2012-08-13 18:40:42'),
(78, 1, 15, 'fos_user_registration_confirm', 1, 1, 1, 'fos_user_registration_confirm', '/register/confirm/{token}', NULL, NULL, '{"id":15,"name":"fos_user_registration_confirm","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"register-confirm-token","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:42', '2012-08-15 15:59:49', '2012-08-13 18:40:42', '2012-08-13 18:40:42'),
(79, 1, 16, 'fos_user_registration_confirmed', 1, 1, 1, 'fos_user_registration_confirmed', '/register/confirmed', NULL, NULL, '{"id":16,"name":"fos_user_registration_confirmed","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"register-confirmed","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:42', '2012-08-15 15:59:49', '2012-08-13 18:40:42', '2012-08-13 18:40:42'),
(80, 1, 17, 'fos_user_resetting_request', 1, 1, 1, 'fos_user_resetting_request', '/resetting/request', NULL, NULL, '{"id":17,"name":"fos_user_resetting_request","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"resetting-request","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:42', '2012-08-15 15:59:49', '2012-08-13 18:40:42', '2012-08-13 18:40:42'),
(81, 1, 18, 'fos_user_resetting_send_email', 1, 1, 1, 'fos_user_resetting_send_email', '/resetting/send-email', NULL, NULL, '{"id":18,"name":"fos_user_resetting_send_email","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"POST","created_at":"1344875584","updated_at":"1344875687","slug":"resetting-send-email","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:42', '2012-08-15 15:59:49', '2012-08-13 18:40:42', '2012-08-13 18:40:42'),
(82, 1, 19, 'fos_user_resetting_check_email', 1, 1, 1, 'fos_user_resetting_check_email', '/resetting/check-email', NULL, NULL, '{"id":19,"name":"fos_user_resetting_check_email","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875687","slug":"resetting-check-email","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:43', '2012-08-15 15:59:50', '2012-08-13 18:40:42', '2012-08-13 18:40:43'),
(83, 1, 20, 'fos_user_resetting_reset', 1, 1, 1, 'fos_user_resetting_reset', '/resetting/reset/{token}', NULL, NULL, '{"id":20,"name":"fos_user_resetting_reset","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST","created_at":"1344875585","updated_at":"1344875687","slug":"resetting-reset-token","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:43', '2012-08-15 15:59:50', '2012-08-13 18:40:43', '2012-08-13 18:40:43'),
(84, 1, 21, 'fos_user_change_password', 1, 1, 1, 'fos_user_change_password', '/profile/change-password', NULL, NULL, '{"id":21,"name":"fos_user_change_password","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST","created_at":"1344875585","updated_at":"1344875687","slug":"profile-change-password","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:43', '2012-08-15 15:59:50', '2012-08-13 18:40:43', '2012-08-13 18:40:43'),
(85, 1, 22, 'fos_user_group_list', 1, 1, 1, 'fos_user_group_list', '/group/list', NULL, NULL, '{"id":22,"name":"fos_user_group_list","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875585","updated_at":"1344875687","slug":"group-list","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:43', '2012-08-15 15:59:50', '2012-08-13 18:40:43', '2012-08-13 18:40:43'),
(86, 1, 23, 'fos_user_group_new', 1, 1, 1, 'fos_user_group_new', '/group/new', NULL, NULL, '{"id":23,"name":"fos_user_group_new","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875688","slug":"group-new","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:43', '2012-08-15 15:59:51', '2012-08-13 18:40:43', '2012-08-13 18:40:43'),
(87, 1, 24, 'fos_user_group_show', 1, 1, 1, 'fos_user_group_show', '/group/{groupname}', NULL, NULL, '{"id":24,"name":"fos_user_group_show","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875585","updated_at":"1344875688","slug":"group-groupname","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:44', '2012-08-15 15:59:51', '2012-08-13 18:40:43', '2012-08-13 18:40:44'),
(88, 1, 25, 'fos_user_group_edit', 1, 1, 1, 'fos_user_group_edit', '/group/{groupname}/edit', NULL, NULL, '{"id":25,"name":"fos_user_group_edit","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875688","slug":"group-groupname-edit","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:44', '2012-08-15 15:59:51', '2012-08-13 18:40:44', '2012-08-13 18:40:44'),
(89, 1, 26, 'fos_user_group_delete', 1, 1, 1, 'fos_user_group_delete', '/group/{groupname}/delete', NULL, NULL, '{"id":26,"name":"fos_user_group_delete","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875585","updated_at":"1344875688","slug":"group-groupname-delete","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:44', '2012-08-15 15:59:51', '2012-08-13 18:40:44', '2012-08-13 18:40:44'),
(90, 1, 27, 'sonata_page_exceptions_list', 1, 1, 1, 'sonata_page_exceptions_list', '/exceptions/list', NULL, NULL, '{"id":27,"name":"sonata_page_exceptions_list","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875688","slug":"exceptions-list","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:44', '2012-08-15 15:59:52', '2012-08-13 18:40:44', '2012-08-13 18:40:44'),
(91, 1, 28, 'sonata_page_exceptions_edit', 1, 1, 1, 'sonata_page_exceptions_edit', '/exceptions/edit/{code}', NULL, NULL, '{"id":28,"name":"sonata_page_exceptions_edit","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875689","slug":"exceptions-edit-code","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:44', '2012-08-15 15:59:52', '2012-08-13 18:40:44', '2012-08-13 18:40:44'),
(92, 1, 29, 'sonata_page_cache_esi', 1, 1, 1, 'sonata_page_cache_esi', '/sonata/page/cache/esi/{manager}/{page_id}/{block_id}', NULL, NULL, '{"id":29,"name":"sonata_page_cache_esi","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875689","slug":"sonata-page-cache-esi-manager-page-id-block-id","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:45', '2012-08-15 15:59:52', '2012-08-13 18:40:44', '2012-08-13 18:40:45'),
(93, 1, 30, 'catchAll', 1, 1, 1, 'catchAll', '/{path}', NULL, NULL, '{"id":30,"name":"catchAll","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875586","updated_at":"1344875689","slug":"path","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:45', '2012-08-15 15:59:52', '2012-08-13 18:40:45', '2012-08-13 18:40:45'),
(94, 1, 31, '_page_internal_error_not_found', 1, 1, 0, '_page_internal_error_not_found', NULL, NULL, NULL, '{"id":31,"name":"_page_internal_error_not_found","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":null,"created_at":"1344875586","updated_at":"1344875689","slug":"n-a","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:45', '2012-08-15 15:59:53', '2012-08-13 18:40:45', '2012-08-13 18:40:45'),
(95, 1, 32, '_page_internal_error_fatal', 1, 1, 0, '_page_internal_error_fatal', NULL, NULL, NULL, '{"id":32,"name":"_page_internal_error_fatal","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":null,"created_at":"1344875586","updated_at":"1344875689","slug":"n-a","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:45', '2012-08-15 15:59:53', '2012-08-13 18:40:45', '2012-08-13 18:40:45'),
(96, 1, 64, 'sonata_news_add_comment', 1, 1, 1, 'sonata_news_add_comment', '/news/add-comment/{id}', NULL, NULL, '{"id":64,"name":"sonata_news_add_comment","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876024","slug":"news-add-comment-id","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:45', '2012-08-15 15:59:53', '2012-08-13 18:40:45', '2012-08-13 18:40:45'),
(97, 1, 65, 'sonata_news_archive_monthly', 1, 1, 1, 'sonata_news_archive_monthly', '/news/archive/{year}/{month}.{_format}', NULL, NULL, '{"id":65,"name":"sonata_news_archive_monthly","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876024","slug":"news-archive-year-month-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:46', '2012-08-15 15:59:53', '2012-08-13 18:40:46', '2012-08-13 18:40:46'),
(98, 1, 66, 'sonata_news_tag', 1, 1, 1, 'sonata_news_tag', '/news/tag/{tag}.{_format}', NULL, NULL, '{"id":66,"name":"sonata_news_tag","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876024","slug":"news-tag-tag-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:46', '2012-08-15 15:59:54', '2012-08-13 18:40:46', '2012-08-13 18:40:46'),
(99, 1, 67, 'sonata_news_category', 1, 1, 1, 'sonata_news_category', '/news/category/{category}.{_format}', NULL, NULL, '{"id":67,"name":"sonata_news_category","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876024","slug":"news-category-category-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:46', '2012-08-15 15:59:54', '2012-08-13 18:40:46', '2012-08-13 18:40:46'),
(100, 1, 68, 'sonata_news_archive_yearly', 1, 1, 1, 'sonata_news_archive_yearly', '/news/archive/{year}.{_format}', NULL, NULL, '{"id":68,"name":"sonata_news_archive_yearly","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876024","slug":"news-archive-year-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:46', '2012-08-15 15:59:54', '2012-08-13 18:40:46', '2012-08-13 18:40:46'),
(101, 1, 69, 'sonata_news_archive', 1, 1, 1, 'sonata_news_archive', '/news/archive.{_format}', NULL, NULL, '{"id":69,"name":"sonata_news_archive","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876024","slug":"news-archive-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:47', '2012-08-15 15:59:54', '2012-08-13 18:40:47', '2012-08-13 18:40:47'),
(102, 1, 70, 'sonata_news_comment_moderation', 1, 1, 1, 'sonata_news_comment_moderation', '/news/comment/moderation/{commentId}/{hash}/{status}', NULL, NULL, '{"id":70,"name":"sonata_news_comment_moderation","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876024","slug":"news-comment-moderation-commentid-hash-status","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:47', '2012-08-15 15:59:55', '2012-08-13 18:40:47', '2012-08-13 18:40:47'),
(103, 1, 71, 'sonata_news_view', 1, 1, 1, 'sonata_news_view', '/news/{permalink}.{_format}', NULL, NULL, '{"id":71,"name":"sonata_news_view","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876024","slug":"news-permalink-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:47', '2012-08-15 15:59:55', '2012-08-13 18:40:47', '2012-08-13 18:40:47'),
(104, 1, 72, 'sonata_news_home', 1, 1, 1, 'sonata_news_home', '/news/', NULL, NULL, '{"id":72,"name":"sonata_news_home","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876025","updated_at":"1344876025","slug":"news","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-13 18:40:47', '2012-08-15 15:59:55', '2012-08-13 18:40:47', '2012-08-13 18:40:47'),
(146, 1, 2, 'acme_demo_secured_hello', 1, 1, 1, 'acme_demo_secured_hello', '/demo/secured/hello', NULL, NULL, '{"id":2,"name":"acme_demo_secured_hello","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"demo-secured-hello","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:46', '2012-08-15 16:27:30', '2012-08-15 15:59:46', '2012-08-15 15:59:46'),
(147, 1, 3, 'sonata_media_gallery_index', 1, 1, 1, 'sonata_media_gallery_index', '/media/gallery/', NULL, NULL, '{"id":3,"name":"sonata_media_gallery_index","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"media-gallery","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:46', '2012-08-15 16:27:31', '2012-08-15 15:59:46', '2012-08-15 15:59:46'),
(148, 1, 4, 'sonata_media_gallery_view', 1, 1, 1, 'sonata_media_gallery_view', '/media/gallery/view/{id}', NULL, NULL, '{"id":4,"name":"sonata_media_gallery_view","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"media-gallery-view-id","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:46', '2012-08-15 16:27:31', '2012-08-15 15:59:46', '2012-08-15 15:59:46'),
(149, 1, 5, 'sonata_media_view', 1, 1, 1, 'sonata_media_view', '/media/view/{id}/{format}', NULL, NULL, '{"id":5,"name":"sonata_media_view","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"media-view-id-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:46', '2012-08-15 16:27:31', '2012-08-15 15:59:46', '2012-08-15 15:59:46'),
(150, 1, 6, 'sonata_media_download', 1, 1, 1, 'sonata_media_download', '/media/download/{id}/{format}', NULL, NULL, '{"id":6,"name":"sonata_media_download","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875685","slug":"media-download-id-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:47', '2012-08-15 16:27:31', '2012-08-15 15:59:47', '2012-08-15 15:59:47'),
(151, 1, 7, 'fos_user_security_login', 1, 1, 1, 'fos_user_security_login', '/login', NULL, NULL, '{"id":7,"name":"fos_user_security_login","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"login","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:47', '2012-08-15 16:27:31', '2012-08-15 15:59:47', '2012-08-15 15:59:47'),
(152, 1, 8, 'fos_user_security_check', 1, 1, 1, 'fos_user_security_check', '/login_check', NULL, NULL, '{"id":8,"name":"fos_user_security_check","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"login-check","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:47', '2012-08-15 16:27:32', '2012-08-15 15:59:47', '2012-08-15 15:59:47'),
(153, 1, 9, 'fos_user_security_logout', 1, 1, 1, 'fos_user_security_logout', '/logout', NULL, NULL, '{"id":9,"name":"fos_user_security_logout","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"logout","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:47', '2012-08-15 16:27:32', '2012-08-15 15:59:47', '2012-08-15 15:59:47'),
(154, 1, 10, 'sonata_user_profile_show', 1, 1, 1, 'sonata_user_profile_show', '/profile/', NULL, NULL, '{"id":10,"name":"sonata_user_profile_show","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875685","slug":"profile","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:48', '2012-08-15 16:27:32', '2012-08-15 15:59:48', '2012-08-15 15:59:48'),
(155, 1, 11, 'sonata_user_profile_edit_authentication', 1, 1, 1, 'sonata_user_profile_edit_authentication', '/profile/edit-authentication', NULL, NULL, '{"id":11,"name":"sonata_user_profile_edit_authentication","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"profile-edit-authentication","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:48', '2012-08-15 16:27:32', '2012-08-15 15:59:48', '2012-08-15 15:59:48'),
(156, 1, 12, 'sonata_user_profile_edit', 1, 1, 1, 'sonata_user_profile_edit', '/profile/edit-profile', NULL, NULL, '{"id":12,"name":"sonata_user_profile_edit","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875686","slug":"profile-edit-profile","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:48', '2012-08-15 16:27:32', '2012-08-15 15:59:48', '2012-08-15 15:59:48'),
(157, 1, 13, 'fos_user_registration_register', 1, 1, 1, 'fos_user_registration_register', '/register/', NULL, NULL, '{"id":13,"name":"fos_user_registration_register","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875686","slug":"register","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:48', '2012-08-15 16:27:33', '2012-08-15 15:59:48', '2012-08-15 15:59:48'),
(158, 1, 14, 'fos_user_registration_check_email', 1, 1, 1, 'fos_user_registration_check_email', '/register/check-email', NULL, NULL, '{"id":14,"name":"fos_user_registration_check_email","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"register-check-email","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:49', '2012-08-15 16:27:33', '2012-08-15 15:59:49', '2012-08-15 15:59:49'),
(159, 1, 15, 'fos_user_registration_confirm', 1, 1, 1, 'fos_user_registration_confirm', '/register/confirm/{token}', NULL, NULL, '{"id":15,"name":"fos_user_registration_confirm","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"register-confirm-token","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:49', '2012-08-15 16:27:33', '2012-08-15 15:59:49', '2012-08-15 15:59:49'),
(160, 1, 16, 'fos_user_registration_confirmed', 1, 1, 1, 'fos_user_registration_confirmed', '/register/confirmed', NULL, NULL, '{"id":16,"name":"fos_user_registration_confirmed","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"register-confirmed","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:49', '2012-08-15 16:27:33', '2012-08-15 15:59:49', '2012-08-15 15:59:49'),
(161, 1, 17, 'fos_user_resetting_request', 1, 1, 1, 'fos_user_resetting_request', '/resetting/request', NULL, NULL, '{"id":17,"name":"fos_user_resetting_request","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"resetting-request","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:49', '2012-08-15 16:27:33', '2012-08-15 15:59:49', '2012-08-15 15:59:49'),
(162, 1, 18, 'fos_user_resetting_send_email', 1, 1, 1, 'fos_user_resetting_send_email', '/resetting/send-email', NULL, NULL, '{"id":18,"name":"fos_user_resetting_send_email","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"POST","created_at":"1344875584","updated_at":"1344875687","slug":"resetting-send-email","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:49', '2012-08-15 16:27:34', '2012-08-15 15:59:49', '2012-08-15 15:59:49'),
(163, 1, 19, 'fos_user_resetting_check_email', 1, 1, 1, 'fos_user_resetting_check_email', '/resetting/check-email', NULL, NULL, '{"id":19,"name":"fos_user_resetting_check_email","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875687","slug":"resetting-check-email","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:50', '2012-08-15 16:27:34', '2012-08-15 15:59:50', '2012-08-15 15:59:50');
INSERT INTO `page__snapshot` (`id`, `site_id`, `page_id`, `route_name`, `position`, `enabled`, `decorate`, `name`, `url`, `parent_id`, `target_id`, `content`, `publication_date_start`, `publication_date_end`, `created_at`, `updated_at`) VALUES
(164, 1, 20, 'fos_user_resetting_reset', 1, 1, 1, 'fos_user_resetting_reset', '/resetting/reset/{token}', NULL, NULL, '{"id":20,"name":"fos_user_resetting_reset","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST","created_at":"1344875585","updated_at":"1344875687","slug":"resetting-reset-token","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:50', '2012-08-15 16:27:34', '2012-08-15 15:59:50', '2012-08-15 15:59:50'),
(165, 1, 21, 'fos_user_change_password', 1, 1, 1, 'fos_user_change_password', '/profile/change-password', NULL, NULL, '{"id":21,"name":"fos_user_change_password","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST","created_at":"1344875585","updated_at":"1344875687","slug":"profile-change-password","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:50', '2012-08-15 16:27:34', '2012-08-15 15:59:50', '2012-08-15 15:59:50'),
(166, 1, 22, 'fos_user_group_list', 1, 1, 1, 'fos_user_group_list', '/group/list', NULL, NULL, '{"id":22,"name":"fos_user_group_list","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875585","updated_at":"1344875687","slug":"group-list","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:50', '2012-08-15 16:27:34', '2012-08-15 15:59:50', '2012-08-15 15:59:50'),
(167, 1, 23, 'fos_user_group_new', 1, 1, 1, 'fos_user_group_new', '/group/new', NULL, NULL, '{"id":23,"name":"fos_user_group_new","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875688","slug":"group-new","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:51', '2012-08-15 16:27:35', '2012-08-15 15:59:51', '2012-08-15 15:59:51'),
(168, 1, 24, 'fos_user_group_show', 1, 1, 1, 'fos_user_group_show', '/group/{groupname}', NULL, NULL, '{"id":24,"name":"fos_user_group_show","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875585","updated_at":"1344875688","slug":"group-groupname","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:51', '2012-08-15 16:27:35', '2012-08-15 15:59:51', '2012-08-15 15:59:51'),
(169, 1, 25, 'fos_user_group_edit', 1, 1, 1, 'fos_user_group_edit', '/group/{groupname}/edit', NULL, NULL, '{"id":25,"name":"fos_user_group_edit","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875688","slug":"group-groupname-edit","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:51', '2012-08-15 16:27:35', '2012-08-15 15:59:51', '2012-08-15 15:59:51'),
(170, 1, 26, 'fos_user_group_delete', 1, 1, 1, 'fos_user_group_delete', '/group/{groupname}/delete', NULL, NULL, '{"id":26,"name":"fos_user_group_delete","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875585","updated_at":"1344875688","slug":"group-groupname-delete","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:51', '2012-08-15 16:27:35', '2012-08-15 15:59:51', '2012-08-15 15:59:51'),
(171, 1, 27, 'sonata_page_exceptions_list', 1, 1, 1, 'sonata_page_exceptions_list', '/exceptions/list', NULL, NULL, '{"id":27,"name":"sonata_page_exceptions_list","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875688","slug":"exceptions-list","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:52', '2012-08-15 16:27:35', '2012-08-15 15:59:52', '2012-08-15 15:59:52'),
(172, 1, 28, 'sonata_page_exceptions_edit', 1, 1, 1, 'sonata_page_exceptions_edit', '/exceptions/edit/{code}', NULL, NULL, '{"id":28,"name":"sonata_page_exceptions_edit","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875689","slug":"exceptions-edit-code","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:52', '2012-08-15 16:27:36', '2012-08-15 15:59:52', '2012-08-15 15:59:52'),
(173, 1, 29, 'sonata_page_cache_esi', 1, 1, 1, 'sonata_page_cache_esi', '/sonata/page/cache/esi/{manager}/{page_id}/{block_id}', NULL, NULL, '{"id":29,"name":"sonata_page_cache_esi","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875689","slug":"sonata-page-cache-esi-manager-page-id-block-id","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:52', '2012-08-15 16:27:36', '2012-08-15 15:59:52', '2012-08-15 15:59:52'),
(174, 1, 30, 'catchAll', 1, 1, 1, 'catchAll', '/{path}', NULL, NULL, '{"id":30,"name":"catchAll","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875586","updated_at":"1344875689","slug":"path","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:52', '2012-08-15 16:27:36', '2012-08-15 15:59:52', '2012-08-15 15:59:52'),
(175, 1, 31, '_page_internal_error_not_found', 1, 1, 0, '_page_internal_error_not_found', NULL, NULL, NULL, '{"id":31,"name":"_page_internal_error_not_found","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":null,"created_at":"1344875586","updated_at":"1344875689","slug":"n-a","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:53', '2012-08-15 16:27:36', '2012-08-15 15:59:53', '2012-08-15 15:59:53'),
(176, 1, 32, '_page_internal_error_fatal', 1, 1, 0, '_page_internal_error_fatal', NULL, NULL, NULL, '{"id":32,"name":"_page_internal_error_fatal","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":null,"created_at":"1344875586","updated_at":"1344875689","slug":"n-a","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:53', '2012-08-15 16:27:37', '2012-08-15 15:59:53', '2012-08-15 15:59:53'),
(177, 1, 64, 'sonata_news_add_comment', 1, 1, 1, 'sonata_news_add_comment', '/news/add-comment/{id}', NULL, NULL, '{"id":64,"name":"sonata_news_add_comment","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876045","slug":"news-add-comment-id","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:53', '2012-08-15 16:27:37', '2012-08-15 15:59:53', '2012-08-15 15:59:53'),
(178, 1, 65, 'sonata_news_archive_monthly', 1, 1, 1, 'sonata_news_archive_monthly', '/news/archive/{year}/{month}.{_format}', NULL, NULL, '{"id":65,"name":"sonata_news_archive_monthly","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876046","slug":"news-archive-year-month-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:53', '2012-08-15 16:27:37', '2012-08-15 15:59:53', '2012-08-15 15:59:53'),
(179, 1, 66, 'sonata_news_tag', 1, 1, 1, 'sonata_news_tag', '/news/tag/{tag}.{_format}', NULL, NULL, '{"id":66,"name":"sonata_news_tag","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876046","slug":"news-tag-tag-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:54', '2012-08-15 16:27:37', '2012-08-15 15:59:53', '2012-08-15 15:59:54'),
(180, 1, 67, 'sonata_news_category', 1, 1, 1, 'sonata_news_category', '/news/category/{category}.{_format}', NULL, NULL, '{"id":67,"name":"sonata_news_category","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876046","slug":"news-category-category-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:54', '2012-08-15 16:27:38', '2012-08-15 15:59:54', '2012-08-15 15:59:54'),
(181, 1, 68, 'sonata_news_archive_yearly', 1, 1, 1, 'sonata_news_archive_yearly', '/news/archive/{year}.{_format}', NULL, NULL, '{"id":68,"name":"sonata_news_archive_yearly","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876046","slug":"news-archive-year-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:54', '2012-08-15 16:27:38', '2012-08-15 15:59:54', '2012-08-15 15:59:54'),
(182, 1, 69, 'sonata_news_archive', 1, 1, 1, 'sonata_news_archive', '/news/archive.{_format}', NULL, NULL, '{"id":69,"name":"sonata_news_archive","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876047","slug":"news-archive-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:54', '2012-08-15 16:27:38', '2012-08-15 15:59:54', '2012-08-15 15:59:54'),
(183, 1, 70, 'sonata_news_comment_moderation', 1, 1, 1, 'sonata_news_comment_moderation', '/news/comment/moderation/{commentId}/{hash}/{status}', NULL, NULL, '{"id":70,"name":"sonata_news_comment_moderation","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876047","slug":"news-comment-moderation-commentid-hash-status","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:55', '2012-08-15 16:27:38', '2012-08-15 15:59:55', '2012-08-15 15:59:55'),
(184, 1, 71, 'sonata_news_view', 1, 1, 1, 'sonata_news_view', '/news/{permalink}.{_format}', NULL, NULL, '{"id":71,"name":"sonata_news_view","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876047","slug":"news-permalink-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:55', '2012-08-15 16:27:38', '2012-08-15 15:59:55', '2012-08-15 15:59:55'),
(185, 1, 72, 'sonata_news_home', 1, 1, 1, 'sonata_news_home', '/news/', NULL, NULL, '{"id":72,"name":"sonata_news_home","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876025","updated_at":"1344876047","slug":"news","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 15:59:55', '2012-08-15 16:27:39', '2012-08-15 15:59:55', '2012-08-15 15:59:55'),
(229, 1, 2, 'acme_demo_secured_hello', 1, 1, 1, 'acme_demo_secured_hello', '/demo/secured/hello', NULL, NULL, '{"id":2,"name":"acme_demo_secured_hello","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"demo-secured-hello","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:30', '2012-08-15 16:30:45', '2012-08-15 16:27:30', '2012-08-15 16:27:30'),
(230, 1, 3, 'sonata_media_gallery_index', 1, 1, 1, 'sonata_media_gallery_index', '/media/gallery/', NULL, NULL, '{"id":3,"name":"sonata_media_gallery_index","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"media-gallery","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:31', '2012-08-15 16:30:45', '2012-08-15 16:27:31', '2012-08-15 16:27:31'),
(231, 1, 4, 'sonata_media_gallery_view', 1, 1, 1, 'sonata_media_gallery_view', '/media/gallery/view/{id}', NULL, NULL, '{"id":4,"name":"sonata_media_gallery_view","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"media-gallery-view-id","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:31', '2012-08-15 16:30:45', '2012-08-15 16:27:31', '2012-08-15 16:27:31'),
(232, 1, 5, 'sonata_media_view', 1, 1, 1, 'sonata_media_view', '/media/view/{id}/{format}', NULL, NULL, '{"id":5,"name":"sonata_media_view","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"media-view-id-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:31', '2012-08-15 16:31:01', '2012-08-15 16:27:31', '2012-08-15 16:27:31'),
(233, 1, 6, 'sonata_media_download', 1, 1, 1, 'sonata_media_download', '/media/download/{id}/{format}', NULL, NULL, '{"id":6,"name":"sonata_media_download","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875685","slug":"media-download-id-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:31', '2012-08-15 16:31:02', '2012-08-15 16:27:31', '2012-08-15 16:27:31'),
(234, 1, 7, 'fos_user_security_login', 1, 1, 1, 'fos_user_security_login', '/login', NULL, NULL, '{"id":7,"name":"fos_user_security_login","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"login","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:31', '2012-08-15 16:31:02', '2012-08-15 16:27:31', '2012-08-15 16:27:31'),
(235, 1, 8, 'fos_user_security_check', 1, 1, 1, 'fos_user_security_check', '/login_check', NULL, NULL, '{"id":8,"name":"fos_user_security_check","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"login-check","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:32', '2012-08-15 16:31:02', '2012-08-15 16:27:32', '2012-08-15 16:27:32'),
(236, 1, 9, 'fos_user_security_logout', 1, 1, 1, 'fos_user_security_logout', '/logout', NULL, NULL, '{"id":9,"name":"fos_user_security_logout","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"logout","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:32', '2012-08-15 16:31:02', '2012-08-15 16:27:32', '2012-08-15 16:27:32'),
(237, 1, 10, 'sonata_user_profile_show', 1, 1, 1, 'sonata_user_profile_show', '/profile/', NULL, NULL, '{"id":10,"name":"sonata_user_profile_show","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875685","slug":"profile","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:32', '2012-08-15 16:31:02', '2012-08-15 16:27:32', '2012-08-15 16:27:32'),
(238, 1, 11, 'sonata_user_profile_edit_authentication', 1, 1, 1, 'sonata_user_profile_edit_authentication', '/profile/edit-authentication', NULL, NULL, '{"id":11,"name":"sonata_user_profile_edit_authentication","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"profile-edit-authentication","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:32', '2012-08-15 16:31:03', '2012-08-15 16:27:32', '2012-08-15 16:27:32'),
(239, 1, 12, 'sonata_user_profile_edit', 1, 1, 1, 'sonata_user_profile_edit', '/profile/edit-profile', NULL, NULL, '{"id":12,"name":"sonata_user_profile_edit","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875686","slug":"profile-edit-profile","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:32', '2012-08-15 16:31:03', '2012-08-15 16:27:32', '2012-08-15 16:27:32'),
(240, 1, 13, 'fos_user_registration_register', 1, 1, 1, 'fos_user_registration_register', '/register/', NULL, NULL, '{"id":13,"name":"fos_user_registration_register","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875686","slug":"register","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:33', '2012-08-15 16:31:03', '2012-08-15 16:27:33', '2012-08-15 16:27:33'),
(241, 1, 14, 'fos_user_registration_check_email', 1, 1, 1, 'fos_user_registration_check_email', '/register/check-email', NULL, NULL, '{"id":14,"name":"fos_user_registration_check_email","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"register-check-email","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:33', '2012-08-15 16:31:03', '2012-08-15 16:27:33', '2012-08-15 16:27:33'),
(242, 1, 15, 'fos_user_registration_confirm', 1, 1, 1, 'fos_user_registration_confirm', '/register/confirm/{token}', NULL, NULL, '{"id":15,"name":"fos_user_registration_confirm","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"register-confirm-token","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:33', '2012-08-15 16:31:03', '2012-08-15 16:27:33', '2012-08-15 16:27:33'),
(243, 1, 16, 'fos_user_registration_confirmed', 1, 1, 1, 'fos_user_registration_confirmed', '/register/confirmed', NULL, NULL, '{"id":16,"name":"fos_user_registration_confirmed","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"register-confirmed","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:33', '2012-08-15 16:31:04', '2012-08-15 16:27:33', '2012-08-15 16:27:33'),
(244, 1, 17, 'fos_user_resetting_request', 1, 1, 1, 'fos_user_resetting_request', '/resetting/request', NULL, NULL, '{"id":17,"name":"fos_user_resetting_request","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"resetting-request","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:33', '2012-08-15 16:31:04', '2012-08-15 16:27:33', '2012-08-15 16:27:33'),
(245, 1, 18, 'fos_user_resetting_send_email', 1, 1, 1, 'fos_user_resetting_send_email', '/resetting/send-email', NULL, NULL, '{"id":18,"name":"fos_user_resetting_send_email","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"POST","created_at":"1344875584","updated_at":"1344875687","slug":"resetting-send-email","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:34', '2012-08-15 16:31:04', '2012-08-15 16:27:34', '2012-08-15 16:27:34'),
(246, 1, 19, 'fos_user_resetting_check_email', 1, 1, 1, 'fos_user_resetting_check_email', '/resetting/check-email', NULL, NULL, '{"id":19,"name":"fos_user_resetting_check_email","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875687","slug":"resetting-check-email","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:34', '2012-08-15 16:31:04', '2012-08-15 16:27:34', '2012-08-15 16:27:34'),
(247, 1, 20, 'fos_user_resetting_reset', 1, 1, 1, 'fos_user_resetting_reset', '/resetting/reset/{token}', NULL, NULL, '{"id":20,"name":"fos_user_resetting_reset","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST","created_at":"1344875585","updated_at":"1344875687","slug":"resetting-reset-token","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:34', '2012-08-15 16:31:04', '2012-08-15 16:27:34', '2012-08-15 16:27:34'),
(248, 1, 21, 'fos_user_change_password', 1, 1, 1, 'fos_user_change_password', '/profile/change-password', NULL, NULL, '{"id":21,"name":"fos_user_change_password","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST","created_at":"1344875585","updated_at":"1344875687","slug":"profile-change-password","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:34', '2012-08-15 16:31:05', '2012-08-15 16:27:34', '2012-08-15 16:27:34'),
(249, 1, 22, 'fos_user_group_list', 1, 1, 1, 'fos_user_group_list', '/group/list', NULL, NULL, '{"id":22,"name":"fos_user_group_list","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875585","updated_at":"1344875687","slug":"group-list","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:34', '2012-08-15 16:31:05', '2012-08-15 16:27:34', '2012-08-15 16:27:34'),
(250, 1, 23, 'fos_user_group_new', 1, 1, 1, 'fos_user_group_new', '/group/new', NULL, NULL, '{"id":23,"name":"fos_user_group_new","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875688","slug":"group-new","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:35', '2012-08-15 16:31:05', '2012-08-15 16:27:35', '2012-08-15 16:27:35'),
(251, 1, 24, 'fos_user_group_show', 1, 1, 1, 'fos_user_group_show', '/group/{groupname}', NULL, NULL, '{"id":24,"name":"fos_user_group_show","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875585","updated_at":"1344875688","slug":"group-groupname","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:35', '2012-08-15 16:31:05', '2012-08-15 16:27:35', '2012-08-15 16:27:35'),
(252, 1, 25, 'fos_user_group_edit', 1, 1, 1, 'fos_user_group_edit', '/group/{groupname}/edit', NULL, NULL, '{"id":25,"name":"fos_user_group_edit","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875688","slug":"group-groupname-edit","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:35', '2012-08-15 16:31:06', '2012-08-15 16:27:35', '2012-08-15 16:27:35'),
(253, 1, 26, 'fos_user_group_delete', 1, 1, 1, 'fos_user_group_delete', '/group/{groupname}/delete', NULL, NULL, '{"id":26,"name":"fos_user_group_delete","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875585","updated_at":"1344875688","slug":"group-groupname-delete","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:35', '2012-08-15 16:31:06', '2012-08-15 16:27:35', '2012-08-15 16:27:35'),
(254, 1, 27, 'sonata_page_exceptions_list', 1, 1, 1, 'sonata_page_exceptions_list', '/exceptions/list', NULL, NULL, '{"id":27,"name":"sonata_page_exceptions_list","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875688","slug":"exceptions-list","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:35', '2012-08-15 16:31:06', '2012-08-15 16:27:35', '2012-08-15 16:27:35'),
(255, 1, 28, 'sonata_page_exceptions_edit', 1, 1, 1, 'sonata_page_exceptions_edit', '/exceptions/edit/{code}', NULL, NULL, '{"id":28,"name":"sonata_page_exceptions_edit","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875689","slug":"exceptions-edit-code","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:36', '2012-08-15 16:31:06', '2012-08-15 16:27:36', '2012-08-15 16:27:36'),
(256, 1, 29, 'sonata_page_cache_esi', 1, 1, 1, 'sonata_page_cache_esi', '/sonata/page/cache/esi/{manager}/{page_id}/{block_id}', NULL, NULL, '{"id":29,"name":"sonata_page_cache_esi","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875689","slug":"sonata-page-cache-esi-manager-page-id-block-id","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:36', '2012-08-15 16:31:07', '2012-08-15 16:27:36', '2012-08-15 16:27:36'),
(257, 1, 30, 'catchAll', 1, 1, 1, 'catchAll', '/{path}', NULL, NULL, '{"id":30,"name":"catchAll","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875586","updated_at":"1344875689","slug":"path","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:36', '2012-08-15 16:31:07', '2012-08-15 16:27:36', '2012-08-15 16:27:36'),
(258, 1, 31, '_page_internal_error_not_found', 1, 1, 0, '_page_internal_error_not_found', NULL, NULL, NULL, '{"id":31,"name":"_page_internal_error_not_found","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":null,"created_at":"1344875586","updated_at":"1344875689","slug":"n-a","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:36', '2012-08-15 16:31:07', '2012-08-15 16:27:36', '2012-08-15 16:27:36'),
(259, 1, 32, '_page_internal_error_fatal', 1, 1, 0, '_page_internal_error_fatal', NULL, NULL, NULL, '{"id":32,"name":"_page_internal_error_fatal","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":null,"created_at":"1344875586","updated_at":"1344875689","slug":"n-a","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:37', '2012-08-15 16:31:07', '2012-08-15 16:27:36', '2012-08-15 16:27:37'),
(260, 1, 64, 'sonata_news_add_comment', 1, 1, 1, 'sonata_news_add_comment', '/news/add-comment/{id}', NULL, NULL, '{"id":64,"name":"sonata_news_add_comment","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876045","slug":"news-add-comment-id","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:37', '2012-08-15 16:31:07', '2012-08-15 16:27:37', '2012-08-15 16:27:37'),
(261, 1, 65, 'sonata_news_archive_monthly', 1, 1, 1, 'sonata_news_archive_monthly', '/news/archive/{year}/{month}.{_format}', NULL, NULL, '{"id":65,"name":"sonata_news_archive_monthly","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876046","slug":"news-archive-year-month-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:37', '2012-08-15 16:31:08', '2012-08-15 16:27:37', '2012-08-15 16:27:37'),
(262, 1, 66, 'sonata_news_tag', 1, 1, 1, 'sonata_news_tag', '/news/tag/{tag}.{_format}', NULL, NULL, '{"id":66,"name":"sonata_news_tag","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876046","slug":"news-tag-tag-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:37', '2012-08-15 16:31:08', '2012-08-15 16:27:37', '2012-08-15 16:27:37'),
(263, 1, 67, 'sonata_news_category', 1, 1, 1, 'sonata_news_category', '/news/category/{category}.{_format}', NULL, NULL, '{"id":67,"name":"sonata_news_category","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876046","slug":"news-category-category-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:38', '2012-08-15 16:31:08', '2012-08-15 16:27:37', '2012-08-15 16:27:38'),
(264, 1, 68, 'sonata_news_archive_yearly', 1, 1, 1, 'sonata_news_archive_yearly', '/news/archive/{year}.{_format}', NULL, NULL, '{"id":68,"name":"sonata_news_archive_yearly","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876046","slug":"news-archive-year-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:38', '2012-08-15 16:31:08', '2012-08-15 16:27:38', '2012-08-15 16:27:38'),
(265, 1, 69, 'sonata_news_archive', 1, 1, 1, 'sonata_news_archive', '/news/archive.{_format}', NULL, NULL, '{"id":69,"name":"sonata_news_archive","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876047","slug":"news-archive-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:38', '2012-08-15 16:31:09', '2012-08-15 16:27:38', '2012-08-15 16:27:38'),
(266, 1, 70, 'sonata_news_comment_moderation', 1, 1, 1, 'sonata_news_comment_moderation', '/news/comment/moderation/{commentId}/{hash}/{status}', NULL, NULL, '{"id":70,"name":"sonata_news_comment_moderation","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876047","slug":"news-comment-moderation-commentid-hash-status","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:38', '2012-08-15 16:31:09', '2012-08-15 16:27:38', '2012-08-15 16:27:38'),
(267, 1, 71, 'sonata_news_view', 1, 1, 1, 'sonata_news_view', '/news/{permalink}.{_format}', NULL, NULL, '{"id":71,"name":"sonata_news_view","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876047","slug":"news-permalink-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:38', '2012-08-15 16:31:09', '2012-08-15 16:27:38', '2012-08-15 16:27:39'),
(268, 1, 72, 'sonata_news_home', 1, 1, 1, 'sonata_news_home', '/news/', NULL, NULL, '{"id":72,"name":"sonata_news_home","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876025","updated_at":"1344876047","slug":"news","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:27:39', '2012-08-15 16:31:09', '2012-08-15 16:27:39', '2012-08-15 16:27:39'),
(312, 1, 2, 'acme_demo_secured_hello', 1, 1, 1, 'acme_demo_secured_hello', '/demo/secured/hello', NULL, NULL, '{"id":2,"name":"acme_demo_secured_hello","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"demo-secured-hello","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:30:45', '2012-08-15 16:31:01', '2012-08-15 16:30:45', '2012-08-15 16:30:45'),
(313, 1, 3, 'sonata_media_gallery_index', 1, 1, 1, 'sonata_media_gallery_index', '/media/gallery/', NULL, NULL, '{"id":3,"name":"sonata_media_gallery_index","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"media-gallery","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:30:45', '2012-08-15 16:31:01', '2012-08-15 16:30:45', '2012-08-15 16:30:45'),
(314, 1, 4, 'sonata_media_gallery_view', 1, 1, 1, 'sonata_media_gallery_view', '/media/gallery/view/{id}', NULL, NULL, '{"id":4,"name":"sonata_media_gallery_view","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"media-gallery-view-id","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:30:45', '2012-08-15 16:31:01', '2012-08-15 16:30:45', '2012-08-15 16:30:45'),
(317, 1, 2, 'acme_demo_secured_hello', 1, 1, 1, 'acme_demo_secured_hello', '/demo/secured/hello', NULL, NULL, '{"id":2,"name":"acme_demo_secured_hello","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"demo-secured-hello","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:01', '2012-08-15 16:39:11', '2012-08-15 16:31:01', '2012-08-15 16:31:01'),
(318, 1, 3, 'sonata_media_gallery_index', 1, 1, 1, 'sonata_media_gallery_index', '/media/gallery/', NULL, NULL, '{"id":3,"name":"sonata_media_gallery_index","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"media-gallery","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:01', '2012-08-15 16:39:12', '2012-08-15 16:31:01', '2012-08-15 16:31:01'),
(319, 1, 4, 'sonata_media_gallery_view', 1, 1, 1, 'sonata_media_gallery_view', '/media/gallery/view/{id}', NULL, NULL, '{"id":4,"name":"sonata_media_gallery_view","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"media-gallery-view-id","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:01', '2012-08-15 16:39:12', '2012-08-15 16:31:01', '2012-08-15 16:31:01'),
(320, 1, 5, 'sonata_media_view', 1, 1, 1, 'sonata_media_view', '/media/view/{id}/{format}', NULL, NULL, '{"id":5,"name":"sonata_media_view","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"media-view-id-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:01', '2012-08-15 16:39:12', '2012-08-15 16:31:01', '2012-08-15 16:31:02'),
(321, 1, 6, 'sonata_media_download', 1, 1, 1, 'sonata_media_download', '/media/download/{id}/{format}', NULL, NULL, '{"id":6,"name":"sonata_media_download","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875685","slug":"media-download-id-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:02', '2012-08-15 16:39:12', '2012-08-15 16:31:02', '2012-08-15 16:31:02'),
(322, 1, 7, 'fos_user_security_login', 1, 1, 1, 'fos_user_security_login', '/login', NULL, NULL, '{"id":7,"name":"fos_user_security_login","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"login","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:02', '2012-08-15 16:39:12', '2012-08-15 16:31:02', '2012-08-15 16:31:02'),
(323, 1, 8, 'fos_user_security_check', 1, 1, 1, 'fos_user_security_check', '/login_check', NULL, NULL, '{"id":8,"name":"fos_user_security_check","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"login-check","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:02', '2012-08-15 16:39:13', '2012-08-15 16:31:02', '2012-08-15 16:31:02'),
(324, 1, 9, 'fos_user_security_logout', 1, 1, 1, 'fos_user_security_logout', '/logout', NULL, NULL, '{"id":9,"name":"fos_user_security_logout","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"logout","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:02', '2012-08-15 16:39:13', '2012-08-15 16:31:02', '2012-08-15 16:31:02'),
(325, 1, 10, 'sonata_user_profile_show', 1, 1, 1, 'sonata_user_profile_show', '/profile/', NULL, NULL, '{"id":10,"name":"sonata_user_profile_show","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875685","slug":"profile","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:02', '2012-08-15 16:39:13', '2012-08-15 16:31:02', '2012-08-15 16:31:03'),
(326, 1, 11, 'sonata_user_profile_edit_authentication', 1, 1, 1, 'sonata_user_profile_edit_authentication', '/profile/edit-authentication', NULL, NULL, '{"id":11,"name":"sonata_user_profile_edit_authentication","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"profile-edit-authentication","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:03', '2012-08-15 16:39:13', '2012-08-15 16:31:03', '2012-08-15 16:31:03'),
(327, 1, 12, 'sonata_user_profile_edit', 1, 1, 1, 'sonata_user_profile_edit', '/profile/edit-profile', NULL, NULL, '{"id":12,"name":"sonata_user_profile_edit","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875686","slug":"profile-edit-profile","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:03', '2012-08-15 16:39:13', '2012-08-15 16:31:03', '2012-08-15 16:31:03'),
(328, 1, 13, 'fos_user_registration_register', 1, 1, 1, 'fos_user_registration_register', '/register/', NULL, NULL, '{"id":13,"name":"fos_user_registration_register","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875686","slug":"register","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:03', '2012-08-15 16:39:14', '2012-08-15 16:31:03', '2012-08-15 16:31:03'),
(329, 1, 14, 'fos_user_registration_check_email', 1, 1, 1, 'fos_user_registration_check_email', '/register/check-email', NULL, NULL, '{"id":14,"name":"fos_user_registration_check_email","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"register-check-email","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:03', '2012-08-15 16:39:14', '2012-08-15 16:31:03', '2012-08-15 16:31:03'),
(330, 1, 15, 'fos_user_registration_confirm', 1, 1, 1, 'fos_user_registration_confirm', '/register/confirm/{token}', NULL, NULL, '{"id":15,"name":"fos_user_registration_confirm","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"register-confirm-token","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:03', '2012-08-15 16:39:14', '2012-08-15 16:31:03', '2012-08-15 16:31:04'),
(331, 1, 16, 'fos_user_registration_confirmed', 1, 1, 1, 'fos_user_registration_confirmed', '/register/confirmed', NULL, NULL, '{"id":16,"name":"fos_user_registration_confirmed","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"register-confirmed","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:04', '2012-08-15 16:39:14', '2012-08-15 16:31:04', '2012-08-15 16:31:04'),
(332, 1, 17, 'fos_user_resetting_request', 1, 1, 1, 'fos_user_resetting_request', '/resetting/request', NULL, NULL, '{"id":17,"name":"fos_user_resetting_request","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"resetting-request","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:04', '2012-08-15 16:39:14', '2012-08-15 16:31:04', '2012-08-15 16:31:04'),
(333, 1, 18, 'fos_user_resetting_send_email', 1, 1, 1, 'fos_user_resetting_send_email', '/resetting/send-email', NULL, NULL, '{"id":18,"name":"fos_user_resetting_send_email","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"POST","created_at":"1344875584","updated_at":"1344875687","slug":"resetting-send-email","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:04', '2012-08-15 16:39:15', '2012-08-15 16:31:04', '2012-08-15 16:31:04'),
(334, 1, 19, 'fos_user_resetting_check_email', 1, 1, 1, 'fos_user_resetting_check_email', '/resetting/check-email', NULL, NULL, '{"id":19,"name":"fos_user_resetting_check_email","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875687","slug":"resetting-check-email","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:04', '2012-08-15 16:39:15', '2012-08-15 16:31:04', '2012-08-15 16:31:04'),
(335, 1, 20, 'fos_user_resetting_reset', 1, 1, 1, 'fos_user_resetting_reset', '/resetting/reset/{token}', NULL, NULL, '{"id":20,"name":"fos_user_resetting_reset","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST","created_at":"1344875585","updated_at":"1344875687","slug":"resetting-reset-token","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:04', '2012-08-15 16:39:15', '2012-08-15 16:31:04', '2012-08-15 16:31:05'),
(336, 1, 21, 'fos_user_change_password', 1, 1, 1, 'fos_user_change_password', '/profile/change-password', NULL, NULL, '{"id":21,"name":"fos_user_change_password","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST","created_at":"1344875585","updated_at":"1344875687","slug":"profile-change-password","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:05', '2012-08-15 16:39:15', '2012-08-15 16:31:05', '2012-08-15 16:31:05'),
(337, 1, 22, 'fos_user_group_list', 1, 1, 1, 'fos_user_group_list', '/group/list', NULL, NULL, '{"id":22,"name":"fos_user_group_list","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875585","updated_at":"1344875687","slug":"group-list","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:05', '2012-08-15 16:39:16', '2012-08-15 16:31:05', '2012-08-15 16:31:05'),
(338, 1, 23, 'fos_user_group_new', 1, 1, 1, 'fos_user_group_new', '/group/new', NULL, NULL, '{"id":23,"name":"fos_user_group_new","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875688","slug":"group-new","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:05', '2012-08-15 16:39:16', '2012-08-15 16:31:05', '2012-08-15 16:31:05'),
(339, 1, 24, 'fos_user_group_show', 1, 1, 1, 'fos_user_group_show', '/group/{groupname}', NULL, NULL, '{"id":24,"name":"fos_user_group_show","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875585","updated_at":"1344875688","slug":"group-groupname","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:05', '2012-08-15 16:39:16', '2012-08-15 16:31:05', '2012-08-15 16:31:06'),
(340, 1, 25, 'fos_user_group_edit', 1, 1, 1, 'fos_user_group_edit', '/group/{groupname}/edit', NULL, NULL, '{"id":25,"name":"fos_user_group_edit","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875688","slug":"group-groupname-edit","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:06', '2012-08-15 16:39:16', '2012-08-15 16:31:06', '2012-08-15 16:31:06');
INSERT INTO `page__snapshot` (`id`, `site_id`, `page_id`, `route_name`, `position`, `enabled`, `decorate`, `name`, `url`, `parent_id`, `target_id`, `content`, `publication_date_start`, `publication_date_end`, `created_at`, `updated_at`) VALUES
(341, 1, 26, 'fos_user_group_delete', 1, 1, 1, 'fos_user_group_delete', '/group/{groupname}/delete', NULL, NULL, '{"id":26,"name":"fos_user_group_delete","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875585","updated_at":"1344875688","slug":"group-groupname-delete","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:06', '2012-08-15 16:39:16', '2012-08-15 16:31:06', '2012-08-15 16:31:06'),
(342, 1, 27, 'sonata_page_exceptions_list', 1, 1, 1, 'sonata_page_exceptions_list', '/exceptions/list', NULL, NULL, '{"id":27,"name":"sonata_page_exceptions_list","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875688","slug":"exceptions-list","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:06', '2012-08-15 16:39:17', '2012-08-15 16:31:06', '2012-08-15 16:31:06'),
(343, 1, 28, 'sonata_page_exceptions_edit', 1, 1, 1, 'sonata_page_exceptions_edit', '/exceptions/edit/{code}', NULL, NULL, '{"id":28,"name":"sonata_page_exceptions_edit","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875689","slug":"exceptions-edit-code","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:06', '2012-08-15 16:39:17', '2012-08-15 16:31:06', '2012-08-15 16:31:06'),
(344, 1, 29, 'sonata_page_cache_esi', 1, 1, 1, 'sonata_page_cache_esi', '/sonata/page/cache/esi/{manager}/{page_id}/{block_id}', NULL, NULL, '{"id":29,"name":"sonata_page_cache_esi","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875689","slug":"sonata-page-cache-esi-manager-page-id-block-id","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:07', '2012-08-15 16:39:17', '2012-08-15 16:31:06', '2012-08-15 16:31:07'),
(345, 1, 30, 'catchAll', 1, 1, 1, 'catchAll', '/{path}', NULL, NULL, '{"id":30,"name":"catchAll","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875586","updated_at":"1344875689","slug":"path","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:07', '2012-08-15 16:39:17', '2012-08-15 16:31:07', '2012-08-15 16:31:07'),
(346, 1, 31, '_page_internal_error_not_found', 1, 1, 0, '_page_internal_error_not_found', NULL, NULL, NULL, '{"id":31,"name":"_page_internal_error_not_found","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":null,"created_at":"1344875586","updated_at":"1344875689","slug":"n-a","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:07', '2012-08-15 16:39:17', '2012-08-15 16:31:07', '2012-08-15 16:31:07'),
(347, 1, 32, '_page_internal_error_fatal', 1, 1, 0, '_page_internal_error_fatal', NULL, NULL, NULL, '{"id":32,"name":"_page_internal_error_fatal","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":null,"created_at":"1344875586","updated_at":"1344875689","slug":"n-a","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:07', '2012-08-15 16:39:18', '2012-08-15 16:31:07', '2012-08-15 16:31:07'),
(348, 1, 64, 'sonata_news_add_comment', 1, 1, 1, 'sonata_news_add_comment', '/news/add-comment/{id}', NULL, NULL, '{"id":64,"name":"sonata_news_add_comment","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876045","slug":"news-add-comment-id","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:07', '2012-08-15 16:39:18', '2012-08-15 16:31:07', '2012-08-15 16:31:07'),
(349, 1, 65, 'sonata_news_archive_monthly', 1, 1, 1, 'sonata_news_archive_monthly', '/news/archive/{year}/{month}.{_format}', NULL, NULL, '{"id":65,"name":"sonata_news_archive_monthly","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876046","slug":"news-archive-year-month-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:08', '2012-08-15 16:39:18', '2012-08-15 16:31:08', '2012-08-15 16:31:08'),
(350, 1, 66, 'sonata_news_tag', 1, 1, 1, 'sonata_news_tag', '/news/tag/{tag}.{_format}', NULL, NULL, '{"id":66,"name":"sonata_news_tag","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876046","slug":"news-tag-tag-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:08', '2012-08-15 16:39:18', '2012-08-15 16:31:08', '2012-08-15 16:31:08'),
(351, 1, 67, 'sonata_news_category', 1, 1, 1, 'sonata_news_category', '/news/category/{category}.{_format}', NULL, NULL, '{"id":67,"name":"sonata_news_category","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876046","slug":"news-category-category-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:08', '2012-08-15 16:39:19', '2012-08-15 16:31:08', '2012-08-15 16:31:08'),
(352, 1, 68, 'sonata_news_archive_yearly', 1, 1, 1, 'sonata_news_archive_yearly', '/news/archive/{year}.{_format}', NULL, NULL, '{"id":68,"name":"sonata_news_archive_yearly","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876046","slug":"news-archive-year-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:08', '2012-08-15 16:39:19', '2012-08-15 16:31:08', '2012-08-15 16:31:08'),
(353, 1, 69, 'sonata_news_archive', 1, 1, 1, 'sonata_news_archive', '/news/archive.{_format}', NULL, NULL, '{"id":69,"name":"sonata_news_archive","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876047","slug":"news-archive-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:09', '2012-08-15 16:39:19', '2012-08-15 16:31:09', '2012-08-15 16:31:09'),
(354, 1, 70, 'sonata_news_comment_moderation', 1, 1, 1, 'sonata_news_comment_moderation', '/news/comment/moderation/{commentId}/{hash}/{status}', NULL, NULL, '{"id":70,"name":"sonata_news_comment_moderation","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876047","slug":"news-comment-moderation-commentid-hash-status","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:09', '2012-08-15 16:39:19', '2012-08-15 16:31:09', '2012-08-15 16:31:09'),
(355, 1, 71, 'sonata_news_view', 1, 1, 1, 'sonata_news_view', '/news/{permalink}.{_format}', NULL, NULL, '{"id":71,"name":"sonata_news_view","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876047","slug":"news-permalink-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:09', '2012-08-15 16:39:20', '2012-08-15 16:31:09', '2012-08-15 16:31:09'),
(356, 1, 72, 'sonata_news_home', 1, 1, 1, 'sonata_news_home', '/news/', NULL, NULL, '{"id":72,"name":"sonata_news_home","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876025","updated_at":"1344876047","slug":"news","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:31:09', '2012-08-15 16:39:20', '2012-08-15 16:31:09', '2012-08-15 16:31:09'),
(400, 1, 2, 'acme_demo_secured_hello', 1, 1, 1, 'acme_demo_secured_hello', '/demo/secured/hello', NULL, NULL, '{"id":2,"name":"acme_demo_secured_hello","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"demo-secured-hello","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:11', '2012-08-15 16:44:54', '2012-08-15 16:39:11', '2012-08-15 16:39:12'),
(401, 1, 3, 'sonata_media_gallery_index', 1, 1, 1, 'sonata_media_gallery_index', '/media/gallery/', NULL, NULL, '{"id":3,"name":"sonata_media_gallery_index","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"media-gallery","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:12', '2012-08-15 16:44:55', '2012-08-15 16:39:12', '2012-08-15 16:39:12'),
(402, 1, 4, 'sonata_media_gallery_view', 1, 1, 1, 'sonata_media_gallery_view', '/media/gallery/view/{id}', NULL, NULL, '{"id":4,"name":"sonata_media_gallery_view","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"media-gallery-view-id","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:12', '2012-08-15 16:44:55', '2012-08-15 16:39:12', '2012-08-15 16:39:12'),
(403, 1, 5, 'sonata_media_view', 1, 1, 1, 'sonata_media_view', '/media/view/{id}/{format}', NULL, NULL, '{"id":5,"name":"sonata_media_view","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"media-view-id-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:12', '2012-08-15 16:44:55', '2012-08-15 16:39:12', '2012-08-15 16:39:12'),
(404, 1, 6, 'sonata_media_download', 1, 1, 1, 'sonata_media_download', '/media/download/{id}/{format}', NULL, NULL, '{"id":6,"name":"sonata_media_download","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875685","slug":"media-download-id-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:12', '2012-08-15 16:44:55', '2012-08-15 16:39:12', '2012-08-15 16:39:12'),
(405, 1, 7, 'fos_user_security_login', 1, 1, 1, 'fos_user_security_login', '/login', NULL, NULL, '{"id":7,"name":"fos_user_security_login","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"login","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:12', '2012-08-15 16:44:55', '2012-08-15 16:39:12', '2012-08-15 16:39:13'),
(406, 1, 8, 'fos_user_security_check', 1, 1, 1, 'fos_user_security_check', '/login_check', NULL, NULL, '{"id":8,"name":"fos_user_security_check","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"login-check","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:13', '2012-08-15 16:44:56', '2012-08-15 16:39:13', '2012-08-15 16:39:13'),
(407, 1, 9, 'fos_user_security_logout', 1, 1, 1, 'fos_user_security_logout', '/logout', NULL, NULL, '{"id":9,"name":"fos_user_security_logout","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"logout","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:13', '2012-08-15 16:44:56', '2012-08-15 16:39:13', '2012-08-15 16:39:13'),
(408, 1, 10, 'sonata_user_profile_show', 1, 1, 1, 'sonata_user_profile_show', '/profile/', NULL, NULL, '{"id":10,"name":"sonata_user_profile_show","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875685","slug":"profile","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:13', '2012-08-15 16:44:56', '2012-08-15 16:39:13', '2012-08-15 16:39:13'),
(409, 1, 11, 'sonata_user_profile_edit_authentication', 1, 1, 1, 'sonata_user_profile_edit_authentication', '/profile/edit-authentication', NULL, NULL, '{"id":11,"name":"sonata_user_profile_edit_authentication","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"profile-edit-authentication","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:13', '2012-08-15 16:44:56', '2012-08-15 16:39:13', '2012-08-15 16:39:13'),
(410, 1, 12, 'sonata_user_profile_edit', 1, 1, 1, 'sonata_user_profile_edit', '/profile/edit-profile', NULL, NULL, '{"id":12,"name":"sonata_user_profile_edit","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875686","slug":"profile-edit-profile","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:13', '2012-08-15 16:44:56', '2012-08-15 16:39:13', '2012-08-15 16:39:14'),
(411, 1, 13, 'fos_user_registration_register', 1, 1, 1, 'fos_user_registration_register', '/register/', NULL, NULL, '{"id":13,"name":"fos_user_registration_register","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875686","slug":"register","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:14', '2012-08-15 16:44:57', '2012-08-15 16:39:14', '2012-08-15 16:39:14'),
(412, 1, 14, 'fos_user_registration_check_email', 1, 1, 1, 'fos_user_registration_check_email', '/register/check-email', NULL, NULL, '{"id":14,"name":"fos_user_registration_check_email","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"register-check-email","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:14', '2012-08-15 16:44:57', '2012-08-15 16:39:14', '2012-08-15 16:39:14'),
(413, 1, 15, 'fos_user_registration_confirm', 1, 1, 1, 'fos_user_registration_confirm', '/register/confirm/{token}', NULL, NULL, '{"id":15,"name":"fos_user_registration_confirm","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"register-confirm-token","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:14', '2012-08-15 16:44:57', '2012-08-15 16:39:14', '2012-08-15 16:39:14'),
(414, 1, 16, 'fos_user_registration_confirmed', 1, 1, 1, 'fos_user_registration_confirmed', '/register/confirmed', NULL, NULL, '{"id":16,"name":"fos_user_registration_confirmed","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"register-confirmed","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:14', '2012-08-15 16:44:57', '2012-08-15 16:39:14', '2012-08-15 16:39:14'),
(415, 1, 17, 'fos_user_resetting_request', 1, 1, 1, 'fos_user_resetting_request', '/resetting/request', NULL, NULL, '{"id":17,"name":"fos_user_resetting_request","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"resetting-request","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:14', '2012-08-15 16:44:57', '2012-08-15 16:39:14', '2012-08-15 16:39:15'),
(416, 1, 18, 'fos_user_resetting_send_email', 1, 1, 1, 'fos_user_resetting_send_email', '/resetting/send-email', NULL, NULL, '{"id":18,"name":"fos_user_resetting_send_email","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"POST","created_at":"1344875584","updated_at":"1344875687","slug":"resetting-send-email","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:15', '2012-08-15 16:44:58', '2012-08-15 16:39:15', '2012-08-15 16:39:15'),
(417, 1, 19, 'fos_user_resetting_check_email', 1, 1, 1, 'fos_user_resetting_check_email', '/resetting/check-email', NULL, NULL, '{"id":19,"name":"fos_user_resetting_check_email","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875687","slug":"resetting-check-email","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:15', '2012-08-15 16:44:58', '2012-08-15 16:39:15', '2012-08-15 16:39:15'),
(418, 1, 20, 'fos_user_resetting_reset', 1, 1, 1, 'fos_user_resetting_reset', '/resetting/reset/{token}', NULL, NULL, '{"id":20,"name":"fos_user_resetting_reset","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST","created_at":"1344875585","updated_at":"1344875687","slug":"resetting-reset-token","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:15', '2012-08-15 16:44:58', '2012-08-15 16:39:15', '2012-08-15 16:39:15'),
(419, 1, 21, 'fos_user_change_password', 1, 1, 1, 'fos_user_change_password', '/profile/change-password', NULL, NULL, '{"id":21,"name":"fos_user_change_password","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST","created_at":"1344875585","updated_at":"1344875687","slug":"profile-change-password","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:15', '2012-08-15 16:44:58', '2012-08-15 16:39:15', '2012-08-15 16:39:15'),
(420, 1, 22, 'fos_user_group_list', 1, 1, 1, 'fos_user_group_list', '/group/list', NULL, NULL, '{"id":22,"name":"fos_user_group_list","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875585","updated_at":"1344875687","slug":"group-list","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:16', '2012-08-15 16:44:58', '2012-08-15 16:39:15', '2012-08-15 16:39:16'),
(421, 1, 23, 'fos_user_group_new', 1, 1, 1, 'fos_user_group_new', '/group/new', NULL, NULL, '{"id":23,"name":"fos_user_group_new","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875688","slug":"group-new","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:16', '2012-08-15 16:44:59', '2012-08-15 16:39:16', '2012-08-15 16:39:16'),
(422, 1, 24, 'fos_user_group_show', 1, 1, 1, 'fos_user_group_show', '/group/{groupname}', NULL, NULL, '{"id":24,"name":"fos_user_group_show","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875585","updated_at":"1344875688","slug":"group-groupname","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:16', '2012-08-15 16:44:59', '2012-08-15 16:39:16', '2012-08-15 16:39:16'),
(423, 1, 25, 'fos_user_group_edit', 1, 1, 1, 'fos_user_group_edit', '/group/{groupname}/edit', NULL, NULL, '{"id":25,"name":"fos_user_group_edit","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875688","slug":"group-groupname-edit","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:16', '2012-08-15 16:44:59', '2012-08-15 16:39:16', '2012-08-15 16:39:16'),
(424, 1, 26, 'fos_user_group_delete', 1, 1, 1, 'fos_user_group_delete', '/group/{groupname}/delete', NULL, NULL, '{"id":26,"name":"fos_user_group_delete","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875585","updated_at":"1344875688","slug":"group-groupname-delete","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:16', '2012-08-15 16:44:59', '2012-08-15 16:39:16', '2012-08-15 16:39:16'),
(425, 1, 27, 'sonata_page_exceptions_list', 1, 1, 1, 'sonata_page_exceptions_list', '/exceptions/list', NULL, NULL, '{"id":27,"name":"sonata_page_exceptions_list","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875688","slug":"exceptions-list","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:17', '2012-08-15 16:45:00', '2012-08-15 16:39:16', '2012-08-15 16:39:17'),
(426, 1, 28, 'sonata_page_exceptions_edit', 1, 1, 1, 'sonata_page_exceptions_edit', '/exceptions/edit/{code}', NULL, NULL, '{"id":28,"name":"sonata_page_exceptions_edit","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875689","slug":"exceptions-edit-code","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:17', '2012-08-15 16:45:00', '2012-08-15 16:39:17', '2012-08-15 16:39:17'),
(427, 1, 29, 'sonata_page_cache_esi', 1, 1, 1, 'sonata_page_cache_esi', '/sonata/page/cache/esi/{manager}/{page_id}/{block_id}', NULL, NULL, '{"id":29,"name":"sonata_page_cache_esi","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875689","slug":"sonata-page-cache-esi-manager-page-id-block-id","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:17', '2012-08-15 16:45:00', '2012-08-15 16:39:17', '2012-08-15 16:39:17'),
(428, 1, 30, 'catchAll', 1, 1, 1, 'catchAll', '/{path}', NULL, NULL, '{"id":30,"name":"catchAll","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875586","updated_at":"1344875689","slug":"path","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:17', '2012-08-15 16:45:00', '2012-08-15 16:39:17', '2012-08-15 16:39:17'),
(429, 1, 31, '_page_internal_error_not_found', 1, 1, 0, '_page_internal_error_not_found', NULL, NULL, NULL, '{"id":31,"name":"_page_internal_error_not_found","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":null,"created_at":"1344875586","updated_at":"1344875689","slug":"n-a","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:17', '2012-08-15 16:45:00', '2012-08-15 16:39:17', '2012-08-15 16:39:17'),
(430, 1, 32, '_page_internal_error_fatal', 1, 1, 0, '_page_internal_error_fatal', NULL, NULL, NULL, '{"id":32,"name":"_page_internal_error_fatal","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":null,"created_at":"1344875586","updated_at":"1344875689","slug":"n-a","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:18', '2012-08-15 16:45:01', '2012-08-15 16:39:18', '2012-08-15 16:39:18'),
(431, 1, 64, 'sonata_news_add_comment', 1, 1, 1, 'sonata_news_add_comment', '/news/add-comment/{id}', NULL, NULL, '{"id":64,"name":"sonata_news_add_comment","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876045","slug":"news-add-comment-id","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:18', '2012-08-15 16:45:01', '2012-08-15 16:39:18', '2012-08-15 16:39:18'),
(432, 1, 65, 'sonata_news_archive_monthly', 1, 1, 1, 'sonata_news_archive_monthly', '/news/archive/{year}/{month}.{_format}', NULL, NULL, '{"id":65,"name":"sonata_news_archive_monthly","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876046","slug":"news-archive-year-month-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:18', '2012-08-15 16:45:01', '2012-08-15 16:39:18', '2012-08-15 16:39:18'),
(433, 1, 66, 'sonata_news_tag', 1, 1, 1, 'sonata_news_tag', '/news/tag/{tag}.{_format}', NULL, NULL, '{"id":66,"name":"sonata_news_tag","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876046","slug":"news-tag-tag-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:18', '2012-08-15 16:45:01', '2012-08-15 16:39:18', '2012-08-15 16:39:18'),
(434, 1, 67, 'sonata_news_category', 1, 1, 1, 'sonata_news_category', '/news/category/{category}.{_format}', NULL, NULL, '{"id":67,"name":"sonata_news_category","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876046","slug":"news-category-category-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:19', '2012-08-15 16:45:02', '2012-08-15 16:39:18', '2012-08-15 16:39:19'),
(435, 1, 68, 'sonata_news_archive_yearly', 1, 1, 1, 'sonata_news_archive_yearly', '/news/archive/{year}.{_format}', NULL, NULL, '{"id":68,"name":"sonata_news_archive_yearly","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876046","slug":"news-archive-year-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:19', '2012-08-15 16:45:02', '2012-08-15 16:39:19', '2012-08-15 16:39:19'),
(436, 1, 69, 'sonata_news_archive', 1, 1, 1, 'sonata_news_archive', '/news/archive.{_format}', NULL, NULL, '{"id":69,"name":"sonata_news_archive","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876047","slug":"news-archive-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:19', '2012-08-15 16:45:02', '2012-08-15 16:39:19', '2012-08-15 16:39:19'),
(437, 1, 70, 'sonata_news_comment_moderation', 1, 1, 1, 'sonata_news_comment_moderation', '/news/comment/moderation/{commentId}/{hash}/{status}', NULL, NULL, '{"id":70,"name":"sonata_news_comment_moderation","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876047","slug":"news-comment-moderation-commentid-hash-status","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:19', '2012-08-15 16:45:02', '2012-08-15 16:39:19', '2012-08-15 16:39:19'),
(438, 1, 71, 'sonata_news_view', 1, 1, 1, 'sonata_news_view', '/news/{permalink}.{_format}', NULL, NULL, '{"id":71,"name":"sonata_news_view","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876047","slug":"news-permalink-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:20', '2012-08-15 16:45:02', '2012-08-15 16:39:19', '2012-08-15 16:39:20'),
(439, 1, 72, 'sonata_news_home', 1, 1, 1, 'sonata_news_home', '/news/', NULL, NULL, '{"id":72,"name":"sonata_news_home","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876025","updated_at":"1344876047","slug":"news","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:39:20', '2012-08-15 16:45:03', '2012-08-15 16:39:20', '2012-08-15 16:39:20'),
(483, 1, 2, 'acme_demo_secured_hello', 1, 1, 1, 'acme_demo_secured_hello', '/demo/secured/hello', NULL, NULL, '{"id":2,"name":"acme_demo_secured_hello","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"demo-secured-hello","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:54', NULL, '2012-08-15 16:44:54', '2012-08-15 16:44:54'),
(484, 1, 3, 'sonata_media_gallery_index', 1, 1, 1, 'sonata_media_gallery_index', '/media/gallery/', NULL, NULL, '{"id":3,"name":"sonata_media_gallery_index","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"media-gallery","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:55', NULL, '2012-08-15 16:44:55', '2012-08-15 16:44:55'),
(485, 1, 4, 'sonata_media_gallery_view', 1, 1, 1, 'sonata_media_gallery_view', '/media/gallery/view/{id}', NULL, NULL, '{"id":4,"name":"sonata_media_gallery_view","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"media-gallery-view-id","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:55', NULL, '2012-08-15 16:44:55', '2012-08-15 16:44:55'),
(486, 1, 5, 'sonata_media_view', 1, 1, 1, 'sonata_media_view', '/media/view/{id}/{format}', NULL, NULL, '{"id":5,"name":"sonata_media_view","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875684","slug":"media-view-id-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:55', NULL, '2012-08-15 16:44:55', '2012-08-15 16:44:55'),
(487, 1, 6, 'sonata_media_download', 1, 1, 1, 'sonata_media_download', '/media/download/{id}/{format}', NULL, NULL, '{"id":6,"name":"sonata_media_download","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875583","updated_at":"1344875685","slug":"media-download-id-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:55', NULL, '2012-08-15 16:44:55', '2012-08-15 16:44:55'),
(488, 1, 7, 'fos_user_security_login', 1, 1, 1, 'fos_user_security_login', '/login', NULL, NULL, '{"id":7,"name":"fos_user_security_login","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"login","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:55', NULL, '2012-08-15 16:44:55', '2012-08-15 16:44:55'),
(489, 1, 8, 'fos_user_security_check', 1, 1, 1, 'fos_user_security_check', '/login_check', NULL, NULL, '{"id":8,"name":"fos_user_security_check","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"login-check","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:56', NULL, '2012-08-15 16:44:56', '2012-08-15 16:44:56'),
(490, 1, 9, 'fos_user_security_logout', 1, 1, 1, 'fos_user_security_logout', '/logout', NULL, NULL, '{"id":9,"name":"fos_user_security_logout","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"logout","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:56', NULL, '2012-08-15 16:44:56', '2012-08-15 16:44:56'),
(491, 1, 10, 'sonata_user_profile_show', 1, 1, 1, 'sonata_user_profile_show', '/profile/', NULL, NULL, '{"id":10,"name":"sonata_user_profile_show","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875685","slug":"profile","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:56', NULL, '2012-08-15 16:44:56', '2012-08-15 16:44:56'),
(492, 1, 11, 'sonata_user_profile_edit_authentication', 1, 1, 1, 'sonata_user_profile_edit_authentication', '/profile/edit-authentication', NULL, NULL, '{"id":11,"name":"sonata_user_profile_edit_authentication","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875685","slug":"profile-edit-authentication","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:56', NULL, '2012-08-15 16:44:56', '2012-08-15 16:44:56'),
(493, 1, 12, 'sonata_user_profile_edit', 1, 1, 1, 'sonata_user_profile_edit', '/profile/edit-profile', NULL, NULL, '{"id":12,"name":"sonata_user_profile_edit","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875686","slug":"profile-edit-profile","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:56', NULL, '2012-08-15 16:44:56', '2012-08-15 16:44:56'),
(494, 1, 13, 'fos_user_registration_register', 1, 1, 1, 'fos_user_registration_register', '/register/', NULL, NULL, '{"id":13,"name":"fos_user_registration_register","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875584","updated_at":"1344875686","slug":"register","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:57', NULL, '2012-08-15 16:44:57', '2012-08-15 16:44:57'),
(495, 1, 14, 'fos_user_registration_check_email', 1, 1, 1, 'fos_user_registration_check_email', '/register/check-email', NULL, NULL, '{"id":14,"name":"fos_user_registration_check_email","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"register-check-email","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:57', NULL, '2012-08-15 16:44:57', '2012-08-15 16:44:57'),
(496, 1, 15, 'fos_user_registration_confirm', 1, 1, 1, 'fos_user_registration_confirm', '/register/confirm/{token}', NULL, NULL, '{"id":15,"name":"fos_user_registration_confirm","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"register-confirm-token","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:57', NULL, '2012-08-15 16:44:57', '2012-08-15 16:44:57'),
(497, 1, 16, 'fos_user_registration_confirmed', 1, 1, 1, 'fos_user_registration_confirmed', '/register/confirmed', NULL, NULL, '{"id":16,"name":"fos_user_registration_confirmed","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"register-confirmed","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:57', NULL, '2012-08-15 16:44:57', '2012-08-15 16:44:57'),
(498, 1, 17, 'fos_user_resetting_request', 1, 1, 1, 'fos_user_resetting_request', '/resetting/request', NULL, NULL, '{"id":17,"name":"fos_user_resetting_request","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875686","slug":"resetting-request","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:57', NULL, '2012-08-15 16:44:57', '2012-08-15 16:44:57'),
(499, 1, 18, 'fos_user_resetting_send_email', 1, 1, 1, 'fos_user_resetting_send_email', '/resetting/send-email', NULL, NULL, '{"id":18,"name":"fos_user_resetting_send_email","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"POST","created_at":"1344875584","updated_at":"1344875687","slug":"resetting-send-email","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:58', NULL, '2012-08-15 16:44:58', '2012-08-15 16:44:58'),
(500, 1, 19, 'fos_user_resetting_check_email', 1, 1, 1, 'fos_user_resetting_check_email', '/resetting/check-email', NULL, NULL, '{"id":19,"name":"fos_user_resetting_check_email","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875584","updated_at":"1344875687","slug":"resetting-check-email","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:58', NULL, '2012-08-15 16:44:58', '2012-08-15 16:44:58'),
(501, 1, 20, 'fos_user_resetting_reset', 1, 1, 1, 'fos_user_resetting_reset', '/resetting/reset/{token}', NULL, NULL, '{"id":20,"name":"fos_user_resetting_reset","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST","created_at":"1344875585","updated_at":"1344875687","slug":"resetting-reset-token","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:58', NULL, '2012-08-15 16:44:58', '2012-08-15 16:44:58'),
(502, 1, 21, 'fos_user_change_password', 1, 1, 1, 'fos_user_change_password', '/profile/change-password', NULL, NULL, '{"id":21,"name":"fos_user_change_password","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST","created_at":"1344875585","updated_at":"1344875687","slug":"profile-change-password","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:58', NULL, '2012-08-15 16:44:58', '2012-08-15 16:44:58'),
(503, 1, 22, 'fos_user_group_list', 1, 1, 1, 'fos_user_group_list', '/group/list', NULL, NULL, '{"id":22,"name":"fos_user_group_list","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875585","updated_at":"1344875687","slug":"group-list","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:58', NULL, '2012-08-15 16:44:58', '2012-08-15 16:44:58'),
(504, 1, 23, 'fos_user_group_new', 1, 1, 1, 'fos_user_group_new', '/group/new', NULL, NULL, '{"id":23,"name":"fos_user_group_new","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875688","slug":"group-new","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:59', NULL, '2012-08-15 16:44:59', '2012-08-15 16:44:59'),
(505, 1, 24, 'fos_user_group_show', 1, 1, 1, 'fos_user_group_show', '/group/{groupname}', NULL, NULL, '{"id":24,"name":"fos_user_group_show","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875585","updated_at":"1344875688","slug":"group-groupname","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:59', NULL, '2012-08-15 16:44:59', '2012-08-15 16:44:59'),
(506, 1, 25, 'fos_user_group_edit', 1, 1, 1, 'fos_user_group_edit', '/group/{groupname}/edit', NULL, NULL, '{"id":25,"name":"fos_user_group_edit","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875688","slug":"group-groupname-edit","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:59', NULL, '2012-08-15 16:44:59', '2012-08-15 16:44:59'),
(507, 1, 26, 'fos_user_group_delete', 1, 1, 1, 'fos_user_group_delete', '/group/{groupname}/delete', NULL, NULL, '{"id":26,"name":"fos_user_group_delete","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET","created_at":"1344875585","updated_at":"1344875688","slug":"group-groupname-delete","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:44:59', NULL, '2012-08-15 16:44:59', '2012-08-15 16:44:59'),
(508, 1, 27, 'sonata_page_exceptions_list', 1, 1, 1, 'sonata_page_exceptions_list', '/exceptions/list', NULL, NULL, '{"id":27,"name":"sonata_page_exceptions_list","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875688","slug":"exceptions-list","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:45:00', NULL, '2012-08-15 16:45:00', '2012-08-15 16:45:00'),
(509, 1, 28, 'sonata_page_exceptions_edit', 1, 1, 1, 'sonata_page_exceptions_edit', '/exceptions/edit/{code}', NULL, NULL, '{"id":28,"name":"sonata_page_exceptions_edit","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875689","slug":"exceptions-edit-code","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:45:00', NULL, '2012-08-15 16:45:00', '2012-08-15 16:45:00'),
(510, 1, 29, 'sonata_page_cache_esi', 1, 1, 1, 'sonata_page_cache_esi', '/sonata/page/cache/esi/{manager}/{page_id}/{block_id}', NULL, NULL, '{"id":29,"name":"sonata_page_cache_esi","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875585","updated_at":"1344875689","slug":"sonata-page-cache-esi-manager-page-id-block-id","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:45:00', NULL, '2012-08-15 16:45:00', '2012-08-15 16:45:00'),
(511, 1, 30, 'catchAll', 1, 1, 1, 'catchAll', '/{path}', NULL, NULL, '{"id":30,"name":"catchAll","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344875586","updated_at":"1344875689","slug":"path","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:45:00', NULL, '2012-08-15 16:45:00', '2012-08-15 16:45:00'),
(512, 1, 31, '_page_internal_error_not_found', 1, 1, 0, '_page_internal_error_not_found', NULL, NULL, NULL, '{"id":31,"name":"_page_internal_error_not_found","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":null,"created_at":"1344875586","updated_at":"1344875689","slug":"n-a","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:45:00', NULL, '2012-08-15 16:45:00', '2012-08-15 16:45:01'),
(513, 1, 32, '_page_internal_error_fatal', 1, 1, 0, '_page_internal_error_fatal', NULL, NULL, NULL, '{"id":32,"name":"_page_internal_error_fatal","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":null,"created_at":"1344875586","updated_at":"1344875689","slug":"n-a","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:45:01', NULL, '2012-08-15 16:45:01', '2012-08-15 16:45:01'),
(514, 1, 64, 'sonata_news_add_comment', 1, 1, 1, 'sonata_news_add_comment', '/news/add-comment/{id}', NULL, NULL, '{"id":64,"name":"sonata_news_add_comment","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876045","slug":"news-add-comment-id","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:45:01', NULL, '2012-08-15 16:45:01', '2012-08-15 16:45:01'),
(515, 1, 65, 'sonata_news_archive_monthly', 1, 1, 1, 'sonata_news_archive_monthly', '/news/archive/{year}/{month}.{_format}', NULL, NULL, '{"id":65,"name":"sonata_news_archive_monthly","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876046","slug":"news-archive-year-month-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:45:01', NULL, '2012-08-15 16:45:01', '2012-08-15 16:45:01'),
(516, 1, 66, 'sonata_news_tag', 1, 1, 1, 'sonata_news_tag', '/news/tag/{tag}.{_format}', NULL, NULL, '{"id":66,"name":"sonata_news_tag","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876046","slug":"news-tag-tag-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:45:01', NULL, '2012-08-15 16:45:01', '2012-08-15 16:45:01');
INSERT INTO `page__snapshot` (`id`, `site_id`, `page_id`, `route_name`, `position`, `enabled`, `decorate`, `name`, `url`, `parent_id`, `target_id`, `content`, `publication_date_start`, `publication_date_end`, `created_at`, `updated_at`) VALUES
(517, 1, 67, 'sonata_news_category', 1, 1, 1, 'sonata_news_category', '/news/category/{category}.{_format}', NULL, NULL, '{"id":67,"name":"sonata_news_category","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876046","slug":"news-category-category-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:45:02', NULL, '2012-08-15 16:45:02', '2012-08-15 16:45:02'),
(518, 1, 68, 'sonata_news_archive_yearly', 1, 1, 1, 'sonata_news_archive_yearly', '/news/archive/{year}.{_format}', NULL, NULL, '{"id":68,"name":"sonata_news_archive_yearly","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876046","slug":"news-archive-year-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:45:02', NULL, '2012-08-15 16:45:02', '2012-08-15 16:45:02'),
(519, 1, 69, 'sonata_news_archive', 1, 1, 1, 'sonata_news_archive', '/news/archive.{_format}', NULL, NULL, '{"id":69,"name":"sonata_news_archive","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876047","slug":"news-archive-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:45:02', '2012-08-17 11:31:16', '2012-08-15 16:45:02', '2012-08-15 16:45:02'),
(520, 1, 70, 'sonata_news_comment_moderation', 1, 1, 1, 'sonata_news_comment_moderation', '/news/comment/moderation/{commentId}/{hash}/{status}', NULL, NULL, '{"id":70,"name":"sonata_news_comment_moderation","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876047","slug":"news-comment-moderation-commentid-hash-status","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:45:02', NULL, '2012-08-15 16:45:02', '2012-08-15 16:45:02'),
(521, 1, 71, 'sonata_news_view', 1, 1, 1, 'sonata_news_view', '/news/{permalink}.{_format}', NULL, NULL, '{"id":71,"name":"sonata_news_view","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1344876047","slug":"news-permalink-format","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:45:02', NULL, '2012-08-15 16:45:02', '2012-08-15 16:45:03'),
(522, 1, 72, 'sonata_news_home', 1, 1, 1, 'sonata_news_home', '/news/', NULL, NULL, '{"id":72,"name":"sonata_news_home","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876025","updated_at":"1344876047","slug":"news","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:45:03', NULL, '2012-08-15 16:45:03', '2012-08-15 16:45:03'),
(523, 1, 82, 'appsonata_view_blog', 1, 1, 1, 'appsonata_view_blog', '/blog/blog', NULL, NULL, '{"id":82,"name":"appsonata_view_blog","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1345029523","updated_at":"1345041540","slug":"blog","parent_id":false,"target_id":false,"blocks":[]}', '2012-08-15 16:45:03', NULL, '2012-08-15 16:45:03', '2012-08-15 16:45:03'),
(565, 1, 69, 'sonata_news_archive', 1, 1, 1, 'sonata_news_archive', '/news/archive.{_format}', NULL, NULL, '{"id":69,"name":"sonata_news_archive","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1345195314","slug":"news-archive-format","parent_id":false,"target_id":false,"blocks":[{"id":15,"enabled":true,"position":1,"settings":{"name":"content_top","layout":"{{ CONTENT }} test","orientation":"block"},"type":"sonata.page.block.container","created_at":"1345194522","updated_at":"1345195314","blocks":[]},{"id":16,"enabled":true,"position":1,"settings":{"name":"content_bottom"},"type":"sonata.page.block.container","created_at":"1345194522","updated_at":"1345194522","blocks":[]}]}', '2012-08-17 11:31:16', '2012-08-17 15:29:10', '2012-08-17 11:31:16', '2012-08-17 11:31:16'),
(566, 1, 69, 'sonata_news_archive', 1, 1, 1, 'sonata_news_archive', '/news/archive.{_format}', NULL, NULL, '{"id":69,"name":"sonata_news_archive","javascript":null,"stylesheet":null,"raw_headers":null,"title":null,"meta_description":null,"meta_keyword":null,"template_code":"default","request_method":"GET|POST|HEAD|DELETE|PUT","created_at":"1344876024","updated_at":"1345209782","slug":"news-archive-format","parent_id":false,"target_id":false,"blocks":[{"id":15,"enabled":true,"position":1,"settings":{"name":"content_top","layout":"{{ CONTENT }} top content","orientation":"block"},"type":"sonata.page.block.container","created_at":"1345194522","updated_at":"1345210048","blocks":[]},{"id":16,"enabled":true,"position":1,"settings":{"name":"content_bottom","layout":"{{ CONTENT }}  bottom content","orientation":"block"},"type":"sonata.page.block.container","created_at":"1345194522","updated_at":"1345210053","blocks":[]}]}', '2012-08-17 15:29:00', NULL, '2012-08-17 15:29:10', '2012-08-17 15:29:16');

-- --------------------------------------------------------

--
-- Structure de la table `sly_url_shortener`
--

CREATE TABLE IF NOT EXISTS `sly_url_shortener` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_entity` varchar(255) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `hash` varchar(255) NOT NULL,
  `short_url` varchar(255) NOT NULL,
  `long_url` varchar(255) NOT NULL,
  `provider` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `long_url_idx` (`long_url`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `sly_url_shortener`
--


--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `fos_user_user_group`
--
ALTER TABLE `fos_user_user_group`
  ADD CONSTRAINT `FK_B3C77447A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user_user` (`id`),
  ADD CONSTRAINT `FK_B3C77447FE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_user_group` (`id`);

--
-- Contraintes pour la table `media__gallery_media`
--
ALTER TABLE `media__gallery_media`
  ADD CONSTRAINT `FK_80D4C5414E7AF8F` FOREIGN KEY (`gallery_id`) REFERENCES `media__gallery` (`id`),
  ADD CONSTRAINT `FK_80D4C541EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media__media` (`id`);

--
-- Contraintes pour la table `news__comment`
--
ALTER TABLE `news__comment`
  ADD CONSTRAINT `FK_A90210404B89032C` FOREIGN KEY (`post_id`) REFERENCES `news__post` (`id`);

--
-- Contraintes pour la table `news__post`
--
ALTER TABLE `news__post`
  ADD CONSTRAINT `FK_7D109BC812469DE2` FOREIGN KEY (`category_id`) REFERENCES `news__category` (`id`),
  ADD CONSTRAINT `FK_7D109BC83DA5256D` FOREIGN KEY (`image_id`) REFERENCES `media__media` (`id`),
  ADD CONSTRAINT `FK_7D109BC8F675F31B` FOREIGN KEY (`author_id`) REFERENCES `fos_user_user` (`id`);

--
-- Contraintes pour la table `news__post_tag`
--
ALTER TABLE `news__post_tag`
  ADD CONSTRAINT `FK_682B20514B89032C` FOREIGN KEY (`post_id`) REFERENCES `news__post` (`id`),
  ADD CONSTRAINT `FK_682B2051BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `news__tag` (`id`);

--
-- Contraintes pour la table `page__bloc`
--
ALTER TABLE `page__bloc`
  ADD CONSTRAINT `FK_FCDC1A97727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `page__bloc` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_FCDC1A97C4663E4` FOREIGN KEY (`page_id`) REFERENCES `page__page` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `page__page`
--
ALTER TABLE `page__page`
  ADD CONSTRAINT `FK_2FAE39ED158E0B66` FOREIGN KEY (`target_id`) REFERENCES `page__page` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2FAE39ED727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `page__page` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2FAE39EDF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `page__site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `page__snapshot`
--
ALTER TABLE `page__snapshot`
  ADD CONSTRAINT `FK_3963EF9AC4663E4` FOREIGN KEY (`page_id`) REFERENCES `page__page` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_3963EF9AF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `page__site` (`id`) ON DELETE CASCADE;
