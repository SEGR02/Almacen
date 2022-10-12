-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-10-2022 a las 19:28:12
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2
-- comprobando que funcione el github
-- comprobando github again

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id_producto` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_imagen` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `fechaCaptura` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id_producto`, `id_categoria`, `id_imagen`, `id_usuario`, `nombre`, `descripcion`, `cantidad`, `precio`, `fechaCaptura`) VALUES
(4, 2, 4, 1, 'cilindro', 'horse', 28, 150, '2022-07-27'),
(6, 3, 6, 1, 'Cauchos', 'Owen', 34, 100, '2022-07-27'),
(7, 4, 7, 1, 'relacion', 'cadena45', 46, 110, '2022-07-27'),
(8, 5, 8, 1, 'Rin', 'KLR', 117, 50, '2022-09-16'),
(9, 5, 9, 1, 'AmortiguadO', 'Suzuki', 56, 80, '2022-09-18'),
(10, 4, 10, 1, 'Bujia', 'Owen', 54, 250, '2022-09-18'),
(12, 2, 12, 1, 'Cilindro TX', 'TX', 120, 30, '2022-09-27'),
(13, 3, 14, 1, 'Dunlop', 'Delantero', 2, 45, '2022-10-10'),
(14, 3, 15, 1, 'yuiyuiyu', 'yiuyi', 45, 20, '2022-10-11'),
(15, 4, 16, 1, 'DXDSD', 'JKJKJK', 50, 50, '2022-10-11');

--
-- Disparadores `articulos`
--
DELIMITER $$
CREATE TRIGGER `log_articulos` AFTER UPDATE ON `articulos` FOR EACH ROW INSERT INTO insertaralumno (accion) VALUES (concat("Se actualizo un artículo:  ",old.nombre," a ",new.nombre,"; ",old.descripcion," a ",new.descripcion,"; ",old.cantidad," a ",new.cantidad,"; ",old.precio," a ",new.precio,""))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_articulosii` AFTER INSERT ON `articulos` FOR EACH ROW INSERT INTO insertaralumno (accion) VALUES ("Fue ingrsado un artículo")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_articulosiii` AFTER DELETE ON `articulos` FOR EACH ROW INSERT INTO insertaralumno (accion) VALUES ("Fue borrado un articulo")
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombreCategoria` varchar(150) DEFAULT NULL,
  `fechaCaptura` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `id_usuario`, `nombreCategoria`, `fechaCaptura`) VALUES
(2, 1, 'Cilindros', '2022-07-27'),
(3, 1, 'Cauchos', '2022-07-27'),
(4, 1, 'Relaciones', '2022-07-27'),
(5, 1, 'Bujias', '2022-09-16'),
(6, 1, 'Cadenas', '2022-09-25'),
(9, 1, 'Carroceria', '2022-10-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `apellido` varchar(200) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `telefono` varchar(200) DEFAULT NULL,
  `rif` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `id_usuario`, `nombre`, `apellido`, `direccion`, `email`, `telefono`, `rif`) VALUES
(2, 1, 'Daniel ', 'MÃ¡rquez ', 'San CristÃ³bal', 'daniel0802ams@gmail.com', '04247466987', '295443380'),
(3, 1, 'Pablo', 'Dominguez', 'ColÃ³n', 'pablod01@gmail.com', '04145987210', '185236984'),
(4, 1, 'Maria', 'Gonzalez', 'TÃ¡riba', 'mariag@hotmail.com', '04247895623', '20159763'),
(5, 1, 'NicolÃ¡s', 'Ortega', 'Rubio', 'Nicolaso@gmail.com', '04145287341', '198542369'),
(8, 1, 'Paul ', 'Bazo', 'Macarena 14', 'mancipe@hotmail.com', '04247677481', '9149669-7'),
(9, 8, 'Juan', 'Pernia', 'Tariba', 'mancipe@gmail.com', '3537805', '3544788-e');

--
-- Disparadores `clientes`
--
DELIMITER $$
CREATE TRIGGER `delcliente` AFTER DELETE ON `clientes` FOR EACH ROW INSERT INTO regcliente (accion) VALUES ("Un cliente fue eliminado")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `inscliente` AFTER INSERT ON `clientes` FOR EACH ROW INSERT INTO regcliente (accion) VALUES ("Un nuevo cliente fue registrado")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updcliente` AFTER UPDATE ON `clientes` FOR EACH ROW INSERT INTO regcliente (accion) VALUES (concat("Se actualizaron datos de un cliente; los datos actualizados son: ",old.nombre," a ",new.nombre,"; ",old.apellido," a ",new.apellido,"; ",old.direccion," a ",new.direccion,"; ",old.email," a ",new.email,"; ",old.telefono," a ",new.telefono,"; ",old.rif," a ",new.rif,""))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

CREATE TABLE `imagenes` (
  `id_imagen` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(500) DEFAULT NULL,
  `ruta` varchar(500) DEFAULT NULL,
  `fechaSubida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `imagenes`
--

INSERT INTO `imagenes` (`id_imagen`, `id_categoria`, `nombre`, `ruta`, `fechaSubida`) VALUES
(4, 2, '1212.jpg', '../../archivos/1212.jpg', '2022-07-27'),
(6, 3, 'descarga.jpg', '../../archivos/descarga.jpg', '2022-07-27'),
(7, 4, 'cadena_moto_2.jpg', '../../archivos/cadena_moto_2.jpg', '2022-07-27'),
(8, 5, '619ZKXAruKL._AC_SX466_.jpg', '../../archivos/619ZKXAruKL._AC_SX466_.jpg', '2022-09-16'),
(9, 5, '51hQSm9ac2L._AC_SX679_.jpg', '../../archivos/51hQSm9ac2L._AC_SX679_.jpg', '2022-09-18'),
(10, 4, '814ryeJ6dUL._AC_SX679_.jpg', '../../archivos/814ryeJ6dUL._AC_SX679_.jpg', '2022-09-18'),
(11, 2, '5f4c93be7de34.jpg', '../../archivos/5f4c93be7de34.jpg', '2022-09-18'),
(12, 2, 'cilindro.jpg', '../../archivos/cilindro.jpg', '2022-09-27'),
(13, 2, 'caucho.jpg', '../../archivos/caucho.jpg', '2022-09-27'),
(14, 3, 'airesol.jpg', '../../archivos/airesol.jpg', '2022-10-10'),
(15, 3, 'ererer.jpg', '../../archivos/ererer.jpg', '2022-10-11'),
(16, 4, 'ererer.jpg', '../../archivos/ererer.jpg', '2022-10-11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insertaralumno`
--

CREATE TABLE `insertaralumno` (
  `id` int(5) NOT NULL,
  `accion` varchar(255) NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `insertaralumno`
--

INSERT INTO `insertaralumno` (`id`, `accion`, `fecha_hora`) VALUES
(1, 'Se actualizo un artículo', '2022-09-27 01:49:46'),
(2, 'Fue ingrsado un artículo', '2022-09-27 01:55:21'),
(3, 'Se actualizo un artículo:  relacion a relacion cadena45 a cadena45 50 a 50 50 a 110', '2022-09-27 02:06:30'),
(4, 'Fue borrado un articulo', '2022-09-27 02:09:26'),
(5, 'Se actualizo un artículo:  ioip a ioip ipuiop a ipu 89 a 89 898 a 898', '2022-09-27 02:28:02'),
(6, 'Se actualizo un artículo:  ioip a io ipu a ipu 89 a 89 898 a 898', '2022-09-27 02:28:07'),
(7, 'Se actualizo un artículo:  io a io ipu a ipu 89 a 8 898 a 898', '2022-09-27 02:28:19'),
(8, 'Se actualizo un artículo:  io a io ipu a ipu 8 a 8 898 a 89', '2022-09-27 02:28:22'),
(9, 'Se actualizo un artículo:  cilindro horse II a cilindro  horse a hor 10 a 1 20 a 2', '2022-09-27 02:29:07'),
(10, 'Se actualizo un artículo:  cilindro a cilindro; horse a horse; 44 a 43; 150 a 150', '2022-09-27 03:08:28'),
(11, 'Se actualizo un artículo:  cilindro a cilindro; horse a horse; 43 a 42; 150 a 150', '2022-10-06 19:37:25'),
(12, 'Se actualizo un artículo:  io a Bujia; ipu a pequeño; 8 a 8; 89 a 89', '2022-10-06 21:33:06'),
(13, 'Se actualizo un artículo:  cilindro a cilindro; horse a horse; 42 a 42; 150 a 150', '2022-10-06 21:35:28'),
(14, 'Se actualizo un artículo:  pirelli a pirelli; 17 a 17; 50 a 50; 100 a 100', '2022-10-06 21:36:27'),
(15, 'Se actualizo un artículo:  relacion a relacion; cadena45 a cadena45; 50 a 50; 110 a 110', '2022-10-06 21:38:09'),
(16, 'Se actualizo un artículo:  3123 a 3123; ddsda a ddsda; 120 a 120; 123 a 50', '2022-10-06 21:38:36'),
(17, 'Se actualizo un artículo:  ghj a ghj; tyutyu a tyutyu; 56 a 56; 565464 a 80', '2022-10-06 21:39:09'),
(18, 'Se actualizo un artículo:  ert a ert; ert a ert; 54 a 54; 345 a 250', '2022-10-06 21:39:27'),
(19, 'Se actualizo un artículo:  Bujia a Bujia; pequeño a pequeño; 8 a 8; 89 a 90', '2022-10-06 21:39:39'),
(20, 'Se actualizo un artículo:  cilindro  a cilindro ; hor a hor; 1 a 120; 2 a 30', '2022-10-06 21:39:58'),
(21, 'Se actualizo un artículo:  cilindro a cilindro; horse a horse; 42 a 41; 150 a 150', '2022-10-06 22:01:58'),
(22, 'Se actualizo un artículo:  pirelli a pirelli; 17 a 17; 50 a 49; 100 a 100', '2022-10-06 22:09:28'),
(23, 'Se actualizo un artículo:  pirelli a pirelli; 17 a 17; 49 a 48; 100 a 100', '2022-10-06 22:09:28'),
(24, 'Se actualizo un artículo:  3123 a 3123; ddsda a ddsda; 120 a 119; 50 a 50', '2022-10-06 22:09:29'),
(25, 'Se actualizo un artículo:  Bujia a Bujia; pequeño a Owen; 8 a 8; 90 a 90', '2022-10-07 00:14:21'),
(26, 'Fue borrado un articulo', '2022-10-07 00:14:52'),
(27, 'Se actualizo un artículo:  cilindro a cilindro; horse a horse; 41 a 40; 150 a 150', '2022-10-07 01:48:51'),
(28, 'Se actualizo un artículo:  pirelli a Cauchos; 17 a 17; 48 a 48; 100 a 100', '2022-10-07 02:44:11'),
(29, 'Se actualizo un artículo:  Cauchos a Cauchos; 17 a Owen; 48 a 48; 100 a 100', '2022-10-07 02:44:24'),
(30, 'Se actualizo un artículo:  cilindro  a ; hor a hor; 120 a 120; 30 a 30', '2022-10-07 02:45:55'),
(31, 'Se actualizo un artículo:   a ; hor a hor; 120 a 120; 30 a 30', '2022-10-07 02:46:28'),
(32, 'Se actualizo un artículo:   a Cilindro TX; hor a hor; 120 a 120; 30 a 30', '2022-10-07 02:46:45'),
(33, 'Se actualizo un artículo:  Cilindro TX a Cilindro TX; hor a TX; 120 a 120; 30 a 30', '2022-10-07 02:46:54'),
(34, 'Se actualizo un artículo:  ert a Bujia; ert a ert; 54 a 54; 250 a 250', '2022-10-09 15:14:43'),
(35, 'Se actualizo un artículo:  Bujia a Bujia; ert a Owen; 54 a 54; 250 a 250', '2022-10-09 15:14:51'),
(36, 'Se actualizo un artículo:  ghj a Amortiguador; tyutyu a tyutyu; 56 a 56; 80 a 80', '2022-10-09 15:15:03'),
(37, 'Se actualizo un artículo:  Amortiguador a Amortiguador; tyutyu a Suzuki; 56 a 56; 80 a 80', '2022-10-09 15:15:08'),
(38, 'Se actualizo un artículo:  3123 a Rin; ddsda a ddsda; 119 a 119; 50 a 50', '2022-10-09 15:15:17'),
(39, 'Se actualizo un artículo:  Rin a Rin; ddsda a KLR; 119 a 119; 50 a 50', '2022-10-09 15:15:22'),
(40, 'Se actualizo un artículo:  Cauchos a Cauchos; Owen a Owen; 48 a 47; 100 a 100', '2022-10-10 10:13:50'),
(41, 'Se actualizo un artículo:  Cauchos a Cauchos; Owen a Owen; 47 a 46; 100 a 100', '2022-10-10 10:14:11'),
(42, 'Se actualizo un artículo:  cilindro a cilindro; horse a horse; 40 a 39; 150 a 150', '2022-10-10 13:12:57'),
(43, 'Se actualizo un artículo:  cilindro a cilindro; horse a horse; 39 a 38; 150 a 150', '2022-10-10 13:12:57'),
(44, 'Se actualizo un artículo:  cilindro a cilindro; horse a horse; 38 a 37; 150 a 150', '2022-10-10 13:12:57'),
(45, 'Se actualizo un artículo:  Cauchos a Cauchos; Owen a Owen; 46 a 45; 100 a 100', '2022-10-10 13:12:57'),
(46, 'Se actualizo un artículo:  Cauchos a Cauchos; Owen a Owen; 45 a 44; 100 a 100', '2022-10-10 13:12:57'),
(47, 'Se actualizo un artículo:  Cauchos a Cauchos; Owen a Owen; 44 a 43; 100 a 100', '2022-10-10 13:14:11'),
(48, 'Se actualizo un artículo:  Cauchos a Cauchos; Owen a Owen; 43 a 42; 100 a 100', '2022-10-10 13:14:11'),
(49, 'Se actualizo un artículo:  Cauchos a Cauchos; Owen a Owen; 42 a 41; 100 a 100', '2022-10-10 13:14:11'),
(50, 'Se actualizo un artículo:  Cauchos a Cauchos; Owen a Owen; 41 a 40; 100 a 100', '2022-10-10 13:14:11'),
(51, 'Fue ingrsado un artículo', '2022-10-10 13:35:31'),
(52, 'Se actualizo un artículo:  Dunlop a Dunlop; Delantero a Delantero; 10 a 2; 45 a 45', '2022-10-10 13:35:46'),
(53, 'Se actualizo un artículo:  Cauchos a Cauchos; Owen a Owen; 40 a 39; 100 a 100', '2022-10-10 13:39:58'),
(54, 'Se actualizo un artículo:  Cauchos a Cauchos; Owen a Owen; 39 a 38; 100 a 100', '2022-10-10 13:39:58'),
(55, 'Se actualizo un artículo:  Cauchos a Cauchos; Owen a Owen; 38 a 37; 100 a 100', '2022-10-10 13:39:58'),
(56, 'Se actualizo un artículo:  Cauchos a Cauchos; Owen a Owen; 37 a 36; 100 a 100', '2022-10-10 13:39:58'),
(57, 'Se actualizo un artículo:  cilindro a cilindro; horse a horse; 37 a 36; 150 a 150', '2022-10-10 13:39:58'),
(58, 'Se actualizo un artículo:  cilindro a cilindro; horse a horse; 36 a 35; 150 a 150', '2022-10-10 13:39:58'),
(59, 'Se actualizo un artículo:  Rin a Rin; KLR a KLR; 119 a 118; 50 a 50', '2022-10-10 13:39:58'),
(60, 'Se actualizo un artículo:  Rin a Rin; KLR a KLR; 118 a 117; 50 a 50', '2022-10-10 13:39:58'),
(61, 'Se actualizo un artículo:  cilindro a cilindro; horse a horse; 35 a 34; 150 a 150', '2022-10-10 13:46:35'),
(62, 'Se actualizo un artículo:  cilindro a cilindro; horse a horse; 34 a 33; 150 a 150', '2022-10-10 13:46:35'),
(63, 'Se actualizo un artículo:  cilindro a cilindro; horse a horse; 33 a 32; 150 a 150', '2022-10-11 09:33:15'),
(64, 'Se actualizo un artículo:  cilindro a cilindro; horse a horse; 32 a 31; 150 a 150', '2022-10-11 09:34:08'),
(65, 'Se actualizo un artículo:  cilindro a cilindro; horse a horse; 31 a 30; 150 a 150', '2022-10-11 09:34:08'),
(66, 'Se actualizo un artículo:  Cauchos a Cauchos; Owen a Owen; 36 a 35; 100 a 100', '2022-10-11 09:41:11'),
(67, 'Se actualizo un artículo:  Cauchos a Cauchos; Owen a Owen; 35 a 34; 100 a 100', '2022-10-11 09:41:11'),
(68, 'Se actualizo un artículo:  cilindro a cilindro; horse a horse; 30 a 29; 150 a 150', '2022-10-11 09:54:50'),
(69, 'Se actualizo un artículo:  cilindro a cilindro; horse a horse; 29 a 28; 150 a 150', '2022-10-11 09:54:50'),
(70, 'Se actualizo un artículo:  relacion a relacion; cadena45 a cadena45; 50 a 49; 110 a 110', '2022-10-11 10:08:11'),
(71, 'Fue ingrsado un artículo', '2022-10-11 10:22:16'),
(72, 'Fue ingrsado un artículo', '2022-10-11 10:27:10'),
(73, 'Fue ingrsado un artículo', '2022-10-11 10:27:38'),
(74, 'Fue borrado un articulo', '2022-10-11 10:27:44'),
(75, 'Se actualizo un artículo:  Amortiguador a AmortiguadO; Suzuki a Suzuki; 56 a 56; 80 a 80', '2022-10-11 10:28:00'),
(76, 'Fue ingrsado un artículo', '2022-10-11 11:51:27'),
(77, 'Se actualizo un artículo:  horse a horsee3; horse a horse; 100 a 100; 100 a 100', '2022-10-11 11:51:44'),
(78, 'Fue borrado un articulo', '2022-10-11 11:51:48'),
(79, 'Se actualizo un artículo:  relacion a relacion; cadena45 a cadena45; 49 a 48; 110 a 110', '2022-10-11 12:44:13'),
(80, 'Se actualizo un artículo:  relacion a relacion; cadena45 a cadena45; 48 a 47; 110 a 110', '2022-10-11 12:44:13'),
(81, 'Se actualizo un artículo:  relacion a relacion; cadena45 a cadena45; 47 a 46; 110 a 110', '2022-10-11 12:44:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idproveedor` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `nombrec` text,
  `rife` int(11) DEFAULT NULL,
  `representante` text,
  `rifr` int(11) DEFAULT NULL,
  `telefonor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regcliente`
--

CREATE TABLE `regcliente` (
  `id` int(5) NOT NULL,
  `accion` varchar(255) NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `regcliente`
--

INSERT INTO `regcliente` (`id`, `accion`, `fecha_hora`) VALUES
(1, 'Se actualizaron datos de un cliente; los datos actualizados son: MASCULINO a MAS; rodriguez medina a rodriguez ; Caneyes municipio Guasimos a Caneyes Guasimos; miguell_19@hotmail.es a migue@hotmail.es; 04143754338 a 0414; 259777789 a 25977', '2022-09-27 02:50:08'),
(2, 'Un nuevo cliente fue registrado', '2022-10-06 23:44:47'),
(3, 'Se actualizaron datos de un cliente; los datos actualizados son: MAS a Miguel; rodriguez  a Rodriguez ; Caneyes Guasimos a Caneyes Guasimos; migue@hotmail.es a migue@hotmail.es; 0414 a 0414; 25977 a 25977', '2022-10-06 23:53:55'),
(4, 'Se actualizaron datos de un cliente; los datos actualizados son: Miguel a Miguel; Rodriguez  a Rodriguez ; Caneyes Guasimos a Caneyes Guasimos; migue@hotmail.es a migue@hotmail.es; 0414 a 0414; 25977 a 259777789', '2022-10-07 01:27:08'),
(5, 'Se actualizaron datos de un cliente; los datos actualizados son: Miguel a Miguel; Rodriguez  a Rodriguez ; Caneyes Guasimos a Caneyes Guasimos; migue@hotmail.es a migue@hotmail.es; 0414 a 04143754338; 259777789 a 259777789', '2022-10-07 01:27:29'),
(6, 'Un nuevo cliente fue registrado', '2022-10-07 01:31:54'),
(7, 'Se actualizaron datos de un cliente; los datos actualizados son: Miguel a Pablo Alberto; Rodriguez  a Dominguez Sanchez; Caneyes Guasimos a Lobatera; migue@hotmail.es a pablodom@gmail.com; 04143754338 a 04245214747; 259777789 a 185236984', '2022-10-07 01:35:57'),
(8, 'Se actualizaron datos de un cliente; los datos actualizados son: Pablo Alberto a Miguel Alejandro; Dominguez Sanchez a Rodriguez Medina; Lobatera a Caneyes municipio Guasimos; pablodom@gmail.com a miguell_19@hotmail.es; 04245214747 a 04143754338; 18523698', '2022-10-07 01:46:41'),
(9, 'Un nuevo cliente fue registrado', '2022-10-08 20:44:41'),
(10, 'Un nuevo cliente fue registrado', '2022-10-09 11:45:57'),
(11, 'Un nuevo cliente fue registrado', '2022-10-09 19:12:26'),
(12, 'Se actualizaron datos de un cliente; los datos actualizados son: Miguel Alejandro a Miguel Alejandro; Rodriguez Medina a Rodriguez Medina; Caneyes municipio Guasimos a Caneyes municipio Guasimos; miguell_19@hotmail.es a miguell_19@hotmail.es; 04143754338 ', '2022-10-09 20:24:29'),
(13, 'Un cliente fue eliminado', '2022-10-09 21:10:39'),
(14, 'Un nuevo cliente fue registrado', '2022-10-10 10:17:08'),
(15, 'Se actualizaron datos de un cliente; los datos actualizados son: Miguel Alejandro a Miguel Alejandro II; Rodriguez Medina a Rodriguez Medina; Caneyes municipio Guasimos a Caneyes municipio Guasimos; miguell_19@hotmail.es a miguell_19@hotmail.es; 041437543', '2022-10-10 13:04:08'),
(16, 'Un cliente fue eliminado', '2022-10-10 13:04:31'),
(17, 'Se actualizaron datos de un cliente; los datos actualizados son: Miguel Alejandro II a Miguel Alejandro II; Rodriguez Medina a Rodriguez Medina; Caneyes municipio Guasimos a Caneyes municipio Guasimos; miguell_19@hotmail.es a miguell_19@hotmail.es; 041437', '2022-10-10 13:10:19'),
(18, 'Un nuevo cliente fue registrado', '2022-10-10 13:37:29'),
(19, 'Un cliente fue eliminado', '2022-10-10 13:37:48'),
(20, 'Se actualizaron datos de un cliente; los datos actualizados son: Daniel Antonio a Daniel Antonio; MÃ¡rquez Santander a MÃ¡rquez Santander; San CristÃ³bal a San CristÃ³bal; daniel0802ams@gmail.com a daniel0802ams@gmail.com; 04247466987 a 04247466987; 29544', '2022-10-10 13:37:53'),
(21, 'Un nuevo cliente fue registrado', '2022-10-10 13:45:59'),
(22, 'Se actualizaron datos de un cliente; los datos actualizados son: Daniel Antonio a Daniel ; MÃ¡rquez Santander a MÃ¡rquez ; San CristÃ³bal a San CristÃ³bal; daniel0802ams@gmail.com a daniel0802ams@gmail.com; 04247466987 a 04247466987; 295443380 a 295443380', '2022-10-10 13:58:48'),
(23, 'Se actualizaron datos de un cliente; los datos actualizados son: Daniel  a Daniel ; MÃ¡rquez  a MÃ¡rquez ; San CristÃ³bal a San CristÃ³bal; daniel0802ams@gmail.com a daniel0802ams@gmail.com; 04247466987 a 04247466987; 295443380 a 295443380', '2022-10-10 14:00:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regisusuarios`
--

CREATE TABLE `regisusuarios` (
  `id` int(5) NOT NULL,
  `accion` varchar(255) NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `regisusuarios`
--

INSERT INTO `regisusuarios` (`id`, `accion`, `fecha_hora`) VALUES
(2, '0', '2022-09-27 02:26:29'),
(3, '0', '2022-09-27 02:31:54'),
(4, '0', '2022-09-27 02:32:23'),
(5, 'Se actualizaron los datos de un usuario. Los datos actualizados son los siguientes: vendedor a vende JUAN a JU vendedor a vende 7c222fb2927d828af22f592134e8932480637c0d a 7c222fb2927d828af22f592134e8932480637c0d', '2022-09-27 02:37:38'),
(6, 'Se actualizaron los datos de un usuario. Los datos actualizados son los siguientes: miguel alejandro a Miguel Alejandro rodriguez medina a Rodriguez Medina admin a admin 7110eda4d09e062aa5e4a390b0a572ac0d2c0220 a 7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2022-10-06 23:35:54'),
(7, 'Se actualizaron los datos de un usuario. Los datos actualizados son los siguientes: vende a JosÃ©  JU a Ramirez vende a vende 7c222fb2927d828af22f592134e8932480637c0d a 7c222fb2927d828af22f592134e8932480637c0d', '2022-10-06 23:36:41'),
(8, 'Se actualizaron los datos de un usuario. Los datos actualizados son los siguientes: johan a Johan ramirez a Ramirez johanrmz a johanrmz 7c4a8d09ca3762af61e59520943dc26494f8941b a 7c4a8d09ca3762af61e59520943dc26494f8941b', '2022-10-06 23:36:53'),
(9, 'Se actualizaron los datos de un usuario. Los datos actualizados son los siguientes: miguel a Luis rodriguez a Torres migue a Lutorr 03c342a614e0fb0e7b273bb21c094392f520ac28 a 03c342a614e0fb0e7b273bb21c094392f520ac28', '2022-10-06 23:37:21'),
(10, 'Se actualizaron los datos de un usuario. Los datos actualizados son los siguientes:  a Daniel  a MÃ¡rquez  a daniel da39a3ee5e6b4b0d3255bfef95601890afd80709 a da39a3ee5e6b4b0d3255bfef95601890afd80709', '2022-10-06 23:37:41'),
(11, 'Fue agregado un nuevo usuario', '2022-10-07 00:52:48'),
(12, 'Se actualizaron los datos de un usuario. Los datos actualizados son los siguientes: Manuel  a Manuel Antonio Ortega a Ortega Sanchez manuel5874 a manuel587485 03de6c570bfe24bfc328ccd7ca46b76eadaf4334 a 03de6c570bfe24bfc328ccd7ca46b76eadaf4334', '2022-10-07 00:55:07'),
(13, 'Un usuario fue eliminado', '2022-10-07 00:55:57'),
(14, 'Fue agregado un nuevo usuario', '2022-10-08 20:43:58'),
(15, 'Fue agregado un nuevo usuario', '2022-10-08 21:06:59'),
(16, 'Se actualizaron los datos de un usuario. Los datos actualizados son los siguientes: Carlos a Carlos Perez a Perez carlosp a carlosz 2fc7f44e566c3b29ba7aed98dd8796a000cbb07c a 2fc7f44e566c3b29ba7aed98dd8796a000cbb07c', '2022-10-08 21:29:35'),
(17, 'Se actualizaron los datos de un usuario. Los datos actualizados son los siguientes: Miguel Alejandro a Miguel  Rodriguez Medina a Rodriguez  admin a admin 7110eda4d09e062aa5e4a390b0a572ac0d2c0220 a 7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2022-10-09 19:27:22'),
(18, 'Fue agregado un nuevo usuario', '2022-10-10 13:43:58'),
(19, 'Se actualizaron los datos de un usuario. Los datos actualizados son los siguientes: Paul a Paul Vito a Vito Vendedor a Saler f18bc1793967cb099ef4e79d965f32ca31498e08 a f18bc1793967cb099ef4e79d965f32ca31498e08', '2022-10-10 13:44:09'),
(20, 'Fue agregado un nuevo usuario', '2022-10-11 11:52:27'),
(21, 'Un usuario fue eliminado', '2022-10-11 11:52:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trig_ventas`
--

CREATE TABLE `trig_ventas` (
  `id` int(5) NOT NULL,
  `accion` varchar(255) NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `trig_ventas`
--

INSERT INTO `trig_ventas` (`id`, `accion`, `fecha_hora`) VALUES
(1, 'Se ha registrado una nueva venta', '2022-09-27 03:08:28'),
(2, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(3, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(4, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(5, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(6, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(7, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(8, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(9, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(10, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(11, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(12, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(13, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(14, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(15, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(16, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(17, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(18, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(19, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(20, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(21, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(22, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(23, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(24, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(25, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(26, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(27, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(28, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(29, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(30, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(31, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(32, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(33, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(34, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(35, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(36, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(37, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(38, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(39, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(40, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(41, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(42, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(43, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(44, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(45, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(46, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(47, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(48, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(49, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(50, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(51, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(52, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(53, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(54, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(55, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(56, 'Se ha registrado una nueva venta', '2022-09-27 07:16:08'),
(57, 'Se ha registrado una nueva venta', '2022-10-06 19:37:25'),
(58, 'Se ha registrado una nueva venta', '2022-10-06 22:01:57'),
(59, 'Se ha registrado una nueva venta', '2022-10-06 22:09:28'),
(60, 'Se ha registrado una nueva venta', '2022-10-06 22:09:28'),
(61, 'Se ha registrado una nueva venta', '2022-10-06 22:09:28'),
(62, 'Se ha registrado una nueva venta', '2022-10-07 01:48:51'),
(63, 'Se ha registrado una nueva venta', '2022-10-10 10:13:49'),
(64, 'Se ha registrado una nueva venta', '2022-10-10 10:14:11'),
(65, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(66, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(67, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(68, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(69, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(70, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(71, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(72, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(73, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(74, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(75, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(76, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(77, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(78, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(79, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(80, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(81, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(82, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(83, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(84, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(85, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(86, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(87, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(88, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(89, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(90, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(91, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(92, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(93, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(94, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(95, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(96, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(97, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(98, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(99, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(100, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(101, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(102, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(103, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(104, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(105, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(106, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(107, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(108, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(109, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(110, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(111, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(112, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(113, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(114, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(115, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(116, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(117, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(118, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(119, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(120, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(121, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(122, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(123, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(124, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(125, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(126, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(127, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(128, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(129, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(130, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(131, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(132, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(133, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(134, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(135, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(136, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(137, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(138, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(139, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(140, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(141, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(142, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(143, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(144, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(145, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(146, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(147, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(148, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(149, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(150, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(151, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(152, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(153, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(154, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(155, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(156, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(157, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(158, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(159, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(160, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(161, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(162, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(163, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(164, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(165, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(166, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(167, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(168, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(169, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(170, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(171, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(172, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(173, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(174, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(175, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(176, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(177, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(178, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(179, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(180, 'Se ha registrado una nueva venta', '2022-10-10 17:01:06'),
(181, 'Se ha registrado una nueva venta', '2022-10-10 13:12:56'),
(182, 'Se ha registrado una nueva venta', '2022-10-10 13:12:57'),
(183, 'Se ha registrado una nueva venta', '2022-10-10 13:12:57'),
(184, 'Se ha registrado una nueva venta', '2022-10-10 13:12:57'),
(185, 'Se ha registrado una nueva venta', '2022-10-10 13:12:57'),
(186, 'Se ha registrado una nueva venta', '2022-10-10 13:14:11'),
(187, 'Se ha registrado una nueva venta', '2022-10-10 13:14:11'),
(188, 'Se ha registrado una nueva venta', '2022-10-10 13:14:11'),
(189, 'Se ha registrado una nueva venta', '2022-10-10 13:14:11'),
(190, 'Se ha registrado una nueva venta', '2022-10-10 13:39:57'),
(191, 'Se ha registrado una nueva venta', '2022-10-10 13:39:58'),
(192, 'Se ha registrado una nueva venta', '2022-10-10 13:39:58'),
(193, 'Se ha registrado una nueva venta', '2022-10-10 13:39:58'),
(194, 'Se ha registrado una nueva venta', '2022-10-10 13:39:58'),
(195, 'Se ha registrado una nueva venta', '2022-10-10 13:39:58'),
(196, 'Se ha registrado una nueva venta', '2022-10-10 13:39:58'),
(197, 'Se ha registrado una nueva venta', '2022-10-10 13:39:58'),
(198, 'Se ha registrado una nueva venta', '2022-10-10 13:46:35'),
(199, 'Se ha registrado una nueva venta', '2022-10-10 13:46:35'),
(200, 'Se ha registrado una nueva venta', '2022-10-11 09:33:15'),
(201, 'Se ha registrado una nueva venta', '2022-10-11 09:34:08'),
(202, 'Se ha registrado una nueva venta', '2022-10-11 09:34:08'),
(203, 'Se ha registrado una nueva venta', '2022-10-11 09:41:11'),
(204, 'Se ha registrado una nueva venta', '2022-10-11 09:41:11'),
(205, 'Se ha registrado una nueva venta', '2022-10-11 09:54:50'),
(206, 'Se ha registrado una nueva venta', '2022-10-11 09:54:50'),
(207, 'Se ha registrado una nueva venta', '2022-10-11 10:08:10'),
(208, 'Se ha registrado una nueva venta', '2022-10-11 12:44:13'),
(209, 'Se ha registrado una nueva venta', '2022-10-11 12:44:13'),
(210, 'Se ha registrado una nueva venta', '2022-10-11 12:44:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` tinytext,
  `fechaCaptura` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `email`, `password`, `fechaCaptura`) VALUES
(1, 'Miguel ', 'Rodriguez ', 'admin', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2022-07-26'),
(2, 'JosÃ© ', 'Ramirez', 'vende', '7c222fb2927d828af22f592134e8932480637c0d', '2022-07-27'),
(3, 'Johan', 'Ramirez', 'johanrmz', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2022-09-19'),
(4, 'Luis', 'Torres', 'Lutorr', '03c342a614e0fb0e7b273bb21c094392f520ac28', '2022-09-19'),
(5, 'Daniel', 'MÃ¡rquez', 'daniel', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '2022-09-23'),
(7, 'Carlos', 'Perez', 'carlosz', '2fc7f44e566c3b29ba7aed98dd8796a000cbb07c', '2022-10-09'),
(8, 'Paul', 'Vito', 'Saler', 'f18bc1793967cb099ef4e79d965f32ca31498e08', '2022-10-10'),
(9, 'sebastian', 'gomez', 'sebas', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2022-10-11');

--
-- Disparadores `usuarios`
--
DELIMITER $$
CREATE TRIGGER `delusuario` AFTER DELETE ON `usuarios` FOR EACH ROW INSERT INTO regisusuarios (accion) VALUES ("Un usuario fue eliminado")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insusuarui` AFTER INSERT ON `usuarios` FOR EACH ROW INSERT INTO regisusuarios (accion) VALUES ("Fue agregado un nuevo usuario")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updusuario` AFTER UPDATE ON `usuarios` FOR EACH ROW INSERT INTO regisusuarios (accion) VALUES (concat("Se actualizaron los datos de un usuario. Los datos actualizados son los siguientes: ",old.nombre," a ",new.nombre," ",old.apellido," a ",new.apellido," ",old.email," a ",new.email," ",old.password," a ",new.password,""))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `fechaCompra` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `id_cliente`, `id_producto`, `id_usuario`, `precio`, `fechaCompra`) VALUES
(1, 0, 1, 1, 50, '2022-07-26'),
(2, 0, 4, 1, 150, '2022-07-27'),
(3, 1, 1, 1, 50, '2022-07-27'),
(4, 0, 1, 1, 50, '2022-07-27'),
(4, 0, 1, 1, 50, '2022-07-27'),
(5, 0, 1, 1, 50, '2022-07-27'),
(6, 0, 6, 1, 100, '2022-07-27'),
(7, 0, 4, 1, 150, '2022-09-08'),
(7, 0, 4, 1, 150, '2022-09-08'),
(7, 0, 4, 1, 150, '2022-09-08'),
(8, 0, 4, 1, 150, '2022-09-16'),
(9, 1, 8, 1, 123, '2022-09-16'),
(9, 1, 8, 1, 123, '2022-09-16'),
(9, 1, 8, 1, 123, '2022-09-16'),
(10, 1, 4, 1, 150, '2022-09-16'),
(11, 0, 4, 3, 150, '2022-09-19'),
(11, 0, 4, 3, 150, '2022-09-19'),
(11, 0, 4, 3, 150, '2022-09-19'),
(11, 0, 4, 3, 150, '2022-09-19'),
(12, 0, 4, 1, 150, '2022-09-20'),
(12, 0, 4, 1, 150, '2022-09-20'),
(12, 0, 4, 1, 150, '2022-09-20'),
(12, 0, 4, 1, 150, '2022-09-20'),
(13, 0, 4, 1, 150, '2022-09-20'),
(14, 0, 4, 1, 150, '2022-09-20'),
(14, 0, 4, 1, 150, '2022-09-20'),
(15, 0, 4, 1, 150, '2022-09-20'),
(15, 0, 4, 1, 150, '2022-09-20'),
(15, 0, 4, 1, 150, '2022-09-20'),
(16, 0, 4, 1, 150, '2022-09-20'),
(16, 0, 4, 1, 150, '2022-09-20'),
(16, 0, 4, 1, 150, '2022-09-20'),
(17, 1, 4, 1, 150, '2022-09-20'),
(18, 1, 4, 1, 150, '2022-09-20'),
(18, 1, 4, 1, 150, '2022-09-20'),
(19, 2, 9, 1, 565464, '2022-09-20'),
(19, 2, 9, 1, 565464, '2022-09-20'),
(20, 1, 8, 1, 123, '2022-09-20'),
(20, 1, 8, 1, 123, '2022-09-20'),
(21, 1, 8, 1, 123, '2022-09-20'),
(22, 1, 8, 1, 123, '2022-09-20'),
(22, 1, 8, 1, 123, '2022-09-20'),
(22, 1, 8, 1, 123, '2022-09-20'),
(23, 0, 4, 1, 150, '2022-09-20'),
(23, 0, 4, 1, 150, '2022-09-20'),
(23, 0, 4, 1, 150, '2022-09-20'),
(23, 0, 4, 1, 150, '2022-09-20'),
(23, 0, 4, 1, 150, '2022-09-20'),
(24, 0, 4, 1, 150, '2022-09-21'),
(24, 0, 4, 1, 150, '2022-09-21'),
(24, 0, 4, 1, 150, '2022-09-21'),
(25, 1, 4, 4, 150, '2022-09-21'),
(25, 1, 4, 4, 150, '2022-09-21'),
(26, 0, 4, 1, 150, '2022-09-25'),
(27, 0, 4, 1, 150, '2022-09-27'),
(1, 0, 1, 1, 50, '2022-07-26'),
(2, 0, 4, 1, 150, '2022-07-27'),
(3, 1, 1, 1, 50, '2022-07-27'),
(4, 0, 1, 1, 50, '2022-07-27'),
(4, 0, 1, 1, 50, '2022-07-27'),
(5, 0, 1, 1, 50, '2022-07-27'),
(6, 0, 6, 1, 100, '2022-07-27'),
(7, 0, 4, 1, 150, '2022-09-08'),
(7, 0, 4, 1, 150, '2022-09-08'),
(7, 0, 4, 1, 150, '2022-09-08'),
(8, 0, 4, 1, 150, '2022-09-16'),
(9, 1, 8, 1, 123, '2022-09-16'),
(9, 1, 8, 1, 123, '2022-09-16'),
(9, 1, 8, 1, 123, '2022-09-16'),
(10, 1, 4, 1, 150, '2022-09-16'),
(11, 0, 4, 3, 150, '2022-09-19'),
(11, 0, 4, 3, 150, '2022-09-19'),
(11, 0, 4, 3, 150, '2022-09-19'),
(11, 0, 4, 3, 150, '2022-09-19'),
(12, 0, 4, 1, 150, '2022-09-20'),
(12, 0, 4, 1, 150, '2022-09-20'),
(12, 0, 4, 1, 150, '2022-09-20'),
(12, 0, 4, 1, 150, '2022-09-20'),
(13, 0, 4, 1, 150, '2022-09-20'),
(14, 0, 4, 1, 150, '2022-09-20'),
(14, 0, 4, 1, 150, '2022-09-20'),
(15, 0, 4, 1, 150, '2022-09-20'),
(15, 0, 4, 1, 150, '2022-09-20'),
(15, 0, 4, 1, 150, '2022-09-20'),
(16, 0, 4, 1, 150, '2022-09-20'),
(16, 0, 4, 1, 150, '2022-09-20'),
(16, 0, 4, 1, 150, '2022-09-20'),
(17, 1, 4, 1, 150, '2022-09-20'),
(18, 1, 4, 1, 150, '2022-09-20'),
(18, 1, 4, 1, 150, '2022-09-20'),
(19, 2, 9, 1, 565464, '2022-09-20'),
(19, 2, 9, 1, 565464, '2022-09-20'),
(20, 1, 8, 1, 123, '2022-09-20'),
(20, 1, 8, 1, 123, '2022-09-20'),
(21, 1, 8, 1, 123, '2022-09-20'),
(22, 1, 8, 1, 123, '2022-09-20'),
(22, 1, 8, 1, 123, '2022-09-20'),
(22, 1, 8, 1, 123, '2022-09-20'),
(23, 0, 4, 1, 150, '2022-09-20'),
(23, 0, 4, 1, 150, '2022-09-20'),
(23, 0, 4, 1, 150, '2022-09-20'),
(23, 0, 4, 1, 150, '2022-09-20'),
(23, 0, 4, 1, 150, '2022-09-20'),
(24, 0, 4, 1, 150, '2022-09-21'),
(24, 0, 4, 1, 150, '2022-09-21'),
(24, 0, 4, 1, 150, '2022-09-21'),
(25, 1, 4, 4, 150, '2022-09-21'),
(25, 1, 4, 4, 150, '2022-09-21'),
(26, 0, 4, 1, 150, '2022-09-25'),
(27, 0, 4, 1, 150, '2022-09-27'),
(28, 1, 4, 1, 150, '2022-10-07'),
(29, 1, 4, 1, 150, '2022-10-07'),
(30, 1, 6, 1, 100, '2022-10-07'),
(30, 1, 6, 1, 100, '2022-10-07'),
(30, 1, 8, 1, 50, '2022-10-07'),
(31, 1, 4, 1, 150, '2022-10-07'),
(32, 1, 6, 1, 100, '2022-10-10'),
(33, 1, 6, 1, 100, '2022-10-10'),
(1, 0, 1, 1, 50, '2022-07-26'),
(2, 0, 4, 1, 150, '2022-07-27'),
(3, 1, 1, 1, 50, '2022-07-27'),
(4, 0, 1, 1, 50, '2022-07-27'),
(4, 0, 1, 1, 50, '2022-07-27'),
(5, 0, 1, 1, 50, '2022-07-27'),
(6, 0, 6, 1, 100, '2022-07-27'),
(7, 0, 4, 1, 150, '2022-09-08'),
(7, 0, 4, 1, 150, '2022-09-08'),
(7, 0, 4, 1, 150, '2022-09-08'),
(8, 0, 4, 1, 150, '2022-09-16'),
(9, 1, 8, 1, 123, '2022-09-16'),
(9, 1, 8, 1, 123, '2022-09-16'),
(9, 1, 8, 1, 123, '2022-09-16'),
(10, 1, 4, 1, 150, '2022-09-16'),
(11, 0, 4, 3, 150, '2022-09-19'),
(11, 0, 4, 3, 150, '2022-09-19'),
(11, 0, 4, 3, 150, '2022-09-19'),
(11, 0, 4, 3, 150, '2022-09-19'),
(12, 0, 4, 1, 150, '2022-09-20'),
(12, 0, 4, 1, 150, '2022-09-20'),
(12, 0, 4, 1, 150, '2022-09-20'),
(12, 0, 4, 1, 150, '2022-09-20'),
(13, 0, 4, 1, 150, '2022-09-20'),
(14, 0, 4, 1, 150, '2022-09-20'),
(14, 0, 4, 1, 150, '2022-09-20'),
(15, 0, 4, 1, 150, '2022-09-20'),
(15, 0, 4, 1, 150, '2022-09-20'),
(15, 0, 4, 1, 150, '2022-09-20'),
(16, 0, 4, 1, 150, '2022-09-20'),
(16, 0, 4, 1, 150, '2022-09-20'),
(16, 0, 4, 1, 150, '2022-09-20'),
(17, 1, 4, 1, 150, '2022-09-20'),
(18, 1, 4, 1, 150, '2022-09-20'),
(18, 1, 4, 1, 150, '2022-09-20'),
(19, 2, 9, 1, 565464, '2022-09-20'),
(19, 2, 9, 1, 565464, '2022-09-20'),
(20, 1, 8, 1, 123, '2022-09-20'),
(20, 1, 8, 1, 123, '2022-09-20'),
(21, 1, 8, 1, 123, '2022-09-20'),
(22, 1, 8, 1, 123, '2022-09-20'),
(22, 1, 8, 1, 123, '2022-09-20'),
(22, 1, 8, 1, 123, '2022-09-20'),
(23, 0, 4, 1, 150, '2022-09-20'),
(23, 0, 4, 1, 150, '2022-09-20'),
(23, 0, 4, 1, 150, '2022-09-20'),
(23, 0, 4, 1, 150, '2022-09-20'),
(23, 0, 4, 1, 150, '2022-09-20'),
(24, 0, 4, 1, 150, '2022-09-21'),
(24, 0, 4, 1, 150, '2022-09-21'),
(24, 0, 4, 1, 150, '2022-09-21'),
(25, 1, 4, 4, 150, '2022-09-21'),
(25, 1, 4, 4, 150, '2022-09-21'),
(26, 0, 4, 1, 150, '2022-09-25'),
(27, 0, 4, 1, 150, '2022-09-27'),
(1, 0, 1, 1, 50, '2022-07-26'),
(2, 0, 4, 1, 150, '2022-07-27'),
(3, 1, 1, 1, 50, '2022-07-27'),
(4, 0, 1, 1, 50, '2022-07-27'),
(4, 0, 1, 1, 50, '2022-07-27'),
(5, 0, 1, 1, 50, '2022-07-27'),
(6, 0, 6, 1, 100, '2022-07-27'),
(7, 0, 4, 1, 150, '2022-09-08'),
(7, 0, 4, 1, 150, '2022-09-08'),
(7, 0, 4, 1, 150, '2022-09-08'),
(8, 0, 4, 1, 150, '2022-09-16'),
(9, 1, 8, 1, 123, '2022-09-16'),
(9, 1, 8, 1, 123, '2022-09-16'),
(9, 1, 8, 1, 123, '2022-09-16'),
(10, 1, 4, 1, 150, '2022-09-16'),
(11, 0, 4, 3, 150, '2022-09-19'),
(11, 0, 4, 3, 150, '2022-09-19'),
(11, 0, 4, 3, 150, '2022-09-19'),
(11, 0, 4, 3, 150, '2022-09-19'),
(12, 0, 4, 1, 150, '2022-09-20'),
(12, 0, 4, 1, 150, '2022-09-20'),
(12, 0, 4, 1, 150, '2022-09-20'),
(12, 0, 4, 1, 150, '2022-09-20'),
(13, 0, 4, 1, 150, '2022-09-20'),
(14, 0, 4, 1, 150, '2022-09-20'),
(14, 0, 4, 1, 150, '2022-09-20'),
(15, 0, 4, 1, 150, '2022-09-20'),
(15, 0, 4, 1, 150, '2022-09-20'),
(15, 0, 4, 1, 150, '2022-09-20'),
(16, 0, 4, 1, 150, '2022-09-20'),
(16, 0, 4, 1, 150, '2022-09-20'),
(16, 0, 4, 1, 150, '2022-09-20'),
(17, 1, 4, 1, 150, '2022-09-20'),
(18, 1, 4, 1, 150, '2022-09-20'),
(18, 1, 4, 1, 150, '2022-09-20'),
(19, 2, 9, 1, 565464, '2022-09-20'),
(19, 2, 9, 1, 565464, '2022-09-20'),
(20, 1, 8, 1, 123, '2022-09-20'),
(20, 1, 8, 1, 123, '2022-09-20'),
(21, 1, 8, 1, 123, '2022-09-20'),
(22, 1, 8, 1, 123, '2022-09-20'),
(22, 1, 8, 1, 123, '2022-09-20'),
(22, 1, 8, 1, 123, '2022-09-20'),
(23, 0, 4, 1, 150, '2022-09-20'),
(23, 0, 4, 1, 150, '2022-09-20'),
(23, 0, 4, 1, 150, '2022-09-20'),
(23, 0, 4, 1, 150, '2022-09-20'),
(23, 0, 4, 1, 150, '2022-09-20'),
(24, 0, 4, 1, 150, '2022-09-21'),
(24, 0, 4, 1, 150, '2022-09-21'),
(24, 0, 4, 1, 150, '2022-09-21'),
(25, 1, 4, 4, 150, '2022-09-21'),
(25, 1, 4, 4, 150, '2022-09-21'),
(26, 0, 4, 1, 150, '2022-09-25'),
(27, 0, 4, 1, 150, '2022-09-27'),
(28, 1, 4, 1, 150, '2022-10-07'),
(29, 1, 4, 1, 150, '2022-10-07'),
(30, 1, 6, 1, 100, '2022-10-07'),
(30, 1, 6, 1, 100, '2022-10-07'),
(30, 1, 8, 1, 50, '2022-10-07'),
(31, 1, 4, 1, 150, '2022-10-07'),
(34, 1, 4, 1, 150, '2022-10-10'),
(34, 1, 4, 1, 150, '2022-10-10'),
(34, 1, 4, 1, 150, '2022-10-10'),
(34, 1, 6, 1, 100, '2022-10-10'),
(34, 1, 6, 1, 100, '2022-10-10'),
(35, 1, 6, 1, 100, '2022-10-10'),
(35, 1, 6, 1, 100, '2022-10-10'),
(35, 1, 6, 1, 100, '2022-10-10'),
(35, 1, 6, 1, 100, '2022-10-10'),
(36, 8, 6, 1, 100, '2022-10-10'),
(36, 8, 6, 1, 100, '2022-10-10'),
(36, 8, 6, 1, 100, '2022-10-10'),
(36, 8, 6, 1, 100, '2022-10-10'),
(36, 8, 4, 1, 150, '2022-10-10'),
(36, 8, 4, 1, 150, '2022-10-10'),
(36, 8, 8, 1, 50, '2022-10-10'),
(36, 8, 8, 1, 50, '2022-10-10'),
(37, 9, 4, 8, 150, '2022-10-10'),
(37, 9, 4, 8, 150, '2022-10-10'),
(38, 2, 4, 1, 150, '2022-10-11'),
(39, 2, 4, 1, 150, '2022-10-11'),
(39, 2, 4, 1, 150, '2022-10-11'),
(40, 2, 6, 1, 100, '2022-10-11'),
(40, 2, 6, 1, 100, '2022-10-11'),
(41, 2, 4, 1, 150, '2022-10-11'),
(41, 2, 4, 1, 150, '2022-10-11'),
(42, 5, 7, 1, 110, '2022-10-11'),
(43, 2, 7, 1, 110, '2022-10-11'),
(43, 2, 7, 1, 110, '2022-10-11'),
(43, 2, 7, 1, 110, '2022-10-11');

--
-- Disparadores `ventas`
--
DELIMITER $$
CREATE TRIGGER `delventa` AFTER DELETE ON `ventas` FOR EACH ROW INSERT INTO trig_ventas (accion) VALUES ("Una venta ha sido borrada")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insventas` AFTER INSERT ON `ventas` FOR EACH ROW INSERT INTO trig_ventas (accion) VALUES ("Se ha registrado una nueva venta")
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updventa` AFTER UPDATE ON `ventas` FOR EACH ROW INSERT INTO trig_ventas (accion) VALUES (concat("Una venta ha sido alterada: los datos alterados son: ",old.id_venta," a ",new.id_venta,"; ",old.id_cliente," a ",new.id_cliente,"; ",old.id_producto," a ",new.id_producto,"; ",old.id_usuario," a ",new.id_usuario,"; ",old.precio," a ",new.precio,"; ",old.fechaCompra," a ",new.fechaCompra,""))
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_imagen` (`id_imagen`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD PRIMARY KEY (`id_imagen`);

--
-- Indices de la tabla `insertaralumno`
--
ALTER TABLE `insertaralumno`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idproveedor`);

--
-- Indices de la tabla `regcliente`
--
ALTER TABLE `regcliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `regisusuarios`
--
ALTER TABLE `regisusuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trig_ventas`
--
ALTER TABLE `trig_ventas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `id_imagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `insertaralumno`
--
ALTER TABLE `insertaralumno`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT de la tabla `regcliente`
--
ALTER TABLE `regcliente`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `regisusuarios`
--
ALTER TABLE `regisusuarios`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `trig_ventas`
--
ALTER TABLE `trig_ventas`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
