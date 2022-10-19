<html lang="es">
	<head> 
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>	

	<section id="tabla_resutado">


    </section>	
</html>	
<?php 

	require_once "../../clases/Conexion.php";
	require_once "../../clases/Ventas.php";

	$c= new conectar();
	$conexion=$c->conexion();

	$obj= new ventas();
	$campo= 'precio';
	$valor= '100';
	$o ='>';
	$sql="SELECT id_venta,
				fechaCompra,
				id_cliente 
			from ventas  where {$campo} {$o} {$valor} group by id_venta";
	$result=mysqli_query($conexion,$sql); 
	?>
<div>
<form name="formFechas" id="formFechas">
	<div class="form-group">
		<label>Fecha Inicial</label>
		<input type="date" name="fecha_inicio" required>
		<label>Fecha Final</label>
		<input type="date" name="fecha_fin" required>
    	<button type="submit" class="btn btn-primary">Buscar</button>
	</div>
</form>
</div>
<h4>Reportes y ventas</h4>
<div class="row">
	<div class="col-sm-1"></div>
	<div class="col-sm-10">
		<div class="table-responsive">
			<table class="table table-hover table-condensed table-bordered" style="text-align: center;">
				<caption><label>Ventas :)</label></caption>
				<tr>
					<td>Folio</td>
					<td>Fecha</td>
					<td>Cliente</td>
					<td>Total de compra</td>
					<td>Ticket</td>
					<td>Reporte</td>
				</tr>
		<?php while($ver=mysqli_fetch_row($result)): ?>
				<tr>
					<td><?php echo $ver[0] ?></td>
					<td><?php echo $ver[1] ?></td>
					<td>
						<?php
							if($obj->nombreCliente($ver[2])==" "){
								echo "S/C";
							}else{
								echo $obj->nombreCliente($ver[2]);
							}
						 ?>
					</td>
					<td>
						<?php 
							echo "$".$obj->obtenerTotal($ver[0]);
						 ?>
					</td>
					<td>
						<a href="../procesos/ventas/crearTicketPdf.php?idventa=<?php echo $ver[0] ?>" class="btn btn-danger btn-sm">
							Ticket <span class="glyphicon glyphicon-list-alt"></span>
						</a>
					</td>
					<td>
						<a href="../procesos/ventas/crearReportePdf.php?idventa=<?php echo $ver[0] ?>" class="btn btn-danger btn-sm">
							Reporte <span class="glyphicon glyphicon-file"></span>
						</a>	
					</td>
				</tr>
		<?php endwhile; ?>
			</table>
		</div>
	</div>
	<div class="col-sm-1"></div>
</div>

<script type="text/javascript">
 
 $('Formfechas').submit(function(e){

	 e.preventDefault();

	 var form = $($this);
	 var url = form.attr('action');

	 $.ajax(
	 {
		 type: "POST",
		 url: 'fechas.php',
		 data: form.serialize(),
		 success: function(data)
		 {
			 $('#tabla_resultado').html('');
			 $('#tabla_resultado').append(data); 
		 }
	 });
 }); 

</script>