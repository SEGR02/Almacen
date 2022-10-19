<?php 
session_start();
if(isset($_SESSION['usuario'])){

	?>


	<!DOCTYPE html>
	<html>
	<head>
		<title>proveedores</title>
		<?php require_once "menu.php"; ?>
	</head>
	<body>
		<div class="container">
			<h1>Proveedores</h1>
			<div class="row">
				<div class="col-sm-3">
					<form id="frmProveedores">
						<label>Distribuidor</label>
						<input type="text" class="form-control input-sm" id="nombrec" name="nombrec">
						<label>Rif del distribuidor</label>
						<input type="text" class="form-control input-sm" id="rife" name="rife">
						<label>Representante</label>
						<input type="text" class="form-control input-sm" id="representante" name="representante">
						<label>Rif del representante</label>
						<input type="text" class="form-control input-sm" id="rifr" name="rifr">
						<label>Telefono</label>
						<input type="number" class="form-control input-sm" id="telefonor" name="telefonor">
						<p></p>
						<span class="btn btn-primary" id="btnAgregarProveedor">Agregar</span>
					</form>
				</div>
				<div class="col-sm-8">
					<div id="tablaProveedoresLoad"></div>
				</div>
			</div>
		</div>


		<div class="modal fade" id="abremodalProveedoresUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Actualizar proveedor</h4>
					</div>
					<div class="modal-body">
						<form id="frmProveedoresU">
							<input type="text" hidden="" id="idproveedorU" name="idproveedorU">
							<label>Distribuidor</label>
							<input type="text" class="form-control input-sm" id="nombrecU" name="nombrecU">
							<label>Rif de distribuidor</label>
							<input type="text" class="form-control input-sm" id="rifeU" name="rifeU">
							<label>Representante</label>
							<input type="text" class="form-control input-sm" id="representanteU" name="representanteU">
							<label>Rif de representante</label>
							<input type="text" class="form-control input-sm" id="rifrU" name="rifrU">
							<label>Telefono</label>
							<input type="text" class="form-control input-sm" id="telefonorU" name="telefonorU">
						</form>
					</div>
					<div class="modal-footer">
						<button id="btnAgregarProveedorU" type="button" class="btn btn-primary" data-dismiss="modal">Actualizar</button>

					</div>
				</div>
			</div>
		</div>

	</body>
	</html>


	<script type="text/javascript">
		function agregaDatosProveedor(idproveedor){

			$.ajax({
				type:"POST",
				data:"idproveedor=" + idproveedor,
				url:"../procesos/proveedores/obtenDatosProveedor.php",
				success:function(r){
					dato=jQuery.parseJSON(r);

					$('#idproveedorU').val(dato['id_proveedor']);
					$('#nombrecU').val(dato['nombrec']);
					$('#rifeU').val(dato['rife']);
					$('#representanteU').val(dato['representante']);
					$('#rifrU').val(dato['rifr']);
					$('#telefonorU').val(dato['telefonor']);
					
				}
			});
		}

		function eliminarProveedor(idproveedor){
			alertify.confirm('¿Desea eliminar este proveedor?', function(){ 
				$.ajax({
					type:"POST",
					data:"idproveedor=" + idproveedor,
					url:"../procesos/proveedores/eliminarProveedor.php",
					success:function(r){
						if(r==1){
							$('#tablaProveedoresLoad').load("proveedores/tablaProveedores.php");
							alertify.success("Eliminado con exito!!");
						}else{
							alertify.error("No se pudo eliminar :(");
						}
					}
				});
			}, function(){ 
				alertify.error('Cancelo !')
			});
		}
	</script>

	<script type="text/javascript">
		$(document).ready(function(){

			$('#tablaProveedoresLoad').load("proveedores/tablaProveedores.php");

			$('#btnAgregarProveedor').click(function(){

				vacios=validarFormVacio('frmProveedores');

				if(vacios > 0){
					alertify.alert("Debes llenar todos los campos!!");
					return false;
				}

				datos=$('#frmProveedores').serialize();

				$.ajax({
					type:"POST",
					data:datos,
					url:"../procesos/proveedores/agregaProveedor.php",
					success:function(r){

						if(r==1){
							$('#frmProveedores')[0].reset();
							$('#tablaProveedoresLoad').load("proveedores/tablaProveedores.php");
							alertify.success("Proveedor agregado con exito :D");
						}else{
							alertify.error("No se pudo agregar proveedor");
						}
					}
				});
			});
		});
	</script>	

	<script type="text/javascript">
		$(document).ready(function(){
			$('#btnAgregarProveedorU').click(function(){
				
				datos=$('#frmProveedoresU').serialize();
				$.ajax({
					type:"POST",
					data:datos,
					url:"../procesos/proveedores/actualizaProveedor.php",
					success:function(r){

						if(r==1){
							$('#tablaProveedoresLoad').load("proveedores/tablaProveedores.php");
							alertify.success("Proveedor actualizado con exito :D");
						}else{
							alertify.error("No se pudo actualizar proveedor");
						}
					}
				});
			})
		})
	</script>


	<?php 
}else{
	header("location:../index.php");
}
?>