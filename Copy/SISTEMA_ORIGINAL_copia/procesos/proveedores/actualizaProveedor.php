<?php 

session_start();
	require_once "../../clases/Conexion.php";
	require_once "../../clases/Proveedores.php";

	$obj= new proveedores();


	$datos=array(
			$_POST['idproveedorU'],
			$_POST['nombrecU'],
			$_POST['rifeU'],
			$_POST['representanteU'],
			$_POST['rifrU'],
			$_POST['telefonorU']
				);

	echo $obj->actualizaProveedor($datos);

	
	
 ?>