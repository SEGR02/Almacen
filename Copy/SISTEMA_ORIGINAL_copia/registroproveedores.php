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
    $this->Cell(70);
    // Título
    $this->Cell(60,10,'Proveedores registrados',1,0,'C');
    // Salto de línea
    $this->Ln(20);
    

    $this->Cell(50, 10, utf8_decode('Proveedor'), 1, 0, 'C', 0);
    $this->Cell(25, 10, utf8_decode('Rif'), 1, 0, 'C', 0);
    $this->Cell(50, 10, utf8_decode('Representante'), 1, 0, 'C', 0);
    $this->Cell(25, 10, utf8_decode('Rif '), 1, 0, 'C', 0);
    $this->Cell(28, 10, utf8_decode('Telefono '), 1, 1, 'C', 0);

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
$consulta = "SELECT * FROM proveedores";
$resultado = $mysqli->query($consulta);

// Creación del objeto de la clase heredada
$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetMargins(10,10,10);
$pdf->SetAutoPageBreak(true, 20);
$pdf->SetFont('Times','',10);

while($row = $resultado->fetch_assoc()){
    $pdf->Cell(50, 5, utf8_decode($row['nombrec']), 1, 0, 'C', 0);
    $pdf->Cell(25, 5, utf8_decode($row['rife']), 1, 0, 'C', 0);
    $pdf->Cell(50, 5, utf8_decode($row['representante']), 1, 0, 'C', 0);
    $pdf->Cell(25, 5, utf8_decode($row['rifr']), 1, 0, 'C', 0);
    $pdf->Cell(28, 5, utf8_decode($row['telefonor']), 1, 1, 'C', 0);
}
$pdf->Output();

?>