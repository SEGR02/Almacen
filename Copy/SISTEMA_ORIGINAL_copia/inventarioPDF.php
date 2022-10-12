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
    $this->Cell(80);
    // Título
    $this->Cell(30,10,'Inventario',1,0,'C');
    // Salto de línea
    $this->Ln(20);

    $this->Cell(30, 10, 'Nombre', 1, 0, 'C', 0);
    $this->Cell(30, 10, 'Descripcion', 1, 0, 'C', 0);
    $this->Cell(30, 10, 'Cantidad', 1, 0, 'C', 0);
    $this->Cell(30, 10, 'Precio ($)', 1, 1, 'C', 0);
    
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
$consulta = "SELECT * FROM articulos";
$resultado = $mysqli->query($consulta);

// Creación del objeto de la clase heredada
$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetFont('Times','',12);

while($row = $resultado->fetch_assoc()){
    $pdf->Cell(30, 10, $row['nombre'], 1, 0, 'C', 0);
    $pdf->Cell(30, 10, $row['descripcion'], 1, 0, 'C', 0);
    $pdf->Cell(30, 10, $row['cantidad'], 1, 0, 'C', 0);
    $pdf->Cell(30, 10, $row['precio'], 1, 1, 'C', 0);
    

}
$pdf->Output();
?>