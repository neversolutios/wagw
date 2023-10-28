<?php 
//Make sure parameter GET like these
@$wa_no = $_GET['wa_no']; 
@$wa_text = strtoupper($_GET['wa_text']);
@$wa_profil = $_GET['profil'] ;
if ($wa_no . $wa_text == '') { exit ; } 

// Make your script to proccess Logic.. here
// ....

//This Bot just need echo "bla bla bla.. to send response" 
echo "Hello $wa_no, You send Text to me :~rwa_text" ;

/*
// You also can send directly using insert table 
function sendMessage($wa_profil, $wa_no, $wa_text) {
	include "../konfig.php";
	echo $wa_text ;  //bwt TEST DI BROWSER
	$wa_media = '' ; $wa_file = '' ;
	if ($multi != 'yes') {	
		mysqli_query($koneksi,"INSERT into outbox (wa_mode, wa_no, wa_text, wa_media, wa_file) values('0','$wa_no','$wa_text','$wa_media', '$wa_file')");
	} else {
		mysqli_query($koneksi,"INSERT into multi (tipe, profil, wa_mode, wa_no, wa_text, wa_media, wa_file) values('O', '$wa_profil', '0','$wa_no','$wa_text','$wa_media', '$wa_file')");
	} 
}
*/
?>