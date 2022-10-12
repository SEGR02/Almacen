<?php 
	require_once "../../clases/Conexion.php";

	$obj= new conectar();
	$conexion= $obj->conexion();

	$sql="SELECT idproveedor, 
				nombrec,
				rife,
				representante,
				rifr,
				telefonor
		from proveedores";
	$result=mysqli_query($conexion,$sql);
 ?>


	 <table class="table table-hover table-condensed table-bordered" style="text-align: center;">
	 	<caption><label>Proveedores</label></caption>
	 	<caption><label><a href="../registroproveedores.php?">Registro</label></caption>
	 	<tr>
	 		<td>Nombre de la compañia</td>
	 		<td>Rif de la compañia</td>
	 		<td>Rpresentante</td>
	 		<td>Rif del representante</td>
	 		<td>Telefono</td>
	 		<td>Editar</td>
	 		<td>Eliminar</td>
	 	</tr>

	 	<?php while($ver=mysqli_fetch_row($result)): ?>

	 	<tr>
	 		<td><?php echo $ver[1]; ?></td>
	 		<td><?php echo $ver[2]; ?></td>
	 		<td><?php echo $ver[3]; ?></td>
	 		<td><?php echo $ver[4]; ?></td>
	 		<td><?php echo $ver[5]; ?></td>
	 		<td>
				<span class="btn btn-warning btn-xs" data-toggle="modal" data-target="#abremodalProveedoresUpdate" onclick="agregaDatosProveedores('<?php echo $ver[0]; ?>')">
					<span class="glyphicon glyphicon-pencil"></span>
				</span>
			</td>
			<td>
				<span class="btn btn-danger btn-xs" onclick="eliminarProveedor('<?php echo $ver[0]; ?>')">
					<span class="glyphicon glyphicon-remove"></span>
				</span>
			</td>
	 	</tr>
	 <?php endwhile; ?>
	 </table>
