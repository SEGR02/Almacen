<?php 

	class proveedores{

		public function agregaProveedor($datos){
			$c= new conectar();
			$conexion=$c->conexion();

			$idusuario=$_SESSION['iduser'];

			$sql="INSERT into proveedores (id_usuario,
										   nombrec,
									       rife,
										   representante,
										   rifr,
										   telefonor)
							values ('$idusuario',
									'$datos[0]',
									'$datos[1]',
									'$datos[2]',
									'$datos[3]'
								    '$datos[4]')";
			return mysqli_query($conexion,$sql);	
		}

		public function obtenDatosProveedor($idproveedor){
			$c= new conectar();
			$conexion=$c->conexion();

			$sql="SELECT idproveedor, 
							nombrec,
							rife,
							representante,
							rifr,
							telefonor
				from proveedores";
			$result=mysqli_query($conexion,$sql);
			$ver=mysqli_fetch_row($result);

			$datos=array(
					'idproveedor' => $ver[0], 
					'nombrec' => $ver[1],
					'rife' => $ver[2],
					'representante' => $ver[3],
					'rifr' => $ver[4],
					'telefonor' => $ver[5]
						);
			return $datos;
		}

		public function actualizaProveedor($datos){
			$c= new conectar();
			$conexion=$c->conexion();
			$sql="UPDATE proveedores set nombrec='$datos[1]',
										   rife='$datos[2]',
										   representante='$datos[3]',
										   rifr='$datos[4]',
										   telefonor='$datos[5]'
								where idproveedor='$datos[0]'";
			return mysqli_query($conexion,$sql);
		}

		public function eliminarProveedor($idproveedor){
			$c= new conectar();
			$conexion=$c->conexion();

			$sql="DELETE from proveedores where idproveedor='$idproveedor'";

			return mysqli_query($conexion,$sql);
		}
	}

 ?>