<?php

$host = "localhost";
$nombre = "ventas";
$password = "";
$usuario = "root";


$fecha = date('Ymd_His');

$nombre_sql = $nombre .'_'.$fecha.'.sql';

$dump = "mysqldump -h$host -u$usuario -p$password $nombre > $nombre_sql";

exec($dump);

?>