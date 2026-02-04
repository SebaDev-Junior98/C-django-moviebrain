-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 23-01-2026 a las 21:51:12
-- Versión del servidor: 8.0.27
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `moviebrain`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Familiar'),
(2, 'Adulto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 40),
(2, 1, 28),
(3, 1, 44),
(4, 2, 32),
(5, 2, 37),
(6, 2, 40),
(7, 2, 41),
(8, 2, 44),
(9, 2, 25),
(10, 2, 28),
(11, 2, 29),
(12, 1, 32);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add Género', 7, 'add_genero'),
(26, 'Can change Género', 7, 'change_genero'),
(27, 'Can delete Género', 7, 'delete_genero'),
(28, 'Can view Género', 7, 'view_genero'),
(29, 'Can add Calificacion', 8, 'add_calificacion'),
(30, 'Can change Calificacion', 8, 'change_calificacion'),
(31, 'Can delete Calificacion', 8, 'delete_calificacion'),
(32, 'Can view Calificacion', 8, 'view_calificacion'),
(33, 'Can add Comentario', 9, 'add_comentario'),
(34, 'Can change Comentario', 9, 'change_comentario'),
(35, 'Can delete Comentario', 9, 'delete_comentario'),
(36, 'Can view Comentario', 9, 'view_comentario'),
(37, 'Can add Película', 10, 'add_pelicula'),
(38, 'Can change Película', 10, 'change_pelicula'),
(39, 'Can delete Película', 10, 'delete_pelicula'),
(40, 'Can view Película', 10, 'view_pelicula'),
(41, 'Can add Recomendación', 11, 'add_recomendacion'),
(42, 'Can change Recomendación', 11, 'change_recomendacion'),
(43, 'Can delete Recomendación', 11, 'delete_recomendacion'),
(44, 'Can view Recomendación', 11, 'view_recomendacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_spanish_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$1000000$z0h5an6lggXN1GJM5eE1pl$cSK2iyPc0shfGeyer45TyvGmQg/uvfGOdV6g5ZPOke0=', '2026-01-16 20:02:50.737049', 1, 'admin', '', '', 'admin@correo.cl', 1, 1, '2025-12-18 21:39:46.640397'),
(2, 'pbkdf2_sha256$1000000$G0Z2C0uK0UXwhkGuicljWl$Gy38Q7vYdLnEkZhw7dA4GcG4QoCcWqI31PRoYYnlOwk=', '2026-01-16 20:19:24.886190', 0, 'joaquin', 'joaquin', 'lopez', 'j.lopez@correo.cl', 0, 1, '2025-12-22 20:10:57.000000'),
(3, 'pbkdf2_sha256$1000000$IF9JTeh6R22ncDXRvwcphD$Xrh3zo7iczBoTsLRT2rH9cDNnJPdoetDTpoVbYPmIk8=', '2026-01-16 20:17:22.993487', 0, 'seba', '', '', 'wachapsacroth@gmail.com', 0, 1, '2026-01-05 21:11:43.786687'),
(4, 'pbkdf2_sha256$1000000$0pgC2S1ewB4MxnsQ5Ntp60$w96SfdEIxNF2at9QxOWem5WzMzSSV6U4i6MIQi704M0=', NULL, 0, 'sebastian_flores', '', '', 'sebastian.flores95@inacapmail.cl', 0, 1, '2026-01-07 21:45:17.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 4, 2),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

DROP TABLE IF EXISTS `calificacion`;
CREATE TABLE IF NOT EXISTS `calificacion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `puntuacion` int UNSIGNED NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calificacion_usuario_id_2eccbfeb` (`usuario_id`)
) ;

--
-- Volcado de datos para la tabla `calificacion`
--

INSERT INTO `calificacion` (`id`, `puntuacion`, `fecha`, `usuario_id`) VALUES
(1, 5, '2025-12-31 20:57:42.419071', 1),
(2, 3, '2025-12-31 21:05:15.711993', 1),
(3, 4, '2026-01-05 21:06:15.988201', 1),
(4, 6, '2026-01-05 21:06:22.819880', 1),
(5, 1, '2026-01-05 21:06:29.434920', 1),
(6, 1, '2026-01-16 20:17:52.794787', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

DROP TABLE IF EXISTS `comentario`;
CREATE TABLE IF NOT EXISTS `comentario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `texto` longtext COLLATE utf8_spanish_ci NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comentario_usuario_id_e164ef9d` (`usuario_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`id`, `texto`, `fecha`, `usuario_id`) VALUES
(1, 'muy buena la aplicacion funciona y es divertida para recomendar pelis', '2025-12-31 20:58:06.079115', 1),
(2, 'xd', '2025-12-31 21:01:29.888262', 1),
(3, 'buena aplicacion responsiva', '2026-01-05 21:51:35.995339', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_spanish_ci,
  `object_repr` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8_spanish_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-12-22 20:04:45.712872', '1', 'Drama', 1, '[{\"added\": {}}]', 7, 1),
(2, '2025-12-22 20:09:01.901103', '3', 'Matar a Pinochet (Drama)', 1, '[{\"added\": {}}]', 10, 1),
(3, '2025-12-22 20:09:25.262137', '3', 'Matar a Pinochet (Drama)', 3, '', 10, 1),
(4, '2025-12-22 20:09:25.262137', '2', 'Matar a Pinochet (Drama)', 3, '', 10, 1),
(5, '2025-12-22 20:10:58.456053', '2', 'joaquin', 1, '[{\"added\": {}}]', 4, 1),
(6, '2025-12-22 20:11:53.264167', '2', 'joaquin', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(7, '2025-12-22 20:13:42.382932', '1', 'Familiar', 1, '[{\"added\": {}}]', 3, 1),
(8, '2025-12-22 20:18:33.403132', '2', 'Adulto', 1, '[{\"added\": {}}]', 3, 1),
(9, '2025-12-22 20:18:56.007846', '1', 'Familiar', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 1),
(10, '2025-12-31 20:33:55.178964', '1', 'Recomendación de admin', 1, '[{\"added\": {}}]', 11, 1),
(11, '2026-01-16 20:03:38.655808', '4', 'sebastian_flores', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(12, '2026-01-16 20:03:52.064309', '2', 'joaquin', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'primeraApp', 'genero'),
(8, 'primeraApp', 'calificacion'),
(9, 'primeraApp', 'comentario'),
(10, 'primeraApp', 'pelicula'),
(11, 'primeraApp', 'recomendacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-12-18 21:34:33.978505'),
(2, 'auth', '0001_initial', '2025-12-18 21:34:34.512707'),
(3, 'admin', '0001_initial', '2025-12-18 21:34:34.718382'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-12-18 21:34:34.727966'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-12-18 21:34:34.766750'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-12-18 21:34:34.890944'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-12-18 21:34:34.941194'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-12-18 21:34:34.992988'),
(9, 'auth', '0004_alter_user_username_opts', '2025-12-18 21:34:35.000022'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-12-18 21:34:35.040039'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-12-18 21:34:35.040039'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-12-18 21:34:35.049969'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-12-18 21:34:35.090250'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-12-18 21:34:35.130076'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-12-18 21:34:35.174110'),
(16, 'auth', '0011_update_proxy_permissions', '2025-12-18 21:34:35.180182'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-12-18 21:34:35.220052'),
(18, 'primeraApp', '0001_initial', '2025-12-18 21:34:35.583131'),
(19, 'sessions', '0001_initial', '2025-12-18 21:34:35.625375'),
(20, 'primeraApp', '0002_alter_calificacion_puntuacion', '2025-12-23 01:06:16.045038'),
(21, 'primeraApp', '0002_alter_genero_creado_alter_pelicula_creado_and_more', '2025-12-31 21:01:05.562379'),
(22, 'primeraApp', '0003_alter_comentario_texto', '2025-12-31 21:01:05.654995'),
(23, 'primeraApp', '0004_pelicula_foto', '2026-01-06 21:45:22.168946'),
(24, 'primeraApp', '0005_alter_pelicula_foto', '2026-01-07 21:16:31.549359'),
(25, 'primeraApp', '0006_alter_pelicula_foto', '2026-01-07 21:32:41.824356');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `session_data` longtext COLLATE utf8_spanish_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('bxtjh3rn4hvzpyjctx7zgbyj0zpcoz7m', '.eJxVjMEOwiAQRP-FsyG4lAIevfsNZJcFqRpISnsy_rtt0oMe5jLvzbxFwHUpYe1pDhOLiziL029HGJ-p7oAfWO9NxlaXeSK5K_KgXd4ap9f1cP8OCvayrcF7jBYRcgKTQEEaFTsa1LAlO6TMYJTSTDaDJueNiaw1ZDd6RuvF5wvstTf9:1vWLjN:4kHHFUt9Ip4yFrF9GmuRzHQ8_DRMCspsCqTg7zlmvHk', '2026-01-01 21:40:17.178238'),
('yqpabfuihvsm50ovc7wgf7va1dtelviw', '.eJxVzM0OwiAQBOB34WwILH_Ro3efgSzsKlUDSWlPje8uTXrQ68w3s4mI61Li2nmOE4mLAHH6zRLmF9e9oCfWR5O51WWektyJPNoub434fT3s30HBXsbaKwXZWWBAhmDIsdJWoc_urI13lJzTlkKwHmBYQ6iDSeiTD0PcUXy-sAs2kw:1vgqI0:t1C_FGkMSOSJGI5m8pL3TXUYq8PW0CkgtWR8w8B60oE', '2026-01-30 20:19:24.887244');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

DROP TABLE IF EXISTS `genero`;
CREATE TABLE IF NOT EXISTS `genero` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_genero` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `creado` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id`, `nombre_genero`, `creado`) VALUES
(1, 'Drama', '2025-12-22 20:04:33.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
CREATE TABLE IF NOT EXISTS `pelicula` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `anio` int DEFAULT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `puntuacion` int UNSIGNED NOT NULL,
  `creado` datetime(6) NOT NULL,
  `generos_id` bigint NOT NULL,
  `foto` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pelicula_generos_id_e99d9b4b` (`generos_id`)
) ;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`id`, `titulo`, `anio`, `descripcion`, `puntuacion`, `creado`, `generos_id`, `foto`) VALUES
(4, 'Matar a pinochet', 2020, '\"Matar a Pinochet\" se trata de la película chilena de 2020 que narra el intento de asesinato contra el dictador Augusto Pinochet', 10, '2026-01-07 21:42:52.978904', 1, 'listar_peliculas/07012026_214253.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `primeraapp_recomendacion`
--

DROP TABLE IF EXISTS `primeraapp_recomendacion`;
CREATE TABLE IF NOT EXISTS `primeraapp_recomendacion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) NOT NULL,
  `peliculas_id` bigint NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `primeraApp_recomendacion_peliculas_id_219cc08d` (`peliculas_id`),
  KEY `primeraApp_recomendacion_usuario_id_daafab9f` (`usuario_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `primeraapp_recomendacion`
--

INSERT INTO `primeraapp_recomendacion` (`id`, `fecha`, `peliculas_id`, `usuario_id`) VALUES
(1, '2025-12-31 20:33:55.162154', 1, 1),
(2, '2025-12-31 20:36:07.859394', 1, 1),
(3, '2026-01-05 21:05:33.403310', 1, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
