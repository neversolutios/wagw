<?php 
//Make sure parameter GET like these
@$wa_no = $_GET['wa_no']; 
@$wa_text = strtoupper($_GET['wa_text']);
@$wa_profil = $_GET['profil'] ;
if ($wa_no . $wa_text == '') { exit ; } 

// Make your script to proccess Logic.. here
$kode = 36 ;
$content = file_get_contents("http://jadwalsholat.pkpu.or.id/monthly.php?id=". $kode);
$pecah = explode( '<tr class="table_highlight" align="center">' ,$content) ;
$pecah2 = explode( '</tr>' ,$pecah[1] ) ;

$fix = $pecah2[0] ;
$fix =  str_replace('</td>' , '', $fix ) ; 
$fix =  str_replace('</b>' , '', $fix ) ; 
$pecah3 = explode( '<td>' , $fix ) ;

//--------------------------------------------------
@$pecah4 = explode( '<td colspan="7" align="center">' ,$content) ;
@$pecah5 = explode( '</small>' , $pecah4[1]) ;
@$fix2 = $pecah5[0];
$fix2 =  str_replace('<b>' , '', $fix2 ) ; 
$fix2 =  str_replace('</b>' , '', $fix2 ) ; 
$fix2 =  str_replace('<br>' , '', $fix2 ) ;  
$fix2 =  str_replace('<small>' , '', $fix2 ) ;  
 
    //-------------------------------------------------- 
$hasil = "*JADWAL SHOLAT JAKARTA* 
Tanggal $pecah3[1] ". trim($fix2) . "
- Subuh : $pecah3[2]
- Dzuhur : $pecah3[3]
- Ashar : $pecah3[4]
- Maghrib : $pecah3[5]
- Isya : $pecah3[6]
" ;
    
$hasil =  str_replace('<b>' , '', $hasil ) ;    
$hasil =  str_replace('(' , '<br>(', $hasil ) ;    
$msg = $hasil ;
$msg = str_replace('<br>', '%0A', $msg );
 

//This Bot just need echo "bla bla bla.. to send response" 
echo $msg ; 
?>