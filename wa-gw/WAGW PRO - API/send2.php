sample :<br>
https://wagwpro.com/api/send2.php?wa=6285692961782&msg=SEND%20USING%20SEND.PHP&img=http://wa-gw.com/eng/files/about-img.png<hr>
<?php
date_default_timezone_set("Asia/Jakarta");
 
@$msg = $_GET['msg'] ;
@$wa = $_GET['wa'] ;
@$img = $_GET['img'] ;
@$file = $_GET['file'] ;

$wa = str_replace ('+', '', $wa) ;
$wa = str_replace (' ', '', $wa) ;
if (substr($wa, 0, 1) == '0' ) { $wa = '62' . substr($wa,1,30) ; }
$msg = str_replace ('~r', "\r\n", $msg) ;

$wa_mode = '' ;
if ($img !='') { $wa_mode='image' ; $media = $img ; }  
if ($file !='') { $wa_mode='document' ; $media = $file ;}  
if ($img =='' AND $file=='') { $wa_mode='text' ; }  

 
if ($wa !='') {
    include "key.php"; 
    
    $curl = curl_init();

    if ($wa_mode=='text') { $url = "$host/messages/send-text" ; } else { $url = "$host/messages/send-media";}
    
    $dataarr = [
      "to" => $wa,
      "message" => $msg,
      "media_url"=> $media,
      "type"=> $wa_mode
    ];
     
    $sendrest = json_encode($dataarr, true); 
    
    curl_setopt_array($curl, [
      CURLOPT_URL => $url,
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_ENCODING => "",
      CURLOPT_MAXREDIRS => 10,
      CURLOPT_TIMEOUT => 0,
      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
      CURLOPT_CUSTOMREQUEST => "POST",
      CURLOPT_POSTFIELDS => $sendrest,
      CURLOPT_HTTPHEADER => [
        "Authorization: Bearer $token",
        "Content-Type: application/json",
        "device-key: $devicekey"
      ],
    ]);
    
    $response = curl_exec($curl);
    $err = curl_error($curl);
    
    curl_close($curl);
    
    if ($err) {
      echo "cURL Error #:" . $err;
    } else {
      echo $response;
    }
}
 