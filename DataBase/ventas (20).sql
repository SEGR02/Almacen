-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-10-2022 a las 18:11:17
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

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
  `costo` float DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `ganancia` int(11) DEFAULT NULL,
  `fechaCaptura` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id_producto`, `id_categoria`, `id_imagen`, `id_usuario`, `nombre`, `descripcion`, `cantidad`, `costo`, `precio`, `ganancia`, `fechaCaptura`) VALUES
(4, 2, 4, 1, 'cilindro', 'horse', 30, 130, 150, 20, '2022-07-27'),
(6, 3, 6, 1, 'Cauchos', 'Owen', 46, 70, 100, 30, '2022-07-27'),
(25, 3, 26, 1, 'Caucho TX', 'Caucho 16', 16, NULL, 50, NULL, '2022-10-14'),
(26, 2, 27, 1, 'Cilindro Empire', 'Kit cilindro empire ', 17, NULL, 30, NULL, '2022-10-15'),
(28, 3, 29, 1, 'Caucho arsen', 'caucho arsen', 19, NULL, 20, NULL, '2022-10-15');

--
-- Disparadores `articulos`
--
DELIMITER $$
CREATE TRIGGER `actualiza_articulo` AFTER UPDATE ON `articulos` FOR EACH ROW BEGIN
	INSERT INTO bitacora (`operacion` , `accion` , `tabla`) 
    VALUES ("ACTUALIZAR" , concat("Fue actualizado el articulo: ",new.nombre," , ",new.descripcion,"") , "ARTICULOS"); 
    
    INSERT INTO trig_articulo (`accion`) 
    VALUES (concat("Fue actualizado el articulo: ",new.nombre," , ",new.descripcion,"")); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `elimina_articulo` AFTER DELETE ON `articulos` FOR EACH ROW BEGIN
	INSERT INTO bitacora (`operacion` , `accion` , `tabla`)
    VALUES ("ELIMINAR" , concat("Fue eliminado el articulo: ",old.nombre," ",old.descripcion,"") , "ARTICULOS");
    
    INSERT INTO trig_articulo (`accion`)
    VALUES (concat("Fue eliminado el articulo: ",old.nombre," ",old.descripcion,""));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `inserta_articulo` AFTER INSERT ON `articulos` FOR EACH ROW BEGIN
	INSERT INTO bitacora (`operacion` , `accion` , `tabla`)
    VALUES ("INSERTAR" , concat("Fue ingresado un articulo nuevo: ",new.nombre," , ",new.descripcion,"") , "ARTICULOS");
    
    INSERT INTO trig_articulo (`accion`)
    VALUES (concat("Fue ingresado un articulo nuevo: ",new.nombre," ",new.descripcion,""));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `id` int(11) NOT NULL,
  `accion` varchar(255) NOT NULL,
  `operacion` varchar(255) NOT NULL,
  `tabla` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`id`, `accion`, `operacion`, `tabla`, `fecha`) VALUES
(1, 'Fue ingresado un articulo nuevo', 'INSERTAR', 'ARTICULOS', '2022-10-13 20:54:20'),
(2, 'Fue ingresado un articulo nuevo', 'INSERTAR', 'ARTICULOS', '2022-10-13 21:12:16'),
(3, 'Fue ingresado un articulo nuevo', 'INSERTAR', 'ARTICULOS', '2022-10-13 21:16:46'),
(4, 'Se actualizo un artículo', 'ACTUALIZAR', 'ARTICULOS', '2022-10-13 21:17:20'),
(5, 'Se actualizo un artículo', 'ACTUALIZAR', 'ARTICULOS', '2022-10-13 21:17:23'),
(6, 'Fue ingresado un articulo nuevo:', 'INSERTAR', 'ARTICULOS', '2022-10-13 21:21:36'),
(7, 'Fue ingresada una categoria nueva:', 'INSERTAR', 'CATEGORIAS', '2022-10-13 21:28:45'),
(8, 'Fue actualizado un cliente', 'INSERTAR', 'CLIENTES', '2022-10-13 21:51:25'),
(9, 'Fue actualizado un usuario', 'ACTUALIZAR', 'USUARIOS', '2022-10-13 22:32:16'),
(10, 'Fue actualizado un proveedor', 'ACTUALIZAR', 'PROVEEDORES', '2022-10-13 22:32:50'),
(11, 'Fue actualizado un proveedor', 'ACTUALIZAR', 'PROVEEDORES', '2022-10-13 22:37:25'),
(12, 'Fue actualizado un cliente', 'INSERTAR', 'CLIENTES', '2022-10-13 22:37:33'),
(13, 'Fue actualizado un usuario', 'ACTUALIZAR', 'USUARIOS', '2022-10-13 22:37:39'),
(14, 'Se actualizo un artículo', 'ACTUALIZAR', 'ARTICULOS', '2022-10-13 22:37:44'),
(15, 'Fue actualizado un cliente', 'INSERTAR', 'CLIENTES', '2022-10-14 01:16:01'),
(16, 'Fue ingresada una imagen nueva:', 'INSERTAR', 'IMAGENES', '2022-10-14 02:55:33'),
(17, 'Fue ingresado un articulo nuevo: Cilindro', 'INSERTAR', 'ARTICULOS', '2022-10-14 02:55:35'),
(18, 'Fue ingresada una imagen nueva:', 'INSERTAR', 'IMAGENES', '2022-10-14 02:55:35'),
(19, 'Fue ingresado un articulo nuevo: Cilindro', 'INSERTAR', 'ARTICULOS', '2022-10-14 02:55:36'),
(20, 'Fue eliminadoo un articulo: Cilindro , TX', 'ELIMINAR', 'ARTICULOS', '2022-10-14 02:58:50'),
(21, 'Fue eliminada una imagen', 'ELIMINAR', 'IMAGENES', '2022-10-14 02:58:50'),
(22, 'Fue actualizado un proveedor: Mundo X', 'ACTUALIZAR', 'PROVEEDORES', '2022-10-14 14:07:39'),
(23, 'Fue actualizado el proveedor: Import SD', 'ACTUALIZAR', 'PROVEEDORES', '2022-10-14 14:09:20'),
(24, 'Fue eliminadoo el articulo: Cadena RKV  (RKV cadena 15 2001)', 'ELIMINAR', 'ARTICULOS', '2022-10-14 14:16:33'),
(25, 'Fue eliminada una imagen', 'ELIMINAR', 'IMAGENES', '2022-10-14 14:16:33'),
(26, 'Fue eliminadoo el articulo: Amortiguador  (Suzuki)', 'ELIMINAR', 'ARTICULOS', '2022-10-14 14:16:44'),
(27, 'Fue eliminada una imagen', 'ELIMINAR', 'IMAGENES', '2022-10-14 14:16:44'),
(28, 'Fue eliminadoo el articulo: Cilindro  (TX)', 'ELIMINAR', 'ARTICULOS', '2022-10-14 14:17:57'),
(29, 'Fue eliminada una imagen', 'ELIMINAR', 'IMAGENES', '2022-10-14 14:17:57'),
(30, 'Fue eliminadoo el articulo: Cilindro  (TX)', 'ELIMINAR', 'ARTICULOS', '2022-10-14 14:18:05'),
(31, 'Fue eliminada una imagen', 'ELIMINAR', 'IMAGENES', '2022-10-14 14:18:05'),
(32, 'Fue ingresada una categoria nueva: Luces', 'INSERTAR', 'CATEGORIAS', '2022-10-14 14:21:16'),
(33, 'Fue actualizada la categoria: Luz', 'ACTUALIZAR', 'CATEGORIAS', '2022-10-14 14:21:25'),
(34, 'Fue eliminada la categoria: Luz', 'ELIMINAR', 'CATEGORIA', '2022-10-14 14:21:28'),
(35, 'Fue actualizado el cliente: Miguel ', 'INSERTAR', 'CLIENTES', '2022-10-14 14:25:27'),
(36, 'Fue actualizado el cliente: Miguel  Rodriguez ', 'INSERTAR', 'CLIENTES', '2022-10-14 14:27:23'),
(37, 'Fue eliminado el cliente: Carlos Sanchez', 'ELIMINAR', 'CLIENTES', '2022-10-14 14:48:11'),
(38, 'Fue actualizado el cliente: Luis Ramirez', 'INSERTAR', 'CLIENTES', '2022-10-14 14:48:13'),
(39, 'Fue actualizado el cliente: Luis Ramirez', 'INSERTAR', 'CLIENTES', '2022-10-14 15:05:43'),
(40, 'Fue actualizado el proveedor: Inversiones', 'ACTUALIZAR', 'PROVEEDORES', '2022-10-14 15:06:41'),
(41, 'Fue eliminado el proveedor: Inversiones', 'ELIMINAR', 'PROVEEDORES', '2022-10-14 15:06:51'),
(42, 'Fue ingresado un proveedor nuevo: Mundo de motos', 'INSERTAR', 'PROVEEDORES', '2022-10-14 15:09:09'),
(43, 'Fue eliminadoo el articulo: Cilindro  (Cilindro)', 'ELIMINAR', 'ARTICULOS', '2022-10-14 15:09:38'),
(44, 'Fue eliminada la imagen cilindro tx.jpg', 'ELIMINAR', 'IMAGENES', '2022-10-14 15:09:38'),
(45, 'Fue eliminadoo el articulo: Rin KLR', 'ELIMINAR', 'ARTICULOS', '2022-10-14 15:10:58'),
(46, 'Fue eliminada la imagen 619ZKXAruKL._AC_SX466_.jpg', 'ELIMINAR', 'IMAGENES', '2022-10-14 15:10:58'),
(47, 'Fue actualizado el articulo: Bujia , (Owen)', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 15:11:06'),
(48, 'Fue ingresada una imagen nueva: cilindro.jpg', 'INSERTAR', 'IMAGENES', '2022-10-14 15:12:24'),
(49, 'Fue ingresado un articulo nuevo: Cilindro Horse II , Cilindro 2.0 Horse II', 'INSERTAR', 'ARTICULOS', '2022-10-14 15:12:24'),
(50, 'Fue actualizado el articulo: Cilindro Horse II , Cilindro  Horse II', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 15:14:22'),
(51, 'Fue eliminadoo el articulo: Cilindro Horse II Cilindro  Horse II', 'ELIMINAR', 'ARTICULOS', '2022-10-14 15:14:48'),
(52, 'Fue eliminada la imagen cilindro.jpg', 'ELIMINAR', 'IMAGENES', '2022-10-14 15:14:48'),
(53, 'Fue ingresada una imagen nueva: caucho.jpg', 'INSERTAR', 'IMAGENES', '2022-10-14 15:15:38'),
(54, 'Fue ingresado un articulo nuevo: Caucho TX , Caucho 16', 'INSERTAR', 'ARTICULOS', '2022-10-14 15:15:38'),
(55, 'Fue ingresada una categoria nueva: Guayas', 'INSERTAR', 'CATEGORIAS', '2022-10-14 15:16:03'),
(56, 'Fue actualizada la categoria: Guaya', 'ACTUALIZAR', 'CATEGORIAS', '2022-10-14 15:16:36'),
(57, 'Fue eliminada la categoria: Guaya', 'ELIMINAR', 'CATEGORIA', '2022-10-14 15:16:39'),
(58, 'Fue actualizada la categoria: Ruedas', 'ACTUALIZAR', 'CATEGORIAS', '2022-10-14 15:20:17'),
(59, 'Fue actualizado el usuario Maria mariajim', 'ACTUALIZAR', 'USUARIOS', '2022-10-14 15:22:52'),
(60, 'Fue actualizado el cliente: Luis Ramirez', 'INSERTAR', 'CLIENTES', '2022-10-14 15:23:45'),
(61, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-14 15:24:52'),
(62, 'Fue actualizado el articulo: Cauchos , Owen', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 15:24:52'),
(63, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-14 15:24:52'),
(64, 'Fue actualizado el articulo: Cauchos , Owen', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 15:24:52'),
(65, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-14 15:24:52'),
(66, 'Fue actualizado el articulo: Cilindro TX , TX', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 15:24:52'),
(67, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-14 15:24:53'),
(68, 'Fue actualizado el articulo: Caucho , Freno', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 15:24:53'),
(69, 'Fue eliminadoo el articulo: Cilindro TX TX', 'ELIMINAR', 'ARTICULOS', '2022-10-14 15:53:31'),
(70, 'Fue eliminada la imagen cilindro.jpg', 'ELIMINAR', 'IMAGENES', '2022-10-14 15:53:31'),
(71, 'Fue eliminadoo el articulo: Cilindro Horse II  Cilindro II12', 'ELIMINAR', 'ARTICULOS', '2022-10-14 15:53:39'),
(72, 'Fue eliminada la imagen cilindro tx.jpg', 'ELIMINAR', 'IMAGENES', '2022-10-14 15:53:40'),
(73, 'Fue eliminadoo el articulo: Caucho Freno', 'ELIMINAR', 'ARTICULOS', '2022-10-14 15:53:55'),
(74, 'Fue eliminada la imagen cilindro tx.jpg', 'ELIMINAR', 'IMAGENES', '2022-10-14 15:53:55'),
(75, 'Fue eliminado el articulo: Bujia Owen', 'ELIMINAR', 'ARTICULOS', '2022-10-14 15:55:03'),
(76, 'Fue eliminada la imagen 814ryeJ6dUL._AC_SX679_.jpg', 'ELIMINAR', 'IMAGENES', '2022-10-14 15:55:03'),
(77, 'Fue eliminado el articulo: relacion cadena45', 'ELIMINAR', 'ARTICULOS', '2022-10-14 15:55:43'),
(78, 'Fue eliminada la imagen cadena_moto_2.jpg', 'ELIMINAR', 'IMAGENES', '2022-10-14 15:55:43'),
(79, 'Fue eliminado el usuario Sofia sofiajim', 'ELIMINAR', 'USUARIOS', '2022-10-14 15:55:56'),
(80, 'Fue eliminado el proveedor: asoc', 'ELIMINAR', 'PROVEEDORES', '2022-10-14 15:56:15'),
(81, 'Fue eliminado el cliente: Pedro Ramirez', 'ELIMINAR', 'CLIENTES', '2022-10-14 15:56:49'),
(82, 'Fue actualizado el cliente: Daniel Antonio MÃ¡rquez Santander', 'INSERTAR', 'CLIENTES', '2022-10-14 15:57:07'),
(83, 'Fue actualizado el articulo: Caucho TX , Caucho 16', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 16:56:08'),
(84, 'Fue actualizado el articulo: Cauchos , Owen', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 16:56:10'),
(85, 'Fue actualizado el articulo: cilindro , horse', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 16:56:12'),
(86, 'Fue actualizada la categoria: Rines', 'ACTUALIZAR', 'CATEGORIAS', '2022-10-14 16:56:17'),
(87, 'Fue actualizada la categoria: Cadenas', 'ACTUALIZAR', 'CATEGORIAS', '2022-10-14 16:56:19'),
(88, 'Fue actualizada la categoria: Cilindros', 'ACTUALIZAR', 'CATEGORIAS', '2022-10-14 16:56:21'),
(89, 'Fue actualizado el usuario Juan Juanprz', 'ACTUALIZAR', 'USUARIOS', '2022-10-14 16:56:26'),
(90, 'Fue actualizado el usuario Maria mariaz', 'ACTUALIZAR', 'USUARIOS', '2022-10-14 16:56:28'),
(91, 'Fue ingresado un usuario nuevo Luis  luischnz', 'INSERTAR', 'USUARIOS', '2022-10-14 16:56:56'),
(92, 'Fue ingresado un proveedor nuevo: Motos xd', 'INSERTAR', 'PROVEEDORES', '2022-10-14 16:57:29'),
(93, 'Fue ingresado un cliente nuevo: Maria Colmenares', 'INSERTAR', 'CLIENTES', '2022-10-14 16:58:21'),
(94, 'Fue actualizado el proveedor: Motos xd', 'ACTUALIZAR', 'PROVEEDORES', '2022-10-14 17:03:10'),
(95, 'Fue ingresada una imagen nueva: kit de cilindro.jpg', 'INSERTAR', 'IMAGENES', '2022-10-14 20:49:22'),
(96, 'Fue ingresado un articulo nuevo: Cilindro Empire , Kit cilindro empire tx 200', 'INSERTAR', 'ARTICULOS', '2022-10-14 20:49:22'),
(97, 'Fue actualizado el articulo: Cilindro Empire , Kit cilindro empire ', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 20:49:35'),
(98, 'Fue ingresada una categoria nueva: Frenos', 'INSERTAR', 'CATEGORIAS', '2022-10-14 20:49:49'),
(99, 'Fue ingresado un usuario nuevo Pedro pedromrt', 'INSERTAR', 'USUARIOS', '2022-10-14 20:50:21'),
(100, 'Fue actualizado el usuario Pedro pedromrt', 'ACTUALIZAR', 'USUARIOS', '2022-10-14 20:50:30'),
(101, 'Fue ingresado un proveedor nuevo: Casa de la moto', 'INSERTAR', 'PROVEEDORES', '2022-10-14 20:51:17'),
(102, 'Fue actualizado el proveedor: Casa de la moto', 'ACTUALIZAR', 'PROVEEDORES', '2022-10-14 20:51:29'),
(103, 'Fue ingresado un cliente nuevo: Manuel Perez', 'INSERTAR', 'CLIENTES', '2022-10-14 20:52:18'),
(104, 'Fue actualizado el cliente: Manuel Perez', 'INSERTAR', 'CLIENTES', '2022-10-14 20:52:29'),
(105, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-14 20:52:50'),
(106, 'Fue actualizado el articulo: Cilindro Empire , Kit cilindro empire ', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 20:52:50'),
(107, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-14 20:52:50'),
(108, 'Fue actualizado el articulo: Cilindro Empire , Kit cilindro empire ', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 20:52:50'),
(109, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-14 20:52:51'),
(110, 'Fue actualizado el articulo: Cilindro Empire , Kit cilindro empire ', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 20:52:51'),
(111, 'Fue ingresada una imagen nueva: caucho arsen ii.jpg', 'INSERTAR', 'IMAGENES', '2022-10-14 21:09:35'),
(112, 'Fue ingresado un articulo nuevo: Caucho arsen II , Caucho arsen II', 'INSERTAR', 'ARTICULOS', '2022-10-14 21:09:36'),
(113, 'Fue actualizado el articulo: Caucho arsen II , Caucho arsen II', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 21:10:09'),
(114, 'Fue eliminado el articulo: Caucho arsen II Caucho arsen II', 'ELIMINAR', 'ARTICULOS', '2022-10-14 21:10:29'),
(115, 'Fue eliminada la imagen caucho arsen ii.jpg', 'ELIMINAR', 'IMAGENES', '2022-10-14 21:10:29'),
(116, 'Fue ingresada una categoria nueva: Electricidad', 'INSERTAR', 'CATEGORIAS', '2022-10-14 21:10:49'),
(117, 'Fue eliminada la categoria: Electricidad', 'ELIMINAR', 'CATEGORIA', '2022-10-14 21:14:08'),
(118, 'Fue ingresada una imagen nueva: caucho arsen ii.jpg', 'INSERTAR', 'IMAGENES', '2022-10-14 21:16:13'),
(119, 'Fue ingresado un articulo nuevo: Caucho arsen , caucho arsen', 'INSERTAR', 'ARTICULOS', '2022-10-14 21:16:13'),
(120, 'Fue actualizado el articulo: Caucho arsen , caucho arsen', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 21:16:29'),
(121, 'Fue ingresada una categoria nueva: Partes electricas', 'INSERTAR', 'CATEGORIAS', '2022-10-14 21:17:20'),
(122, 'Fue actualizada la categoria: Partes electricas', 'ACTUALIZAR', 'CATEGORIAS', '2022-10-14 21:17:39'),
(123, 'Fue ingresado un usuario nuevo Maria marlpz', 'INSERTAR', 'USUARIOS', '2022-10-14 21:18:38'),
(124, 'Fue actualizado el usuario Maria marlpz', 'ACTUALIZAR', 'USUARIOS', '2022-10-14 21:18:52'),
(125, 'Fue eliminado el usuario Maria mar', 'ELIMINAR', 'USUARIOS', '2022-10-14 21:18:59'),
(126, 'Fue ingresado un proveedor nuevo: Importaciones DM', 'INSERTAR', 'PROVEEDORES', '2022-10-14 21:21:50'),
(127, 'Fue actualizado el proveedor: Importaciones DM', 'ACTUALIZAR', 'PROVEEDORES', '2022-10-14 21:22:07'),
(128, 'Fue ingresado un proveedor nuevo: S y R', 'INSERTAR', 'PROVEEDORES', '2022-10-14 21:27:53'),
(129, 'Fue actualizado el proveedor: S y R', 'ACTUALIZAR', 'PROVEEDORES', '2022-10-14 21:28:05'),
(130, 'Fue ingresado un cliente nuevo: Carlos Ramirez', 'INSERTAR', 'CLIENTES', '2022-10-14 21:29:45'),
(131, 'Fue actualizado el cliente: Carlos Ramirez', 'INSERTAR', 'CLIENTES', '2022-10-14 21:30:01'),
(132, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-14 21:39:21'),
(133, 'Fue actualizado el articulo: cilindro , horse', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 21:39:21'),
(134, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-14 21:40:37'),
(135, 'Fue actualizado el articulo: cilindro , horse', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 21:40:37'),
(136, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-14 21:40:37'),
(137, 'Fue actualizado el articulo: cilindro , horse', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 21:40:38'),
(138, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-14 21:40:38'),
(139, 'Fue actualizado el articulo: Caucho arsen , caucho arsen', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 21:40:38'),
(140, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-14 21:40:38'),
(141, 'Fue actualizado el articulo: Caucho arsen , caucho arsen', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 21:40:38'),
(142, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-14 21:48:11'),
(143, 'Fue actualizado el articulo: cilindro , horse', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 21:48:11'),
(144, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-14 21:48:11'),
(145, 'Fue actualizado el articulo: Caucho arsen , caucho arsen', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 21:48:12'),
(146, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-14 21:48:12'),
(147, 'Fue actualizado el articulo: Caucho arsen , caucho arsen', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 21:48:12'),
(148, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-15 00:59:52'),
(149, 'Fue actualizado el articulo: Caucho TX , Caucho 16', 'ACTUALIZAR', 'ARTICULOS', '2022-10-15 00:59:52'),
(150, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-15 00:59:52'),
(151, 'Fue actualizado el articulo: Caucho TX , Caucho 16', 'ACTUALIZAR', 'ARTICULOS', '2022-10-15 00:59:52'),
(152, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-15 00:59:52'),
(153, 'Fue actualizado el articulo: Caucho TX , Caucho 16', 'ACTUALIZAR', 'ARTICULOS', '2022-10-15 00:59:52'),
(154, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-15 00:59:52'),
(155, 'Fue actualizado el articulo: cilindro , horse', 'ACTUALIZAR', 'ARTICULOS', '2022-10-15 00:59:52'),
(156, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-15 00:59:53'),
(157, 'Fue actualizado el articulo: cilindro , horse', 'ACTUALIZAR', 'ARTICULOS', '2022-10-15 00:59:53'),
(158, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-15 00:59:53'),
(159, 'Fue actualizado el articulo: cilindro , horse', 'ACTUALIZAR', 'ARTICULOS', '2022-10-15 00:59:53'),
(160, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-15 00:59:53'),
(161, 'Fue actualizado el articulo: cilindro , horse', 'ACTUALIZAR', 'ARTICULOS', '2022-10-15 00:59:53'),
(162, 'Fue actualizado el usuario Pedro (pedromrtz)', 'ACTUALIZAR', 'USUARIOS', '2022-10-15 01:53:57'),
(163, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-15 02:26:39'),
(164, 'Fue actualizado el articulo: Caucho TX , Caucho 16', 'ACTUALIZAR', 'ARTICULOS', '2022-10-15 02:26:39'),
(165, 'Fue actualizado el cliente: Manuel Perez', 'INSERTAR', 'CLIENTES', '2022-10-15 10:17:50'),
(166, 'Fue ingresado un usuario nuevo Sofia (sofiaj)', 'INSERTAR', 'USUARIOS', '2022-10-14 05:21:31'),
(167, 'Fue ingresado un usuario nuevo Luis (lsmrtnz)', 'INSERTAR', 'USUARIOS', '2022-10-14 05:29:23'),
(168, 'Fue actualizado el usuario Luis (lsmrtnz)', 'ACTUALIZAR', 'USUARIOS', '2022-10-14 05:29:34'),
(169, 'Fue eliminado el usuario Luis (lsmr)', 'ELIMINAR', 'USUARIOS', '2022-10-14 05:29:56'),
(170, 'Fue ingresado un proveedor nuevo: Csa DM', 'INSERTAR', 'PROVEEDORES', '2022-10-14 05:31:14'),
(171, 'Fue actualizado el proveedor: Csa DM', 'ACTUALIZAR', 'PROVEEDORES', '2022-10-14 05:31:36'),
(172, 'Fue eliminado el proveedor: Csa DM', 'ELIMINAR', 'PROVEEDORES', '2022-10-14 05:31:59'),
(173, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-14 05:32:50'),
(174, 'Fue actualizado el articulo: cilindro , horse', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 05:32:50'),
(175, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-14 05:32:50'),
(176, 'Fue actualizado el articulo: cilindro , horse', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 05:32:50'),
(177, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-14 05:32:50'),
(178, 'Fue actualizado el articulo: Caucho arsen , caucho arsen', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 05:32:50'),
(179, 'Fue registrada una nueva venta', 'INSERTAR', 'VENTAS', '2022-10-14 05:32:50'),
(180, 'Fue actualizado el articulo: Caucho arsen , caucho arsen', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 05:32:50'),
(181, 'Fue ingresado un cliente nuevo: Maria Gomez', 'INSERTAR', 'CLIENTES', '2022-10-14 05:35:18'),
(182, 'Fue actualizado el cliente: Maria Gomez', 'INSERTAR', 'CLIENTES', '2022-10-14 05:35:39'),
(183, 'Fue eliminado el cliente: Maria Gomez', 'ELIMINAR', 'CLIENTES', '2022-10-14 05:35:56'),
(184, 'Fue ingresada una categoria nueva: Luces', 'INSERTAR', 'CATEGORIAS', '2022-10-14 05:36:38'),
(185, 'Fue actualizada la categoria: Luces', 'ACTUALIZAR', 'CATEGORIAS', '2022-10-14 05:36:50'),
(186, 'Fue eliminada la categoria: Luz', 'ELIMINAR', 'CATEGORIA', '2022-10-14 05:37:06'),
(187, 'Fue ingresada una imagen nueva: caucho.jpg', 'INSERTAR', 'IMAGENES', '2022-10-14 05:38:05'),
(188, 'Fue ingresado un articulo nuevo: Caucho Owen , Caucho Owen', 'INSERTAR', 'ARTICULOS', '2022-10-14 05:38:05'),
(189, 'Fue actualizado el articulo: Caucho Owen , Caucho Owen', 'ACTUALIZAR', 'ARTICULOS', '2022-10-14 05:38:23'),
(190, 'Fue eliminado el articulo: Caucho Owen Caucho Owen', 'ELIMINAR', 'ARTICULOS', '2022-10-14 05:38:50'),
(191, 'Fue eliminada la imagen caucho.jpg', 'ELIMINAR', 'IMAGENES', '2022-10-14 05:38:50');

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
(7, 1, 'Rines', '2022-10-14'),
(10, 1, 'Frenos', '2022-10-15'),
(12, 1, 'Electricidad', '2022-10-15');

--
-- Disparadores `categorias`
--
DELIMITER $$
CREATE TRIGGER `actualiza_categoria` AFTER UPDATE ON `categorias` FOR EACH ROW BEGIN
	INSERT INTO bitacora (`operacion` , `accion` , `tabla`)
    VALUES ("ACTUALIZAR" , concat("Fue actualizada la categoria: ",old.nombreCategoria,"") , "CATEGORIAS");
    
    INSERT INTO trig_categoria (`accion`)
    VALUES (concat("Fue actualizada la categoria: ",old.nombreCategoria,""));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `elimina_categoria` AFTER DELETE ON `categorias` FOR EACH ROW BEGIN
	INSERT INTO bitacora (`operacion` , `accion` , `tabla`)
    VALUES ("ELIMINAR" , concat("Fue eliminada la categoria: ",old.nombreCategoria,"") , "CATEGORIA");
    
    INSERT INTO trig_categoria (`accion`)
    VALUES (concat("Fue eliminada la categoria: ",old.nombreCategoria,""));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `inserta_categoria` AFTER INSERT ON `categorias` FOR EACH ROW BEGIN
	INSERT INTO bitacora (`operacion` , `accion` , `tabla`)
    VALUES ("INSERTAR" , concat("Fue ingresada una categoria nueva: ",new.nombreCategoria,"") , "CATEGORIAS");
    
    INSERT INTO trig_categoria (`accion`)
    VALUES (concat("Fue ingresada una categoria nueva: ",new.nombreCategoria,""));
END
$$
DELIMITER ;

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
(1, 1, 'Miguel ', 'Rodriguez ', 'Caneyes ', 'miguell_19@hotmail.es', '04143754338', '259777789'),
(2, 1, 'Daniel Antonio', 'MÃ¡rquez Santander', 'San CristÃ³bal', 'daniel0802ams@gmail.com', '04247466987', '295443380'),
(3, 1, 'Pablo', 'Dominguez', 'ColÃ³n', 'pablod01@gmail.com', '04145987210', '185236984'),
(4, 1, 'Maria', 'Gonzalez', 'TÃ¡riba', 'mariag@hotmail.com', '04247895623', '20159763'),
(5, 1, 'NicolÃ¡s', 'Ortega', 'Rubio', 'Nicolaso@gmail.com', '04145287341', '198542369'),
(8, 1, 'Maria', 'Colmenares', 'Barrio Obrero', 'maria@gmail.com', '04241598774', '236598874'),
(9, 1, 'Manuel', 'Perez', 'Palmira', 'manuelprez@gmail.com', '04241520164', '152369896'),
(10, 1, 'Carlos', 'Ramirez', 'Lobatera', 'crls@gmail.com', '04142587410', '163254780');

--
-- Disparadores `clientes`
--
DELIMITER $$
CREATE TRIGGER `actualiza_cliente` AFTER UPDATE ON `clientes` FOR EACH ROW BEGIN
	INSERT INTO bitacora (`operacion` , `accion` , `tabla`)
    VALUES ("INSERTAR" , concat("Fue actualizado el cliente: ",old.nombre," ",old.apellido,"") , "CLIENTES");
    
    INSERT INTO trig_cliente (`accion`)
    VALUES (concat("Fue actualizado el cliente: ",old.nombre," ",old.apellido,""));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `elimina_cliente` AFTER DELETE ON `clientes` FOR EACH ROW BEGIN
	INSERT INTO bitacora (`operacion` , `accion` , `tabla`)
    VALUES ("ELIMINAR" , concat("Fue eliminado el cliente: ",old.nombre," ",old.apellido,"") , "CLIENTES");
    
    INSERT INTO trig_cliente (`accion`)
    VALUES (concat("Fue eliminado el cliente: ",old.nombre," ",old.apellido,""));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `inserta_cliente` AFTER INSERT ON `clientes` FOR EACH ROW BEGIN
	INSERT INTO bitacora (`operacion` , `accion` , `tabla`)
    VALUES ("INSERTAR" , concat("Fue ingresado un cliente nuevo: ",new.nombre," ",new.apellido,"") , "CLIENTES");
    
    INSERT INTO trig_cliente (`accion`)
    VALUES (concat("Fue ingresado un cliente nuevo: ",new.nombre," ",new.apellido,""));
END
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
(11, 2, '5f4c93be7de34.jpg', '../../archivos/5f4c93be7de34.jpg', '2022-09-18'),
(13, 2, 'caucho.jpg', '../../archivos/caucho.jpg', '2022-09-27'),
(16, 3, 'caucho.jpg', '../../archivos/caucho.jpg', '2022-10-14'),
(17, 2, 'cilindro tx.jpg', '../../archivos/cilindro tx.jpg', '2022-10-14'),
(20, 2, 'cilindro tx.jpg', '../../archivos/cilindro tx.jpg', '2022-10-14'),
(21, 2, 'cilindro tx.jpg', '../../archivos/cilindro tx.jpg', '2022-10-14'),
(26, 3, 'caucho.jpg', '../../archivos/caucho.jpg', '2022-10-14'),
(27, 2, 'kit de cilindro.jpg', '../../archivos/kit de cilindro.jpg', '2022-10-15'),
(29, 3, 'caucho arsen ii.jpg', '../../archivos/caucho arsen ii.jpg', '2022-10-15');

--
-- Disparadores `imagenes`
--
DELIMITER $$
CREATE TRIGGER `actualiza_imagen` AFTER UPDATE ON `imagenes` FOR EACH ROW BEGIN
	INSERT INTO bitacora (`operacion` , `accion` , `tabla`)
    VALUES ("ACTUALIZAR" , concat("Fue actualizada la imagen ",old.nombre,"") , "IMAGENES");
    
    INSERT INTO trig_imagenes (`accion`)
    VALUES (concat("Fue actualizada la imagen ",old.nombre,""));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `elimina_imagen` AFTER DELETE ON `imagenes` FOR EACH ROW BEGIN
	INSERT INTO bitacora (`operacion` , `accion` , `tabla`)
    VALUES ("ELIMINAR" , concat("Fue eliminada la imagen ",old.nombre,"") , "IMAGENES");
    
    INSERT INTO trig_imagenes (`accion`)
    VALUES (concat("Fue eliminada la imagen ",old.nombre,""));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `inserta_imagen` AFTER INSERT ON `imagenes` FOR EACH ROW BEGIN
	INSERT INTO bitacora (`operacion` , `accion` , `tabla`)
    VALUES ("INSERTAR" , concat("Fue ingresada una imagen nueva: ",new.nombre,"") , "IMAGENES");
    
    INSERT INTO trig_imagenes (`accion`)
    VALUES (concat("Fue ingresada una imagen nueva: ",new.nombre,""));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombrec` varchar(200) DEFAULT NULL,
  `rife` varchar(200) DEFAULT NULL,
  `representante` varchar(200) DEFAULT NULL,
  `rifr` varchar(200) DEFAULT NULL,
  `telefonor` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `id_usuario`, `nombrec`, `rife`, `representante`, `rifr`, `telefonor`) VALUES
(1, 0, 'Mundo X', '235415230', 'Daniel MÃ¡rquez', '295443380', '04247466987'),
(2, 0, 'Import SD', '285748604', 'Sebastian GÃ³mez', '303984811', '04247497999'),
(3, 0, 'Assoc S A', '265417150', 'Jobly BriceÃ±o', '297342298', '04247795752'),
(4, 0, 'Motos SHX', '201478541', 'Miguel Rodriguez', '274226045', '04143754338'),
(5, 1, 'Invers', '147852369', 'Martin Gonzalez', '201145210', '04142847851'),
(6, 1, 'Inv', '254177744', 'Pedro Lopez', '214587126', '04241521146'),
(9, 1, 'Motos Universal', '125748930', 'Maria Contreras', '203651478', '04142521415'),
(12, 1, 'Mundo de motos', '254113698', 'Juan Gomez', '156234789', '04241572589'),
(13, 1, 'Motos xd', '147852369', 'JosÃ© Sanchez', '203154795', '04241593578'),
(14, 1, 'Casa de la moto', '169587441', 'Carlos Sanchez', '196321450', '04241594264'),
(15, 1, 'Importaciones DM', '203698547', 'Daniel Martinez', '23695874', '04241230021'),
(16, 1, 'S y R', '201365412', 'Maria Gomez', '203154520', '04142582036');

--
-- Disparadores `proveedores`
--
DELIMITER $$
CREATE TRIGGER `actualiza_proveedor` AFTER UPDATE ON `proveedores` FOR EACH ROW BEGIN
	INSERT INTO bitacora (`operacion` , `accion` , `tabla`)
    VALUES ("ACTUALIZAR" , concat("Fue actualizado el proveedor: ",old.nombrec,"") , "PROVEEDORES");
    
    INSERT INTO trig_proveedor (`accion`)
    VALUES (concat("Fue actualizado el proveedor: ",old.nombrec,""));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `elimina_proveedor` AFTER DELETE ON `proveedores` FOR EACH ROW BEGIN
	INSERT INTO bitacora (`operacion` , `accion` , `tabla`)
    VALUES ("ELIMINAR" , concat("Fue eliminado el proveedor: ",old.nombrec,"") , "PROVEEDORES");
    
    INSERT INTO trig_proveedor (`accion`)
    VALUES (concat("Fue eliminado el proveedor: ",old.nombrec,""));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `inserta_provvedor` AFTER INSERT ON `proveedores` FOR EACH ROW BEGIN
	INSERT INTO bitacora (`operacion` , `accion` , `tabla`)
    VALUES ("INSERTAR" , concat("Fue ingresado un proveedor nuevo: ",new.nombrec,"") , "PROVEEDORES");
    
    INSERT INTO trig_proveedor (`accion`)
    VALUES (concat("Fue ingresado un proveedor nuevo: ",new.nombrec,""));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trig_articulo`
--

CREATE TABLE `trig_articulo` (
  `id` int(5) NOT NULL,
  `accion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `trig_articulo`
--

INSERT INTO `trig_articulo` (`id`, `accion`, `fecha_hora`) VALUES
(1, 'Fue eliminado el articulo: Cilindro TX TX', '2022-10-14 15:53:31'),
(2, 'Fue eliminado el articulo: Cilindro Horse II  Cilindro II12', '2022-10-14 15:53:39'),
(3, 'Fue eliminado el articulo: Caucho Freno', '2022-10-14 15:53:55'),
(4, 'Fue eliminado el articulo: Bujia Owen', '2022-10-14 15:55:03'),
(5, 'Fue eliminado el articulo: relacion cadena45', '2022-10-14 15:55:43'),
(6, 'Fue actualizado el articulo: Caucho TX , Caucho 16', '2022-10-14 16:56:08'),
(7, 'Fue actualizado el articulo: Cauchos , Owen', '2022-10-14 16:56:10'),
(8, 'Fue actualizado el articulo: cilindro , horse', '2022-10-14 16:56:12'),
(9, 'Fue ingresado un articulo nuevo: Cilindro Empire Kit cilindro empire tx 200', '2022-10-14 20:49:22'),
(10, 'Fue actualizado el articulo: Cilindro Empire , Kit cilindro empire ', '2022-10-14 20:49:35'),
(11, 'Fue actualizado el articulo: Cilindro Empire , Kit cilindro empire ', '2022-10-14 20:52:50'),
(12, 'Fue actualizado el articulo: Cilindro Empire , Kit cilindro empire ', '2022-10-14 20:52:50'),
(13, 'Fue actualizado el articulo: Cilindro Empire , Kit cilindro empire ', '2022-10-14 20:52:51'),
(14, 'Fue ingresado un articulo nuevo: Caucho arsen II Caucho arsen II', '2022-10-14 21:09:36'),
(15, 'Fue actualizado el articulo: Caucho arsen II , Caucho arsen II', '2022-10-14 21:10:09'),
(16, 'Fue eliminado el articulo: Caucho arsen II Caucho arsen II', '2022-10-14 21:10:29'),
(17, 'Fue ingresado un articulo nuevo: Caucho arsen caucho arsen', '2022-10-14 21:16:13'),
(18, 'Fue actualizado el articulo: Caucho arsen , caucho arsen', '2022-10-14 21:16:29'),
(19, 'Fue actualizado el articulo: cilindro , horse', '2022-10-14 21:39:21'),
(20, 'Fue actualizado el articulo: cilindro , horse', '2022-10-14 21:40:37'),
(21, 'Fue actualizado el articulo: cilindro , horse', '2022-10-14 21:40:38'),
(22, 'Fue actualizado el articulo: Caucho arsen , caucho arsen', '2022-10-14 21:40:38'),
(23, 'Fue actualizado el articulo: Caucho arsen , caucho arsen', '2022-10-14 21:40:38'),
(24, 'Fue actualizado el articulo: cilindro , horse', '2022-10-14 21:48:11'),
(25, 'Fue actualizado el articulo: Caucho arsen , caucho arsen', '2022-10-14 21:48:12'),
(26, 'Fue actualizado el articulo: Caucho arsen , caucho arsen', '2022-10-14 21:48:12'),
(27, 'Fue actualizado el articulo: Caucho TX , Caucho 16', '2022-10-15 00:59:52'),
(28, 'Fue actualizado el articulo: Caucho TX , Caucho 16', '2022-10-15 00:59:52'),
(29, 'Fue actualizado el articulo: Caucho TX , Caucho 16', '2022-10-15 00:59:52'),
(30, 'Fue actualizado el articulo: cilindro , horse', '2022-10-15 00:59:52'),
(31, 'Fue actualizado el articulo: cilindro , horse', '2022-10-15 00:59:53'),
(32, 'Fue actualizado el articulo: cilindro , horse', '2022-10-15 00:59:53'),
(33, 'Fue actualizado el articulo: cilindro , horse', '2022-10-15 00:59:53'),
(34, 'Fue actualizado el articulo: Caucho TX , Caucho 16', '2022-10-15 02:26:39'),
(35, 'Fue actualizado el articulo: cilindro , horse', '2022-10-14 05:32:50'),
(36, 'Fue actualizado el articulo: cilindro , horse', '2022-10-14 05:32:50'),
(37, 'Fue actualizado el articulo: Caucho arsen , caucho arsen', '2022-10-14 05:32:50'),
(38, 'Fue actualizado el articulo: Caucho arsen , caucho arsen', '2022-10-14 05:32:50'),
(39, 'Fue ingresado un articulo nuevo: Caucho Owen Caucho Owen', '2022-10-14 05:38:05'),
(40, 'Fue actualizado el articulo: Caucho Owen , Caucho Owen', '2022-10-14 05:38:23'),
(41, 'Fue eliminado el articulo: Caucho Owen Caucho Owen', '2022-10-14 05:38:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trig_categoria`
--

CREATE TABLE `trig_categoria` (
  `id` int(11) NOT NULL,
  `accion` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `trig_categoria`
--

INSERT INTO `trig_categoria` (`id`, `accion`, `fecha`) VALUES
(1, 'Fue actualizada la categoria: Rines', '2022-10-14 16:56:17'),
(2, 'Fue actualizada la categoria: Cadenas', '2022-10-14 16:56:19'),
(3, 'Fue actualizada la categoria: Cilindros', '2022-10-14 16:56:21'),
(4, 'Fue ingresada una categoria nueva: Frenos', '2022-10-14 20:49:49'),
(5, 'Fue ingresada una categoria nueva: Electricidad', '2022-10-14 21:10:49'),
(6, 'Fue eliminada la categoria: Electricidad', '2022-10-14 21:14:08'),
(7, 'Fue ingresada una categoria nueva: Partes electricas', '2022-10-14 21:17:20'),
(8, 'Fue actualizada la categoria: Partes electricas', '2022-10-14 21:17:39'),
(9, 'Fue ingresada una categoria nueva: Luces', '2022-10-14 05:36:38'),
(10, 'Fue actualizada la categoria: Luces', '2022-10-14 05:36:50'),
(11, 'Fue eliminada la categoria: Luz', '2022-10-14 05:37:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trig_cliente`
--

CREATE TABLE `trig_cliente` (
  `id` int(5) NOT NULL,
  `accion` varchar(255) NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `trig_cliente`
--

INSERT INTO `trig_cliente` (`id`, `accion`, `fecha_hora`) VALUES
(1, 'Fue eliminado el cliente: Pedro Ramirez', '2022-10-14 15:56:49'),
(2, 'Fue actualizado el cliente: Daniel Antonio MÃ¡rquez Santander', '2022-10-14 15:57:07'),
(3, 'Fue ingresado un cliente nuevo: Maria Colmenares', '2022-10-14 16:58:21'),
(4, 'Fue ingresado un cliente nuevo: Manuel Perez', '2022-10-14 20:52:18'),
(5, 'Fue actualizado el cliente: Manuel Perez', '2022-10-14 20:52:29'),
(6, 'Fue ingresado un cliente nuevo: Carlos Ramirez', '2022-10-14 21:29:45'),
(7, 'Fue actualizado el cliente: Carlos Ramirez', '2022-10-14 21:30:01'),
(8, 'Fue actualizado el cliente: Manuel Perez', '2022-10-15 10:17:50'),
(9, 'Fue ingresado un cliente nuevo: Maria Gomez', '2022-10-14 05:35:18'),
(10, 'Fue actualizado el cliente: Maria Gomez', '2022-10-14 05:35:39'),
(11, 'Fue eliminado el cliente: Maria Gomez', '2022-10-14 05:35:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trig_imagenes`
--

CREATE TABLE `trig_imagenes` (
  `id` int(11) NOT NULL,
  `accion` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `trig_imagenes`
--

INSERT INTO `trig_imagenes` (`id`, `accion`, `fecha`) VALUES
(1, 'Fue ingresada una imagen nueva', '2022-10-14 02:55:33'),
(2, 'Fue ingresada una imagen nueva', '2022-10-14 02:55:35'),
(3, 'Fue eliminada una imagen', '2022-10-14 02:58:50'),
(4, 'Fue eliminada una imagen', '2022-10-14 14:16:33'),
(5, 'Fue eliminada una imagen', '2022-10-14 14:16:44'),
(6, 'Fue eliminada una imagen', '2022-10-14 14:17:57'),
(7, 'Fue eliminada una imagen', '2022-10-14 14:18:05'),
(8, 'Fue eliminada la imagen cilindro tx.jpg', '2022-10-14 15:09:38'),
(9, 'Fue eliminada la imagen 619ZKXAruKL._AC_SX466_.jpg', '2022-10-14 15:10:58'),
(10, 'Fue ingresada una imagen nueva: cilindro.jpg', '2022-10-14 15:12:24'),
(11, 'Fue eliminada la imagen cilindro.jpg', '2022-10-14 15:14:48'),
(12, 'Fue ingresada una imagen nueva: caucho.jpg', '2022-10-14 15:15:38'),
(13, 'Fue eliminada la imagen cilindro.jpg', '2022-10-14 15:53:31'),
(14, 'Fue eliminada la imagen cilindro tx.jpg', '2022-10-14 15:53:40'),
(15, 'Fue eliminada la imagen cilindro tx.jpg', '2022-10-14 15:53:55'),
(16, 'Fue eliminada la imagen 814ryeJ6dUL._AC_SX679_.jpg', '2022-10-14 15:55:03'),
(17, 'Fue eliminada la imagen cadena_moto_2.jpg', '2022-10-14 15:55:43'),
(18, 'Fue ingresada una imagen nueva: kit de cilindro.jpg', '2022-10-14 20:49:22'),
(19, 'Fue ingresada una imagen nueva: caucho arsen ii.jpg', '2022-10-14 21:09:35'),
(20, 'Fue eliminada la imagen caucho arsen ii.jpg', '2022-10-14 21:10:29'),
(21, 'Fue ingresada una imagen nueva: caucho arsen ii.jpg', '2022-10-14 21:16:13'),
(22, 'Fue ingresada una imagen nueva: caucho.jpg', '2022-10-14 05:38:05'),
(23, 'Fue eliminada la imagen caucho.jpg', '2022-10-14 05:38:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trig_proveedor`
--

CREATE TABLE `trig_proveedor` (
  `id` int(11) NOT NULL,
  `accion` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `trig_proveedor`
--

INSERT INTO `trig_proveedor` (`id`, `accion`, `fecha`) VALUES
(1, 'Fue actualizado un proveedor', '2022-10-13 22:32:50'),
(2, 'Fue actualizado un proveedor', '2022-10-13 22:37:25'),
(3, 'Fue actualizado un proveedor: Mundo X', '2022-10-14 14:07:39'),
(4, 'Fue actualizado el proveedor: Import SD', '2022-10-14 14:09:20'),
(5, 'Fue actualizado el proveedor: Inversiones', '2022-10-14 15:06:41'),
(6, 'Fue eliminado el proveedor: Inversiones', '2022-10-14 15:06:51'),
(7, 'Fue ingresado un proveedor nuevo: Mundo de motos', '2022-10-14 15:09:09'),
(8, 'Fue eliminado el proveedor: asoc', '2022-10-14 15:56:15'),
(9, 'Fue ingresado un proveedor nuevo: Motos xd', '2022-10-14 16:57:29'),
(10, 'Fue actualizado el proveedor: Motos xd', '2022-10-14 17:03:10'),
(11, 'Fue ingresado un proveedor nuevo: Casa de la moto', '2022-10-14 20:51:17'),
(12, 'Fue actualizado el proveedor: Casa de la moto', '2022-10-14 20:51:29'),
(13, 'Fue ingresado un proveedor nuevo: Importaciones DM', '2022-10-14 21:21:50'),
(14, 'Fue actualizado el proveedor: Importaciones DM', '2022-10-14 21:22:07'),
(15, 'Fue ingresado un proveedor nuevo: S y R', '2022-10-14 21:27:53'),
(16, 'Fue actualizado el proveedor: S y R', '2022-10-14 21:28:05'),
(17, 'Fue ingresado un proveedor nuevo: Csa DM', '2022-10-14 05:31:14'),
(18, 'Fue actualizado el proveedor: Csa DM', '2022-10-14 05:31:36'),
(19, 'Fue eliminado el proveedor: Csa DM', '2022-10-14 05:31:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trig_usuarios`
--

CREATE TABLE `trig_usuarios` (
  `id` int(5) NOT NULL,
  `accion` varchar(255) NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `trig_usuarios`
--

INSERT INTO `trig_usuarios` (`id`, `accion`, `fecha_hora`) VALUES
(1, 'Fue eliminado el usuario Sofia sofiajim', '2022-10-14 15:55:56'),
(2, 'Fue actualizado el usuario Juan Juanprz', '2022-10-14 16:56:26'),
(3, 'Fue actualizado el usuario Maria mariaz', '2022-10-14 16:56:28'),
(4, 'Fue ingresado un usuario nuevo Luis  luischnz', '2022-10-14 16:56:56'),
(5, 'Fue ingresado un usuario nuevo Pedro pedromrt', '2022-10-14 20:50:21'),
(6, 'Fue actualizado el usuario Pedro pedromrt', '2022-10-14 20:50:30'),
(7, 'Fue ingresado un usuario nuevo Maria marlpz', '2022-10-14 21:18:38'),
(8, 'Fue actualizado el usuario Maria marlpz', '2022-10-14 21:18:52'),
(9, 'Fue eliminado el usuario Maria mar', '2022-10-14 21:18:59'),
(10, 'Fue actualizado el usuario Pedro (pedromrtz)', '2022-10-15 01:53:57'),
(11, 'Fue ingresado un usuario nuevo Sofia (sofiaj)', '2022-10-14 05:21:31'),
(12, 'Fue ingresado un usuario nuevo Luis (lsmrtnz)', '2022-10-14 05:29:23'),
(13, 'Fue actualizado el usuario Luis (lsmrtnz)', '2022-10-14 05:29:34'),
(14, 'Fue eliminado el usuario Luis (lsmr)', '2022-10-14 05:29:56');

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
(63, 'Fue registrada una nueva venta', '2022-10-14 15:24:52'),
(64, 'Fue registrada una nueva venta', '2022-10-14 15:24:52'),
(65, 'Fue registrada una nueva venta', '2022-10-14 15:24:52'),
(66, 'Fue registrada una nueva venta', '2022-10-14 15:24:53'),
(67, 'Fue registrada una nueva venta', '2022-10-14 20:52:50'),
(68, 'Fue registrada una nueva venta', '2022-10-14 20:52:50'),
(69, 'Fue registrada una nueva venta', '2022-10-14 20:52:51'),
(70, 'Fue registrada una nueva venta', '2022-10-14 21:39:21'),
(71, 'Fue registrada una nueva venta', '2022-10-14 21:40:37'),
(72, 'Fue registrada una nueva venta', '2022-10-14 21:40:37'),
(73, 'Fue registrada una nueva venta', '2022-10-14 21:40:38'),
(74, 'Fue registrada una nueva venta', '2022-10-14 21:40:38'),
(75, 'Fue registrada una nueva venta', '2022-10-14 21:48:11'),
(76, 'Fue registrada una nueva venta', '2022-10-14 21:48:11'),
(77, 'Fue registrada una nueva venta', '2022-10-14 21:48:12'),
(78, 'Fue registrada una nueva venta', '2022-10-15 00:59:52'),
(79, 'Fue registrada una nueva venta', '2022-10-15 00:59:52'),
(80, 'Fue registrada una nueva venta', '2022-10-15 00:59:52'),
(81, 'Fue registrada una nueva venta', '2022-10-15 00:59:52'),
(82, 'Fue registrada una nueva venta', '2022-10-15 00:59:53'),
(83, 'Fue registrada una nueva venta', '2022-10-15 00:59:53'),
(84, 'Fue registrada una nueva venta', '2022-10-15 00:59:53'),
(85, 'Fue registrada una nueva venta', '2022-10-15 02:26:39'),
(86, 'Fue registrada una nueva venta', '2022-10-14 05:32:50'),
(87, 'Fue registrada una nueva venta', '2022-10-14 05:32:50'),
(88, 'Fue registrada una nueva venta', '2022-10-14 05:32:50'),
(89, 'Fue registrada una nueva venta', '2022-10-14 05:32:50');

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
(6, 'Maria', 'Sanchez', 'Mars', '3da541559918a808c2402bba5012f6c60b27661c', '2022-10-09'),
(7, 'Carlos', 'Perez', 'carlosz', '2fc7f44e566c3b29ba7aed98dd8796a000cbb07c', '2022-10-09'),
(8, 'Luis', 'Sanchez', 'luissz', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2022-10-14'),
(9, 'Maria', 'Perez', 'mariaz', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2022-10-14'),
(10, 'Maria', 'Sanchez', 'mariasz', '23b23be9da2519c88f11c084310bcc0bf14417f8', '2022-10-14'),
(11, 'Carlos', 'Contreras', 'carloscntrs', 'ed00d4e5ddb694d8dc20e97f7a2022845e49228e', '2022-10-14'),
(12, 'Juan', 'Perez', 'Juanprz', '582349ae8b07260c1067fc3168572b67af86706f', '2022-10-14'),
(14, 'Luis ', 'Sanchez', 'luischnz', 'cc7b8755a2a153285a26a7568c30b88a27217f0f', '2022-10-14'),
(15, 'Pedro', 'Martinez', 'pedromrz', '8cb2237d0679ca88db6464eac60da96345513964', '2022-10-15'),
(16, 'Sofia', 'Jimenez', 'sofiaj', '8913dbc65c2fd0c0798c7a94dc0faa94e1955ed7', '2022-10-14');

--
-- Disparadores `usuarios`
--
DELIMITER $$
CREATE TRIGGER `actualiza_usuario` AFTER UPDATE ON `usuarios` FOR EACH ROW BEGIN
	INSERT INTO bitacora (`operacion` , `accion` , `tabla`)
    VALUES ("ACTUALIZAR" , concat("Fue actualizado el usuario ",old.nombre," (",old.email,")") , "USUARIOS");
    
    INSERT INTO trig_usuarios (`accion`)
    VALUES (concat("Fue actualizado el usuario ",old.nombre," (",old.email,")"));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `elimina_usuario` AFTER DELETE ON `usuarios` FOR EACH ROW BEGIN
	INSERT INTO bitacora (`operacion` , `accion` , `tabla`)
    VALUES ("ELIMINAR" , concat("Fue eliminado el usuario ",old.nombre," (",old.email,")") , "USUARIOS");
    
    INSERT INTO trig_usuarios (`accion`)
    VALUES (concat("Fue eliminado el usuario ",old.nombre," (",old.email,")"));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `inserta_usuario` AFTER INSERT ON `usuarios` FOR EACH ROW BEGIN
	INSERT INTO bitacora (`operacion` , `accion` , `tabla`)
    VALUES ("INSERTAR" , concat("Fue ingresado un usuario nuevo ",new.nombre," (",new.email,")") , "USUARIOS");
    
    INSERT INTO trig_usuarios (`accion`)
    VALUES (concat("Fue ingresado un usuario nuevo ",new.nombre," (",new.email,")"));
END
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
(32, 1, 6, 1, 100, '2022-10-14'),
(32, 1, 6, 1, 100, '2022-10-14'),
(32, 1, 12, 1, 30, '2022-10-14'),
(32, 1, 18, 1, 20, '2022-10-14'),
(33, 4, 26, 1, 30, '2022-10-15'),
(33, 4, 26, 1, 30, '2022-10-15'),
(33, 4, 26, 1, 30, '2022-10-15'),
(34, 1, 4, 1, 150, '2022-10-15'),
(35, 1, 4, 1, 150, '2022-10-15'),
(35, 1, 4, 1, 150, '2022-10-15'),
(35, 1, 28, 1, 20, '2022-10-15'),
(35, 1, 28, 1, 20, '2022-10-15'),
(36, 1, 4, 1, 150, '2022-10-15'),
(36, 1, 28, 1, 20, '2022-10-15'),
(36, 1, 28, 1, 20, '2022-10-15'),
(37, 5, 25, 1, 50, '2022-10-15'),
(37, 5, 25, 1, 50, '2022-10-15'),
(37, 5, 25, 1, 50, '2022-10-15'),
(37, 5, 4, 1, 150, '2022-10-15'),
(37, 5, 4, 1, 150, '2022-10-15'),
(37, 5, 4, 1, 150, '2022-10-15'),
(37, 5, 4, 1, 150, '2022-10-15'),
(38, 3, 25, 1, 50, '2022-10-15'),
(39, 9, 4, 1, 150, '2022-10-14'),
(39, 9, 4, 1, 150, '2022-10-14'),
(39, 9, 28, 1, 20, '2022-10-14'),
(39, 9, 28, 1, 20, '2022-10-14');

--
-- Disparadores `ventas`
--
DELIMITER $$
CREATE TRIGGER `actualiza_venta` AFTER UPDATE ON `ventas` FOR EACH ROW BEGIN
	INSERT INTO bitacora (`operacion` , `accion` , `tabla`)
    VALUES ("ACTUALIZAR" , "Fue actualizada una venta" , "VENTAS");
    
    INSERT INTO trig_ventas (`accion`)
    VALUES ("Fue actualizada una venta");
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `elimina_venta` AFTER DELETE ON `ventas` FOR EACH ROW BEGIN
	INSERT INTO bitacora (`operacion` , `accion` , `tabla`)
    VALUES ("ELIMINAR" , "Fue eliminada una venta" , "VENTAS");
    
    INSERT INTO trig_ventas (`accion`)
    VALUES ("Fue eliminada una venta");
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `inserta_venta` AFTER INSERT ON `ventas` FOR EACH ROW BEGIN
	INSERT INTO bitacora (`operacion` , `accion` , `tabla`)
    VALUES ("INSERTAR" , "Fue registrada una nueva venta" , "VENTAS");
    
    INSERT INTO trig_ventas (`accion`)
    VALUES ("Fue registrada una nueva venta");
END
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
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id`);

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
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `trig_articulo`
--
ALTER TABLE `trig_articulo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trig_categoria`
--
ALTER TABLE `trig_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trig_cliente`
--
ALTER TABLE `trig_cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trig_imagenes`
--
ALTER TABLE `trig_imagenes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trig_proveedor`
--
ALTER TABLE `trig_proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trig_usuarios`
--
ALTER TABLE `trig_usuarios`
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
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `id_imagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `trig_articulo`
--
ALTER TABLE `trig_articulo`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `trig_categoria`
--
ALTER TABLE `trig_categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `trig_cliente`
--
ALTER TABLE `trig_cliente`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `trig_imagenes`
--
ALTER TABLE `trig_imagenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `trig_proveedor`
--
ALTER TABLE `trig_proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `trig_usuarios`
--
ALTER TABLE `trig_usuarios`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `trig_ventas`
--
ALTER TABLE `trig_ventas`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
