<?php 

	require_once "../../clases/Conexion.php";
	require_once "../../clases/Proveedores.php";

	$obj= new proveedores();

	
	echo $obj->eliminarProveedor($_POST['idproveedor']);
 ?>