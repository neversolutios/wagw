use url with parameter wa=...<br>
example : ../read_messages_percontact.php?wa=6285692961782
<hr>
<?php

@$wa=$_GET['wa'] ;
$curl = curl_init();

curl_setopt_array($curl, [
  CURLOPT_URL => "$host/messages?chat_id=$wa&order_by=desc&limit=1000",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 0,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_POSTFIELDS => "",
  CURLOPT_HTTPHEADER => [
    "Authorization: Bearer $token",
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