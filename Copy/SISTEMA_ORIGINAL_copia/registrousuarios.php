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
    $this->Cell(50,10,'Usuarios registrados',1,0,'C');
    // Salto de línea
    $this->Ln(20);

    $this->Cell(40, 10, utf8_decode('Nombre'), 1, 0, 'C', 0);
    $this->Cell(40, 10, utf8_decode('Apellido'), 1, 0, 'C', 0);
    $this->Cell(40, 10, utf8_decode('Usuario'), 1, 1, 'C', 0);

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
$consulta = "SELECT * FROM usuarios";
$resultado = $mysqli->query($consulta);

// Creación del objeto de la clase heredada
$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetFont('Times','',12);

while($row = $resultado->fetch_assoc()){
    $pdf->Cell(40, 5, utf8_decode($row['nombre']), 1, 0, 'C', 0);
    $pdf->Cell(40, 5, utf8_decode($row['apellido']), 1, 0, 'C', 0);
    $pdf->Cell(40, 5, utf8_decode($row['email']), 1, 1, 'C', 0);
}
$pdf->Output();
$pdf->stream('Registro de usuarios.pdf');
?>