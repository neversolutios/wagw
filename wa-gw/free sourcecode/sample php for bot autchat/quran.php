<?php 
//Make sure parameter GET like these
@$wa_no = $_GET['wa_no']; 
@$wa_text = strtoupper($_GET['wa_text']);
@$wa_profil = $_GET['profil'] ;
if ($wa_no . $wa_text == '') { exit ; } 

// Make your script to proccess Logic.. here
$content = file_get_contents("http://ayatalquran.com/random");  
$pecah = explode( '<h2 id="aya_text">' ,$content) ;
$pecah2 = explode( '</h2>' ,$pecah[1] ) ;
$quran =  $pecah2[0] ;

$pecah = explode( '<span id="sura_id">' ,$content) ;
$pecah2 = explode( '</span>' ,$pecah[1] ) ;
$surat =  $pecah2[0] ;

$pecah = explode( '<span id="verse_id">' ,$content) ;
$pecah2 = explode( '</span>' ,$pecah[1] ) ;
$ayat =  $pecah2[0] ;	

$msg =  '"' . $quran . '"( Holy Quran - '. "$surat:$ayat )" ;

//This Bot just need echo "bla bla bla.. to send response" 
echo $msg ; 
?>