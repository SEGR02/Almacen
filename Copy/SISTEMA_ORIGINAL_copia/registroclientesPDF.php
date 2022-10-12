<?php

require('fpdf/fpdf.php');


class PDF extends FPDF
{
// Cabecera de página
function Header()
{

    // Arial bold 15
    $this->SetFont('Arial','B',12);
    // Movernos a la derecha
    $this->Cell(75);
    // Título
    $this->Cell(50,10,'Clientes registrados',1,0,'C');
    // Salto de línea
    $this->Ln(20);

    $this->Cell(30, 10, utf8_decode('Nombre'), 1, 0, 'C', 0);
    $this->Cell(30, 10, utf8_decode('Apellido'), 1, 0, 'C', 0);
    $this->Cell(45, 10, utf8_decode('Dirección'), 1, 0, 'C', 0);
    $this->Cell(25, 10, utf8_decode('Telefono'), 1, 0, 'C', 0);
	$this->Cell(25, 10, utf8_decode('Rif'), 1, 1, 'C', 0);

}

// Pie de página
function Footer()
{
    // Posición: a 1,5 cm del final
    $this->SetY(-15);
    // Arial italic 8
    $this->SetFont('Arial','I',8);
    // Número de página
    $this->Cell(0,8,utf8_decode('Página ').$this->PageNo().'/{nb}',0,0,'C');
}
}


require 'cn.php';
$consulta = "SELECT * FROM clientes";
$resultado = $mysqli->query($consulta);

// Creación del objeto de la clase heredada
$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetFont('Times','',9);

while($row = $resultado->fetch_assoc()){
    $pdf->Cell(30, 5, utf8_decode($row['nombre']), 1, 0, 'C', 0);
    $pdf->Cell(30, 5, utf8_decode($row['apellido']), 1, 0, 'C', 0);
    $pdf->Cell(45, 5, utf8_decode($row['direccion']), 1, 0, 'C', 0);
    $pdf->Cell(25, 5, utf8_decode($row['telefono']), 1, 0, 'C', 0);
	$pdf->Cell(25, 5, utf8_decode($row['rif']), 1, 1, 'C', 0);
}
$pdf->Output();
?>