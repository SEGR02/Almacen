<?php 

session_start();
	require_once "../../clases/Conexion.php";
	require_once "../../clases/Proveedores.php";

	$obj= new proveedores();


	$datos=array(
			$_POST['nombrec'],
			$_POST['rife'],
			$_POST['representante'],
			$_POST['rifr'],
			$_POST['telefonor']
				);

	echo $obj->agregaProveedor($datos);

	
	
 ?>