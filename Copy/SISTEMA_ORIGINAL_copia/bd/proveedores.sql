-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-10-2022 a las 23:26:08
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
(13, 1, 'Motos xd', '147852369', 'JosÃ© Sanchez', '203154795', '04241593578');

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

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
