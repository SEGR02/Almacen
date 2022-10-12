<?php

//include('Conexion.php');

$fecha_inicio = $_POST['fecha_inicio'];
$fecha_final  = $_POST['fecha_final'];

$Listaventas = $conexion->query("SELECT * FROM ventas WHERE fechaCompra 
BETWEEN '{$fecha_inicio}' AND '{$fecha_final}'"); 

echo '<table style="width:100%">
  <thead class="bg-primary">
    <th>Fecha</th>
    <th>Cliente</th> 
    <th>Total de Compra</th>
    <th>Ticket</th>
    <th>Reporte</th>
  </th>
  </thead>
  <tbody>';

while($ventas = $Listaventas->fetch(PDO::FETCH_ASSOC))
{
	echo '<tr> 
			<td>'.$ventas['fechaCompra'].'</td>
			<td>'.$ventas['id_cliente'].'</td>
			<td>'.$ventas['id_producto'].'</td>
			<td>'.$ventas['precio'].'</td>
		</tr>';

}

echo '</tbody> </table>'; 

?>