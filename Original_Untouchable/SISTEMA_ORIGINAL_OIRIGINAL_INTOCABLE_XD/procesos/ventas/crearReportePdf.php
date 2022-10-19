<?php

require_once "../../clases/Conexion.php";
require_once "../../clases/Ventas.php";
require_once '../../librerias/FPDF/fpdf.php';

    $objv= new ventas();


	$c=new conectar();
	$conexion= $c->conexion();	
	$idventa=$_GET['idventa'];

    $sql="SELECT ve.id_venta,
            ve.fechaCompra,
            ve.id_cliente,
            art.nombre,
            art.precio,
            art.descripcion
        from ventas  as ve 
        inner join articulos as art
        on ve.id_producto=art.id_producto
        and ve.id_venta='$idventa'";

    $result=mysqli_query($conexion,$sql);       

	$ver=mysqli_fetch_row($result);

	$folio=$ver[0];

	$fecha=$ver[1];
    $f = $fecha; 
    $exp = explode('-',$f);
    $f = $exp[2]."-".$exp[1]."-".$exp[0]; 

	$idcliente=$ver[2];


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

            
        
            $this->Image('../../img/hola.jpg',165,5,38);
            $this->Ln(7);
        }    
        function Footer()
        {
            $this->SetY(-15);
            $this->SetFont('Arial','I',8);    
            $this->Cell(0,8,utf8_decode('Página ').$this->PageNo().'/{nb}',0,0,'C');
        }    
    } 
		
    $pdf = new PDF();
        $pdf->AliasNbPages();
    $pdf->AddPage();
    $pdf->SetFont('Arial','B',15);
    $pdf->SetXY(12,30);
    
    $pdf->Cell(0,6,'Reporte De Venta',0,1,'C');
    $pdf->Ln(3);
    $pdf->SetFont('Arial','',13);
    $pdf->Cell(0,6,'Fecha: '.$f,0,1,'L');
    $pdf->Ln(1);
    $pdf->Cell(0,6,'Folio: '.$folio,0,1,'L');
    $pdf->Ln(1);
    $pdf->Cell(0,6,'Cliente: ',0,1,'L');
    $pdf->SetFillColor(255, 255, 255 );
    $pdf->MultiCell(40,4,utf8_decode($objv->nombreCliente($idcliente)),0,1,'L');

    $pdf->Ln(10);
    

    $sql="SELECT ve.id_venta,
                ve.fechaCompra,
                ve.id_cliente,
                art.nombre,
                art.precio,
                art.descripcion
            from ventas  as ve 
            inner join articulos as art
            on ve.id_producto=art.id_producto
            and ve.id_venta='$idventa'";

    $result=mysqli_query($conexion,$sql);
    $total=0;
    while($mostrar=mysqli_fetch_row($result)){

        
        
        $pdf->SetFont('Arial','',15);
        $pdf->SetFillColor(51, 122, 183);
        $pdf->SetTextColor(255, 255, 255);
        $pdf->Cell(65,10,'Producto',1,0,'C',1);
        $pdf->Cell(65,10,'Precio',1,1,'C',1);
        $pdf->SetTextColor(0, 0, 0);
        $pdf->Cell(65,10,utf8_decode($mostrar[3]),1,0,'C',0);
        $pdf->Cell(65,10,$mostrar[4].'$',1,1,'C',0);

        

        $total=$total + $mostrar[4];
        $pdf->SetTextColor(51, 122, 183);
        
       

    }
        $pdf->SetTextColor(255, 255, 255);
        $pdf->Cell(65,10,'Total',1,0,'C',1);
        $pdf->SetTextColor(0, 0, 0);
        $pdf->Cell(65,10,$total . '$',1,1,'C',0);

    $pdf->Output('reporteVenta_'.$f.'.pdf','D');
?>
