<?php

require('../../fpdf/fpdf.php');

class PDF extends FPDF
{
function Header()
{

    $this->SetTextColor(51, 122, 183);
    $this->SetFont('Arial','B',18);
    $this->SetXY(10,16);
    $this->Cell(0,4,'Ferre motos',0,1,'L');
    $this->SetXY(10,23);
    $this->Cell(0,4,'Aqui me Quedo',0,1,'L');
    $this->SetXY(71,18);
    $this->SetFillColor(51, 122, 183);
    $this->SetTextColor(255, 255, 255);
    $this->SetFont('Arial','',18);
    $this->Cell(75,10,'Proveedores registrados',1,0,'C',1);
    $this->SetXY(10,17);
    $this->Image("../../img/hola.jpg",165,5,38);
    $this->Ln(7);
}    
function Footer()
{
    $this->SetY(-15);
    $this->SetFont('Arial','I',8);
    $this->Cell(0,8,utf8_decode('Página ').$this->PageNo().'/{nb}',0,0,'C');
}

}
require '../../pdf/cn.php';
$consulta = "SELECT * FROM proveedores";
$resultado = $mysqli->query($consulta);

$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetMargins(10,10,10);
$pdf->SetAutoPageBreak(true, 20);

$pdf->SetXY(10,45);
$pdf->SetFont('Arial','B',12);
    $pdf->SetFillColor(51, 122, 183);
    $pdf->SetTextColor(255, 255, 255);
    $pdf->Cell(50, 10, utf8_decode('Proveedor'), 1, 0, 'C', 1);
    $pdf->SetFillColor(51, 122, 183);
    $pdf->SetTextColor(255, 255, 255);
    $pdf->Cell(25, 10, utf8_decode('Rif'), 1, 0, 'C', 1);
    $pdf->SetFillColor(51, 122, 183);
    $pdf->SetTextColor(255, 255, 255);
    $pdf->Cell(50, 10, utf8_decode('Representante'), 1, 0, 'C', 1);
    $pdf->SetFillColor(51, 122, 183);
    $pdf->SetTextColor(255, 255, 255);
    $pdf->Cell(25, 10, utf8_decode('Rif '), 1, 0, 'C', 1);
    $pdf->SetFillColor(51, 122, 183);
    $pdf->SetTextColor(255, 255, 255);
    $pdf->Cell(28, 10, utf8_decode('Telefono '), 1, 1, 'C', 1);
while($row = $resultado->fetch_assoc()){
$pdf->SetFont('Times','',9);
    $pdf->SetTextColor(0, 0, 0);
    $pdf->Cell(50, 5, utf8_decode($row['nombrec']), 1, 0, 'C', 0);
    $pdf->SetTextColor(0, 0, 0);
    $pdf->Cell(25, 5, utf8_decode($row['rife']), 1, 0, 'C', 0);
    $pdf->SetTextColor(0, 0, 0);
    $pdf->Cell(50, 5, utf8_decode($row['representante']), 1, 0, 'C', 0);
    $pdf->SetTextColor(0, 0, 0);
    $pdf->Cell(25, 5, utf8_decode($row['rifr']), 1, 0, 'C', 0);
    $pdf->SetTextColor(0, 0, 0);
    $pdf->Cell(28, 5, utf8_decode($row['telefonor']), 1, 1, 'C', 0);
}
$pdf->Output();

?>