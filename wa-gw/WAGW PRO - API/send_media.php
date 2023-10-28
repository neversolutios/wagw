<?php
include "key.php"; 

$curl = curl_init();

curl_setopt_array($curl, [
  CURLOPT_URL => "$host/messages/send-media",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => "{\n\t\"to\": \"6285692961782\",\n\t\"message\": \"Demo Send Image using WA-GW API\",\n\t\"media_url\": \"https://wa-gw.com/ind/files/header2.png\",\n\t\"type\": \"image\"\n}",
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