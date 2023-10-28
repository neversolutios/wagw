<?php
include "key.php"; 
$curl = curl_init();


curl_setopt_array($curl, [
  CURLOPT_URL => "$host/setting",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "PATCH",
  CURLOPT_POSTFIELDS => "{\n\t\"auto_read\": true,\n  \"auto_save_media\": true,\n  \"include_group_message\": true,\n  \"sync_story\": true,\n  \"sync_contact\": true\n}",
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