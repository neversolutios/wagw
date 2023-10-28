<?php
include "key.php"; 

$curl = curl_init();

$msg = "
Hello..
This is DEMO of
WAGW API
"  ;

 
$dataarr = [
  "to" => "6285692961782",
  "message" => $msg
];
$sendrest = json_encode($dataarr, true);

curl_setopt_array($curl, [
  CURLOPT_URL => "$host/messages/send-text",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => $sendrest,
  CURLOPT_HTTPHEADER => [
    "Authorization: Bearer $devicekey",
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