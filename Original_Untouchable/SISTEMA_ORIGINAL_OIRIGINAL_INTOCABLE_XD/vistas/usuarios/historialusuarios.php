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
    $this->SetXY(78,18);
    $this->SetFillColor(51, 122, 183);
    $this->SetTextColor(255, 255, 255);
    $this->SetFont('Arial','',15);
    $this->SetXY(69,18);
    $this->Cell(80,10,'Historial del registro de usuarios ',1,0,'C',1);
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
$consulta = "SELECT * FROM trig_usuarios";
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
    $pdf->SetFillColor(51, 122, 183);
    $pdf->SetTextColor(255, 255, 255);
    $pdf->Cell(20, 10, utf8_decode('Registro'), 1, 0, 'C', 1);
    $pdf->SetFillColor(51, 122, 183);
    $pdf->SetTextColor(255, 255, 255);
    $pdf->Cell(90, 10, utf8_decode('Acción ejecutada'), 1, 0, 'C', 1);
    $pdf->SetFillColor(51, 122, 183);
    $pdf->SetTextColor(255, 255, 255);
    $pdf->Cell(33, 10, utf8_decode('Fecha'), 1, 1, 'C', 1);
while($row = $resultado->fetch_assoc()){
    $pdf->SetFont('Times','',10);
    $pdf->SetTextColor(0, 0, 0);
    $pdf->Cell(20, 5, utf8_decode($row['id']), 1, 0, 'C', 0);
    $pdf->SetTextColor(0, 0, 0);
    $pdf->Cell(90, 5, utf8_decode($row['accion']), 1, 0, 'C', 0);
    $pdf->SetTextColor(0, 0, 0);
    $pdf->Cell(33, 5, utf8_decode($row['fecha_hora']), 1, 1, 'C', 0);
    
}
$pdf->Output();
?>