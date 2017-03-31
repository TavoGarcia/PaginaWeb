<?php
include './Connet.php';

include "./conexion.php";
$day=date("d");
$mont=date("m");
$year=date("Y");
$hora=date("H-i-s");
$fecha=$day.'_'.$mont.'_'.$year;
$DataBASE=$fecha."_(".$hora."_hrs).sql";
$insertar="INSERT INTO respaldo SET nombre='$DataBASE' ";
$ejecutar_insertar=mysql_query($insertar);
$tables=array();
$result=SGBD::sql('SHOW TABLES');
if($result){
    while($row=mysql_fetch_row($result)){
        $tables[] = $row[0];
    }
    $sql='SET FOREIGN_KEY_CHECKS=0;'."\n\n";
    $sql.='CREATE DATABASE IF NOT EXISTS '.BD.";\n\n";
    $sql.='USE '.BD.";\n\n";
    foreach($tables as $table){
        $result=SGBD::sql('SELECT * FROM '.$table);
        if($result){
            $numFields=mysql_num_fields($result);
            $sql.='DROP TABLE IF EXISTS '.$table.';';
            $row2=mysql_fetch_row(SGBD::sql('SHOW CREATE TABLE '.$table));
            $sql.="\n\n".$row2[1].";\n\n";
            for ($i=0; $i < $numFields; $i++){
                while($row=mysql_fetch_row($result)){
                    $sql.='INSERT INTO '.$table.' VALUES(';
                    for($j=0; $j<$numFields; $j++){
                        $row[$j]=addslashes($row[$j]);
                        $row[$j]=ereg_replace("\n","\\n",$row[$j]);
                        if (isset($row[$j])){
                            $sql .= '"'.$row[$j].'"' ;
                        }
                        else{
                            $sql.= '""';
                        }
                        if ($j < ($numFields-1)){
                            $sql .= ',';
                        }
                    }
                    $sql.= ");\n";
                }
            }
            $sql.="\n\n\n";
        }else{
            $error=1;
        }
    }
    if($error==1){
        echo 'error';
    }else{
        chmod(BACKUP_PATH, 0777);
        $sql.='SET FOREIGN_KEY_CHECKS=1;';
        $handle=fopen(BACKUP_PATH.$DataBASE,'w+');
        if(fwrite($handle, $sql)){
            fclose($handle);
           echo "<script>alert('Respaldo creado exitosamente');</script>";
            echo "<script>location.href='respaldar.php'</script>";
        }else{
            echo "<script>alert('Ocurrio un error);</script>";
            echo "<script>location.href='respaldar.php'</script>";
        }
    }
}else{
   echo "<script>alert('Ocurrio un error inesperado');</script>";
    echo "<script>location.href='respaldar.php'</script>";
}
mysql_free_result($result);