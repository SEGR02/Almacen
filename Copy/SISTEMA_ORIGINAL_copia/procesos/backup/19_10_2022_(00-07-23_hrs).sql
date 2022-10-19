SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE IF NOT EXISTS ventas;

USE ventas;

DROP TABLE IF EXISTS articulos;

CREATE TABLE `articulos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL,
  `id_imagen` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `ganancia` int(11) DEFAULT NULL,
  `fechaCaptura` date DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_imagen` (`id_imagen`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

INSERT INTO articulos VALUES("4","2","4","1","cilindro","horse","30","130","150","20","2022-07-27");
INSERT INTO articulos VALUES("6","3","6","1","Cauchos","Owen","46","70","100","30","2022-07-27");
INSERT INTO articulos VALUES("25","3","26","1","Caucho TX","Caucho 16","16","","50","","2022-10-14");
INSERT INTO articulos VALUES("26","2","27","1","Cilindro Empire","Kit cilindro empire ","17","","30","","2022-10-15");
INSERT INTO articulos VALUES("28","3","29","1","Caucho arsen","caucho arsen","19","","20","","2022-10-15");



DROP TABLE IF EXISTS bitacora;

CREATE TABLE `bitacora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accion` varchar(255) NOT NULL,
  `operacion` varchar(255) NOT NULL,
  `tabla` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=latin1;

INSERT INTO bitacora VALUES("1","Fue ingresado un articulo nuevo","INSERTAR","ARTICULOS","2022-10-13 20:54:20");
INSERT INTO bitacora VALUES("2","Fue ingresado un articulo nuevo","INSERTAR","ARTICULOS","2022-10-13 21:12:16");
INSERT INTO bitacora VALUES("3","Fue ingresado un articulo nuevo","INSERTAR","ARTICULOS","2022-10-13 21:16:46");
INSERT INTO bitacora VALUES("4","Se actualizo un artículo","ACTUALIZAR","ARTICULOS","2022-10-13 21:17:20");
INSERT INTO bitacora VALUES("5","Se actualizo un artículo","ACTUALIZAR","ARTICULOS","2022-10-13 21:17:23");
INSERT INTO bitacora VALUES("6","Fue ingresado un articulo nuevo:","INSERTAR","ARTICULOS","2022-10-13 21:21:36");
INSERT INTO bitacora VALUES("7","Fue ingresada una categoria nueva:","INSERTAR","CATEGORIAS","2022-10-13 21:28:45");
INSERT INTO bitacora VALUES("8","Fue actualizado un cliente","INSERTAR","CLIENTES","2022-10-13 21:51:25");
INSERT INTO bitacora VALUES("9","Fue actualizado un usuario","ACTUALIZAR","USUARIOS","2022-10-13 22:32:16");
INSERT INTO bitacora VALUES("10","Fue actualizado un proveedor","ACTUALIZAR","PROVEEDORES","2022-10-13 22:32:50");
INSERT INTO bitacora VALUES("11","Fue actualizado un proveedor","ACTUALIZAR","PROVEEDORES","2022-10-13 22:37:25");
INSERT INTO bitacora VALUES("12","Fue actualizado un cliente","INSERTAR","CLIENTES","2022-10-13 22:37:33");
INSERT INTO bitacora VALUES("13","Fue actualizado un usuario","ACTUALIZAR","USUARIOS","2022-10-13 22:37:39");
INSERT INTO bitacora VALUES("14","Se actualizo un artículo","ACTUALIZAR","ARTICULOS","2022-10-13 22:37:44");
INSERT INTO bitacora VALUES("15","Fue actualizado un cliente","INSERTAR","CLIENTES","2022-10-14 01:16:01");
INSERT INTO bitacora VALUES("16","Fue ingresada una imagen nueva:","INSERTAR","IMAGENES","2022-10-14 02:55:33");
INSERT INTO bitacora VALUES("17","Fue ingresado un articulo nuevo: Cilindro","INSERTAR","ARTICULOS","2022-10-14 02:55:35");
INSERT INTO bitacora VALUES("18","Fue ingresada una imagen nueva:","INSERTAR","IMAGENES","2022-10-14 02:55:35");
INSERT INTO bitacora VALUES("19","Fue ingresado un articulo nuevo: Cilindro","INSERTAR","ARTICULOS","2022-10-14 02:55:36");
INSERT INTO bitacora VALUES("20","Fue eliminadoo un articulo: Cilindro , TX","ELIMINAR","ARTICULOS","2022-10-14 02:58:50");
INSERT INTO bitacora VALUES("21","Fue eliminada una imagen","ELIMINAR","IMAGENES","2022-10-14 02:58:50");
INSERT INTO bitacora VALUES("22","Fue actualizado un proveedor: Mundo X","ACTUALIZAR","PROVEEDORES","2022-10-14 14:07:39");
INSERT INTO bitacora VALUES("23","Fue actualizado el proveedor: Import SD","ACTUALIZAR","PROVEEDORES","2022-10-14 14:09:20");
INSERT INTO bitacora VALUES("24","Fue eliminadoo el articulo: Cadena RKV  (RKV cadena 15 2001)","ELIMINAR","ARTICULOS","2022-10-14 14:16:33");
INSERT INTO bitacora VALUES("25","Fue eliminada una imagen","ELIMINAR","IMAGENES","2022-10-14 14:16:33");
INSERT INTO bitacora VALUES("26","Fue eliminadoo el articulo: Amortiguador  (Suzuki)","ELIMINAR","ARTICULOS","2022-10-14 14:16:44");
INSERT INTO bitacora VALUES("27","Fue eliminada una imagen","ELIMINAR","IMAGENES","2022-10-14 14:16:44");
INSERT INTO bitacora VALUES("28","Fue eliminadoo el articulo: Cilindro  (TX)","ELIMINAR","ARTICULOS","2022-10-14 14:17:57");
INSERT INTO bitacora VALUES("29","Fue eliminada una imagen","ELIMINAR","IMAGENES","2022-10-14 14:17:57");
INSERT INTO bitacora VALUES("30","Fue eliminadoo el articulo: Cilindro  (TX)","ELIMINAR","ARTICULOS","2022-10-14 14:18:05");
INSERT INTO bitacora VALUES("31","Fue eliminada una imagen","ELIMINAR","IMAGENES","2022-10-14 14:18:05");
INSERT INTO bitacora VALUES("32","Fue ingresada una categoria nueva: Luces","INSERTAR","CATEGORIAS","2022-10-14 14:21:16");
INSERT INTO bitacora VALUES("33","Fue actualizada la categoria: Luz","ACTUALIZAR","CATEGORIAS","2022-10-14 14:21:25");
INSERT INTO bitacora VALUES("34","Fue eliminada la categoria: Luz","ELIMINAR","CATEGORIA","2022-10-14 14:21:28");
INSERT INTO bitacora VALUES("35","Fue actualizado el cliente: Miguel ","INSERTAR","CLIENTES","2022-10-14 14:25:27");
INSERT INTO bitacora VALUES("36","Fue actualizado el cliente: Miguel  Rodriguez ","INSERTAR","CLIENTES","2022-10-14 14:27:23");
INSERT INTO bitacora VALUES("37","Fue eliminado el cliente: Carlos Sanchez","ELIMINAR","CLIENTES","2022-10-14 14:48:11");
INSERT INTO bitacora VALUES("38","Fue actualizado el cliente: Luis Ramirez","INSERTAR","CLIENTES","2022-10-14 14:48:13");
INSERT INTO bitacora VALUES("39","Fue actualizado el cliente: Luis Ramirez","INSERTAR","CLIENTES","2022-10-14 15:05:43");
INSERT INTO bitacora VALUES("40","Fue actualizado el proveedor: Inversiones","ACTUALIZAR","PROVEEDORES","2022-10-14 15:06:41");
INSERT INTO bitacora VALUES("41","Fue eliminado el proveedor: Inversiones","ELIMINAR","PROVEEDORES","2022-10-14 15:06:51");
INSERT INTO bitacora VALUES("42","Fue ingresado un proveedor nuevo: Mundo de motos","INSERTAR","PROVEEDORES","2022-10-14 15:09:09");
INSERT INTO bitacora VALUES("43","Fue eliminadoo el articulo: Cilindro  (Cilindro)","ELIMINAR","ARTICULOS","2022-10-14 15:09:38");
INSERT INTO bitacora VALUES("44","Fue eliminada la imagen cilindro tx.jpg","ELIMINAR","IMAGENES","2022-10-14 15:09:38");
INSERT INTO bitacora VALUES("45","Fue eliminadoo el articulo: Rin KLR","ELIMINAR","ARTICULOS","2022-10-14 15:10:58");
INSERT INTO bitacora VALUES("46","Fue eliminada la imagen 619ZKXAruKL._AC_SX466_.jpg","ELIMINAR","IMAGENES","2022-10-14 15:10:58");
INSERT INTO bitacora VALUES("47","Fue actualizado el articulo: Bujia , (Owen)","ACTUALIZAR","ARTICULOS","2022-10-14 15:11:06");
INSERT INTO bitacora VALUES("48","Fue ingresada una imagen nueva: cilindro.jpg","INSERTAR","IMAGENES","2022-10-14 15:12:24");
INSERT INTO bitacora VALUES("49","Fue ingresado un articulo nuevo: Cilindro Horse II , Cilindro 2.0 Horse II","INSERTAR","ARTICULOS","2022-10-14 15:12:24");
INSERT INTO bitacora VALUES("50","Fue actualizado el articulo: Cilindro Horse II , Cilindro  Horse II","ACTUALIZAR","ARTICULOS","2022-10-14 15:14:22");
INSERT INTO bitacora VALUES("51","Fue eliminadoo el articulo: Cilindro Horse II Cilindro  Horse II","ELIMINAR","ARTICULOS","2022-10-14 15:14:48");
INSERT INTO bitacora VALUES("52","Fue eliminada la imagen cilindro.jpg","ELIMINAR","IMAGENES","2022-10-14 15:14:48");
INSERT INTO bitacora VALUES("53","Fue ingresada una imagen nueva: caucho.jpg","INSERTAR","IMAGENES","2022-10-14 15:15:38");
INSERT INTO bitacora VALUES("54","Fue ingresado un articulo nuevo: Caucho TX , Caucho 16","INSERTAR","ARTICULOS","2022-10-14 15:15:38");
INSERT INTO bitacora VALUES("55","Fue ingresada una categoria nueva: Guayas","INSERTAR","CATEGORIAS","2022-10-14 15:16:03");
INSERT INTO bitacora VALUES("56","Fue actualizada la categoria: Guaya","ACTUALIZAR","CATEGORIAS","2022-10-14 15:16:36");
INSERT INTO bitacora VALUES("57","Fue eliminada la categoria: Guaya","ELIMINAR","CATEGORIA","2022-10-14 15:16:39");
INSERT INTO bitacora VALUES("58","Fue actualizada la categoria: Ruedas","ACTUALIZAR","CATEGORIAS","2022-10-14 15:20:17");
INSERT INTO bitacora VALUES("59","Fue actualizado el usuario Maria mariajim","ACTUALIZAR","USUARIOS","2022-10-14 15:22:52");
INSERT INTO bitacora VALUES("60","Fue actualizado el cliente: Luis Ramirez","INSERTAR","CLIENTES","2022-10-14 15:23:45");
INSERT INTO bitacora VALUES("61","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-14 15:24:52");
INSERT INTO bitacora VALUES("62","Fue actualizado el articulo: Cauchos , Owen","ACTUALIZAR","ARTICULOS","2022-10-14 15:24:52");
INSERT INTO bitacora VALUES("63","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-14 15:24:52");
INSERT INTO bitacora VALUES("64","Fue actualizado el articulo: Cauchos , Owen","ACTUALIZAR","ARTICULOS","2022-10-14 15:24:52");
INSERT INTO bitacora VALUES("65","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-14 15:24:52");
INSERT INTO bitacora VALUES("66","Fue actualizado el articulo: Cilindro TX , TX","ACTUALIZAR","ARTICULOS","2022-10-14 15:24:52");
INSERT INTO bitacora VALUES("67","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-14 15:24:53");
INSERT INTO bitacora VALUES("68","Fue actualizado el articulo: Caucho , Freno","ACTUALIZAR","ARTICULOS","2022-10-14 15:24:53");
INSERT INTO bitacora VALUES("69","Fue eliminadoo el articulo: Cilindro TX TX","ELIMINAR","ARTICULOS","2022-10-14 15:53:31");
INSERT INTO bitacora VALUES("70","Fue eliminada la imagen cilindro.jpg","ELIMINAR","IMAGENES","2022-10-14 15:53:31");
INSERT INTO bitacora VALUES("71","Fue eliminadoo el articulo: Cilindro Horse II  Cilindro II12","ELIMINAR","ARTICULOS","2022-10-14 15:53:39");
INSERT INTO bitacora VALUES("72","Fue eliminada la imagen cilindro tx.jpg","ELIMINAR","IMAGENES","2022-10-14 15:53:40");
INSERT INTO bitacora VALUES("73","Fue eliminadoo el articulo: Caucho Freno","ELIMINAR","ARTICULOS","2022-10-14 15:53:55");
INSERT INTO bitacora VALUES("74","Fue eliminada la imagen cilindro tx.jpg","ELIMINAR","IMAGENES","2022-10-14 15:53:55");
INSERT INTO bitacora VALUES("75","Fue eliminado el articulo: Bujia Owen","ELIMINAR","ARTICULOS","2022-10-14 15:55:03");
INSERT INTO bitacora VALUES("76","Fue eliminada la imagen 814ryeJ6dUL._AC_SX679_.jpg","ELIMINAR","IMAGENES","2022-10-14 15:55:03");
INSERT INTO bitacora VALUES("77","Fue eliminado el articulo: relacion cadena45","ELIMINAR","ARTICULOS","2022-10-14 15:55:43");
INSERT INTO bitacora VALUES("78","Fue eliminada la imagen cadena_moto_2.jpg","ELIMINAR","IMAGENES","2022-10-14 15:55:43");
INSERT INTO bitacora VALUES("79","Fue eliminado el usuario Sofia sofiajim","ELIMINAR","USUARIOS","2022-10-14 15:55:56");
INSERT INTO bitacora VALUES("80","Fue eliminado el proveedor: asoc","ELIMINAR","PROVEEDORES","2022-10-14 15:56:15");
INSERT INTO bitacora VALUES("81","Fue eliminado el cliente: Pedro Ramirez","ELIMINAR","CLIENTES","2022-10-14 15:56:49");
INSERT INTO bitacora VALUES("82","Fue actualizado el cliente: Daniel Antonio MÃ¡rquez Santander","INSERTAR","CLIENTES","2022-10-14 15:57:07");
INSERT INTO bitacora VALUES("83","Fue actualizado el articulo: Caucho TX , Caucho 16","ACTUALIZAR","ARTICULOS","2022-10-14 16:56:08");
INSERT INTO bitacora VALUES("84","Fue actualizado el articulo: Cauchos , Owen","ACTUALIZAR","ARTICULOS","2022-10-14 16:56:10");
INSERT INTO bitacora VALUES("85","Fue actualizado el articulo: cilindro , horse","ACTUALIZAR","ARTICULOS","2022-10-14 16:56:12");
INSERT INTO bitacora VALUES("86","Fue actualizada la categoria: Rines","ACTUALIZAR","CATEGORIAS","2022-10-14 16:56:17");
INSERT INTO bitacora VALUES("87","Fue actualizada la categoria: Cadenas","ACTUALIZAR","CATEGORIAS","2022-10-14 16:56:19");
INSERT INTO bitacora VALUES("88","Fue actualizada la categoria: Cilindros","ACTUALIZAR","CATEGORIAS","2022-10-14 16:56:21");
INSERT INTO bitacora VALUES("89","Fue actualizado el usuario Juan Juanprz","ACTUALIZAR","USUARIOS","2022-10-14 16:56:26");
INSERT INTO bitacora VALUES("90","Fue actualizado el usuario Maria mariaz","ACTUALIZAR","USUARIOS","2022-10-14 16:56:28");
INSERT INTO bitacora VALUES("91","Fue ingresado un usuario nuevo Luis  luischnz","INSERTAR","USUARIOS","2022-10-14 16:56:56");
INSERT INTO bitacora VALUES("92","Fue ingresado un proveedor nuevo: Motos xd","INSERTAR","PROVEEDORES","2022-10-14 16:57:29");
INSERT INTO bitacora VALUES("93","Fue ingresado un cliente nuevo: Maria Colmenares","INSERTAR","CLIENTES","2022-10-14 16:58:21");
INSERT INTO bitacora VALUES("94","Fue actualizado el proveedor: Motos xd","ACTUALIZAR","PROVEEDORES","2022-10-14 17:03:10");
INSERT INTO bitacora VALUES("95","Fue ingresada una imagen nueva: kit de cilindro.jpg","INSERTAR","IMAGENES","2022-10-14 20:49:22");
INSERT INTO bitacora VALUES("96","Fue ingresado un articulo nuevo: Cilindro Empire , Kit cilindro empire tx 200","INSERTAR","ARTICULOS","2022-10-14 20:49:22");
INSERT INTO bitacora VALUES("97","Fue actualizado el articulo: Cilindro Empire , Kit cilindro empire ","ACTUALIZAR","ARTICULOS","2022-10-14 20:49:35");
INSERT INTO bitacora VALUES("98","Fue ingresada una categoria nueva: Frenos","INSERTAR","CATEGORIAS","2022-10-14 20:49:49");
INSERT INTO bitacora VALUES("99","Fue ingresado un usuario nuevo Pedro pedromrt","INSERTAR","USUARIOS","2022-10-14 20:50:21");
INSERT INTO bitacora VALUES("100","Fue actualizado el usuario Pedro pedromrt","ACTUALIZAR","USUARIOS","2022-10-14 20:50:30");
INSERT INTO bitacora VALUES("101","Fue ingresado un proveedor nuevo: Casa de la moto","INSERTAR","PROVEEDORES","2022-10-14 20:51:17");
INSERT INTO bitacora VALUES("102","Fue actualizado el proveedor: Casa de la moto","ACTUALIZAR","PROVEEDORES","2022-10-14 20:51:29");
INSERT INTO bitacora VALUES("103","Fue ingresado un cliente nuevo: Manuel Perez","INSERTAR","CLIENTES","2022-10-14 20:52:18");
INSERT INTO bitacora VALUES("104","Fue actualizado el cliente: Manuel Perez","INSERTAR","CLIENTES","2022-10-14 20:52:29");
INSERT INTO bitacora VALUES("105","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-14 20:52:50");
INSERT INTO bitacora VALUES("106","Fue actualizado el articulo: Cilindro Empire , Kit cilindro empire ","ACTUALIZAR","ARTICULOS","2022-10-14 20:52:50");
INSERT INTO bitacora VALUES("107","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-14 20:52:50");
INSERT INTO bitacora VALUES("108","Fue actualizado el articulo: Cilindro Empire , Kit cilindro empire ","ACTUALIZAR","ARTICULOS","2022-10-14 20:52:50");
INSERT INTO bitacora VALUES("109","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-14 20:52:51");
INSERT INTO bitacora VALUES("110","Fue actualizado el articulo: Cilindro Empire , Kit cilindro empire ","ACTUALIZAR","ARTICULOS","2022-10-14 20:52:51");
INSERT INTO bitacora VALUES("111","Fue ingresada una imagen nueva: caucho arsen ii.jpg","INSERTAR","IMAGENES","2022-10-14 21:09:35");
INSERT INTO bitacora VALUES("112","Fue ingresado un articulo nuevo: Caucho arsen II , Caucho arsen II","INSERTAR","ARTICULOS","2022-10-14 21:09:36");
INSERT INTO bitacora VALUES("113","Fue actualizado el articulo: Caucho arsen II , Caucho arsen II","ACTUALIZAR","ARTICULOS","2022-10-14 21:10:09");
INSERT INTO bitacora VALUES("114","Fue eliminado el articulo: Caucho arsen II Caucho arsen II","ELIMINAR","ARTICULOS","2022-10-14 21:10:29");
INSERT INTO bitacora VALUES("115","Fue eliminada la imagen caucho arsen ii.jpg","ELIMINAR","IMAGENES","2022-10-14 21:10:29");
INSERT INTO bitacora VALUES("116","Fue ingresada una categoria nueva: Electricidad","INSERTAR","CATEGORIAS","2022-10-14 21:10:49");
INSERT INTO bitacora VALUES("117","Fue eliminada la categoria: Electricidad","ELIMINAR","CATEGORIA","2022-10-14 21:14:08");
INSERT INTO bitacora VALUES("118","Fue ingresada una imagen nueva: caucho arsen ii.jpg","INSERTAR","IMAGENES","2022-10-14 21:16:13");
INSERT INTO bitacora VALUES("119","Fue ingresado un articulo nuevo: Caucho arsen , caucho arsen","INSERTAR","ARTICULOS","2022-10-14 21:16:13");
INSERT INTO bitacora VALUES("120","Fue actualizado el articulo: Caucho arsen , caucho arsen","ACTUALIZAR","ARTICULOS","2022-10-14 21:16:29");
INSERT INTO bitacora VALUES("121","Fue ingresada una categoria nueva: Partes electricas","INSERTAR","CATEGORIAS","2022-10-14 21:17:20");
INSERT INTO bitacora VALUES("122","Fue actualizada la categoria: Partes electricas","ACTUALIZAR","CATEGORIAS","2022-10-14 21:17:39");
INSERT INTO bitacora VALUES("123","Fue ingresado un usuario nuevo Maria marlpz","INSERTAR","USUARIOS","2022-10-14 21:18:38");
INSERT INTO bitacora VALUES("124","Fue actualizado el usuario Maria marlpz","ACTUALIZAR","USUARIOS","2022-10-14 21:18:52");
INSERT INTO bitacora VALUES("125","Fue eliminado el usuario Maria mar","ELIMINAR","USUARIOS","2022-10-14 21:18:59");
INSERT INTO bitacora VALUES("126","Fue ingresado un proveedor nuevo: Importaciones DM","INSERTAR","PROVEEDORES","2022-10-14 21:21:50");
INSERT INTO bitacora VALUES("127","Fue actualizado el proveedor: Importaciones DM","ACTUALIZAR","PROVEEDORES","2022-10-14 21:22:07");
INSERT INTO bitacora VALUES("128","Fue ingresado un proveedor nuevo: S y R","INSERTAR","PROVEEDORES","2022-10-14 21:27:53");
INSERT INTO bitacora VALUES("129","Fue actualizado el proveedor: S y R","ACTUALIZAR","PROVEEDORES","2022-10-14 21:28:05");
INSERT INTO bitacora VALUES("130","Fue ingresado un cliente nuevo: Carlos Ramirez","INSERTAR","CLIENTES","2022-10-14 21:29:45");
INSERT INTO bitacora VALUES("131","Fue actualizado el cliente: Carlos Ramirez","INSERTAR","CLIENTES","2022-10-14 21:30:01");
INSERT INTO bitacora VALUES("132","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-14 21:39:21");
INSERT INTO bitacora VALUES("133","Fue actualizado el articulo: cilindro , horse","ACTUALIZAR","ARTICULOS","2022-10-14 21:39:21");
INSERT INTO bitacora VALUES("134","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-14 21:40:37");
INSERT INTO bitacora VALUES("135","Fue actualizado el articulo: cilindro , horse","ACTUALIZAR","ARTICULOS","2022-10-14 21:40:37");
INSERT INTO bitacora VALUES("136","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-14 21:40:37");
INSERT INTO bitacora VALUES("137","Fue actualizado el articulo: cilindro , horse","ACTUALIZAR","ARTICULOS","2022-10-14 21:40:38");
INSERT INTO bitacora VALUES("138","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-14 21:40:38");
INSERT INTO bitacora VALUES("139","Fue actualizado el articulo: Caucho arsen , caucho arsen","ACTUALIZAR","ARTICULOS","2022-10-14 21:40:38");
INSERT INTO bitacora VALUES("140","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-14 21:40:38");
INSERT INTO bitacora VALUES("141","Fue actualizado el articulo: Caucho arsen , caucho arsen","ACTUALIZAR","ARTICULOS","2022-10-14 21:40:38");
INSERT INTO bitacora VALUES("142","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-14 21:48:11");
INSERT INTO bitacora VALUES("143","Fue actualizado el articulo: cilindro , horse","ACTUALIZAR","ARTICULOS","2022-10-14 21:48:11");
INSERT INTO bitacora VALUES("144","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-14 21:48:11");
INSERT INTO bitacora VALUES("145","Fue actualizado el articulo: Caucho arsen , caucho arsen","ACTUALIZAR","ARTICULOS","2022-10-14 21:48:12");
INSERT INTO bitacora VALUES("146","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-14 21:48:12");
INSERT INTO bitacora VALUES("147","Fue actualizado el articulo: Caucho arsen , caucho arsen","ACTUALIZAR","ARTICULOS","2022-10-14 21:48:12");
INSERT INTO bitacora VALUES("148","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-15 00:59:52");
INSERT INTO bitacora VALUES("149","Fue actualizado el articulo: Caucho TX , Caucho 16","ACTUALIZAR","ARTICULOS","2022-10-15 00:59:52");
INSERT INTO bitacora VALUES("150","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-15 00:59:52");
INSERT INTO bitacora VALUES("151","Fue actualizado el articulo: Caucho TX , Caucho 16","ACTUALIZAR","ARTICULOS","2022-10-15 00:59:52");
INSERT INTO bitacora VALUES("152","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-15 00:59:52");
INSERT INTO bitacora VALUES("153","Fue actualizado el articulo: Caucho TX , Caucho 16","ACTUALIZAR","ARTICULOS","2022-10-15 00:59:52");
INSERT INTO bitacora VALUES("154","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-15 00:59:52");
INSERT INTO bitacora VALUES("155","Fue actualizado el articulo: cilindro , horse","ACTUALIZAR","ARTICULOS","2022-10-15 00:59:52");
INSERT INTO bitacora VALUES("156","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-15 00:59:53");
INSERT INTO bitacora VALUES("157","Fue actualizado el articulo: cilindro , horse","ACTUALIZAR","ARTICULOS","2022-10-15 00:59:53");
INSERT INTO bitacora VALUES("158","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-15 00:59:53");
INSERT INTO bitacora VALUES("159","Fue actualizado el articulo: cilindro , horse","ACTUALIZAR","ARTICULOS","2022-10-15 00:59:53");
INSERT INTO bitacora VALUES("160","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-15 00:59:53");
INSERT INTO bitacora VALUES("161","Fue actualizado el articulo: cilindro , horse","ACTUALIZAR","ARTICULOS","2022-10-15 00:59:53");
INSERT INTO bitacora VALUES("162","Fue actualizado el usuario Pedro (pedromrtz)","ACTUALIZAR","USUARIOS","2022-10-15 01:53:57");
INSERT INTO bitacora VALUES("163","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-15 02:26:39");
INSERT INTO bitacora VALUES("164","Fue actualizado el articulo: Caucho TX , Caucho 16","ACTUALIZAR","ARTICULOS","2022-10-15 02:26:39");
INSERT INTO bitacora VALUES("165","Fue actualizado el cliente: Manuel Perez","INSERTAR","CLIENTES","2022-10-15 10:17:50");
INSERT INTO bitacora VALUES("166","Fue ingresado un usuario nuevo Sofia (sofiaj)","INSERTAR","USUARIOS","2022-10-14 05:21:31");
INSERT INTO bitacora VALUES("167","Fue ingresado un usuario nuevo Luis (lsmrtnz)","INSERTAR","USUARIOS","2022-10-14 05:29:23");
INSERT INTO bitacora VALUES("168","Fue actualizado el usuario Luis (lsmrtnz)","ACTUALIZAR","USUARIOS","2022-10-14 05:29:34");
INSERT INTO bitacora VALUES("169","Fue eliminado el usuario Luis (lsmr)","ELIMINAR","USUARIOS","2022-10-14 05:29:56");
INSERT INTO bitacora VALUES("170","Fue ingresado un proveedor nuevo: Csa DM","INSERTAR","PROVEEDORES","2022-10-14 05:31:14");
INSERT INTO bitacora VALUES("171","Fue actualizado el proveedor: Csa DM","ACTUALIZAR","PROVEEDORES","2022-10-14 05:31:36");
INSERT INTO bitacora VALUES("172","Fue eliminado el proveedor: Csa DM","ELIMINAR","PROVEEDORES","2022-10-14 05:31:59");
INSERT INTO bitacora VALUES("173","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-14 05:32:50");
INSERT INTO bitacora VALUES("174","Fue actualizado el articulo: cilindro , horse","ACTUALIZAR","ARTICULOS","2022-10-14 05:32:50");
INSERT INTO bitacora VALUES("175","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-14 05:32:50");
INSERT INTO bitacora VALUES("176","Fue actualizado el articulo: cilindro , horse","ACTUALIZAR","ARTICULOS","2022-10-14 05:32:50");
INSERT INTO bitacora VALUES("177","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-14 05:32:50");
INSERT INTO bitacora VALUES("178","Fue actualizado el articulo: Caucho arsen , caucho arsen","ACTUALIZAR","ARTICULOS","2022-10-14 05:32:50");
INSERT INTO bitacora VALUES("179","Fue registrada una nueva venta","INSERTAR","VENTAS","2022-10-14 05:32:50");
INSERT INTO bitacora VALUES("180","Fue actualizado el articulo: Caucho arsen , caucho arsen","ACTUALIZAR","ARTICULOS","2022-10-14 05:32:50");
INSERT INTO bitacora VALUES("181","Fue ingresado un cliente nuevo: Maria Gomez","INSERTAR","CLIENTES","2022-10-14 05:35:18");
INSERT INTO bitacora VALUES("182","Fue actualizado el cliente: Maria Gomez","INSERTAR","CLIENTES","2022-10-14 05:35:39");
INSERT INTO bitacora VALUES("183","Fue eliminado el cliente: Maria Gomez","ELIMINAR","CLIENTES","2022-10-14 05:35:56");
INSERT INTO bitacora VALUES("184","Fue ingresada una categoria nueva: Luces","INSERTAR","CATEGORIAS","2022-10-14 05:36:38");
INSERT INTO bitacora VALUES("185","Fue actualizada la categoria: Luces","ACTUALIZAR","CATEGORIAS","2022-10-14 05:36:50");
INSERT INTO bitacora VALUES("186","Fue eliminada la categoria: Luz","ELIMINAR","CATEGORIA","2022-10-14 05:37:06");
INSERT INTO bitacora VALUES("187","Fue ingresada una imagen nueva: caucho.jpg","INSERTAR","IMAGENES","2022-10-14 05:38:05");
INSERT INTO bitacora VALUES("188","Fue ingresado un articulo nuevo: Caucho Owen , Caucho Owen","INSERTAR","ARTICULOS","2022-10-14 05:38:05");
INSERT INTO bitacora VALUES("189","Fue actualizado el articulo: Caucho Owen , Caucho Owen","ACTUALIZAR","ARTICULOS","2022-10-14 05:38:23");
INSERT INTO bitacora VALUES("190","Fue eliminado el articulo: Caucho Owen Caucho Owen","ELIMINAR","ARTICULOS","2022-10-14 05:38:50");
INSERT INTO bitacora VALUES("191","Fue eliminada la imagen caucho.jpg","ELIMINAR","IMAGENES","2022-10-14 05:38:50");
INSERT INTO bitacora VALUES("192","Fue actualizado el proveedor: S y R","ACTUALIZAR","PROVEEDORES","2022-10-18 23:46:40");



DROP TABLE IF EXISTS categorias;

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `nombreCategoria` varchar(150) DEFAULT NULL,
  `fechaCaptura` date DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

INSERT INTO categorias VALUES("2","1","Cilindros","2022-07-27");
INSERT INTO categorias VALUES("3","1","Cauchos","2022-07-27");
INSERT INTO categorias VALUES("4","1","Relaciones","2022-07-27");
INSERT INTO categorias VALUES("5","1","Bujias","2022-09-16");
INSERT INTO categorias VALUES("6","1","Cadenas","2022-09-25");
INSERT INTO categorias VALUES("7","1","Rines","2022-10-14");
INSERT INTO categorias VALUES("10","1","Frenos","2022-10-15");
INSERT INTO categorias VALUES("12","1","Electricidad","2022-10-15");



DROP TABLE IF EXISTS clientes;

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `apellido` varchar(200) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `telefono` varchar(200) DEFAULT NULL,
  `rif` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

INSERT INTO clientes VALUES("1","1","Miguel ","Rodriguez ","Caneyes ","miguell_19@hotmail.es","04143754338","259777789");
INSERT INTO clientes VALUES("2","1","Daniel Antonio","MÃ¡rquez Santander","San CristÃ³bal","daniel0802ams@gmail.com","04247466987","295443380");
INSERT INTO clientes VALUES("3","1","Pablo","Dominguez","ColÃ³n","pablod01@gmail.com","04145987210","185236984");
INSERT INTO clientes VALUES("4","1","Maria","Gonzalez","TÃ¡riba","mariag@hotmail.com","04247895623","20159763");
INSERT INTO clientes VALUES("5","1","NicolÃ¡s","Ortega","Rubio","Nicolaso@gmail.com","04145287341","198542369");
INSERT INTO clientes VALUES("8","1","Maria","Colmenares","Barrio Obrero","maria@gmail.com","04241598774","236598874");
INSERT INTO clientes VALUES("9","1","Manuel","Perez","Palmira","manuelprez@gmail.com","04241520164","152369896");
INSERT INTO clientes VALUES("10","1","Carlos","Ramirez","Lobatera","crls@gmail.com","04142587410","163254780");



DROP TABLE IF EXISTS imagenes;

CREATE TABLE `imagenes` (
  `id_imagen` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(500) DEFAULT NULL,
  `ruta` varchar(500) DEFAULT NULL,
  `fechaSubida` date DEFAULT NULL,
  PRIMARY KEY (`id_imagen`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

INSERT INTO imagenes VALUES("4","2","1212.jpg","../../archivos/1212.jpg","2022-07-27");
INSERT INTO imagenes VALUES("6","3","descarga.jpg","../../archivos/descarga.jpg","2022-07-27");
INSERT INTO imagenes VALUES("11","2","5f4c93be7de34.jpg","../../archivos/5f4c93be7de34.jpg","2022-09-18");
INSERT INTO imagenes VALUES("13","2","caucho.jpg","../../archivos/caucho.jpg","2022-09-27");
INSERT INTO imagenes VALUES("16","3","caucho.jpg","../../archivos/caucho.jpg","2022-10-14");
INSERT INTO imagenes VALUES("17","2","cilindro tx.jpg","../../archivos/cilindro tx.jpg","2022-10-14");
INSERT INTO imagenes VALUES("20","2","cilindro tx.jpg","../../archivos/cilindro tx.jpg","2022-10-14");
INSERT INTO imagenes VALUES("21","2","cilindro tx.jpg","../../archivos/cilindro tx.jpg","2022-10-14");
INSERT INTO imagenes VALUES("26","3","caucho.jpg","../../archivos/caucho.jpg","2022-10-14");
INSERT INTO imagenes VALUES("27","2","kit de cilindro.jpg","../../archivos/kit de cilindro.jpg","2022-10-15");
INSERT INTO imagenes VALUES("29","3","caucho arsen ii.jpg","../../archivos/caucho arsen ii.jpg","2022-10-15");



DROP TABLE IF EXISTS proveedores;

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `nombrec` varchar(200) DEFAULT NULL,
  `rife` varchar(200) DEFAULT NULL,
  `representante` varchar(200) DEFAULT NULL,
  `rifr` varchar(200) DEFAULT NULL,
  `telefonor` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

INSERT INTO proveedores VALUES("1","0","Mundo X","235415230","Daniel MÃ¡rquez","295443380","04247466987");
INSERT INTO proveedores VALUES("2","0","Import SD","285748604","Sebastian GÃ³mez","303984811","04247497999");
INSERT INTO proveedores VALUES("3","0","Assoc S A","265417150","Jobly BriceÃ±o","297342298","04247795752");
INSERT INTO proveedores VALUES("4","0","Motos SHX","201478541","Miguel Rodriguez","274226045","04143754338");
INSERT INTO proveedores VALUES("5","1","Invers","147852369","Martin Gonzalez","201145210","04142847851");
INSERT INTO proveedores VALUES("6","1","Inv","254177744","Pedro Lopez","214587126","04241521146");
INSERT INTO proveedores VALUES("9","1","Motos Universal","125748930","Maria Contreras","203651478","04142521415");
INSERT INTO proveedores VALUES("12","1","Mundo de motos","254113698","Juan Gomez","156234789","04241572589");
INSERT INTO proveedores VALUES("13","1","Motos xd","147852369","JosÃ© Sanchez","203154795","04241593578");
INSERT INTO proveedores VALUES("14","1","Casa de la moto","169587441","Carlos Sanchez","196321450","04241594264");
INSERT INTO proveedores VALUES("15","1","Importaciones DM","203698547","Daniel Martinez","23695874","04241230021");
INSERT INTO proveedores VALUES("16","1","S y R","201365412","Maria Gomez","203154520","041425820");



DROP TABLE IF EXISTS trig_articulo;

CREATE TABLE `trig_articulo` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `accion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

INSERT INTO trig_articulo VALUES("1","Fue eliminado el articulo: Cilindro TX TX","2022-10-14 15:53:31");
INSERT INTO trig_articulo VALUES("2","Fue eliminado el articulo: Cilindro Horse II  Cilindro II12","2022-10-14 15:53:39");
INSERT INTO trig_articulo VALUES("3","Fue eliminado el articulo: Caucho Freno","2022-10-14 15:53:55");
INSERT INTO trig_articulo VALUES("4","Fue eliminado el articulo: Bujia Owen","2022-10-14 15:55:03");
INSERT INTO trig_articulo VALUES("5","Fue eliminado el articulo: relacion cadena45","2022-10-14 15:55:43");
INSERT INTO trig_articulo VALUES("6","Fue actualizado el articulo: Caucho TX , Caucho 16","2022-10-14 16:56:08");
INSERT INTO trig_articulo VALUES("7","Fue actualizado el articulo: Cauchos , Owen","2022-10-14 16:56:10");
INSERT INTO trig_articulo VALUES("8","Fue actualizado el articulo: cilindro , horse","2022-10-14 16:56:12");
INSERT INTO trig_articulo VALUES("9","Fue ingresado un articulo nuevo: Cilindro Empire Kit cilindro empire tx 200","2022-10-14 20:49:22");
INSERT INTO trig_articulo VALUES("10","Fue actualizado el articulo: Cilindro Empire , Kit cilindro empire ","2022-10-14 20:49:35");
INSERT INTO trig_articulo VALUES("11","Fue actualizado el articulo: Cilindro Empire , Kit cilindro empire ","2022-10-14 20:52:50");
INSERT INTO trig_articulo VALUES("12","Fue actualizado el articulo: Cilindro Empire , Kit cilindro empire ","2022-10-14 20:52:50");
INSERT INTO trig_articulo VALUES("13","Fue actualizado el articulo: Cilindro Empire , Kit cilindro empire ","2022-10-14 20:52:51");
INSERT INTO trig_articulo VALUES("14","Fue ingresado un articulo nuevo: Caucho arsen II Caucho arsen II","2022-10-14 21:09:36");
INSERT INTO trig_articulo VALUES("15","Fue actualizado el articulo: Caucho arsen II , Caucho arsen II","2022-10-14 21:10:09");
INSERT INTO trig_articulo VALUES("16","Fue eliminado el articulo: Caucho arsen II Caucho arsen II","2022-10-14 21:10:29");
INSERT INTO trig_articulo VALUES("17","Fue ingresado un articulo nuevo: Caucho arsen caucho arsen","2022-10-14 21:16:13");
INSERT INTO trig_articulo VALUES("18","Fue actualizado el articulo: Caucho arsen , caucho arsen","2022-10-14 21:16:29");
INSERT INTO trig_articulo VALUES("19","Fue actualizado el articulo: cilindro , horse","2022-10-14 21:39:21");
INSERT INTO trig_articulo VALUES("20","Fue actualizado el articulo: cilindro , horse","2022-10-14 21:40:37");
INSERT INTO trig_articulo VALUES("21","Fue actualizado el articulo: cilindro , horse","2022-10-14 21:40:38");
INSERT INTO trig_articulo VALUES("22","Fue actualizado el articulo: Caucho arsen , caucho arsen","2022-10-14 21:40:38");
INSERT INTO trig_articulo VALUES("23","Fue actualizado el articulo: Caucho arsen , caucho arsen","2022-10-14 21:40:38");
INSERT INTO trig_articulo VALUES("24","Fue actualizado el articulo: cilindro , horse","2022-10-14 21:48:11");
INSERT INTO trig_articulo VALUES("25","Fue actualizado el articulo: Caucho arsen , caucho arsen","2022-10-14 21:48:12");
INSERT INTO trig_articulo VALUES("26","Fue actualizado el articulo: Caucho arsen , caucho arsen","2022-10-14 21:48:12");
INSERT INTO trig_articulo VALUES("27","Fue actualizado el articulo: Caucho TX , Caucho 16","2022-10-15 00:59:52");
INSERT INTO trig_articulo VALUES("28","Fue actualizado el articulo: Caucho TX , Caucho 16","2022-10-15 00:59:52");
INSERT INTO trig_articulo VALUES("29","Fue actualizado el articulo: Caucho TX , Caucho 16","2022-10-15 00:59:52");
INSERT INTO trig_articulo VALUES("30","Fue actualizado el articulo: cilindro , horse","2022-10-15 00:59:52");
INSERT INTO trig_articulo VALUES("31","Fue actualizado el articulo: cilindro , horse","2022-10-15 00:59:53");
INSERT INTO trig_articulo VALUES("32","Fue actualizado el articulo: cilindro , horse","2022-10-15 00:59:53");
INSERT INTO trig_articulo VALUES("33","Fue actualizado el articulo: cilindro , horse","2022-10-15 00:59:53");
INSERT INTO trig_articulo VALUES("34","Fue actualizado el articulo: Caucho TX , Caucho 16","2022-10-15 02:26:39");
INSERT INTO trig_articulo VALUES("35","Fue actualizado el articulo: cilindro , horse","2022-10-14 05:32:50");
INSERT INTO trig_articulo VALUES("36","Fue actualizado el articulo: cilindro , horse","2022-10-14 05:32:50");
INSERT INTO trig_articulo VALUES("37","Fue actualizado el articulo: Caucho arsen , caucho arsen","2022-10-14 05:32:50");
INSERT INTO trig_articulo VALUES("38","Fue actualizado el articulo: Caucho arsen , caucho arsen","2022-10-14 05:32:50");
INSERT INTO trig_articulo VALUES("39","Fue ingresado un articulo nuevo: Caucho Owen Caucho Owen","2022-10-14 05:38:05");
INSERT INTO trig_articulo VALUES("40","Fue actualizado el articulo: Caucho Owen , Caucho Owen","2022-10-14 05:38:23");
INSERT INTO trig_articulo VALUES("41","Fue eliminado el articulo: Caucho Owen Caucho Owen","2022-10-14 05:38:50");



DROP TABLE IF EXISTS trig_categoria;

CREATE TABLE `trig_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accion` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

INSERT INTO trig_categoria VALUES("1","Fue actualizada la categoria: Rines","2022-10-14 16:56:17");
INSERT INTO trig_categoria VALUES("2","Fue actualizada la categoria: Cadenas","2022-10-14 16:56:19");
INSERT INTO trig_categoria VALUES("3","Fue actualizada la categoria: Cilindros","2022-10-14 16:56:21");
INSERT INTO trig_categoria VALUES("4","Fue ingresada una categoria nueva: Frenos","2022-10-14 20:49:49");
INSERT INTO trig_categoria VALUES("5","Fue ingresada una categoria nueva: Electricidad","2022-10-14 21:10:49");
INSERT INTO trig_categoria VALUES("6","Fue eliminada la categoria: Electricidad","2022-10-14 21:14:08");
INSERT INTO trig_categoria VALUES("7","Fue ingresada una categoria nueva: Partes electricas","2022-10-14 21:17:20");
INSERT INTO trig_categoria VALUES("8","Fue actualizada la categoria: Partes electricas","2022-10-14 21:17:39");
INSERT INTO trig_categoria VALUES("9","Fue ingresada una categoria nueva: Luces","2022-10-14 05:36:38");
INSERT INTO trig_categoria VALUES("10","Fue actualizada la categoria: Luces","2022-10-14 05:36:50");
INSERT INTO trig_categoria VALUES("11","Fue eliminada la categoria: Luz","2022-10-14 05:37:06");



DROP TABLE IF EXISTS trig_cliente;

CREATE TABLE `trig_cliente` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `accion` varchar(255) NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

INSERT INTO trig_cliente VALUES("1","Fue eliminado el cliente: Pedro Ramirez","2022-10-14 15:56:49");
INSERT INTO trig_cliente VALUES("2","Fue actualizado el cliente: Daniel Antonio MÃ¡rquez Santander","2022-10-14 15:57:07");
INSERT INTO trig_cliente VALUES("3","Fue ingresado un cliente nuevo: Maria Colmenares","2022-10-14 16:58:21");
INSERT INTO trig_cliente VALUES("4","Fue ingresado un cliente nuevo: Manuel Perez","2022-10-14 20:52:18");
INSERT INTO trig_cliente VALUES("5","Fue actualizado el cliente: Manuel Perez","2022-10-14 20:52:29");
INSERT INTO trig_cliente VALUES("6","Fue ingresado un cliente nuevo: Carlos Ramirez","2022-10-14 21:29:45");
INSERT INTO trig_cliente VALUES("7","Fue actualizado el cliente: Carlos Ramirez","2022-10-14 21:30:01");
INSERT INTO trig_cliente VALUES("8","Fue actualizado el cliente: Manuel Perez","2022-10-15 10:17:50");
INSERT INTO trig_cliente VALUES("9","Fue ingresado un cliente nuevo: Maria Gomez","2022-10-14 05:35:18");
INSERT INTO trig_cliente VALUES("10","Fue actualizado el cliente: Maria Gomez","2022-10-14 05:35:39");
INSERT INTO trig_cliente VALUES("11","Fue eliminado el cliente: Maria Gomez","2022-10-14 05:35:56");



DROP TABLE IF EXISTS trig_imagenes;

CREATE TABLE `trig_imagenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accion` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

INSERT INTO trig_imagenes VALUES("1","Fue ingresada una imagen nueva","2022-10-14 02:55:33");
INSERT INTO trig_imagenes VALUES("2","Fue ingresada una imagen nueva","2022-10-14 02:55:35");
INSERT INTO trig_imagenes VALUES("3","Fue eliminada una imagen","2022-10-14 02:58:50");
INSERT INTO trig_imagenes VALUES("4","Fue eliminada una imagen","2022-10-14 14:16:33");
INSERT INTO trig_imagenes VALUES("5","Fue eliminada una imagen","2022-10-14 14:16:44");
INSERT INTO trig_imagenes VALUES("6","Fue eliminada una imagen","2022-10-14 14:17:57");
INSERT INTO trig_imagenes VALUES("7","Fue eliminada una imagen","2022-10-14 14:18:05");
INSERT INTO trig_imagenes VALUES("8","Fue eliminada la imagen cilindro tx.jpg","2022-10-14 15:09:38");
INSERT INTO trig_imagenes VALUES("9","Fue eliminada la imagen 619ZKXAruKL._AC_SX466_.jpg","2022-10-14 15:10:58");
INSERT INTO trig_imagenes VALUES("10","Fue ingresada una imagen nueva: cilindro.jpg","2022-10-14 15:12:24");
INSERT INTO trig_imagenes VALUES("11","Fue eliminada la imagen cilindro.jpg","2022-10-14 15:14:48");
INSERT INTO trig_imagenes VALUES("12","Fue ingresada una imagen nueva: caucho.jpg","2022-10-14 15:15:38");
INSERT INTO trig_imagenes VALUES("13","Fue eliminada la imagen cilindro.jpg","2022-10-14 15:53:31");
INSERT INTO trig_imagenes VALUES("14","Fue eliminada la imagen cilindro tx.jpg","2022-10-14 15:53:40");
INSERT INTO trig_imagenes VALUES("15","Fue eliminada la imagen cilindro tx.jpg","2022-10-14 15:53:55");
INSERT INTO trig_imagenes VALUES("16","Fue eliminada la imagen 814ryeJ6dUL._AC_SX679_.jpg","2022-10-14 15:55:03");
INSERT INTO trig_imagenes VALUES("17","Fue eliminada la imagen cadena_moto_2.jpg","2022-10-14 15:55:43");
INSERT INTO trig_imagenes VALUES("18","Fue ingresada una imagen nueva: kit de cilindro.jpg","2022-10-14 20:49:22");
INSERT INTO trig_imagenes VALUES("19","Fue ingresada una imagen nueva: caucho arsen ii.jpg","2022-10-14 21:09:35");
INSERT INTO trig_imagenes VALUES("20","Fue eliminada la imagen caucho arsen ii.jpg","2022-10-14 21:10:29");
INSERT INTO trig_imagenes VALUES("21","Fue ingresada una imagen nueva: caucho arsen ii.jpg","2022-10-14 21:16:13");
INSERT INTO trig_imagenes VALUES("22","Fue ingresada una imagen nueva: caucho.jpg","2022-10-14 05:38:05");
INSERT INTO trig_imagenes VALUES("23","Fue eliminada la imagen caucho.jpg","2022-10-14 05:38:50");



DROP TABLE IF EXISTS trig_proveedor;

CREATE TABLE `trig_proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accion` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

INSERT INTO trig_proveedor VALUES("1","Fue actualizado un proveedor","2022-10-13 22:32:50");
INSERT INTO trig_proveedor VALUES("2","Fue actualizado un proveedor","2022-10-13 22:37:25");
INSERT INTO trig_proveedor VALUES("3","Fue actualizado un proveedor: Mundo X","2022-10-14 14:07:39");
INSERT INTO trig_proveedor VALUES("4","Fue actualizado el proveedor: Import SD","2022-10-14 14:09:20");
INSERT INTO trig_proveedor VALUES("5","Fue actualizado el proveedor: Inversiones","2022-10-14 15:06:41");
INSERT INTO trig_proveedor VALUES("6","Fue eliminado el proveedor: Inversiones","2022-10-14 15:06:51");
INSERT INTO trig_proveedor VALUES("7","Fue ingresado un proveedor nuevo: Mundo de motos","2022-10-14 15:09:09");
INSERT INTO trig_proveedor VALUES("8","Fue eliminado el proveedor: asoc","2022-10-14 15:56:15");
INSERT INTO trig_proveedor VALUES("9","Fue ingresado un proveedor nuevo: Motos xd","2022-10-14 16:57:29");
INSERT INTO trig_proveedor VALUES("10","Fue actualizado el proveedor: Motos xd","2022-10-14 17:03:10");
INSERT INTO trig_proveedor VALUES("11","Fue ingresado un proveedor nuevo: Casa de la moto","2022-10-14 20:51:17");
INSERT INTO trig_proveedor VALUES("12","Fue actualizado el proveedor: Casa de la moto","2022-10-14 20:51:29");
INSERT INTO trig_proveedor VALUES("13","Fue ingresado un proveedor nuevo: Importaciones DM","2022-10-14 21:21:50");
INSERT INTO trig_proveedor VALUES("14","Fue actualizado el proveedor: Importaciones DM","2022-10-14 21:22:07");
INSERT INTO trig_proveedor VALUES("15","Fue ingresado un proveedor nuevo: S y R","2022-10-14 21:27:53");
INSERT INTO trig_proveedor VALUES("16","Fue actualizado el proveedor: S y R","2022-10-14 21:28:05");
INSERT INTO trig_proveedor VALUES("17","Fue ingresado un proveedor nuevo: Csa DM","2022-10-14 05:31:14");
INSERT INTO trig_proveedor VALUES("18","Fue actualizado el proveedor: Csa DM","2022-10-14 05:31:36");
INSERT INTO trig_proveedor VALUES("19","Fue eliminado el proveedor: Csa DM","2022-10-14 05:31:59");
INSERT INTO trig_proveedor VALUES("20","Fue actualizado el proveedor: S y R","2022-10-18 23:46:40");



DROP TABLE IF EXISTS trig_usuarios;

CREATE TABLE `trig_usuarios` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `accion` varchar(255) NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

INSERT INTO trig_usuarios VALUES("1","Fue eliminado el usuario Sofia sofiajim","2022-10-14 15:55:56");
INSERT INTO trig_usuarios VALUES("2","Fue actualizado el usuario Juan Juanprz","2022-10-14 16:56:26");
INSERT INTO trig_usuarios VALUES("3","Fue actualizado el usuario Maria mariaz","2022-10-14 16:56:28");
INSERT INTO trig_usuarios VALUES("4","Fue ingresado un usuario nuevo Luis  luischnz","2022-10-14 16:56:56");
INSERT INTO trig_usuarios VALUES("5","Fue ingresado un usuario nuevo Pedro pedromrt","2022-10-14 20:50:21");
INSERT INTO trig_usuarios VALUES("6","Fue actualizado el usuario Pedro pedromrt","2022-10-14 20:50:30");
INSERT INTO trig_usuarios VALUES("7","Fue ingresado un usuario nuevo Maria marlpz","2022-10-14 21:18:38");
INSERT INTO trig_usuarios VALUES("8","Fue actualizado el usuario Maria marlpz","2022-10-14 21:18:52");
INSERT INTO trig_usuarios VALUES("9","Fue eliminado el usuario Maria mar","2022-10-14 21:18:59");
INSERT INTO trig_usuarios VALUES("10","Fue actualizado el usuario Pedro (pedromrtz)","2022-10-15 01:53:57");
INSERT INTO trig_usuarios VALUES("11","Fue ingresado un usuario nuevo Sofia (sofiaj)","2022-10-14 05:21:31");
INSERT INTO trig_usuarios VALUES("12","Fue ingresado un usuario nuevo Luis (lsmrtnz)","2022-10-14 05:29:23");
INSERT INTO trig_usuarios VALUES("13","Fue actualizado el usuario Luis (lsmrtnz)","2022-10-14 05:29:34");
INSERT INTO trig_usuarios VALUES("14","Fue eliminado el usuario Luis (lsmr)","2022-10-14 05:29:56");



DROP TABLE IF EXISTS trig_ventas;

CREATE TABLE `trig_ventas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `accion` varchar(255) NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;

INSERT INTO trig_ventas VALUES("1","Se ha registrado una nueva venta","2022-09-27 03:08:28");
INSERT INTO trig_ventas VALUES("2","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("3","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("4","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("5","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("6","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("7","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("8","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("9","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("10","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("11","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("12","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("13","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("14","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("15","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("16","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("17","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("18","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("19","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("20","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("21","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("22","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("23","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("24","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("25","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("26","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("27","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("28","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("29","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("30","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("31","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("32","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("33","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("34","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("35","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("36","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("37","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("38","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("39","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("40","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("41","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("42","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("43","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("44","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("45","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("46","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("47","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("48","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("49","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("50","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("51","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("52","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("53","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("54","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("55","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("56","Se ha registrado una nueva venta","2022-09-27 07:16:08");
INSERT INTO trig_ventas VALUES("57","Se ha registrado una nueva venta","2022-10-06 19:37:25");
INSERT INTO trig_ventas VALUES("58","Se ha registrado una nueva venta","2022-10-06 22:01:57");
INSERT INTO trig_ventas VALUES("59","Se ha registrado una nueva venta","2022-10-06 22:09:28");
INSERT INTO trig_ventas VALUES("60","Se ha registrado una nueva venta","2022-10-06 22:09:28");
INSERT INTO trig_ventas VALUES("61","Se ha registrado una nueva venta","2022-10-06 22:09:28");
INSERT INTO trig_ventas VALUES("62","Se ha registrado una nueva venta","2022-10-07 01:48:51");
INSERT INTO trig_ventas VALUES("63","Fue registrada una nueva venta","2022-10-14 15:24:52");
INSERT INTO trig_ventas VALUES("64","Fue registrada una nueva venta","2022-10-14 15:24:52");
INSERT INTO trig_ventas VALUES("65","Fue registrada una nueva venta","2022-10-14 15:24:52");
INSERT INTO trig_ventas VALUES("66","Fue registrada una nueva venta","2022-10-14 15:24:53");
INSERT INTO trig_ventas VALUES("67","Fue registrada una nueva venta","2022-10-14 20:52:50");
INSERT INTO trig_ventas VALUES("68","Fue registrada una nueva venta","2022-10-14 20:52:50");
INSERT INTO trig_ventas VALUES("69","Fue registrada una nueva venta","2022-10-14 20:52:51");
INSERT INTO trig_ventas VALUES("70","Fue registrada una nueva venta","2022-10-14 21:39:21");
INSERT INTO trig_ventas VALUES("71","Fue registrada una nueva venta","2022-10-14 21:40:37");
INSERT INTO trig_ventas VALUES("72","Fue registrada una nueva venta","2022-10-14 21:40:37");
INSERT INTO trig_ventas VALUES("73","Fue registrada una nueva venta","2022-10-14 21:40:38");
INSERT INTO trig_ventas VALUES("74","Fue registrada una nueva venta","2022-10-14 21:40:38");
INSERT INTO trig_ventas VALUES("75","Fue registrada una nueva venta","2022-10-14 21:48:11");
INSERT INTO trig_ventas VALUES("76","Fue registrada una nueva venta","2022-10-14 21:48:11");
INSERT INTO trig_ventas VALUES("77","Fue registrada una nueva venta","2022-10-14 21:48:12");
INSERT INTO trig_ventas VALUES("78","Fue registrada una nueva venta","2022-10-15 00:59:52");
INSERT INTO trig_ventas VALUES("79","Fue registrada una nueva venta","2022-10-15 00:59:52");
INSERT INTO trig_ventas VALUES("80","Fue registrada una nueva venta","2022-10-15 00:59:52");
INSERT INTO trig_ventas VALUES("81","Fue registrada una nueva venta","2022-10-15 00:59:52");
INSERT INTO trig_ventas VALUES("82","Fue registrada una nueva venta","2022-10-15 00:59:53");
INSERT INTO trig_ventas VALUES("83","Fue registrada una nueva venta","2022-10-15 00:59:53");
INSERT INTO trig_ventas VALUES("84","Fue registrada una nueva venta","2022-10-15 00:59:53");
INSERT INTO trig_ventas VALUES("85","Fue registrada una nueva venta","2022-10-15 02:26:39");
INSERT INTO trig_ventas VALUES("86","Fue registrada una nueva venta","2022-10-14 05:32:50");
INSERT INTO trig_ventas VALUES("87","Fue registrada una nueva venta","2022-10-14 05:32:50");
INSERT INTO trig_ventas VALUES("88","Fue registrada una nueva venta","2022-10-14 05:32:50");
INSERT INTO trig_ventas VALUES("89","Fue registrada una nueva venta","2022-10-14 05:32:50");



DROP TABLE IF EXISTS usuarios;

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` tinytext,
  `fechaCaptura` date DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

INSERT INTO usuarios VALUES("1","Miguel ","Rodriguez ","admin","7110eda4d09e062aa5e4a390b0a572ac0d2c0220","2022-07-26");
INSERT INTO usuarios VALUES("2","JosÃ© ","Ramirez","vende","7c222fb2927d828af22f592134e8932480637c0d","2022-07-27");
INSERT INTO usuarios VALUES("3","Johan","Ramirez","johanrmz","7c4a8d09ca3762af61e59520943dc26494f8941b","2022-09-19");
INSERT INTO usuarios VALUES("4","Luis","Torres","Lutorr","03c342a614e0fb0e7b273bb21c094392f520ac28","2022-09-19");
INSERT INTO usuarios VALUES("5","Daniel","MÃ¡rquez","daniel","da39a3ee5e6b4b0d3255bfef95601890afd80709","2022-09-23");
INSERT INTO usuarios VALUES("6","Maria","Sanchez","Mars","3da541559918a808c2402bba5012f6c60b27661c","2022-10-09");
INSERT INTO usuarios VALUES("7","Carlos","Perez","carlosz","2fc7f44e566c3b29ba7aed98dd8796a000cbb07c","2022-10-09");
INSERT INTO usuarios VALUES("8","Luis","Sanchez","luissz","7c4a8d09ca3762af61e59520943dc26494f8941b","2022-10-14");
INSERT INTO usuarios VALUES("9","Maria","Perez","mariaz","7c4a8d09ca3762af61e59520943dc26494f8941b","2022-10-14");
INSERT INTO usuarios VALUES("10","Maria","Sanchez","mariasz","23b23be9da2519c88f11c084310bcc0bf14417f8","2022-10-14");
INSERT INTO usuarios VALUES("11","Carlos","Contreras","carloscntrs","ed00d4e5ddb694d8dc20e97f7a2022845e49228e","2022-10-14");
INSERT INTO usuarios VALUES("12","Juan","Perez","Juanprz","582349ae8b07260c1067fc3168572b67af86706f","2022-10-14");
INSERT INTO usuarios VALUES("14","Luis ","Sanchez","luischnz","cc7b8755a2a153285a26a7568c30b88a27217f0f","2022-10-14");
INSERT INTO usuarios VALUES("15","Pedro","Martinez","pedromrz","8cb2237d0679ca88db6464eac60da96345513964","2022-10-15");
INSERT INTO usuarios VALUES("16","Sofia","Jimenez","sofiaj","8913dbc65c2fd0c0798c7a94dc0faa94e1955ed7","2022-10-14");



DROP TABLE IF EXISTS ventas;

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `fechaCompra` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO ventas VALUES("1","0","1","1","50","2022-07-26");
INSERT INTO ventas VALUES("2","0","4","1","150","2022-07-27");
INSERT INTO ventas VALUES("3","1","1","1","50","2022-07-27");
INSERT INTO ventas VALUES("4","0","1","1","50","2022-07-27");
INSERT INTO ventas VALUES("4","0","1","1","50","2022-07-27");
INSERT INTO ventas VALUES("5","0","1","1","50","2022-07-27");
INSERT INTO ventas VALUES("6","0","6","1","100","2022-07-27");
INSERT INTO ventas VALUES("7","0","4","1","150","2022-09-08");
INSERT INTO ventas VALUES("7","0","4","1","150","2022-09-08");
INSERT INTO ventas VALUES("7","0","4","1","150","2022-09-08");
INSERT INTO ventas VALUES("8","0","4","1","150","2022-09-16");
INSERT INTO ventas VALUES("9","1","8","1","123","2022-09-16");
INSERT INTO ventas VALUES("9","1","8","1","123","2022-09-16");
INSERT INTO ventas VALUES("9","1","8","1","123","2022-09-16");
INSERT INTO ventas VALUES("10","1","4","1","150","2022-09-16");
INSERT INTO ventas VALUES("11","0","4","3","150","2022-09-19");
INSERT INTO ventas VALUES("11","0","4","3","150","2022-09-19");
INSERT INTO ventas VALUES("11","0","4","3","150","2022-09-19");
INSERT INTO ventas VALUES("11","0","4","3","150","2022-09-19");
INSERT INTO ventas VALUES("12","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("12","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("12","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("12","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("13","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("14","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("14","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("15","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("15","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("15","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("16","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("16","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("16","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("17","1","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("18","1","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("18","1","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("19","2","9","1","565464","2022-09-20");
INSERT INTO ventas VALUES("19","2","9","1","565464","2022-09-20");
INSERT INTO ventas VALUES("20","1","8","1","123","2022-09-20");
INSERT INTO ventas VALUES("20","1","8","1","123","2022-09-20");
INSERT INTO ventas VALUES("21","1","8","1","123","2022-09-20");
INSERT INTO ventas VALUES("22","1","8","1","123","2022-09-20");
INSERT INTO ventas VALUES("22","1","8","1","123","2022-09-20");
INSERT INTO ventas VALUES("22","1","8","1","123","2022-09-20");
INSERT INTO ventas VALUES("23","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("23","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("23","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("23","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("23","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("24","0","4","1","150","2022-09-21");
INSERT INTO ventas VALUES("24","0","4","1","150","2022-09-21");
INSERT INTO ventas VALUES("24","0","4","1","150","2022-09-21");
INSERT INTO ventas VALUES("25","1","4","4","150","2022-09-21");
INSERT INTO ventas VALUES("25","1","4","4","150","2022-09-21");
INSERT INTO ventas VALUES("26","0","4","1","150","2022-09-25");
INSERT INTO ventas VALUES("27","0","4","1","150","2022-09-27");
INSERT INTO ventas VALUES("1","0","1","1","50","2022-07-26");
INSERT INTO ventas VALUES("2","0","4","1","150","2022-07-27");
INSERT INTO ventas VALUES("3","1","1","1","50","2022-07-27");
INSERT INTO ventas VALUES("4","0","1","1","50","2022-07-27");
INSERT INTO ventas VALUES("4","0","1","1","50","2022-07-27");
INSERT INTO ventas VALUES("5","0","1","1","50","2022-07-27");
INSERT INTO ventas VALUES("6","0","6","1","100","2022-07-27");
INSERT INTO ventas VALUES("7","0","4","1","150","2022-09-08");
INSERT INTO ventas VALUES("7","0","4","1","150","2022-09-08");
INSERT INTO ventas VALUES("7","0","4","1","150","2022-09-08");
INSERT INTO ventas VALUES("8","0","4","1","150","2022-09-16");
INSERT INTO ventas VALUES("9","1","8","1","123","2022-09-16");
INSERT INTO ventas VALUES("9","1","8","1","123","2022-09-16");
INSERT INTO ventas VALUES("9","1","8","1","123","2022-09-16");
INSERT INTO ventas VALUES("10","1","4","1","150","2022-09-16");
INSERT INTO ventas VALUES("11","0","4","3","150","2022-09-19");
INSERT INTO ventas VALUES("11","0","4","3","150","2022-09-19");
INSERT INTO ventas VALUES("11","0","4","3","150","2022-09-19");
INSERT INTO ventas VALUES("11","0","4","3","150","2022-09-19");
INSERT INTO ventas VALUES("12","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("12","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("12","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("12","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("13","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("14","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("14","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("15","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("15","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("15","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("16","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("16","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("16","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("17","1","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("18","1","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("18","1","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("19","2","9","1","565464","2022-09-20");
INSERT INTO ventas VALUES("19","2","9","1","565464","2022-09-20");
INSERT INTO ventas VALUES("20","1","8","1","123","2022-09-20");
INSERT INTO ventas VALUES("20","1","8","1","123","2022-09-20");
INSERT INTO ventas VALUES("21","1","8","1","123","2022-09-20");
INSERT INTO ventas VALUES("22","1","8","1","123","2022-09-20");
INSERT INTO ventas VALUES("22","1","8","1","123","2022-09-20");
INSERT INTO ventas VALUES("22","1","8","1","123","2022-09-20");
INSERT INTO ventas VALUES("23","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("23","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("23","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("23","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("23","0","4","1","150","2022-09-20");
INSERT INTO ventas VALUES("24","0","4","1","150","2022-09-21");
INSERT INTO ventas VALUES("24","0","4","1","150","2022-09-21");
INSERT INTO ventas VALUES("24","0","4","1","150","2022-09-21");
INSERT INTO ventas VALUES("25","1","4","4","150","2022-09-21");
INSERT INTO ventas VALUES("25","1","4","4","150","2022-09-21");
INSERT INTO ventas VALUES("26","0","4","1","150","2022-09-25");
INSERT INTO ventas VALUES("27","0","4","1","150","2022-09-27");
INSERT INTO ventas VALUES("28","1","4","1","150","2022-10-07");
INSERT INTO ventas VALUES("29","1","4","1","150","2022-10-07");
INSERT INTO ventas VALUES("30","1","6","1","100","2022-10-07");
INSERT INTO ventas VALUES("30","1","6","1","100","2022-10-07");
INSERT INTO ventas VALUES("30","1","8","1","50","2022-10-07");
INSERT INTO ventas VALUES("31","1","4","1","150","2022-10-07");
INSERT INTO ventas VALUES("32","1","6","1","100","2022-10-14");
INSERT INTO ventas VALUES("32","1","6","1","100","2022-10-14");
INSERT INTO ventas VALUES("32","1","12","1","30","2022-10-14");
INSERT INTO ventas VALUES("32","1","18","1","20","2022-10-14");
INSERT INTO ventas VALUES("33","4","26","1","30","2022-10-15");
INSERT INTO ventas VALUES("33","4","26","1","30","2022-10-15");
INSERT INTO ventas VALUES("33","4","26","1","30","2022-10-15");
INSERT INTO ventas VALUES("34","1","4","1","150","2022-10-15");
INSERT INTO ventas VALUES("35","1","4","1","150","2022-10-15");
INSERT INTO ventas VALUES("35","1","4","1","150","2022-10-15");
INSERT INTO ventas VALUES("35","1","28","1","20","2022-10-15");
INSERT INTO ventas VALUES("35","1","28","1","20","2022-10-15");
INSERT INTO ventas VALUES("36","1","4","1","150","2022-10-15");
INSERT INTO ventas VALUES("36","1","28","1","20","2022-10-15");
INSERT INTO ventas VALUES("36","1","28","1","20","2022-10-15");
INSERT INTO ventas VALUES("37","5","25","1","50","2022-10-15");
INSERT INTO ventas VALUES("37","5","25","1","50","2022-10-15");
INSERT INTO ventas VALUES("37","5","25","1","50","2022-10-15");
INSERT INTO ventas VALUES("37","5","4","1","150","2022-10-15");
INSERT INTO ventas VALUES("37","5","4","1","150","2022-10-15");
INSERT INTO ventas VALUES("37","5","4","1","150","2022-10-15");
INSERT INTO ventas VALUES("37","5","4","1","150","2022-10-15");
INSERT INTO ventas VALUES("38","3","25","1","50","2022-10-15");
INSERT INTO ventas VALUES("39","9","4","1","150","2022-10-14");
INSERT INTO ventas VALUES("39","9","4","1","150","2022-10-14");
INSERT INTO ventas VALUES("39","9","28","1","20","2022-10-14");
INSERT INTO ventas VALUES("39","9","28","1","20","2022-10-14");



SET FOREIGN_KEY_CHECKS=1;