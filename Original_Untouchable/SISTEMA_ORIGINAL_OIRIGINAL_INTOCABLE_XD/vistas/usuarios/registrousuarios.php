<?php

require('../../fpdf/fpdf.php');


class PDF extends FPDF
{
// Cabecera de página
function Header()
{

    $this->SetTextColor(51, 122, 183);
    $this->SetFont('Arial','B',18);
    $this->SetXY(10,16);
    $this->Cell(0,4,'Ferre motos',0,1,'L');
    $this->SetXY(10,23);
    $this->Cell(0,4,'Aqui me Quedo',0,1,'L');
    $this->SetXY(75,18);
    $this->SetFillColor(51, 122, 183);
    $this->SetTextColor(255, 255, 255);
    $this->SetFont('Arial','',18);
    $this->Cell(63,10,'Usuarios registrados',1,0,'C',1);
    $this->SetXY(10,17);
    $this->Image("../../img/hola.jpg",165,5,38);
    $this->Ln(7);
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


require '../../pdf/cn.php';
$consulta = "SELECT * FROM usuarios";
$resultado = $mysqli->query($consulta);

// Creación del objeto de la clase heredada
$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetMargins(10,10,10);
$pdf->SetAutoPageBreak(true, 20);

$pdf->SetXY(10,45);
$pdf->SetFont('Arial','B',12);
    $pdf->SetFillColor(51, 122, 183);
    $pdf->SetTextColor(255, 255, 255);    
    $pdf->Cell(50, 10, utf8_decode('Nombre'), 1, 0, 'C', 1);
    $pdf->SetFillColor(51, 122, 183);
    $pdf->SetTextColor(255, 255, 255);
    $pdf->Cell(50, 10, utf8_decode('Apellido'), 1, 0, 'C', 1);
    $pdf->SetFillColor(51, 122, 183);
    $pdf->SetTextColor(255, 255, 255);
    $pdf->Cell(50, 10, utf8_decode('Usuario'), 1, 1, 'C', 1);
while($row = $resultado->fetch_assoc()){
$pdf->SetFont('Times','',11);
    $pdf->SetTextColor(0, 0, 0);
    $pdf->Cell(50, 8, utf8_decode($row['nombre']), 1, 0, 'C', 0);
    $pdf->SetTextColor(0, 0, 0);
    $pdf->Cell(50, 8, utf8_decode($row['apellido']), 1, 0, 'C', 0);
    $pdf->SetTextColor(0, 0, 0);
    $pdf->Cell(50, 8, utf8_decode($row['email']), 1, 1, 'C', 0);
}
$pdf->Output();
$pdf->stream('Registro de usuarios.pdf');
?>