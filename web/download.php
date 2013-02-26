<?php

// désactive le temps max d'exécution
set_time_limit(0);
 
// démarrage de la session
session_start();
 
// vérifie que l'utilisateur est connecté
/*
if (!isset($_SESSION["user_id"])) {
    header("HTTP/1.1 403 Forbidden");
    exit;
}
*/

// on a bien une demande de téléchargement de fichier
if(empty($_GET["file"])) {
    header("HTTP/1.1 404 Not Found");
    exit;
}


// le nom doit être un nom de fichier
/*
if(basename($_GET["file"]) != $_GET["file"]) {
    header("HTTP/1.1 400 Bad Request");
    exit;
}
*/


// le fichier doit finir par .mp3
//http://www.euradionantes.eu/uploads/media/default/0001/05/b601cbae048813d3bd3a339eccb15ddd58eed0e5.mp3

if(substr($_GET["file"], 0, 23) != "/uploads/media/default/"){

    header("HTTP/1.1 400 Bad Request");
    exit;

}



if(substr($_GET["file"], strlen($_GET["file"])-4, 4) != '.mp3'){

    header("HTTP/1.1 400 Bad Request");
    exit;

}


if($_GET["name"]){

	$filename = $_GET["name"];
	$filename.= '.mp3';

}


 /*
// vérifie l'existence et l'accès en lecture au fichier
//$filename = dirname(__FILE__)."/../files/".$name;

if (!is_file($filename) || !is_readable($filename)) {
    header("HTTP/1.1 404 Not Found");
    exit;
}

die('YOUHOU4');
*/

$size = filesize('.'.$_GET['file']);
 
// désactivation compression GZip
if (ini_get("zlib.output_compression")) {
    ini_set("zlib.output_compression", "Off");
}
 
// fermeture de la session
session_write_close();
 
// désactive la mise en cache
header("Cache-Control: no-cache, must-revalidate");
header("Cache-Control: post-check=0,pre-check=0");
header("Cache-Control: max-age=0");
header("Pragma: no-cache");
header("Expires: 0");

// force le téléchargement du fichier avec un beau nom
header("Content-Type: application/force-download");
header('Content-Disposition: attachment; filename="'.$filename.'"');

// indique la taille du fichier à télécharger
header("Content-Length: ".$size);

// envoi le contenu du fichier
readfile('.'.$_GET['file']);
?>