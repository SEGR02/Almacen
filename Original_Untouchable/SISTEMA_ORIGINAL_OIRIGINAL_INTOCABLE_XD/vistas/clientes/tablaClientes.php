
<?php 
	require_once "../../clases/Conexion.php";

	$obj= new conectar();
	$conexion= $obj->conexion();

	$sql="SELECT id_cliente, 
				nombre,
				apellido,
				direccion,
				email,
				telefono,
				rif 
		from clientes";
	$result=mysqli_query($conexion,$sql);
?>


	 <table class="table table-hover table-condensed table-bordered" style="text-align: center;">
	 	<caption><label>Clientes :)</label></caption>
	 	<caption><label><a href="../../almacen/vistas/clientes/registroclientesPDF.php?">Registro</label></caption>
	 	<caption><label><a href="../../almacen/vistas/clientes/historialclientes.php?">Historial</label></caption>
	 	<tr>
	 		<td>Nombre</td>
	 		<td>Apellido</td>
	 		<td>Direccion</td>
	 		<td>Email</td>
	 		<td>Telefono</td>
	 		<td>Rif</td>
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
	 		<td><?php echo $ver[6]; ?></td>
	 		<td>
				<span class="btn btn-warning btn-xs" data-toggle="modal" data-target="#abremodalClientesUpdate" onclick="agregaDatosCliente('<?php echo $ver[0] ?>','<?php echo $ver[1] ?>')">
					<span class="glyphicon glyphicon-pencil"></span>
				</span>
			</td>
			<td>
				<span class="btn btn-danger btn-xs" onclick="eliminarCliente('<?php echo $ver[0]; ?>')">
					<span class="glyphicon glyphicon-remove"></span>
				</span>
			</td>
	 	</tr>
	 <?php endwhile; ?>
	 </table>
