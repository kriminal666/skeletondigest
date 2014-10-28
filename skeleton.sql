-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 16-10-2014 a las 21:44:19
-- Versión del servidor: 5.5.38-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `skeleton`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('1fc94c682873f6c777741f87bd92ae95', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:33.0) Gecko/20100101 Firefox/33.0', 1413401675, 'a:12:{s:8:"username";s:5:"admin";s:2:"cn";s:26:"System Administrator-admin";s:2:"dn";s:57:"cn=System Administrator-admin,ou=people,dc=iesebre,dc=com";s:4:"role";i:3;s:5:"roles";a:1:{i:0;s:14:"intranet_admin";}s:7:"rolesdn";a:1:{i:0;s:35:"cn=intranet_admin,dc=iesebre,dc=com";}s:9:"logged_in";b:1;s:8:"identity";s:5:"admin";s:7:"user_id";s:1:"1";s:14:"old_last_login";s:19:"2014-10-15 21:34:35";s:16:"current_language";s:7:"catalan";s:17:"flash:old:message";s:36:"<p>##group_creation_successful##</p>";}'),
('72b8612f1256d166adef73ba88b70b06', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:33.0) Gecko/20100101 Firefox/33.0', 1413488573, 'a:13:{s:9:"user_data";s:0:"";s:8:"username";s:5:"admin";s:2:"cn";s:26:"System Administrator-admin";s:2:"dn";s:57:"cn=System Administrator-admin,ou=people,dc=iesebre,dc=com";s:4:"role";i:3;s:5:"roles";a:1:{i:0;s:14:"intranet_admin";}s:7:"rolesdn";a:1:{i:0;s:35:"cn=intranet_admin,dc=iesebre,dc=com";}s:9:"logged_in";b:1;s:8:"identity";s:5:"admin";s:7:"user_id";s:1:"1";s:14:"old_last_login";s:19:"2014-10-15 21:34:35";s:16:"current_language";s:7:"catalan";s:17:"flash:old:message";s:0:"";}'),
('c86a4072bd7f80f4f1971327b9978d4a', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:33.0) Gecko/20100101 Firefox/33.0', 1413438302, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'intranet_admin', 'Automatic group added as ldap skeleton role');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `locationId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `shortName` varchar(150) NOT NULL,
  `description` text,
  `entryDate` datetime NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creationUserId` int(11) DEFAULT NULL,
  `lastupdateUserId` int(11) DEFAULT NULL,
  `parentLocation` int(11) DEFAULT NULL,
  `markedForDeletion` enum('n','y') NOT NULL,
  `markedForDeletionDate` datetime NOT NULL,
  PRIMARY KEY (`locationId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organizational_unit`
--

CREATE TABLE IF NOT EXISTS `organizational_unit` (
  `organizational_unitId` int(11) NOT NULL AUTO_INCREMENT,
  `externalCode` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `shortName` varchar(150) NOT NULL,
  `description` text,
  `entryDate` datetime NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creationUserId` int(11) DEFAULT NULL,
  `lastupdateUserId` int(11) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `markedForDeletion` enum('n','y') NOT NULL,
  `markedForDeletionDate` datetime NOT NULL,
  PRIMARY KEY (`organizational_unitId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_givenName` varchar(255) CHARACTER SET utf8 NOT NULL,
  `person_sn1` varchar(255) CHARACTER SET utf8 NOT NULL,
  `person_sn2` varchar(255) CHARACTER SET utf8 NOT NULL,
  `person_email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `person_secondary_email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `person_official_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `person_official_id_type` int(11) NOT NULL,
  `person_date_of_birth` date NOT NULL,
  `person_gender` enum('F','M') CHARACTER SET utf8 NOT NULL,
  `person_secondary_official_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `person_secondary_official_id_type` int(11) NOT NULL,
  `person_homePostalAddress` varchar(750) CHARACTER SET utf8 NOT NULL,
  `person_photo` varchar(255) CHARACTER SET utf8 NOT NULL,
  `person_locality_id` int(11) NOT NULL,
  `person_telephoneNumber` varchar(255) CHARACTER SET utf8 NOT NULL,
  `person_mobile` varchar(255) CHARACTER SET utf8 NOT NULL,
  `person_bank_account_id` int(11) NOT NULL,
  `person_notes` text CHARACTER SET utf8 NOT NULL,
  `person_entryDate` datetime NOT NULL,
  `person_last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `person_creationUserId` int(11) DEFAULT NULL,
  `person_lastupdateUserId` int(11) DEFAULT NULL,
  `person_markedForDeletion` enum('n','y') NOT NULL DEFAULT 'n',
  `person_markedForDeletionDate` datetime NOT NULL,
  `username_original_ldap` varchar(255) NOT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(80) NOT NULL,
  `mainOrganizationaUnitId` int(11) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_realm` varchar(50) NOT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `mainOrganizationaUnitId`, `salt`, `email`, `activation_code`, `forgotten_password_realm`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `person_id`) VALUES
(1, '\0\0', 'admin', '8ff885e683270e302f672b33c4484ffc', 0, NULL, '0', NULL, '', NULL, NULL, NULL, '2014-10-15 21:34:35', '2014-10-16 21:43:05', 1, 'System', 'Administrator', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_groups`
--

CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_preferences`
--

CREATE TABLE IF NOT EXISTS `user_preferences` (
  `user_preferencesId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `language` enum('catalan','spanish','english') NOT NULL DEFAULT 'catalan',
  `theme` enum('flexigrid','datatables','twitter-bootstrap') NOT NULL DEFAULT 'flexigrid',
  `dialogforms` enum('n','y') NOT NULL DEFAULT 'n',
  `description` text,
  `entryDate` datetime NOT NULL,
  `manualEntryDate` datetime NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `manualLast_update` datetime NOT NULL,
  `creationUserId` int(11) DEFAULT NULL,
  `lastupdateUserId` int(11) DEFAULT NULL,
  `markedForDeletion` enum('n','y') NOT NULL DEFAULT 'n',
  `markedForDeletionDate` datetime NOT NULL,
  PRIMARY KEY (`user_preferencesId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
